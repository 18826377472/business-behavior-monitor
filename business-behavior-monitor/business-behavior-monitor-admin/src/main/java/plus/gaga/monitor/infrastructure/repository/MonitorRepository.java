package plus.gaga.monitor.infrastructure.repository;

import org.springframework.stereotype.Repository;
import plus.gaga.monitor.domain.model.entity.MonitorDataEntity;
import plus.gaga.monitor.domain.model.entity.MonitorDataMapEntity;
import plus.gaga.monitor.domain.model.valobj.GatherNodeExpressionVO;
import plus.gaga.monitor.domain.model.valobj.MonitorTreeConfigVO;
import plus.gaga.monitor.domain.repository.IMonitorRepository;
import plus.gaga.monitor.infrastructure.dao.*;
import plus.gaga.monitor.infrastructure.po.*;
import plus.gaga.monitor.infrastructure.redis.IRedisService;
import plus.gaga.monitor.types.Constants;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Repository
public class MonitorRepository implements IMonitorRepository {

    @Resource
    private IMonitorDataDao monitorDataDao;
    @Resource
    private IMonitorDataMapDao monitorDataMapDao;
    @Resource
    private IMonitorDataMapNodeDao monitorDataMapNodeDao;
    @Resource
    private IMonitorDataMapNodeFieldDao monitorDataMapNodeFieldDao;
    @Resource
    private IMonitorDataMapNodeLinkDao monitorDataMapNodeLinkDao;

    @Resource
    private IRedisService redisService;

    @Override
    public List<GatherNodeExpressionVO> queryGatherNodeExpressionVO(String systemName, String className, String methodName) {
        // 1. 查询采集节点
        MonitorDataMapNode monitorDataMapNodeReq = new MonitorDataMapNode();
        monitorDataMapNodeReq.setGatherSystemName(systemName);
        monitorDataMapNodeReq.setGatherClazzName(className);
        monitorDataMapNodeReq.setGatherMethodName(methodName);
        List<MonitorDataMapNode> monitorDataMapNodes = monitorDataMapNodeDao.queryMonitoryDataMapNodeList(monitorDataMapNodeReq);
        if (monitorDataMapNodes.isEmpty()) return null;

        List<GatherNodeExpressionVO> gatherNodeExpressionVOS = new ArrayList<>();
        for (MonitorDataMapNode monitorDataMapNodeRes : monitorDataMapNodes) {
            // 2. 查询采集公式
            MonitorDataMapNodeField monitorDataMapNodeFieldReq = new MonitorDataMapNodeField();
            monitorDataMapNodeFieldReq.setMonitorId(monitorDataMapNodeRes.getMonitorId());
            monitorDataMapNodeFieldReq.setMonitorNodeId(monitorDataMapNodeRes.getMonitorNodeId());
            List<MonitorDataMapNodeField> monitorDataMapNodeFieldList = monitorDataMapNodeFieldDao.queryMonitorDataMapNodeList(monitorDataMapNodeFieldReq);

            List<GatherNodeExpressionVO.Filed> fileds = new ArrayList<>();
            for (MonitorDataMapNodeField monitorDataMapNodeField : monitorDataMapNodeFieldList) {
                fileds.add(GatherNodeExpressionVO.Filed.builder()
                        .logName(monitorDataMapNodeField.getLogName())
                        .logIndex(monitorDataMapNodeField.getLogIndex())
                        .logType(monitorDataMapNodeField.getLogType())
                        .attributeField(monitorDataMapNodeField.getAttributeField())
                        .attributeName(monitorDataMapNodeField.getAttributeName())
                        .attributeOgnl(monitorDataMapNodeField.getAttributeOgnl())
                        .build());
            }

            gatherNodeExpressionVOS.add(GatherNodeExpressionVO.builder()
                    .monitorId(monitorDataMapNodeRes.getMonitorId())
                    .monitorNodeId(monitorDataMapNodeRes.getMonitorNodeId())
                    .gatherSystemName(monitorDataMapNodeRes.getGatherSystemName())
                    .gatherClazzName(monitorDataMapNodeRes.getGatherClazzName())
                    .gatherMethodName(monitorDataMapNodeRes.getGatherMethodName())
                    .fileds(fileds)
                    .build());
        }
        return gatherNodeExpressionVOS;
    }

    @Override
    public String queryMonitoryNameByMonitoryId(String monitorId) {
        return monitorDataMapDao.queryMonitorNameByMonitoryId(monitorId);
    }

    @Override
    public void saveMonitoryData(MonitorDataEntity monitorDataEntity) {
        MonitorData monitorDataReq = new MonitorData();
        monitorDataReq.setMonitorId(monitorDataEntity.getMonitorId());
        monitorDataReq.setMonitorName(monitorDataEntity.getMonitorName());
        monitorDataReq.setMonitorNodeId(monitorDataEntity.getMonitorNodeId());
        monitorDataReq.setSystemName(monitorDataEntity.getSystemName());
        monitorDataReq.setClazzName(monitorDataEntity.getClazzName());
        monitorDataReq.setMethodName(monitorDataEntity.getMethodName());
        monitorDataReq.setAttributeName(monitorDataEntity.getAttributeName());
        monitorDataReq.setAttributeField(monitorDataEntity.getAttributeField());
        monitorDataReq.setAttributeValue(monitorDataEntity.getAttributeValue());
        monitorDataDao.insert(monitorDataReq);

        String cacheKey = Constants.RedisKey.monitor_node_data_count_key + monitorDataEntity.getMonitorId() + Constants.UNDERLINE + monitorDataEntity.getMonitorNodeId();
        redisService.incr(cacheKey);
    }

    @Override
    public List<MonitorDataMapEntity> queryMonitorDataMapEntityList() {
        List<MonitorDataMap> monitorDataList = monitorDataMapDao.queryMonitorDataMapEntityList();
        List<MonitorDataMapEntity> monitorDataMapEntities = new ArrayList<>();
        for (MonitorDataMap monitorDataMap : monitorDataList) {
            monitorDataMapEntities.add(MonitorDataMapEntity.builder()
                    .monitorId(monitorDataMap.getMonitorId())
                    .monitorName(monitorDataMap.getMonitorName())
                    .build());
        }
        return monitorDataMapEntities;
    }

    @Override
    public MonitorTreeConfigVO queryMonitorFlowData(String monitorId) {
        // 监控节点配置
        List<MonitorDataMapNode> monitorDataMapNodes = monitorDataMapNodeDao.queryMonitorNodeConfigByMonitorId(monitorId);
        // 监控节点链路
        List<MonitorDataMapNodeLink> monitorDataMapNodeLinks = monitorDataMapNodeLinkDao.queryMonitorNodeLinkConfigByMonitorId(monitorId);

        Map<String, List<String>> fromMonitorNodeIdToNodeIds = monitorDataMapNodeLinks.stream()
                .collect(Collectors.groupingBy(MonitorDataMapNodeLink::getFromMonitorNodeId,
                        Collectors.mapping(MonitorDataMapNodeLink::getToMonitorNodeId,
                                Collectors.toList())));

        List<MonitorTreeConfigVO.Node> nodeList = new ArrayList<>();
        for (MonitorDataMapNode monitorDataMapNode : monitorDataMapNodes) {
            // 查询缓存节点流量值
            String cacheKey = Constants.RedisKey.monitor_node_data_count_key + monitorId + Constants.UNDERLINE + monitorDataMapNode.getMonitorNodeId();
            Long count = redisService.getAtomicLong(cacheKey);

            nodeList.add(MonitorTreeConfigVO.Node.builder()
                    .monitorNodeId(monitorDataMapNode.getMonitorNodeId())
                    .monitorNodeName(monitorDataMapNode.getMonitorNodeName())
                    .loc(monitorDataMapNode.getLoc())
                    .color(monitorDataMapNode.getColor())
                    .monitorNodeValue(null == count ? "0" : String.valueOf(count))
                    .build());
        }

        List<MonitorTreeConfigVO.Link> linkList = new ArrayList<>();
        for (MonitorDataMapNodeLink monitorDataMapNodeLink : monitorDataMapNodeLinks) {
            // 获取节点值
            String fromCacheKey = Constants.RedisKey.monitor_node_data_count_key + monitorId + Constants.UNDERLINE + monitorDataMapNodeLink.getFromMonitorNodeId();
            Long fromCacheCount = redisService.getAtomicLong(fromCacheKey);
            Long toCacheCount = 0L;

            // 合并所有值
            List<String> toNodeIds = fromMonitorNodeIdToNodeIds.get(monitorDataMapNodeLink.getFromMonitorNodeId());
            for (String toNodeId : toNodeIds) {
                String toCacheKey = Constants.RedisKey.monitor_node_data_count_key + monitorId + Constants.UNDERLINE + toNodeId;
                toCacheCount += redisService.getAtomicLong(toCacheKey);
            }

            long differenceValue = (null == fromCacheCount ? 0L : fromCacheCount) - toCacheCount;

            linkList.add(MonitorTreeConfigVO.Link.builder()
                    .fromMonitorNodeId(monitorDataMapNodeLink.getFromMonitorNodeId())
                    .toMonitorNodeId(monitorDataMapNodeLink.getToMonitorNodeId())
                    .linkKey(String.valueOf(monitorDataMapNodeLink.getId()))
                    .linkValue(String.valueOf(differenceValue <= 0 ? 0 : differenceValue))
                    .build());

        }

        return MonitorTreeConfigVO.builder()
                .monitorId(monitorId)
                .nodeList(nodeList)
                .linkList(linkList)
                .build();
    }

}

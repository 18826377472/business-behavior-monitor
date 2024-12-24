package plus.gaga.monitor.infrastructure.repository;

import org.springframework.stereotype.Repository;
import plus.gaga.monitor.domain.model.entity.MonitorDataEntity;
import plus.gaga.monitor.domain.model.valobj.GatherNodeExpressionVO;
import plus.gaga.monitor.domain.repository.IMonitorRepository;
import plus.gaga.monitor.infrastructure.dao.*;
import plus.gaga.monitor.infrastructure.po.MonitorData;
import plus.gaga.monitor.infrastructure.po.MonitorDataMapNode;
import plus.gaga.monitor.infrastructure.po.MonitorDataMapNodeField;
import plus.gaga.monitor.infrastructure.redis.IRedisService;
import plus.gaga.monitor.types.Constants;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

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

}

package plus.gaga.monitor.domain.service;

import com.alibaba.fastjson.JSONObject;
import ognl.Ognl;
import ognl.OgnlContext;
import ognl.OgnlException;
import org.springframework.stereotype.Service;
import plus.gaga.monitor.domain.model.entity.MonitorDataEntity;
import plus.gaga.monitor.domain.model.entity.MonitorDataMapEntity;
import plus.gaga.monitor.domain.model.valobj.GatherNodeExpressionVO;
import plus.gaga.monitor.domain.model.valobj.MonitorTreeConfigVO;
import plus.gaga.monitor.domain.repository.IMonitorRepository;
import plus.gaga.monitor.types.Constants;

import javax.annotation.Resource;
import java.util.List;

@Service
public class LogAnalyticalService implements ILogAnalyticalService {

    @Resource
    private IMonitorRepository repository;

    @Override
    public void doAnalytical(String systemName, String className, String methodName, List<String> logList) throws OgnlException {
        // 查询匹配解析节点
        List<GatherNodeExpressionVO> gatherNodeExpressionVOs = repository.queryGatherNodeExpressionVO(systemName, className, methodName);
        if (null == gatherNodeExpressionVOs || gatherNodeExpressionVOs.isEmpty()) return;

        for (GatherNodeExpressionVO gatherNodeExpressionVO : gatherNodeExpressionVOs) {
            String monitoryName = repository.queryMonitoryNameByMonitoryId(gatherNodeExpressionVO.getMonitorId());

            List<GatherNodeExpressionVO.Filed> fileds = gatherNodeExpressionVO.getFileds();
            for (GatherNodeExpressionVO.Filed filed : fileds) {
                Integer logIndex = filed.getLogIndex();

                String logName = logList.get(0);
                if (!logName.equals(filed.getLogName())) {
                    continue;
                }

                String attributeValue = "";
                String logStr = logList.get(logIndex);
                if ("Object".equals(filed.getLogType())) {
                    OgnlContext context = new OgnlContext();
                    context.setRoot(JSONObject.parseObject(logStr));
                    Object root = context.getRoot();
                    attributeValue = String.valueOf(Ognl.getValue(filed.getAttributeOgnl(), context, root));
                } else {
                    attributeValue = logStr.trim();
                    if (attributeValue.contains(Constants.COLON)) {
                        attributeValue = attributeValue.split(Constants.COLON)[1].trim();
                    }
                }

                MonitorDataEntity monitorDataEntity = MonitorDataEntity.builder()
                        .monitorId(gatherNodeExpressionVO.getMonitorId())
                        .monitorName(monitoryName)
                        .monitorNodeId(gatherNodeExpressionVO.getMonitorNodeId())
                        .systemName(gatherNodeExpressionVO.getGatherSystemName())
                        .clazzName(gatherNodeExpressionVO.getGatherClazzName())
                        .methodName(gatherNodeExpressionVO.getGatherMethodName())
                        .attributeName(filed.getAttributeName())
                        .attributeField(filed.getAttributeField())
                        .attributeValue(attributeValue)
                        .build();

                repository.saveMonitoryData(monitorDataEntity);
            }

        }

    }

    @Override
    public List<MonitorDataMapEntity> queryMonitorDataMapEntityList() {
        return repository.queryMonitorDataMapEntityList();
    }

    @Override
    public MonitorTreeConfigVO queryMonitorFlowData(String monitorId) {
        return repository.queryMonitorFlowData(monitorId);
    }

}

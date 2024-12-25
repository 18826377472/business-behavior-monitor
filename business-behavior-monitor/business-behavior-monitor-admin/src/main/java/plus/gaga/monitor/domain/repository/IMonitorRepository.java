package plus.gaga.monitor.domain.repository;

import plus.gaga.monitor.domain.model.entity.MonitorDataEntity;
import plus.gaga.monitor.domain.model.entity.MonitorDataMapEntity;
import plus.gaga.monitor.domain.model.valobj.GatherNodeExpressionVO;
import plus.gaga.monitor.domain.model.valobj.MonitorTreeConfigVO;

import java.util.List;

public interface IMonitorRepository {

    List<GatherNodeExpressionVO> queryGatherNodeExpressionVO(String systemName, String className, String methodName);

    String queryMonitoryNameByMonitoryId(String monitorId);


    void saveMonitoryData(MonitorDataEntity monitorDataEntity);

    List<MonitorDataMapEntity> queryMonitorDataMapEntityList();

    MonitorTreeConfigVO queryMonitorFlowData(String monitorId);

    List<MonitorDataEntity> queryMonitorDataEntityList(MonitorDataEntity monitorDataEntity);

}

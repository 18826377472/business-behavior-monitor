package plus.gaga.monitor.domain.service;

import ognl.OgnlException;
import plus.gaga.monitor.domain.model.entity.MonitorDataMapEntity;

import java.util.List;

public interface ILogAnalyticalService {

    void doAnalytical(String systemName, String className, String methodName, List<String> logList) throws OgnlException;

    List<MonitorDataMapEntity> queryMonitorDataMapEntityList();

}

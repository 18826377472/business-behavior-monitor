package plus.gaga.monitor.infrastructure.dao;

import org.apache.ibatis.annotations.Mapper;
import plus.gaga.monitor.infrastructure.po.MonitorDataMap;

import java.util.List;

@Mapper
public interface IMonitorDataMapDao {
    String queryMonitorNameByMonitoryId(String monitorId);

    List<MonitorDataMap> queryMonitorDataMapEntityList();

}

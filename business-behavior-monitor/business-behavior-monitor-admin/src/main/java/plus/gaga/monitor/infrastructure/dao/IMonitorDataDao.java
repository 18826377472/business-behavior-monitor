package plus.gaga.monitor.infrastructure.dao;

import org.apache.ibatis.annotations.Mapper;
import plus.gaga.monitor.infrastructure.po.MonitorData;

import java.util.List;

@Mapper
public interface IMonitorDataDao {

    List<MonitorData> queryMonitorDataList(MonitorData monitorDataReq);

    void insert(MonitorData monitorDataReq);

}

package plus.gaga.monitor.infrastructure.dao;

import org.apache.ibatis.annotations.Mapper;
import plus.gaga.monitor.infrastructure.po.MonitorDataMapNodeLink;

import java.util.List;

@Mapper
public interface IMonitorDataMapNodeLinkDao {

    List<MonitorDataMapNodeLink> queryMonitorNodeLinkConfigByMonitorId(String monitorId);

}

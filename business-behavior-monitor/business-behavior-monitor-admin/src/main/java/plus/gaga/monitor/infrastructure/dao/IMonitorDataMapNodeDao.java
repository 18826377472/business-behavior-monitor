package plus.gaga.monitor.infrastructure.dao;

import org.apache.ibatis.annotations.Mapper;
import plus.gaga.monitor.infrastructure.po.MonitorDataMapNode;

import java.util.List;

@Mapper
public interface IMonitorDataMapNodeDao {
    List<MonitorDataMapNode> queryMonitoryDataMapNodeList(MonitorDataMapNode monitorDataMapNodeReq);

}

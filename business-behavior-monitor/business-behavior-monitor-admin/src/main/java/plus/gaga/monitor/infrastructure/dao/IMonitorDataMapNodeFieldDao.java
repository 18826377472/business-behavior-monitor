package plus.gaga.monitor.infrastructure.dao;

import org.apache.ibatis.annotations.Mapper;
import plus.gaga.monitor.infrastructure.po.MonitorDataMapNodeField;

import java.util.List;

@Mapper
public interface IMonitorDataMapNodeFieldDao {
    List<MonitorDataMapNodeField> queryMonitorDataMapNodeList(MonitorDataMapNodeField monitorDataMapNodeFieldReq);

}

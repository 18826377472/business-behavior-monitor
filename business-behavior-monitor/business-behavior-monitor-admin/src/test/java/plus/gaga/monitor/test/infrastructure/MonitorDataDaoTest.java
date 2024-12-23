package plus.gaga.monitor.test.infrastructure;

import com.alibaba.fastjson.JSON;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import plus.gaga.monitor.infrastructure.dao.IMonitorDataDao;
import plus.gaga.monitor.infrastructure.po.MonitorData;

import javax.annotation.Resource;
import java.util.List;

@Slf4j
@RunWith(SpringRunner.class)
@SpringBootTest
public class MonitorDataDaoTest {

    @Resource
    private IMonitorDataDao monitorDataDao;

    @Test
    public void test_queryMonitorDataList() {
        List<MonitorData> monitorData = monitorDataDao.queryMonitorDataList(new MonitorData());
        log.info("测试结果: {}", JSON.toJSONString(monitorData));
    }

}

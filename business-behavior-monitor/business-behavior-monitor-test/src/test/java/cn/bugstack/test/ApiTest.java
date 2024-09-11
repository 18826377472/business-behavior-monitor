package cn.bugstack.test;

import com.alibaba.fastjson.JSON;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.SpringBootConfiguration;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.concurrent.CountDownLatch;


@Slf4j
@RunWith(SpringRunner.class)
@SpringBootTest
@SpringBootConfiguration
public class ApiTest {
    private UserEntity userEntity = null;

    @Before
    public void init() {
        userEntity = new UserEntity();
        userEntity.setUserId("10001");
        userEntity.setUserName("李二狗");
        userEntity.setUserAge(25);
        userEntity.setOrderId("109099893222");
    }


    @Test
    public void test_log_01() throws InterruptedException {
        log.info("测试日志 {} {} {}", userEntity.getUserId(), userEntity.getUserName(), JSON.toJSONString(userEntity));
        new CountDownLatch(1).await();
    }

    @Data
    static class UserEntity {
        private String userId;
        private String userName;
        private Integer userAge;
        private String orderId;
    }


}

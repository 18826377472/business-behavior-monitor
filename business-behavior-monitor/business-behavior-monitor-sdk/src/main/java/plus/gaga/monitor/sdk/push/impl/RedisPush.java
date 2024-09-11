package plus.gaga.monitor.sdk.push.impl;

import com.alibaba.fastjson.JSON;
import org.redisson.Redisson;
import org.redisson.api.RTopic;
import org.redisson.api.RedissonClient;
import org.redisson.api.listener.MessageListener;
import org.redisson.codec.JsonJacksonCodec;
import org.redisson.config.Config;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import plus.gaga.monitor.sdk.model.LogMessage;
import plus.gaga.monitor.sdk.push.IPush;

/**
 * @author Fuzhengwei bugstack.cn @小傅哥
 * @description redis 发布订阅方式进行推送消息
 * @create 2024-06-15 16:49
 */
public class RedisPush implements IPush {

    private final Logger logger = LoggerFactory.getLogger(RedisPush.class);

    private RedissonClient redissonClient;

    @Override
    public synchronized void open(String host, int port) {
        if (null != redissonClient && !redissonClient.isShutdown()) return;

        Config config = new Config();
        config.setCodec(JsonJacksonCodec.INSTANCE);
        config.useSingleServer()
                .setAddress("redis://" + host + ":" + port)
                .setConnectionPoolSize(64)
                .setConnectionMinimumIdleSize(10)
                .setIdleConnectionTimeout(1000)
                .setConnectTimeout(1000)
                .setRetryAttempts(3)
                .setRetryInterval(1000)
                .setPingConnectionInterval(0)
                .setKeepAlive(true);

        this.redissonClient = Redisson.create(config);
        // 获取主题，并注册消息监听器
        RTopic topic = this.redissonClient.getTopic("business-behavior-monitor-sdk-topic");
        topic.addListener(LogMessage.class, new Listener());
    }

    /**
     * 当实现 MessageListener 接口的对象被注册到一个消息系统或队列中，并且该系统或队列中有新的 LogMessage 消息到达时，onMessage方法就会被自动调用。
     */
    class Listener implements MessageListener<LogMessage> {

        @Override
        public void onMessage(CharSequence charSequence, LogMessage logMessage) {
            logger.info("接收消息：{}", JSON.toJSONString(logMessage));
        }
    }

    @Override
    public void send(LogMessage logMessage) {
        try {
            // 获取Redisson主题
            RTopic topic = redissonClient.getTopic("business-behavior-monitor-sdk-topic");
            // 发布日志消息到主题
            topic.publish(logMessage);
        } catch (Exception e) {
            logger.error("警告: 业务行为监控组件，推送日志消息失败", e);
        }

    }

}

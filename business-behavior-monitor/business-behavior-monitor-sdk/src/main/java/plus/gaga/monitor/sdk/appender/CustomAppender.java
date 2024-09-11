package plus.gaga.monitor.sdk.appender;

import ch.qos.logback.classic.spi.ILoggingEvent;
import ch.qos.logback.core.AppenderBase;
import plus.gaga.monitor.sdk.model.LogMessage;
import plus.gaga.monitor.sdk.push.IPush;
import plus.gaga.monitor.sdk.push.impl.RedisPush;

import java.util.Arrays;

/**
 * @author Fuzhengwei bugstack.cn @小傅哥
 * @description 自定义日志采集
 * @create 2024-06-15 16:21
 */
public class CustomAppender<E> extends AppenderBase<E> {

    // 系统名称
    private String systemName;
    // 只采集指定范围的日志
    private String groupId;
    // redis 连接地址
    private String host;
    // redis 连接端口
    private int port;

    private final IPush push = new RedisPush();

    @Override
    protected void append(E eventObject) {
        // 开启推送
        push.open(host, port);
        // 获取日志
        if (eventObject instanceof ILoggingEvent) {
            ILoggingEvent event = (ILoggingEvent) eventObject;

            String methodName = "unknown";
            String className = "unknown";

            StackTraceElement[] callerDataArray = event.getCallerData();
            if (null != callerDataArray && callerDataArray.length > 0) {
                StackTraceElement callerData = callerDataArray[0];
                methodName = callerData.getMethodName();
                className = callerData.getClassName();
            }

            if (!className.startsWith(groupId)){
                return;
            }

            // 构建日志
            LogMessage logMessage = new LogMessage(systemName, className, methodName, Arrays.asList(event.getFormattedMessage().split(" ")));
            // 推送日志
            push.send(logMessage);
        }
    }

    public String getSystemName() {
        return systemName;
    }

    public void setSystemName(String systemName) {
        this.systemName = systemName;
    }

    public String getGroupId() {
        return groupId;
    }

    public void setGroupId(String groupId) {
        this.groupId = groupId;
    }

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public int getPort() {
        return port;
    }

    public void setPort(int port) {
        this.port = port;
    }
}



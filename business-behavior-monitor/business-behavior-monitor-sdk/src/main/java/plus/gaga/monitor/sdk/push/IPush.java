package plus.gaga.monitor.sdk.push;

import plus.gaga.monitor.sdk.model.LogMessage;

/**
 * @author Fuzhengwei bugstack.cn @小傅哥
 * @description 发布
 * @create 2024-06-15 16:49
 */
public interface IPush {

    void open(String host, int port);

    void send(LogMessage logMessage);

}

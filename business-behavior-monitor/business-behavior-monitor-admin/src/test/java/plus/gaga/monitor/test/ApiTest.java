package plus.gaga.monitor.test;

import com.alibaba.fastjson.JSONObject;
import lombok.extern.slf4j.Slf4j;
import ognl.Ognl;
import ognl.OgnlContext;
import ognl.OgnlException;
import org.junit.Test;

@Slf4j
public class ApiTest {

    @Test
    public void test_monitor_ognl() throws OgnlException {
        String json = "{\"orderId\":\"109099893222\",\"userAge\":25,\"userId\":\"10001\",\"userName\":\"李二狗\"}";

        JSONObject obj = JSONObject.parseObject(json);

        OgnlContext context = new OgnlContext();
        context.setRoot(obj);

        Object root = context.getRoot();

        log.info((String) Ognl.getValue("userId", context, root));
        log.info((String) Ognl.getValue("orderId", context, root));
    }

}

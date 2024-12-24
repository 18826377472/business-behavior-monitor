package plus.gaga.monitor.trigger.http;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import plus.gaga.monitor.domain.model.entity.MonitorDataMapEntity;
import plus.gaga.monitor.domain.service.ILogAnalyticalService;
import plus.gaga.monitor.trigger.http.dto.MonitorDataMapDTO;
import plus.gaga.monitor.types.Response;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@RestController()
@CrossOrigin("*")
@RequestMapping("/api/v1/monitor/")
public class MonitorController {

    @Resource
    private ILogAnalyticalService logAnalyticalService;

    /**
     * http://localhost:8091/api/v1/monitor/query_monitor_data_map_entity_list
     */
    @RequestMapping(value = "query_monitor_data_map_entity_list", method = RequestMethod.GET)
    public Response<List<MonitorDataMapDTO>> queryMonitorDataMapEntityList() {
        try {
            List<MonitorDataMapEntity> monitorDataMapEntities = logAnalyticalService.queryMonitorDataMapEntityList();
            List<MonitorDataMapDTO> monitorDataMapDTOS = new ArrayList<>(monitorDataMapEntities.size());
            for (MonitorDataMapEntity monitorDataMapEntity : monitorDataMapEntities) {
                monitorDataMapDTOS.add(MonitorDataMapDTO.builder()
                        .monitorId(monitorDataMapEntity.getMonitorId())
                        .monitorName(monitorDataMapEntity.getMonitorName())
                        .build());
            }
            return Response.<List<MonitorDataMapDTO>>builder()
                    .code("0000")
                    .info("调用成功")
                    .data(monitorDataMapDTOS)
                    .build();
        } catch (Exception e) {
            log.error("查询监控列表数据失败", e);
            return Response.<List<MonitorDataMapDTO>>builder()
                    .code("0001")
                    .info("调用失败")
                    .build();
        }
    }

}

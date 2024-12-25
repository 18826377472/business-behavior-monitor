package plus.gaga.monitor.trigger.http;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.bind.annotation.*;
import plus.gaga.monitor.domain.model.entity.MonitorDataEntity;
import plus.gaga.monitor.domain.model.entity.MonitorDataMapEntity;
import plus.gaga.monitor.domain.model.valobj.MonitorTreeConfigVO;
import plus.gaga.monitor.domain.service.ILogAnalyticalService;
import plus.gaga.monitor.trigger.http.dto.MonitorDataDTO;
import plus.gaga.monitor.trigger.http.dto.MonitorDataMapDTO;
import plus.gaga.monitor.trigger.http.dto.MonitorFlowDataDTO;
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

    @RequestMapping(value = "query_monitor_flow_map", method = RequestMethod.GET)
    public Response<MonitorFlowDataDTO> queryMonitorFlowMap(@RequestParam String monitorId) {
        try {
            log.info("查询监控流数据 monitorId:{}", monitorId);
            MonitorTreeConfigVO monitorTreeConfigVO = logAnalyticalService.queryMonitorFlowData(monitorId);
            List<MonitorTreeConfigVO.Node> nodeList = monitorTreeConfigVO.getNodeList();
            List<MonitorTreeConfigVO.Link> linkList = monitorTreeConfigVO.getLinkList();

            List<MonitorFlowDataDTO.NodeData> nodeDataList = new ArrayList<>();
            for (MonitorTreeConfigVO.Node node : nodeList) {
                nodeDataList.add(new MonitorFlowDataDTO.NodeData(
                        node.getMonitorNodeId(),
                        node.getMonitorNodeId(),
                        node.getMonitorNodeName(),
                        node.getMonitorNodeValue(),
                        node.getLoc(),
                        node.getColor()));
            }

            List<MonitorFlowDataDTO.LinkData> linkDataList = new ArrayList<>();
            for (MonitorTreeConfigVO.Link link : linkList) {
                String linkValue = link.getLinkValue();
                linkDataList.add("0".equals(linkValue) ?
                        new MonitorFlowDataDTO.LinkData(link.getFromMonitorNodeId(), link.getToMonitorNodeId()) :
                        new MonitorFlowDataDTO.LinkData(link.getFromMonitorNodeId(), link.getToMonitorNodeId(), link.getLinkKey(), linkValue));
            }

            MonitorFlowDataDTO monitorFlowDataDTO = new MonitorFlowDataDTO();
            monitorFlowDataDTO.setNodeDataArray(nodeDataList);
            monitorFlowDataDTO.setLinkDataArray(linkDataList);

            // 返回结果
            return Response.<MonitorFlowDataDTO>builder()
                    .code("0000")
                    .info("调用成功")
                    .data(monitorFlowDataDTO).build();
        } catch (Exception e) {
            log.error("查询监控流数据失败 monitorId:{}", monitorId, e);
            return Response.<MonitorFlowDataDTO>builder()
                    .code("0001")
                    .info("调用失败")
                    .build();
        }
    }

    @RequestMapping(value = "query_monitor_data_list", method = RequestMethod.GET)
    public Response<List<MonitorDataDTO>> queryMonitorDataList(@RequestParam String monitorId, @RequestParam String monitorName, @RequestParam String monitorNodeId) {
        try {
            log.info("查询监控数据 monitorId:{}", monitorId);
            List<MonitorDataEntity> monitorDataEntities = logAnalyticalService.queryMonitorDataEntityList(MonitorDataEntity.builder()
                    .monitorId(StringUtils.isBlank(monitorId.trim()) ? null : monitorId)
                    .monitorName(StringUtils.isBlank(monitorName.trim()) ? null : monitorName)
                    .monitorNodeId(StringUtils.isBlank(monitorNodeId.trim()) ? null : monitorNodeId)
                    .build());

            List<MonitorDataDTO> monitorDataDTOS = new ArrayList<>();
            for (MonitorDataEntity monitorDataEntity : monitorDataEntities) {
                monitorDataDTOS.add(MonitorDataDTO.builder()
                        .monitorId(monitorDataEntity.getMonitorId())
                        .monitorName(monitorDataEntity.getMonitorName())
                        .monitorNodeId(monitorDataEntity.getMonitorNodeId())
                        .systemName(monitorDataEntity.getSystemName())
                        .clazzName(monitorDataEntity.getClazzName())
                        .methodName(monitorDataEntity.getMethodName())
                        .attributeName(monitorDataEntity.getAttributeName())
                        .attributeField(monitorDataEntity.getAttributeField())
                        .attributeValue(monitorDataEntity.getAttributeValue())
                        .build());
            }
            return Response.<List<MonitorDataDTO>>builder()
                    .code("0000")
                    .info("调用成功")
                    .data(monitorDataDTOS)
                    .build();
        } catch (Exception e) {
            log.error("查询监控数据失败 monitorId:{}", monitorId, e);
            return Response.<List<MonitorDataDTO>>builder()
                    .code("0001")
                    .info("调用失败")
                    .build();
        }
    }

}

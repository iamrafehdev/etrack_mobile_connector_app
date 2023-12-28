import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:etrack_mobile_connector_app/models/work_order_model.dart';
import 'package:etrack_mobile_connector_app/modules/work_order/controllers/work_order_controller.dart';
import 'package:etrack_mobile_connector_app/widgets/app_text.dart';
import 'package:etrack_mobile_connector_app/widgets/text_span.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:req_fun/req_fun.dart';

class WorkOrderDetailsScreen extends StatefulWidget {
  final WorkOrderModel workOrderModel;

  const WorkOrderDetailsScreen({super.key, required this.workOrderModel});

  @override
  State<WorkOrderDetailsScreen> createState() => _WorkOrderDetailsScreenState();
}

class _WorkOrderDetailsScreenState extends State<WorkOrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final workOrderController = Provider.of<WorkOrderController>(context);
    Size screenSize = MediaQuery.of(context).size;
    List<StepperData> stepperData = [
      StepperData(
          title: StepperText("Scheduled Date"),
          subtitle: widget.workOrderModel.scheduledDate == null
              ? StepperText("N/A")
              : StepperText("${workOrderController.dateTimeConverter(widget.workOrderModel.scheduledDate!)}"),
          iconWidget: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: widget.workOrderModel.scheduledDate == null ? Colors.red.withOpacity(0.8) : Colors.green.withOpacity(0.8),
                borderRadius: const BorderRadius.all(Radius.circular(30))),
            child: const Icon(Icons.schedule_sharp, color: Colors.white),
          )),
      StepperData(
          title: StepperText("Picked Time"),
          subtitle: widget.workOrderModel.pickedTime == null
              ? StepperText("N/A")
              : StepperText("${workOrderController.dateTimeConverter(widget.workOrderModel.pickedTime!)}"),
          iconWidget: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: widget.workOrderModel.pickedTime == null ? Colors.red.withOpacity(0.8) : Colors.green.withOpacity(0.8),
                borderRadius: const BorderRadius.all(Radius.circular(30))),
            child: const Icon(Icons.schedule_sharp, color: Colors.white),
          )),
      StepperData(
          title: StepperText("Arrived Time"),
          subtitle: widget.workOrderModel.arrivedTime == null
              ? StepperText("N/A")
              : StepperText("${workOrderController.dateTimeConverter(widget.workOrderModel.arrivedTime!)}"),
          iconWidget: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: widget.workOrderModel.arrivedTime == null ? Colors.red.withOpacity(0.8) : Colors.green.withOpacity(0.8),
                borderRadius: const BorderRadius.all(Radius.circular(30))),
            child: const Icon(Icons.schedule_sharp, color: Colors.white),
          )),
    ];
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        title: AppText("Work Order #${widget.workOrderModel.workOrder}", color: Colors.white, isBold: true),
        actions: [
          widget.workOrderModel.coordinates.toString().split(",").first.toDouble() == 0.0
              ? const SizedBox()
              : IconButton(
                  onPressed: () {
                    workOrderController.openMap(context, widget.workOrderModel.coordinates.toString().split(",").first.toDouble(),
                        widget.workOrderModel.coordinates.toString().split(",").last.toDouble());
                  },
                  icon: const Icon(Icons.location_on))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundColor: widget.workOrderModel.state == "Arrived"
                    ? Colors.green.withOpacity(0.8)
                    : widget.workOrderModel.state == "Assigned"
                        ? Colors.blue.withOpacity(0.8)
                        : Colors.amber.withOpacity(0.8),
                child: const Icon(
                  Icons.work_history_rounded,
                  color: Colors.white,
                  size: 22.0,
                ),
              ),
              title: AppText("Project no: ${widget.workOrderModel.projectId}", size: 14.0, isBold: true),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4.0),
                  Row(
                    children: [
                      AppText(
                        "Record no: ${widget.workOrderModel.recordId}",
                        size: 12,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 8.0),
                      Row(
                        children: [
                          const AppText(
                            "State:",
                            size: 12,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 2.0),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: widget.workOrderModel.state == "Arrived"
                                      ? Colors.green
                                      : widget.workOrderModel.state == "Assigned"
                                          ? Colors.blue
                                          : Colors.amber,
                                ),
                                borderRadius: const BorderRadius.all(Radius.circular(10.0))),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 1.0, left: 6.0, right: 6.0),
                              child: AppText(
                                "${widget.workOrderModel.state}",
                                size: 10,
                                color: widget.workOrderModel.state == "Arrived"
                                    ? Colors.green
                                    : widget.workOrderModel.state == "Assigned"
                                        ? Colors.blue
                                        : Colors.amber,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12.0),
                  AppTextSpan(
                    text1: "Activity: ",
                    textStyle1: const TextStyle(color: Colors.black, fontSize: 12.0),
                    text3: widget.workOrderModel.activity,
                    textStyle3: const TextStyle(color: Colors.grey, fontSize: 12.0),
                  ),
                  const SizedBox(height: 12.0),
                  Wrap(
                    children: [
                      AppTextSpan(
                        text1: "Assigned to: ",
                        textStyle1: const TextStyle(color: Colors.black, fontSize: 12.0),
                        text3: widget.workOrderModel.assigned,
                        textStyle3: const TextStyle(color: Colors.grey, fontSize: 12.0),
                      ),
                      const SizedBox(width: 4.0),
                      AppTextSpan(
                        text1: "Responsible Agent: ",
                        textStyle1: const TextStyle(color: Colors.black, fontSize: 12.0),
                        text3: widget.workOrderModel.responsibleAgent,
                        textStyle3: const TextStyle(color: Colors.grey, fontSize: 12.0),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12.0),
                  Wrap(
                    children: [
                      AppTextSpan(
                        text1: "Area: ",
                        textStyle1: const TextStyle(color: Colors.black, fontSize: 12.0),
                        text3: widget.workOrderModel.area,
                        textStyle3: const TextStyle(color: Colors.grey, fontSize: 12.0),
                      ),
                      const SizedBox(width: 4.0),
                      AppTextSpan(
                        text1: "Location: ",
                        textStyle1: const TextStyle(color: Colors.black, fontSize: 12.0),
                        text3: widget.workOrderModel.location,
                        textStyle3: const TextStyle(color: Colors.grey, fontSize: 12.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: AnotherStepper(
                stepperList: stepperData,
                stepperDirection: Axis.vertical,
                iconWidth: 40,
                iconHeight: 40,
                activeBarColor: Colors.green,
                inActiveBarColor: Colors.grey,
                verticalGap: 30,
                activeIndex: widget.workOrderModel.pickedTime == null
                    ? 0
                    : widget.workOrderModel.arrivedTime == null
                        ? 1
                        : 2,
                barThickness: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:etrack_mobile_connector_app/config/dio/app_dio.dart';
import 'package:etrack_mobile_connector_app/models/work_order_model.dart';
import 'package:etrack_mobile_connector_app/modules/work_order/controllers/work_order_controller.dart';
import 'package:etrack_mobile_connector_app/modules/work_order/views/work_order_details_screen.dart';
import 'package:etrack_mobile_connector_app/widgets/app_loading.dart';
import 'package:etrack_mobile_connector_app/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WorkOrderScreen extends StatefulWidget {
  const WorkOrderScreen({Key? key}) : super(key: key);

  @override
  State<WorkOrderScreen> createState() => _WorkOrderScreenState();
}

class _WorkOrderScreenState extends State<WorkOrderScreen> {
  GlobalKey<RefreshIndicatorState> refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    final workOrderController = Provider.of<WorkOrderController>(context);
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Center(child: AppText("Work Orders", color: Colors.white, isBold: true)),
      ),
      body: workOrderController.loading
          ? ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: const AppLoading(
                          width: 40.0,
                          height: 40.0,
                          radius: 50.0,
                        ),
                        title: const AppLoading(
                          width: 10.0,
                          height: 10.0,
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 4.0),
                            Row(
                              children: [
                                AppLoading(
                                  width: screenSize.width * 0.3,
                                  height: 8.0,
                                ),
                                const SizedBox(width: 8.0),
                                AppLoading(
                                  width: screenSize.width * 0.3,
                                  height: 8.0,
                                ),
                              ],
                            ),
                            const SizedBox(height: 4.0),
                            AppLoading(
                              width: screenSize.width * 0.3,
                              height: 8.0,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12, right: 12),
                        child: AppLoading(
                          width: screenSize.width * 0.8,
                          height: 8.0,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 14.0, right: 14.0),
                        child: Divider(),
                      ),
                    ],
                  ),
                );
              },
            )
          : workOrderController.workOrderModelList.isEmpty
              ? const Center(child: AppText("Work Orders not found!"))
              : Consumer<WorkOrderController>(
                  builder: (context, workOrderConsumer, child) {
                    return RefreshIndicator(
                      key: refreshIndicatorKey,
                      color: Colors.blue,
                      onRefresh: () async {
                        await workOrderController.getWorkOrders(context);
                      },
                      child: ListView.builder(
                        itemCount: workOrderConsumer.workOrderModelList.length,
                        itemBuilder: (context, index) {
                          WorkOrderModel item = workOrderConsumer.workOrderModelList[index];

                          return InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) => WorkOrderDetailsScreen(workOrderModel: item)));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 4.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor: item.state == "Arrived"
                                          ? Colors.green.withOpacity(0.8)
                                          : item.state == "Assigned"
                                              ? Colors.blue.withOpacity(0.8)
                                              : Colors.amber.withOpacity(0.8),
                                      child: const Icon(
                                        Icons.work_history_rounded,
                                        color: Colors.white,
                                        size: 22.0,
                                      ),
                                    ),
                                    title: AppText("Project ID: ${item.projectId}", size: 14.0),
                                    subtitle: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            AppText(
                                              "Work order: ${item.workOrder}",
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
                                                        color: item.state == "Arrived"
                                                            ? Colors.green
                                                            : item.state == "Assigned"
                                                                ? Colors.blue
                                                                : Colors.amber,
                                                      ),
                                                      borderRadius: const BorderRadius.all(Radius.circular(10.0))),
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(bottom: 1.0, left: 6.0, right: 6.0),
                                                    child: AppText(
                                                      "${item.state}",
                                                      size: 10,
                                                      color: item.state == "Arrived"
                                                          ? Colors.green
                                                          : item.state == "Assigned"
                                                              ? Colors.blue
                                                              : Colors.amber,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(width: 8.0),
                                        AppText(
                                          "Area: ${item.area}",
                                          size: 12,
                                          color: Colors.grey,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12, right: 12),
                                    child: AppText(
                                      "Scheduled Date: ${workOrderConsumer.dateTimeConverter(item.scheduledDate!)}",
                                      color: Colors.grey,
                                      size: 12,
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 14.0, right: 14.0),
                                    child: Divider(),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
    );
  }

  _init() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final workOrderController = Provider.of<WorkOrderController>(context, listen: false);
      workOrderController.dio = AppDio(context);
      workOrderController.logger.init();
      workOrderController.getWorkOrders(context);
    });
  }
}

import 'dart:convert';

class WorkOrderModel {
  int? recordId;
  String? projectId;
  String? workOrder;
  String? toDoFilter;
  String? area;
  String? assigned;
  String? responsibleAgent;
  String? location;
  String? activity;
  String? scheduledDate;
  String? state;
  String? pickedTime;
  String? arrivedTime;
  String? coordinates;

  WorkOrderModel({
    this.recordId,
    this.projectId,
    this.workOrder,
    this.toDoFilter,
    this.area,
    this.assigned,
    this.responsibleAgent,
    this.location,
    this.activity,
    this.scheduledDate,
    this.state,
    this.pickedTime,
    this.arrivedTime,
    this.coordinates,
  });

  factory WorkOrderModel.fromJson(Map<String, dynamic> jsonData) {
    return WorkOrderModel(
      recordId: jsonData['record_id'],
      projectId: jsonData['project_id'],
      workOrder: jsonData['work_order'],
      toDoFilter: jsonData['to_do_filter'],
      area: jsonData['area'],
      assigned: jsonData['assigned'],
      responsibleAgent: jsonData['responsible_agent'],
      location: jsonData['location'],
      activity: jsonData['activity'],
      scheduledDate: jsonData['scheduled_date'],
      state: jsonData['state'],
      pickedTime: jsonData['picked_time'],
      arrivedTime: jsonData['arrived_time'],
      coordinates: jsonData['coordinates'],
    );
  }

  static Map<String, dynamic> toMap(WorkOrderModel workOrderModel) => {
        'record_id': workOrderModel.recordId,
        'project_id': workOrderModel.projectId,
        'work_order': workOrderModel.workOrder,
        'to_do_filter': workOrderModel.toDoFilter,
        'area': workOrderModel.area,
        'assigned': workOrderModel.assigned,
        'responsible_agent': workOrderModel.responsibleAgent,
        'location': workOrderModel.location,
        'activity': workOrderModel.activity,
        'scheduled_date': workOrderModel.scheduledDate,
        'state': workOrderModel.state,
        'picked_time': workOrderModel.pickedTime,
        'arrived_time': workOrderModel.arrivedTime,
        'coordinates': workOrderModel.coordinates,
      };

  static String encode(List<WorkOrderModel> workOrderModels) => json.encode(
        workOrderModels.map<Map<String, dynamic>>((workOrderModel) => WorkOrderModel.toMap(workOrderModel)).toList(),
      );

  static List<WorkOrderModel> decode(String workOrderModels) =>
      (json.decode(workOrderModels) as List<dynamic>).map<WorkOrderModel>((item) => WorkOrderModel.fromJson(item)).toList();
}

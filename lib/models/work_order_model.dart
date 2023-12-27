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

  WorkOrderModel.fromJson(Map<String, dynamic> json) {
    recordId = json['record_id'];
    projectId = json['project_id'];
    workOrder = json['work_order'];
    toDoFilter = json['to_do_filter'];
    area = json['area'];
    assigned = json['assigned'];
    responsibleAgent = json['responsible_agent'];
    location = json['location'];
    activity = json['activity'];
    scheduledDate = json['scheduled_date'];
    state = json['state'];
    pickedTime = json['picked_time'];
    arrivedTime = json['arrived_time'];
    coordinates = json['coordinates'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['record_id'] = recordId;
    data['project_id'] = projectId;
    data['work_order'] = workOrder;
    data['to_do_filter'] = toDoFilter;
    data['area'] = area;
    data['assigned'] = assigned;
    data['responsible_agent'] = responsibleAgent;
    data['location'] = location;
    data['activity'] = activity;
    data['scheduled_date'] = scheduledDate;
    data['state'] = state;
    data['picked_time'] = pickedTime;
    data['arrived_time'] = arrivedTime;
    data['coordinates'] = coordinates;

    return data;
  }
}

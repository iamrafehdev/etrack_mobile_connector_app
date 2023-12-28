import 'package:dio/dio.dart';
import 'package:etrack_mobile_connector_app/config/app_urls.dart';
import 'package:etrack_mobile_connector_app/config/conectivity/conectivity.dart';
import 'package:etrack_mobile_connector_app/config/dio/app_dio.dart';
import 'package:etrack_mobile_connector_app/config/keys/response_code.dart';
import 'package:etrack_mobile_connector_app/config/logger/app_logger.dart';
import 'package:etrack_mobile_connector_app/models/work_order_model.dart';
import 'package:fialogs/fialogs.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class WorkOrderController extends ChangeNotifier {
  AppLogger logger = AppLogger();
  bool loading = false;
  late AppDio dio;
  List<WorkOrderModel> workOrderModelList = [];

  updateState() {
    notifyListeners();
  }

  connectivity(context) {
    internet(
      connected: () {
        //
      },
      notConnected: () {
        // notConnectedDialog(context);
      },
    );
  }

  getWorkOrders(context) async {
    loading = true;
    updateState();
    try {
      var response = await dio.get(
        path: AppUrls.downloadWorkOrder,
        options: Options(
          headers: {"API-KEY": "LB00759"},
        ),
      );

      if (loading) {
        loading = false;
      }

      var responseStatusCode = response.statusCode;
      var responseData = response.data;

      if (responseStatusCode == StatusCode.OK) {
        var childes = responseData['data']['work_orders'];
        List<WorkOrderModel> tempList = [];
        childes.forEach((item) {
          tempList.add(WorkOrderModel.fromJson(item));
        });
        workOrderModelList = tempList;
        updateState();
      } else {
        if (responseData != null) {
          warningDialog(context, responseData['message'], responseData['description'], closeOnBackPress: true, neutralButtonText: "OK");
        } else {
          errorDialog(context, "Error", "Something went wrong please try again later", closeOnBackPress: true, neutralButtonText: "OK");
        }
      }
    } catch (e, s) {
      if (loading) {
        loading = false;
      }
      logger.e('Error', e, s);
      errorDialog(context, "Error", "Something went wrong please try again", closeOnBackPress: true, neutralButtonText: "OK");
    }
  }

  Future<void> openMap(context, double latitude, double longitude) async {
    final Uri url = Uri.parse('https://www.google.com/maps/search/?api=1&query=$latitude,$longitude');

    if (!await launchUrl(url)) {
      errorDialog(context, "Invalid", "Could not launch $url");
      throw Exception('Could not launch $url');
    }
  }

  dateTimeConverter(String date) {
    var inputFormat = DateFormat('dd/MM/yyyy HH:mm');
    var inputDate = inputFormat.parse(date);
    var outputFormat = DateFormat('EEEE, dd/MM/yyyy hh:mm a');
    var outputScheduledDate = outputFormat.format(inputDate);
    return outputScheduledDate;
  }
}

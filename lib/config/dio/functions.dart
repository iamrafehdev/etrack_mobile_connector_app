import 'package:dio/dio.dart';
import 'package:etrack_mobile_connector_app/config/keys/response_code.dart';
import 'package:fialogs/fialogs.dart';
import 'package:flutter/cupertino.dart';

responseError(BuildContext context, Response response) {
  if (StatusCode.isBadRequest(response.statusCode!)) {
    errorDialog(
        context, "Bad Request", "${response.data[ResponseAttrs.MESSAGE]}");
  } else if (StatusCode.isServerError(response.statusCode!)) {
    errorDialog(
        context, "Server Error", "${response.data[ResponseAttrs.MESSAGE]}");
  } else {
    errorDialog(context, "Error", "${response.data[ResponseAttrs.MESSAGE]}");
  }
}

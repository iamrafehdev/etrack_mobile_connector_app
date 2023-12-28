import 'package:etrack_mobile_connector_app/modules/work_order/views/work_order_screen.dart';
import 'package:flutter/material.dart';
import 'package:req_fun/req_fun.dart';

class SplashController extends ChangeNotifier {

  navigateToMain(context){
    delayInSeconds(2, (){
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
          const WorkOrderScreen()), (Route<dynamic> route) => false);
    });
  }

}

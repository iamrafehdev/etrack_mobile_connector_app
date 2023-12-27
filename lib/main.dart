import 'package:etrack_mobile_connector_app/modules/work_order/controllers/work_order_controller.dart';
import 'package:etrack_mobile_connector_app/modules/work_order/views/work_order_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => WorkOrderController(),
        ),
      ],
      child: const MaterialApp(
        title: 'ETrack Mobile Connector',
        debugShowCheckedModeBanner: false,
        home: WorkOrderScreen(),
      ),
    );
  }
}
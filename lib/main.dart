import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pages/homepage.dart';
import 'models/pages/pages.dart';
import 'models/Inventories/inventory.dart';
import 'models/robots/robot.dart';
import 'models/flowin/flow_in.dart';
import 'models/flowout/flow_out.dart';
import 'models/warehouse/warehouse.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PagesBloc>(
          create: (context) => PagesBloc()..add(PagesLoadingEvent()),
        ),
        BlocProvider<InventoryBloc>(
          create: (context) => InventoryBloc()..add(InventoryLoadingEvent()),
        ),
        BlocProvider<RobotBloc>(
          create: (context) => RobotBloc()..add(RobotLoadingEvent()),
        ),
        BlocProvider<FlowInBloc>(
          create: (context) => FlowInBloc()..add(FlowInLoadingEvent()),
        ),
        BlocProvider<FlowOutBloc>(
          create: (context) => FlowOutBloc()..add(FlowOutLoadingEvent()),
        ),
        BlocProvider<WarehouseBloc>(
          create: (context) => WarehouseBloc()..add(WarehouseLoadingEvent()),
        ),
      ], 
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MyHomePage(),
      )
    );
  }
}

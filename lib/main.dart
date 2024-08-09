import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:limerick_task/blocs/all_bloc_providers/bloc_providers.dart';
import 'package:limerick_task/views/pages/login_screen.dart';
import 'package:limerick_task/views/pages/product_screen.dart';

final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AllBlocProviders.getAllBlocProviders],
      child: MaterialApp(
        scaffoldMessengerKey: rootScaffoldMessengerKey,
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      ),
    );
  }
}

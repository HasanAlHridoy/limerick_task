import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:limerick_task/blocs/login_bloc/login_bloc.dart';
import 'package:limerick_task/blocs/product_bloc/product_bloc.dart';

class AllBlocProviders {
  static List getAllBlocProviders = [
    BlocProvider(create: (context) => LoginBloc()),
    BlocProvider(create: (context) => ProductBloc()),
  ];
}

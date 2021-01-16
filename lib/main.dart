import 'package:cyborgs/view/sheet/bloc/sheet_info_bloc.dart';
import 'package:cyborgs/view/splash_screen/splash_screen_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:cyborgs/provider/product_provider.dart';

void main() async {
  runApp(FirstScreen());
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<SheetInfoBloc>(
            create: (context) =>
                SheetInfoBloc()..add(LoadingDataFromGoogleSheet()),
          ),
        ],
        child: MaterialApp(
          home: SplashScreenView(),
        ),
      ),
    );
  }
}

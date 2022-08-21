// ignore_for_file: avoid_print, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/layout_screen/layout_screen.dart';
import 'package:medical_app/modules/auth_screens/login_screen.dart';
import 'package:medical_app/shared/components/constants.dart';
import 'package:medical_app/shared/cubit/app_cubit/medical_cubit.dart';
import 'package:medical_app/shared/cubit/app_cubit/medical_states.dart';
import 'package:medical_app/shared/network/local/cach_helper.dart';
import 'package:medical_app/shared/styles/themdata.dart';
import 'block_observer.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  BlocOverrides.runZoned(
    () async {
      await CachHelper.init();
      late Widget widget;
      uId = CachHelper.getData(key: 'uId');
      print(uId);
      if (uId != null) {
        widget = LayoutScreen();
      } else {
        widget = LoginScreen();
      }
      runApp(MyApp(initialWidget: widget));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  late final Widget initialWidget;
  MyApp({Key? key, required this.initialWidget}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => MedicalCubit())],
      child: BlocConsumer<MedicalCubit, MedicalAppStates>(
        listener: (context, state) {},
        builder: (context, state) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightThem,
          home: initialWidget,
          //LayoutScreen(),
        ),
      ),
    );
  }
}

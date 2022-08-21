import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/shared/cubit/app_cubit/medical_cubit.dart';
import 'package:medical_app/shared/cubit/app_cubit/medical_states.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MedicalCubit, MedicalAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
                title: MedicalCubit.get(context)
                    .titles[MedicalCubit.get(context).currentIndex]),
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: MedicalCubit.get(context).currentIndex,
                onTap: (index) {
                  MedicalCubit.get(context)
                      .changeBottomNavigationBarItems(index);
                },
                items: MedicalCubit.get(context).items),
            body: MedicalCubit.get(context)
                .screens[MedicalCubit.get(context).currentIndex]);
      },
    );
  }
}

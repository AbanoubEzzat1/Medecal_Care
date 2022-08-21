import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:medical_app/models/medicine_model.dart';
import 'package:medical_app/modules/Medicines_screen/add_medicine.dart';
import 'package:medical_app/modules/Medicines_screen/edit_medicine_screen.dart';
import 'package:medical_app/shared/components/components.dart';
import 'package:medical_app/shared/cubit/app_cubit/medical_cubit.dart';
import 'package:medical_app/shared/cubit/app_cubit/medical_states.dart';

class MedicinesScreen extends StatelessWidget {
  const MedicinesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MedicalCubit, MedicalAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 15),
              additem(context),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => deffaultTaskItem(
                  MedicalCubit.get(context).medicines[index],
                  context,
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  width: double.infinity,
                  height: 1,
                ),
                itemCount: MedicalCubit.get(context).medicines.length,
              ),
            ],
          ),
        );
      },
    );
  }
}

Widget additem(context) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: () {
          navigateTo(context, AddMedicineScreen());
        },
        child: Container(
          margin: const EdgeInsetsDirectional.only(bottom: 10),
          height: 65,
          decoration: BoxDecoration(
            color: Colors.blue.shade400,
            borderRadius: const BorderRadiusDirectional.only(
              topStart: Radius.circular(20),
              topEnd: Radius.circular(20),
              bottomEnd: Radius.circular(20),
              bottomStart: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                CircleAvatar(
                    backgroundColor: HexColor("#FFFFFF"),
                    radius: 20,
                    child: const Icon(
                      Icons.add,
                      size: 25,
                    )),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "Add Medicine",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

Widget deffaultTaskItem(
  MedicineModel medicineModel,
  context,
) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        margin: const EdgeInsetsDirectional.only(bottom: 10),
        height: 85,
        decoration: BoxDecoration(
          color: Colors.blue.shade400,
          borderRadius: const BorderRadiusDirectional.only(
            topStart: Radius.circular(20),
            topEnd: Radius.circular(20),
            bottomEnd: Radius.circular(20),
            bottomStart: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: HexColor("#FFFFFF"),
                radius: 20,
                child: Text(
                  "${medicineModel.quantity}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${medicineModel.name}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "${medicineModel.dateTime}",
                      style: TextStyle(
                        color: HexColor("#272C33"),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  // navigateTo(
                  //   context,
                  //   EditedicineScreen(medicineModel: medicineModel),
                  // );
                },
                icon: const Icon(
                  Icons.edit,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );


    // Widget deffaultTaskItem() => Dismissible(
    //   key: Key("test"),
    //   child: Padding(
    //     padding: const EdgeInsets.symmetric(horizontal: 10),
    //     child: Container(
    //       margin: const EdgeInsetsDirectional.only(bottom: 10),
    //       height: 85,
    //       decoration: BoxDecoration(
    //         color: HexColor("#704BF4").withOpacity(0.9),
    //         borderRadius: const BorderRadiusDirectional.only(
    //           topStart: Radius.circular(20),
    //           topEnd: Radius.circular(20),
    //           bottomEnd: Radius.circular(20),
    //           bottomStart: Radius.circular(20),
    //         ),
    //       ),
    //       child: Padding(
    //         padding: const EdgeInsets.all(20.0),
    //         child: Row(
    //           children: [
    //             CircleAvatar(
    //               backgroundColor: HexColor("#FFFFFF"),
    //               radius: 40,
    //               child: Text(
    //                 "29",
    //                 style: const TextStyle(
    //                     fontWeight: FontWeight.bold, color: Colors.black),
    //               ),
    //             ),
    //             const SizedBox(
    //               width: 10,
    //             ),
    //             Expanded(
    //               child: Column(
    //                 mainAxisSize: MainAxisSize.min,
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text(
    //                     "'title'",
    //                     style: const TextStyle(
    //                       fontWeight: FontWeight.bold,
    //                       fontSize: 18,
    //                     ),
    //                   ),
    //                   const SizedBox(
    //                     height: 5,
    //                   ),
    //                   Text(
    //                     "13-4-1997",
    //                     style: TextStyle(
    //                       color: HexColor("#272C33"),
    //                       fontSize: 16,
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             IconButton(
    //                 onPressed: () {
    //                   // AppCubit.get(context).updateDataFromDatabase(
    //                   //   status: "Done",
    //                   //   id: model['id'],
    //                   // );
    //                 },
    //                 icon: Icon(
    //                   Icons.check_box,
    //                   size: 30,
    //                   color: HexColor("#D5A9BB"),
    //                 )),
    //             IconButton(
    //                 onPressed: () {
    //                   // AppCubit.get(context).updateDataFromDatabase(
    //                   //   status: "Archive",
    //                   //   id: model['id'],
    //                   // );
    //                 },
    //                 icon: Icon(
    //                   Icons.archive,
    //                   size: 30,
    //                   color: HexColor("#D5A9BB"),
    //                 )),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    //   onDismissed: (DismissDirection direction) {
    //     if (direction == DismissDirection.endToStart) {
    //       // AppCubit.get(context).deleateDataFromDatabase(id: model['id']);
    //     } else {
    //       // AppCubit.get(context)
    //       //     .updateDataFromDatabase(status: "New", id: model['id']);
    //     }
    //   },
    //   background: Container(
    //     margin: const EdgeInsets.all(20),
    //     padding: const EdgeInsets.all(20),
    //     alignment: AlignmentDirectional.centerStart,
    //     color: Colors.blue,
    //     child: const Text(
    //       "Again To Tasks",
    //       style: TextStyle(
    //           color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
    //     ),
    //   ),
    //   secondaryBackground: Container(
    //     margin: const EdgeInsets.all(20),
    //     padding: const EdgeInsets.all(20),
    //     alignment: AlignmentDirectional.centerEnd,
    //     child: const Text(
    //       "Delete",
    //       style: TextStyle(
    //           color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
    //     ),
    //     color: Colors.red,
    //   ),
    // );

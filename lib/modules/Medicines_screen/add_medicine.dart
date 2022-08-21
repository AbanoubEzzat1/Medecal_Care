import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:medical_app/shared/components/components.dart';
import 'package:medical_app/shared/cubit/app_cubit/medical_cubit.dart';
import 'package:medical_app/shared/cubit/app_cubit/medical_states.dart';

class AddMedicineScreen extends StatelessWidget {
  AddMedicineScreen({Key? key}) : super(key: key);
  TextEditingController medicineNamecontroller = TextEditingController();
  TextEditingController medicineQuantitycontroller = TextEditingController();
  TextEditingController notescontroller = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MedicalCubit, MedicalAppStates>(
      listener: (context, state) {
        if (state is MedicalAppAddMedicineSuccessState) {
          medicineNamecontroller.clear();
          medicineQuantitycontroller.clear();
          notescontroller.clear();
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 30,
            backgroundColor: HexColor("#FAFAFA"),
            // titleSpacing: 0,
            // title: const Text(
            //   "Add Medicine",
            //   style: TextStyle(
            //     fontSize: 18,
            //     color: Colors.white,
            //   ),
            // ),
          ),
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    "https://img.freepik.com/free-vector/smooth-white-wave-background_52683-55288.jpg?t=st=1649240421~exp=1649241021~hmac=f197838f803b59107478df40d7f7d467cfe773b05222f7f64291df9bedf34da6&w=740"),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (state is MedicalAppAddMedicineLoadingState)
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        child: LinearProgressIndicator(),
                      ),

                    // Container(
                    //   padding: EdgeInsets.only(bottom: 30),
                    //   width: double.infinity,
                    //   child: const CircleAvatar(
                    //     radius: 40,
                    //     backgroundColor: Colors.red,
                    //   ),
                    //   height: 180,
                    //   decoration: deffaultDecoration(
                    //     bottomEnd: 70,
                    //     bottomStart: 70,
                    //     topEnd: 0,
                    //     topStart: 0,
                    //     backgroundColor: Colors.blue,
                    //   ),
                    // ),
                    // const SizedBox(height: 15),

                    deffaultFormField(
                      controller: medicineNamecontroller,
                      labelText: "Medicine Name",
                      prefix: Icons.abc,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "Medicine Name can't be embty";
                        }
                      },
                    ),
                    const SizedBox(height: 15),
                    deffaultFormField(
                      controller: medicineQuantitycontroller,
                      labelText: "medicine Quantity",
                      prefix: Icons.abc,
                      type: TextInputType.number,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "Medicine Name can't be embty";
                        }
                        if (value == 0) {
                          return "Medicine Name can't be 0 ";
                        }
                      },
                    ),
                    const SizedBox(height: 15),
                    deffaultFormField(
                      controller: notescontroller,
                      labelText: "Notes",
                      prefix: Icons.abc,
                    ),
                    const SizedBox(height: 15),
                    deffaultButton(
                      function: () {
                        if (formKey.currentState!.validate()) {
                          MedicalCubit.get(context).addMedicine(
                            dateTime: DateFormat.yMd()
                                .add_jm()
                                .format(DateTime.now()),
                            medicinename: medicineNamecontroller.text,
                            quantity: medicineQuantitycontroller.text,
                          );
                        }
                      },
                      text: "upload",
                    ),
                    // const Spacer(),
                    // Container(
                    //   height: 180,
                    //   decoration: deffaultDecoration(
                    //     bottomEnd: 0,
                    //     bottomStart: 0,
                    //     topEnd: 70,
                    //     topStart: 70,
                    //     backgroundColor: Colors.blue,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

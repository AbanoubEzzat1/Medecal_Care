import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:medical_app/models/medicine_model.dart';
import 'package:medical_app/shared/components/components.dart';
import 'package:medical_app/shared/cubit/app_cubit/medical_cubit.dart';
import 'package:medical_app/shared/cubit/app_cubit/medical_states.dart';

class EditedicineScreen extends StatelessWidget {
  final MedicineModel medicineModel;
  EditedicineScreen({Key? key, required this.medicineModel}) : super(key: key);
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
        // var medicineModel = MedicalCubit.get(context).medicineModel;
        medicineNamecontroller.text = medicineModel.name!;
        medicineQuantitycontroller.text = medicineModel.quantity!;
        notescontroller.text = medicineModel.note!;
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 30,
          ),
          body: Container(
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
                          MedicalCubit.get(context).editMedicine(
                            dateTime: DateFormat.yMd()
                                .add_jm()
                                .format(DateTime.now()),
                            medicinename: medicineNamecontroller.text,
                            quantity: medicineQuantitycontroller.text,
                          );
                        }
                      },
                      text: "edit",
                    ),
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

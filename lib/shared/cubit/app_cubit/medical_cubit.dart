import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/models/medicine_model.dart';
import 'package:medical_app/modules/Medicines_screen/Medicines_screen.dart';
import 'package:medical_app/modules/Settings_screen/Settings_screen.dart';
import 'package:medical_app/modules/auth_screens/login_screen.dart';
import 'package:medical_app/modules/chats_screen/chats_screen.dart';
import 'package:medical_app/modules/home_screen/home_screen.dart';
import 'package:medical_app/shared/components/components.dart';
import 'package:medical_app/shared/components/constants.dart';
import 'package:medical_app/shared/cubit/app_cubit/medical_states.dart';

class MedicalCubit extends Cubit<MedicalAppStates> {
  MedicalCubit() : super(MedicalAppInitialState());
  static MedicalCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  void changeBottomNavigationBarItems(int index) {
    if (index == 0) {
      print("Hello from 0 index");
    }
    if (index == 1) {
      getMedicines();
      print("Hello from 1 index");
    }
    if (index == 2) {
      print("Hello from 2 index");
    }
    if (index == 3) {
      print("Hello from 3 index");
    }

    currentIndex = index;
    emit(MedicalChangeBottomNavigationBarItemsState());
  }

  List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.upcoming),
      label: 'Medicines',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.chat_bubble),
      label: 'Chat',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
    ),
  ];
  List<Widget> titles = [
    const Text("Home"),
    const Text("Medicines"),
    // Row(
    //   children: [
    //     const Text("Medicines"),
    //     const Spacer(),
    //     deffaultTextButton(
    //       fontSize: 16,
    //       color: Colors.blue,
    //       onPressed: () {},
    //       text: "Add medicine",
    //     )
    //   ],
    // ),
    const Text("Chat"),
    const Text("Settings"),
  ];
  List<Widget> screens = [
    HomeScreen(),
    MedicinesScreen(),
    ChatsScreen(),
    SettingsScreen(),
  ];
  void addMedicine({
    required String dateTime,
    String? medicineCode,
    required String? medicinename,
    required String? quantity,
    String? note,
    String? docId,
  }) {
    emit(MedicalAppAddMedicineLoadingState());
    MedicineModel medicineModel = MedicineModel(
      dateTime: dateTime,
      medicineCode: medicineCode ?? "",
      name: medicinename,
      quantity: quantity,
      note: note ?? "",
      uId: uId,
      docId: docId,
    );
    FirebaseFirestore.instance
        .collection("users")
        .doc(uId)
        .collection("myMedicine")
        .add(medicineModel.toMap())
        .then((value) {
      getMedicines();
      emit(MedicalAppAddMedicineSuccessState());
    }).catchError((erorr) {
      emit(MedicalAppAddMedicineErorrState(erorr));
    });
  }

  void editMedicine({
    required String dateTime,
    String? medicineCode,
    required String? medicinename,
    required String? quantity,
    String? note,
  }) {
    emit(MedicalAppEditMedicineLoadingState());
    MedicineModel medicineModel = MedicineModel(
      dateTime: dateTime,
      medicineCode: medicineCode ?? "",
      name: medicinename,
      quantity: quantity,
      note: note ?? "",
      uId: uId,
    );
    FirebaseFirestore.instance
        .collection("users")
        .doc(uId)
        .collection("myMedicine")
        .doc("uXX80Tojzj5yk8gC8o9M")
        .update(medicineModel.toMap())
        .then((value) {
      emit(MedicalAppEditMedicineSuccessState());
    }).catchError((erorr) {
      emit(MedicalAppEditMedicineErorrState(erorr));
    });
  }

  List<MedicineModel> medicines = [];
  MedicineModel? medicineModel;
  void getMedicines() {
    medicines = [];
    emit(MedicalAppGetMedicinesLoadingState());
    FirebaseFirestore.instance
        .collection("users")
        .doc(uId)
        .collection("myMedicine")
        .orderBy("dateTime", descending: true)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        medicines.add(MedicineModel.fromJson(element.data()));
        print("--------------------------+++-----------------------------");
        print(medicines.length);
      });
      emit(MedicalAppGetMedicinesSuccessState());
    }).catchError((erorr) {
      emit(MedicalAppGetMedicinesErorrState(erorr));
      print(erorr.toString());
    });
  }

  void signOut(context) {
    emit(MedicalAppSignOutLoadingState());
    FirebaseAuth.instance.signOut().then((value) {
      navigateTo(context, LoginScreen());
      emit(MedicalAppSignOutSuccessState());
    }).catchError((error) {
      emit(MedicalAppSignOutErorrState(error));
    });
  }
}

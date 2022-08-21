import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:medical_app/models/user_model.dart';
import 'package:medical_app/shared/cubit/auth_cubit/register_states.dart';

class MedicalAppRegisterCubit extends Cubit<MedicalAppRegisterStates> {
  MedicalAppRegisterCubit() : super(MedicalRegisterInitialState());
  static MedicalAppRegisterCubit get(context) => BlocProvider.of(context);
  IconData suffex = Icons.visibility_off;
  bool isPassword = true;
  void checkVisibility() {
    isPassword = !isPassword;
    suffex = isPassword ? Icons.visibility_off : Icons.visibility;
    emit(MedicalRegisterVisibilityState());
  }

  void userRegister({
    required String name,
    required String email,
    required String password,
  }) {
    emit(MedicalAppRegisterLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      createUser(
        name: name,
        email: email,
        uId: value.user!.uid,
      );
      emit(MedicalAppRegisterSuccessState());
    }).catchError((erorr) {
      emit(MedicalAppRegisterErorrState(erorr));
      print(erorr.toString());
    });
  }

  void signInWithGoogle() async {
    emit(MedicalAppCreateUserWithGoogleLoadingState());
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(credential).then((value) {
      createUser(
        name: value.user!.displayName.toString(),
        email: value.user!.email.toString(),
        uId: value.user!.uid,
      );
      emit(MedicalAppCreateUserWithGoogleSuccessState());
    }).catchError((erorr) {
      emit(MedicalAppCreateUserWithGoogleErorrState(erorr));
    });
  }

  void createUser({
    required String name,
    required String email,
    required String uId,
    String? image,
    String? bio,
  }) {
    emit(MedicalAppCreateUserLoadingState());
    UserModel userModel = UserModel(
      name: name,
      email: email,
      uId: uId,
      image: image,
      bio: bio,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(userModel.toMap())
        .then((value) {
      emit(MedicalAppCreateUserSuccessState());
    }).catchError(((erorr) {
      emit(MedicalAppCreateUserErorrState(erorr));
      print(erorr.toString());
    }));
  }
}

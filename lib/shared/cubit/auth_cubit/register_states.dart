class MedicalAppRegisterStates {}

class MedicalRegisterInitialState extends MedicalAppRegisterStates {}

class MedicalRegisterVisibilityState extends MedicalAppRegisterStates {}

//Start of userRegister
class MedicalAppRegisterLoadingState extends MedicalAppRegisterStates {}

class MedicalAppRegisterSuccessState extends MedicalAppRegisterStates {}

class MedicalAppRegisterErorrState extends MedicalAppRegisterStates {
  final String erorr;

  MedicalAppRegisterErorrState(this.erorr);
}
//End of userRegister

//Start of signInWithGoogle
class MedicalAppCreateUserWithGoogleLoadingState
    extends MedicalAppRegisterStates {}

class MedicalAppCreateUserWithGoogleSuccessState
    extends MedicalAppRegisterStates {}

class MedicalAppCreateUserWithGoogleErorrState
    extends MedicalAppRegisterStates {
  final String erorr;

  MedicalAppCreateUserWithGoogleErorrState(this.erorr);
}
//End of signInWithGoogle

//Start of createUser
class MedicalAppCreateUserLoadingState extends MedicalAppRegisterStates {}

class MedicalAppCreateUserSuccessState extends MedicalAppRegisterStates {}

class MedicalAppCreateUserErorrState extends MedicalAppRegisterStates {
  final String erorr;

  MedicalAppCreateUserErorrState(this.erorr);
}
//Start of createUser

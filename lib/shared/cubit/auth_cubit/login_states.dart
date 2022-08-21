class MedicalAppLoginStates {}

class MedicalAppLoginInitialState extends MedicalAppLoginStates {}

class MedicalAppVisibilityState extends MedicalAppLoginStates {}

//Start of userLogin
class MedicalAppLoginLoadingState extends MedicalAppLoginStates {}

class MedicalAppLoginSuccessState extends MedicalAppLoginStates {
  final String uId;

  MedicalAppLoginSuccessState(this.uId);
}

class MedicalAppLoginErorrState extends MedicalAppLoginStates {
  final String erorr;

  MedicalAppLoginErorrState(this.erorr);
}
//End of userLogin

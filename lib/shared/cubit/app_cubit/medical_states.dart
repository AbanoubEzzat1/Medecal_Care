abstract class MedicalAppStates {}

class MedicalAppInitialState extends MedicalAppStates {}

class MedicalChangeBottomNavigationBarItemsState extends MedicalAppStates {}

//Start of signOut
class MedicalAppSignOutLoadingState extends MedicalAppStates {}

class MedicalAppSignOutSuccessState extends MedicalAppStates {}

class MedicalAppSignOutErorrState extends MedicalAppStates {
  final String erorr;

  MedicalAppSignOutErorrState(this.erorr);
}
//End of signOut

//Start of addMedicine
class MedicalAppAddMedicineLoadingState extends MedicalAppStates {}

class MedicalAppAddMedicineSuccessState extends MedicalAppStates {}

class MedicalAppAddMedicineErorrState extends MedicalAppStates {
  final String erorr;

  MedicalAppAddMedicineErorrState(this.erorr);
}

//End of addMedicine
//Start of addMedicine
class MedicalAppEditMedicineLoadingState extends MedicalAppStates {}

class MedicalAppEditMedicineSuccessState extends MedicalAppStates {}

class MedicalAppEditMedicineErorrState extends MedicalAppStates {
  final String erorr;

  MedicalAppEditMedicineErorrState(this.erorr);
}

//End of addMedicine
//Start of getMedicine
class MedicalAppGetMedicinesLoadingState extends MedicalAppStates {}

class MedicalAppGetMedicinesSuccessState extends MedicalAppStates {}

class MedicalAppGetMedicinesErorrState extends MedicalAppStates {
  final String erorr;

  MedicalAppGetMedicinesErorrState(this.erorr);
}
//End of getMedicine
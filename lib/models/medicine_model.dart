class MedicineModel {
  String? name;
  String? uId;
  String? dateTime;
  String? note;
  String? medicineCode;
  String? quantity;
  String? docId;

  MedicineModel({
    this.name,
    this.uId,
    this.dateTime,
    this.note,
    this.medicineCode,
    this.quantity,
    this.docId,
  });
  MedicineModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    uId = json['uId'];
    dateTime = json['dateTime'];
    note = json['note'];
    medicineCode = json['medicineCode'];
    quantity = json['quantity'];
    docId = json['docId'];
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'uId': uId,
      'dateTime': dateTime,
      'note': note,
      'medicineCode': medicineCode,
      'quantity': quantity,
      'docId': docId,
    };
  }
}

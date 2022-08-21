class UserModel {
  String? name;
  String? email;
  String? uId;
  String? image;
  String? bio;
  UserModel({
    this.name,
    this.email,
    this.uId,
    this.image,
    this.bio,
  });
  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    uId = json['uId'];
    image = json['image'];
    bio = json['bio'];
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'uId': uId,
      'image': image,
      'bio': bio,
    };
  }
}

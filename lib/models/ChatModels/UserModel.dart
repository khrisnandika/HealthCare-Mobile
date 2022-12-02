class UserModel {
  String? uid;
  String? fullname;
  String? address;
  String? gender;
  String? email;
  String? profilepic;

  UserModel({this.uid, this.fullname, this.address, this.gender, this.email, this.profilepic});

  UserModel.fromMap(Map<String, dynamic> map) {
    uid = map["uid"];
    fullname = map["fullname"];
    address = map["address"];
    gender = map["gender"];
    email = map["email"];
    profilepic = map["profilepic"];
  }

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "fullname": fullname,
      "address": address,
      "gender": gender,
      "email": email,
      "profilepic": profilepic,
    };
  }
}
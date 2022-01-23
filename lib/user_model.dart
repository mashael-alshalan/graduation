class UserModel {
  String? uid;
  String? email;
  String? firstName;
  //String? secondName;

  UserModel({this.uid, this.email, this.firstName});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      firstName: map['firstName'],
      //secondName: map['secondName'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      //'secondName': secondName,
    };
  }

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
        email: json['email'],
        firstName: json['firstName'],
      );
}

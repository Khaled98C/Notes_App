class User {
  int? idUser;
  String? nameUser;
  String? passwordUser;
  String? emailUser;

  User({this.idUser, this.nameUser, this.passwordUser, this.emailUser});

  User.fromJson(Map<String, dynamic> json) {
    idUser = json['id_user'];
    nameUser = json['name_user'];
    passwordUser = json['password_user'];
    emailUser = json['email_user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_user'] = this.idUser;
    data['name_user'] = this.nameUser;
    data['password_user'] = this.passwordUser;
    data['email_user'] = this.emailUser;
    return data;
  }
}
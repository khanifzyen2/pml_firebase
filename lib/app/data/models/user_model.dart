class UserModel {
  String? uid;
  String? name;
  String? email;
  String? photoUrl;
  String? status;
  String? creationTime;
  String? lastSignInTime;
  String? updatedTime;

  UserModel(
      {this.uid,
      this.name,
      this.email,
      this.photoUrl,
      this.status,
      this.creationTime,
      this.lastSignInTime,
      this.updatedTime});

  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    email = json['email'];
    photoUrl = json['photoUrl'];
    status = json['status'];
    creationTime = json['creationTime'];
    lastSignInTime = json['lastSignInTime'];
    updatedTime = json['updatedTime'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['uid'] = uid;
    data['name'] = name;
    data['email'] = email;
    data['photoUrl'] = photoUrl;
    data['status'] = status;
    data['creationTime'] = creationTime;
    data['lastSignInTime'] = lastSignInTime;
    data['updatedTime'] = updatedTime;
    return data;
  }
}

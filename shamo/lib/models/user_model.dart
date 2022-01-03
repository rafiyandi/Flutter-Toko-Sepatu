class UserModel {
  int id;
  String name;
  String email;
  String username;
  String profilePhotoUrl;
  String token;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.username,
    this.token,
    this.profilePhotoUrl,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    username = json['username'];
    profilePhotoUrl = json['profile_photo_url'];
    token = json['token'];
  }
//mengubah ke Json

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'username': username,
      'profile_photo_url': profilePhotoUrl,
      'token': token,
    };
  }
}

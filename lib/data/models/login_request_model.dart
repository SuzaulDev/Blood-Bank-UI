class LoginRequestModel{
  String username;
  String password;

  LoginRequestModel({required this.username, required this.password});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    return data;
  }
}
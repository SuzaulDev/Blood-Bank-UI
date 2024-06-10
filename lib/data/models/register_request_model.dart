class RegisterRequestModel{
  String displayName;
  String username;
  String password;

  RegisterRequestModel({required this.displayName,required this.username, required this.password});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['displayName'] = this.displayName;
    data['username'] = this.username;
    data['password'] = this.password;
    return data;
  }
}
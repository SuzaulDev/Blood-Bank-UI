import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/login_response_model.dart';
import '../models/users_models.dart';

class ApiService {
  var URL = "https://jsonplaceholder.typicode.com/";
  String localUrl = "http://192.168.0.100:8080/";
  List<UserModel> userModelList = [];
  late LogInResponseModel data ;
  late LogInResponseModel rData;

  /// This Future Funtion fatch data from Api.....
  Future<List<UserModel>> getData() async {
    try {
      var url = Uri.parse(URL + USERENDPOINT);
      var response = await http.get(url);
      List user = json.decode(response.body);
      userModelList = user.map((e) => UserModel.fromJson(e)).toList();
    } catch (e) {
      print(e.toString());
    }
    return userModelList;
  }

  Future<LogInResponseModel> userLogin(String username, String password) async {
    try {
      var url = Uri.parse("${localUrl}api/auth/signin");
      final response  = await http.post(url,
          headers:<String, String> {
            'Content-Type': 'application/json; charset=UTF-8'
          },
          body: json.encode(<String, String>{
            'username': username,
            'password': password
          }),
      );
      if(response.statusCode == 200){
       data = LogInResponseModel.fromJson( json.decode(response.body) as Map<String,dynamic> );

      }
      else{
        throw Exception();
      }
    } catch (error) {
      print(error.printError);
    }
    return data;
  }
  Future<LogInResponseModel> userRegistration({required String displayName,required String username,required String password}) async{
    try{
      var url = Uri.parse("${localUrl}api/auth/signup");
     final response = await http.post(url,
          headers:<String, String> {
            'Content-Type': 'application/json; charset=UTF-8'
          } ,
          body: json.encode(<String, String>{
            'displayName': displayName,
            'username': username,
            'password': password
          }),
      );
      if(response.statusCode == 200){
        rData = LogInResponseModel.fromJson( json.decode(response.body) as Map<String,dynamic> );
      }
      else{
        throw Exception();
      }
    }
    catch(error){

    }
    return  rData;
  }
}

var USERENDPOINT = "users";
String LOGINENDPOINT = "/api/auth/signin";

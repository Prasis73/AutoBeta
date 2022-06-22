
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart'as http;
import '../models/auth_models.dart';
import '../models/login_models.dart';
import '../pages/signUp.dart';

class ApiService{
  static String _baseUrl="https://autonepalapi.herokuapp.com";

  static Future addAuto(Auto auto)async{
      Uri requestUri=Uri.parse(_baseUrl+"/login");
      var response =await http.post(requestUri,body:auto.toMap());
      var decoded =jsonDecode(response.body);

      log(decoded.toString());

      if(response.statusCode==200){
        return decoded;
      }else{
        return decoded["message"].toString();
      }
   /*    var decoded =jsonDecode(response.body);

      log(decoded.toString());
      log(decoded["success"].toString());
      return decoded; */
  }

   static Future<bool> signUpAuto(SignUp signUp)async{
      Uri requestUrii=Uri.parse(_baseUrl+"/signup");
      var responsee =await http.post(requestUrii,body:signUp.toMap());

      if(responsee.statusCode==200){
        return true;
      }else{
        return false;
      }

  /*     var encodeFirst = json.encode(responsee.body);
      var data = json.decode(encodeFirst);
    //  var decodedd =jsonDecode(responsee.body);
      log(data.toString()); */
  }

  static Future<List<Auto>>fetchAuto(String userid)async{
      Uri requestUri=Uri.parse(_baseUrl+"/list");
      var response =await http.post(requestUri,body:{"userid":userid});
      var decoded =jsonDecode(response.body);
      List <Auto> auto=[];
       for (var autoMap in decoded){
        Auto newAuto=Auto.fromMap(autoMap);
        auto.add(newAuto);
       }
       return auto;
  }
  
}




import 'package:flutter/material.dart';

import '../models/auth_models.dart';
import '../models/login_models.dart';
import '../services/api_services.dart';

class AutoProvider with ChangeNotifier{
  bool isLoading=true;
   List<Auto> autos=[];
   List<SignUp> auth=[];
   AutoProvider(){
    // fetchAuto();
   }

   List<Auto> getFilteredAuto(String searchQuery){
     return autos.where((element) => element.id!.toLowerCase().contains(searchQuery.toLowerCase())
                  ).toList();
   }
  

   Future addAuto(Auto auto){
      autos.add(auto);
      notifyListeners();
      
      return ApiService.addAuto(auto).then((value){
       return value;
      
        print(value);
        print(value["success"]);
        if(value["success"]==true){
          
          print("cool");
          print(value["token"]);
        }
        else{
          print(value["message"]);
        }
     
      });
      
    }
    void signUpAuto(SignUp signUp){
      auth.add(signUp);
      notifyListeners();
      ApiService.signUpAuto(signUp);
    }

/*  
    void fetchAuto()async{
    autos=await ApiService.fetchAuto("2");

    isLoading=false;
    notifyListeners();
      
  } */

}




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
  

    void addAuto(Auto auto){
      autos.add(auto);
      notifyListeners();
      ApiService.addAuto(auto);
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
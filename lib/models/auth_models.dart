import 'dart:io';

class SignUp{
  // String? id;
   String? email;
   String? password;
   String? status;
   String? fullName;
   String? phoneNumber;
   String? citizenNumber;
   String? panVatNumber;
   String? panVatImageName;
   String? citizenImageName;

  
  SignUp({this.password,this.email,this.fullName,this.phoneNumber,this.status,this.citizenImageName,this.citizenNumber,this.panVatImageName,this.panVatNumber});

  factory SignUp.fromMap(Map<String,dynamic>map){
    return SignUp(
      //id: map["phoneOrEmail"],
      email: map["email"],
      password: map["password"],
      status: map["status"],
      fullName: map["fullName"],
      phoneNumber: map["phoneNumber"],
     citizenNumber: map["citizenNumber"],
     panVatNumber: map["panVatNumber"],
      panVatImageName: map["panVatImageName"],
      citizenImageName: map["citizenImageName"],
 
    );
  }

  Map<String,dynamic> toMap(){
      return {
      // "phoneOrEmail":id,
        "email":email,
         "password":password,
        "status":status,
        "fullName":fullName,
        "phoneNumber":phoneNumber,
        "citizenNumber":citizenNumber,
        "panVatNumber":panVatNumber, 
        "panVatImageName":panVatImageName,
        "citizenImageName":citizenImageName,

        //  "email":"prasis723@gmail.com",
        //  "password":"12323323",
        // "status":"Customer",
        // "fullName":"Prasis",
        // "phoneNumber":"98009027523",
       // "citizenNumber":"121212",
        //"panVatNumber":"121212",
        // "panVatImageName":"",
        // "citizenImageName":"",
      };
  }

}
class Auto{
   String? id;
   String? password;

  
  Auto({this.id,this.password});

  factory Auto.fromMap(Map<String,dynamic>map){
    return Auto(
      id: map["phoneOrEmail"],
      password: map["password"],
    );
  }

  Map<String,dynamic> toMap(){
      return {
        "phoneOrEmail":id,
        "password":password,
      
      };
  }

}
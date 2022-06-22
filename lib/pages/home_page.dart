

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meroauto/pages/signUp.dart';
import 'package:provider/provider.dart';

import '../models/auth_models.dart';
import '../models/login_models.dart';
import '../providers/auto_providers.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  String json="";


  

 
  @override
  Widget build(BuildContext context) {
     AutoProvider  notesProvider= Provider.of<AutoProvider>(context);
      void Login(){
        Auto newAuto=Auto(
          id:emailController.text,
          password:passwordController.text,
        );
        Provider.of<AutoProvider>(context,listen:false).addAuto(newAuto).then((value){
        
          setState(() {
            json=value["message"].toString();
            if(value["success"]==true){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Signup()));
            }
          });

        });

       
         }

    return Scaffold(
      
      appBar: AppBar(
        title: Text("AutoNepal Beta App"),centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children:   [
          Text("अटो नेपाल ",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 28),),
          SizedBox(height: 30,),
         TextField(
          controller: emailController,
          
             decoration:InputDecoration(  enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 2.0),
                ),
                      hintText: "Phone or Password",
                      
                     ), ), 
                     SizedBox(height: 5,), 
          TextField(
            controller: passwordController,
             decoration:InputDecoration(
               enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 2.0),
                ),
                      hintText: "Password",
                     ), 
          ),
          ElevatedButton(onPressed: (){Login();
        /*   if(json=="true"){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Signup()));
          } */
          
          }, child: Text("Login")),
          TextButton(onPressed: (){
             print(json);
      
            // Navigator.push(context, CupertinoPageRoute(builder: (context)=>Signup()));
          }, child: Text("SingUp Here")),
          Text(json)
       
     

        ]),
      ),
    );
  }
}
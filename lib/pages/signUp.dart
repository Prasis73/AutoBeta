import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meroauto/pages/home_page.dart';
import 'package:provider/provider.dart';

import '../models/auth_models.dart';
import '../models/login_models.dart';
import '../providers/auto_providers.dart';


class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

    File? _image;
    File? _image1;
  final picker = ImagePicker();
  final picker1 = ImagePicker();
  var imagelink="";
  var imagelink1="";
  TextEditingController fullnameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController statusController=TextEditingController();
  TextEditingController citizenController=TextEditingController();
  TextEditingController panController=TextEditingController();
  @override
  Widget build(BuildContext context) {
  AutoProvider  notesProvider= Provider.of<AutoProvider>(context);
  void signUp(){
        SignUp newAuto=SignUp(
         // id:emailController.text,
          email:emailController.text,
          password:passwordController.text,
          status:statusController.text,
          fullName:fullnameController.text,
          phoneNumber:phoneController.text,
          citizenNumber:citizenController.text,
          panVatNumber:panController.text,
          panVatImageName:imagelink,
          citizenImageName:imagelink1
        );
        Provider.of<AutoProvider>(context,listen:false).signUpAuto(newAuto);

       
         }
    return Scaffold(
      appBar: AppBar(
        title: Text("SignUp AutoNepal Beta"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                "Beta SignUp here ",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.red, fontSize: 28),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: fullnameController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 2.0),
                  ),
                  hintText: "Full Name",
                ),
              ),
              SizedBox(
                height: 5,
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 2.0),
                  ),
                  hintText: "E-mail Address",
                ),
              ),
              SizedBox(
                height: 5,
              ),
              TextField(controller: phoneController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 2.0),
                  ),
                  hintText: "Phone Number",
                ),
              ),
              SizedBox(
                height: 5,
              ),
              TextField(controller: passwordController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 2.0),
                  ),
                  hintText: "Password",
                ),
              ),
              SizedBox(
                height: 5,
              ),
                  TextField(controller: statusController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 2.0),
                  ),
                  hintText: "Status : Supplier",
                ),
              ),
              SizedBox(
                height: 5,
              ),
                TextField(controller: citizenController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 2.0),
                  ),
                  hintText: "Citizenship Number",
                ),
              ),
              SizedBox(
                height: 5,
              ),
      
                TextField(controller: panController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 2.0),
                  ),
                  hintText: "Pan/Vat Number",
                ),
              ),
              SizedBox(
                height: 5,
              ),
               ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.purple,
                          ),
                          onPressed: () async {
                            final pickFile = await picker.pickImage(
                                source: ImageSource.gallery);
                            setState(() async {
                              if (pickFile != null) { 
                                _image = File(pickFile.path);
                             setState(() {
                                  imagelink = _image.toString();
                                });
                              
                              } else {
                                print("no image selected");
                              }
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.image,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text("upload Citizenship")
                            ],
                          )
                          ), 
                           ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.purple,
                          ),
                          onPressed: () async {
                            final pickFile = await picker1.pickImage(
                                source: ImageSource.gallery);
                            setState(() async {
                              if (pickFile != null) { 
                                _image1 = File(pickFile.path);
                             setState(() {
                                  imagelink1 = _image1.toString();
                                });
                              
                              } else {
                                print("no image selected");
                              }
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.image,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text("upload PAN")
                            ],
                          )
                          ),
       
      
      
      
      
      
      
                ElevatedButton(onPressed: (){signUp();}, child: Text("SignUp")),
            TextButton(onPressed: (){
              Navigator.push(context, CupertinoPageRoute(builder: (context)=>HomePage()));
            }, child: Text("Already Have an account? SIGN IN Here"))
            ],
          ),
        ),
      ),
    );
  }
}

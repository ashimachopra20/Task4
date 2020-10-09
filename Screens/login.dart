import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_auth/firebase_auth.dart';


class Mylogin extends StatefulWidget {
  @override
  _MyloginState createState() => _MyloginState();
}

class _MyloginState extends State<Mylogin> {
   String email;
String password;
 var f = FirebaseAuth.instance;
  @override
 
  

  Widget build(BuildContext context) {
    var url='https://github.com/ashimachopra20/linux_flutter_firebase/raw/master/qq.jpg';
     return Scaffold(
      appBar: AppBar(title:Center(child: Text("LOGIN"))),
      body:   Stack(
              children:<Widget>[Container(
                 decoration: BoxDecoration(
     //color:Colors.pinkAccent,
     border:Border.all(
       width: 1,
        color:Colors.red),
    borderRadius: BorderRadius.circular(10),
    
    image: DecorationImage(image: NetworkImage(url),fit:BoxFit.cover),
    //color:Colors.blueGrey,
   ),
                padding:EdgeInsets.all(10),
            alignment: Alignment.center,
          
             child: Column(
               mainAxisAlignment:MainAxisAlignment.center,
              
               children: <Widget>
               [
                
                 Container(
                   color: Colors.black,
                   child: TextField(
                       decoration:InputDecoration(
                           labelStyle:TextStyle(color:Colors.red),
                                          labelText: "Email ID",
                                          enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(20),
                                          //hintText:('Enter your Email id'),
                                            borderSide: BorderSide(color: Colors.red) 
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.red) 
                                          ),
                                        ),
                       onChanged: (value){
                        email= value;
                       },
                       keyboardType: TextInputType.emailAddress,
                       
                     ),
                   ),
                
                 SizedBox(height: 20),
                  Container(
                    color:Colors.black,
                    child: TextField(
                       decoration:InputDecoration(
                         labelStyle:TextStyle(color:Colors.red),
                                        labelText: "Password",
                                        enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        
                                          borderSide: BorderSide(color: Colors.red) 
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.red) 
                                        ),
                                      ),
                        
                     onChanged: (value){
                       password= value;
                     },
                     obscureText: true,
                     
                 ),
                  ),
                   SizedBox(height: 20),
                   Material(
                elevation:20,
                borderRadius: BorderRadius.circular(200),
                color: Colors.red,
                child: MaterialButton(
                  height:15,
                  minWidth: 50,
                  child: Text('LOGIN'),onPressed: () async {
                
                  
                  try{
                   
                  var signin= await f.signInWithEmailAndPassword(email: email, password: password);
                  print(signin);
                     if(signin!=null){
                    Navigator.popAndPushNamed(context, "/terminal");
                    } 
                  } catch(e){
                  print(e);
                  }
                    } , color: Colors.red,
                 ),
                 
                    ) ],
    ),
           ),] 
      ),
      );
  }}
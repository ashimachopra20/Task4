import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Myreg extends StatefulWidget {
  @override
  _MyregState createState() => _MyregState();
}

class _MyregState extends State<Myreg> {
 
  @override
  
  
  Widget build(BuildContext context) {
    
 var f=FirebaseAuth.instance;   
String email;
  String password;
var url='https://github.com/ashimachopra20/linux_flutter_firebase/raw/master/qq.jpg';
    return Scaffold(
      appBar:AppBar(title:Center(child:Text('REGISTRATION'))),
      body:
       Stack(
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
              
               TextField(
                   decoration:InputDecoration(
                     hintText:('Enter your Email id'),
                           labelStyle:TextStyle(color:Colors.red),
                                          labelText: "Email ID",
                                          enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(20),
                                          
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
               SizedBox(height: 20),
                TextField(
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
               
                   SizedBox(height: 20),
                   Material(
                elevation:20,
                borderRadius: BorderRadius.circular(200),
                color: Colors.red,
                child: MaterialButton(
                  height:15,
                  minWidth: 50,
                  child: Text('REGISTER NOW'),onPressed: () async {
                
                   try{
                var user= await  f.createUserWithEmailAndPassword(email: email, password: password);
                print(user);
                   if(user.additionalUserInfo.isNewUser==true){
                  Navigator.pushNamed(context, "/terminal");
                  } 
                } catch(e){
                print(e);
                }
                  } ,
   color: Colors.red,
               )
                  
                 
                    
    
           ) ],
    ),
         ),] 
       ));
  }}
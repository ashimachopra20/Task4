import 'package:flutter/material.dart';

class Myhome extends StatefulWidget {
  @override
  _MyhomeState createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  @override
  Widget build(BuildContext context) {
    var mypro=Icon(Icons.brightness_4, color: Colors.yellowAccent,);
    var url='https://github.com/ashimachopra20/linux_flutter_firebase/raw/master/penguin.webp';
    return Scaffold(
      appBar: AppBar(title:Center(child: Text('HOME PAGE',)),backgroundColor: Colors.black,
      actions: <Widget>[
      IconButton(icon: mypro, onPressed: (){
print("hello");
      })
    ],
 ),
      body: Stack(
              children:<Widget>[Container(
                 decoration: BoxDecoration(
     //color:Colors.pinkAccent,
     border:Border.all(
       width: 1,
        color:Colors.yellowAccent),
    borderRadius: BorderRadius.circular(10),
    
    image: DecorationImage(image: NetworkImage(url),fit: BoxFit.cover),
    //color:Colors.blueGrey,
   ),
                padding:EdgeInsets.all(10),
            alignment: Alignment.center,
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              
              Material(
                elevation:20,
                borderRadius: BorderRadius.circular(200),
                color: Colors.red,
                child: MaterialButton(
                  height:15,
                  minWidth: 50,
                  child: Text('REGISTER'),onPressed: (){
                  Navigator.pushNamed(context, "/reg");
                    })),
                  SizedBox(height: 20),
                   Material(
                elevation:20,
                borderRadius: BorderRadius.circular(200),
                color: Colors.red,
                child: MaterialButton(
                  height:15,
                  minWidth: 50,
                  child: Text('LOGIN'),onPressed: (){
                   Navigator.pushNamed(context, "/login");
                 // Navigator.pushNamed(context, "/terminal");
                    })),
            ],
          ),
        ),] 
      ),
      
    );
  }
}
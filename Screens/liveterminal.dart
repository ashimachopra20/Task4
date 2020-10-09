import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;



class MyTerminal extends StatefulWidget {
  @override
  _MyTerminalState createState() => _MyTerminalState();
}

class _MyTerminalState extends State<MyTerminal> {
 String x;
 var fsconnect= FirebaseFirestore.instance;
 var g;
    String data; 
  myweb(x) async{
    
      var url="http://192.168.1.13/cgi-bin/lc.py?x=${x}";
    print(url);
      var r=await http.get(url);
setState(() {
   data=r.body;
});
        print(data);

      }
myget() async{
   fsconnect= FirebaseFirestore.instance;
   g = await fsconnect.collection("linuxcmd").get();

  var i;
  setState(() {
    for(i in g.docs){
     String a= i.data();
  print(a);
 }
  });
  
}

var f= FirebaseAuth.instance;

  Widget build(BuildContext context) {
    var url='https://github.com/ashimachopra20/linux_flutter_firebase/raw/master/a.jpg';
     var myicon=Icon(Icons.cancel,);
    return Scaffold( appBar: AppBar(title:Center(child: Text('Linux Commands')),
      actions: <Widget>[
      IconButton(icon: myicon, onPressed:(){
        f.signOut();
         Navigator.pushNamed(context, "/login");
      })
    ],),
     body:Stack(
            children:<Widget>[
             SingleChildScrollView(
                              child: Container(
         child: Column(
           children: <Widget>[
 StreamBuilder<QuerySnapshot>(
    stream: fsconnect.collection("linuxcmd").snapshots(),
  
                    builder: (context, snapshot) {
  
                      print('new data comes');
  
  
  
                      var m = snapshot.data.docs;
  
                      // print(msg);
  
                      // print(msg[0].data());
  
  
  
                      List<Widget> y = [];
  
                      for (var d in m) {
  
                        // print(d.data()['sender']);
  
                       
  
                        var tdata = d.data()['output'];
  
                        var tWidget = Text("$data");
  
  
  
                        y.add(tWidget);
  
                      }
  
  
  
                      print(y);
  
                      return Container(
  
                        child: Column(
  
                          children: y,
  
                        ),
  
                      );
  
                    },
  
                  //  stream: fsconnect.collection("linuxcmd").snapshots(),
  
                  ),
  

  SizedBox(height: 20),
 TextField(
   decoration:InputDecoration(
                             labelStyle:TextStyle(color:Colors.red),
                              prefixIcon: Icon(Icons.save,color: Colors.red,),
                                            labelText: "Enter Linux Command",
                                            enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(20),
                                             
                                            //hintText:('Enter your Email id'),
                                              borderSide: BorderSide(color: Colors.red) 
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.red) 
                                            ),
                                          ),
                          onChanged: (value) {
                          x = value;
                          },
                          autocorrect: false,
                          textAlign: TextAlign.center,
                         
                        ),
    
             SizedBox(height: 20),
                         Material(
                      elevation:20,
                      borderRadius: BorderRadius.circular(200),
                      color: Colors.red,
                      child: MaterialButton(
                        height:15,
                        minWidth: 50,
                        child: Text('SEND TO FIRESTORE'),onPressed: () async {
                      
                        await myweb(x);
 print(data);
         fsconnect= FirebaseFirestore.instance;
//print("absd");
 fsconnect.collection("linuxcmd").add({
   "output":data,
          
    });
    },color:Colors.red)
  
                       
                     
                    
                       
                          ) ,
                          SizedBox(height: 20),
                         Material(
                      elevation:20,
                      borderRadius: BorderRadius.circular(200),
                      color: Colors.red,
                      child: MaterialButton(
                        height:15,
                        minWidth: 50,
                        child: Text('DISPLAY OUTPUT'),onPressed: myget
    ,color:Colors.red)
                          ) ,

                 SizedBox(height: 20),
                       Container(
                         color: Colors.red,
                        
   child: Text(("$data"))),] 
           
         ),
       ),
              ),]
     
      
              ));
  }
}
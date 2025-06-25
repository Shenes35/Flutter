import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home:
      SafeArea(
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 36, 104, 222),
        
          body:
          Wrap(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 200,
                    width: 400
                  ,
                  ),
                  Text('facebook ',
                  style: TextStyle(
                  color: Colors.white,
                  fontSize: 38,
                  fontWeight:FontWeight.bold
                  
                )),
              SizedBox(
                    height: 80,
                    width: 50
                  ,
                  ),
                  
                  SizedBox(width: 350, height: 50,child: TextFormField(decoration: InputDecoration(
                    hintText: 'username',
                    
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5))
                  ),),),
                  SizedBox(
                    height: 20,
                    width: 50)
                  ,
                  SizedBox(width: 350, height: 50,child:TextFormField(
                    
              
                    decoration: InputDecoration(
                    
                    hintText: 'password',
                    hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5), // <-- Change the radius here
                  ),
                    )
                  ),),
                  SizedBox(
                    height: 20,
                    width: 50),
                  ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(223, 5, 114, 203), // Blue background
                  padding: EdgeInsets.symmetric(horizontal: 150, vertical: 14), // Bigger button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Rounded corners
                  ),
                ),
                child: const Text(
                  "Log In",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                    height: 190,
                    width: 100)
                  ,
                  Text("Sign up for facebook",style: TextStyle(color: Colors.white, decoration: TextDecoration.underline, decorationColor: Colors.white))
                ],
              ),
            ],
          )
        ),
      ),
    );
  }
}
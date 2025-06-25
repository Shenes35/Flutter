import 'package:flutter/material.dart';
import 'package:registration/Model/user_model.dart';
import 'package:registration/Presentation/home_screen.dart';
import 'package:registration/Presentation/registration_screen.dart';
import 'package:registration/infrastructure/db_functions.dart';


class ScreenLogin extends StatelessWidget {
  ScreenLogin({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _loginAFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Form(
            key: _loginAFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: NetworkImage(
                    'https://cdn-icons-png.flaticon.com/512/11753/11753627.png',
                  ),
                  height: 90,
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email required';
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password required';
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
        if (_loginAFormKey.currentState!.validate()) {
          UserModel u = UserModel('', '', emailController.text, '', passwordController.text, '');
          try {
            bool result = await checkLogin(u);
            print(result);
            if (result) {
              UserModel u=await loadUser('');
              print(u.userName);
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => ScreenUserHome(u: u,)),
              );
            } 
          } catch (e) {
            print(e.toString());      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Check ur credentials')),
            );
          }
        }
      },
                      child: Text('Login'),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Donot have an account?',
                      style: TextStyle(color: Colors.indigo),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ScreenRegistration(),
                          ),
                        );
                      },
                      icon: Icon(Icons.add_box_rounded, color: Colors.pink),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:contact_list/core/core.dart';
import 'package:contact_list/infrastructure/db_functions.dart';
import 'package:contact_list/model/contact_model.dart';
import 'package:flutter/material.dart';

class AddScreen extends StatelessWidget {
   AddScreen({super.key});
   final _formKey2 = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
final lastNameController = TextEditingController();
final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.blueAccent,
          title: Text('Add contact',style: TextStyle(color: Colors.white))
        ),
        body: Form(
          key: _formKey2,
          child: ValueListenableBuilder(
            valueListenable: contactlist,
            builder: (context, value, child) {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    TextFormField(controller: firstNameController,validator: (value){
                            if(value!.isEmpty){
                              return 'Entry required';
                            }
                          },
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(hintText: 'First name',border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6)
                    )),),
                    SizedBox(height: 30),
                    TextFormField(controller: lastNameController,validator: (value){
                            if(value!.isEmpty){
                              return 'Entry required';
                            }
                          },
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(hintText: 'Last name',border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6)
                    )),),
                    SizedBox(height: 30),
                    TextFormField(controller: emailController,validator: (value){
                            if(value!.isEmpty){
                              return 'Entry required';
                            }
                          },
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(hintText: 'Email',border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6)
                    )),),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        SizedBox(width: 50),
                        ElevatedButton(onPressed: (){Navigator.of(context).pop();}, child: const Text('Cancel')),
                        SizedBox(width: 50),
                        ElevatedButton(onPressed: (
                        ){if (_formKey2.currentState!.validate()) {
                          final newContact = ContactsModel(
                            contactId: '',
                    contactFirstName: firstNameController.text,
                    contactLastName: lastNameController.text,
                    contactEmail: emailController.text,
                    favouriteContact: 'false'
                  );
                        
                  addcontact(newContact); 
                  Navigator.of(context).pop();
                        }}, child: const Text('Add'))]
                    )]
                ),
              );
            }
          ),
        )
      ),
    );
  }
}
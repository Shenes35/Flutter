import 'package:contact_list/infrastructure/db_functions.dart';
import 'package:contact_list/model/contact_model.dart';
import 'package:flutter/material.dart';

class EditScreen extends StatelessWidget {
  final ContactsModel contact;
  final TextEditingController contactIdController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;

  EditScreen({super.key, required this.contact})
  : contactIdController = TextEditingController(text: contact.contactId),
        firstNameController = TextEditingController(text: contact.contactFirstName),
        lastNameController = TextEditingController(text: contact.contactLastName),
        emailController = TextEditingController(text: contact.contactEmail);
  final _formKey3 = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.blueAccent,
          title: Text('Edit contact',style: TextStyle(color: Colors.white))
        ),
        body: Form(
          key: _formKey3,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                TextFormField(controller: firstNameController,style: const TextStyle(color: Colors.white),decoration: InputDecoration(hintText: 'First name',border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6)
                )),),
                SizedBox(height: 30),
                TextFormField(controller: lastNameController,style: const TextStyle(color: Colors.white),decoration: InputDecoration(hintText: 'Last name',border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6)
                )),),
                SizedBox(height: 30),
                TextFormField(controller: emailController,style: const TextStyle(color: Colors.white),decoration: InputDecoration(hintText: 'Email',border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6)
                )),),
                SizedBox(height: 30),
                Row(
                  children: [
                    SizedBox(width: 50),
                    ElevatedButton(onPressed: (){
                      Navigator.of(context).pop();
                    }, child: const Text('Cancel')),
                    SizedBox(width: 50),
                    ElevatedButton(onPressed: (){
                     if (_formKey3.currentState!.validate()) {
                          final editedContact = ContactsModel(
                            contactId: contactIdController.text,
                    contactFirstName: firstNameController.text,
                    contactLastName: lastNameController.text,
                    contactEmail: emailController.text,
                    favouriteContact: 'false'
                  );
                  editcontact(editedContact);
                  Navigator.of(context).pop();
  }}, child: const Text('Save'))]
                )]
            ),
          ),
        )
      ),
    );
  }
}
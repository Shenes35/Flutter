import 'package:flutter/material.dart';
import 'package:registration/Core/core.dart';
import 'package:registration/Model/user_model.dart';
import 'package:registration/infrastructure/db_functions.dart';


class ScreenUserHome extends StatelessWidget {
  UserModel u;
  ScreenUserHome({super.key,required this.u}){
    userNameController.text=u.userName;
    userEmailController.text=u.userEmail;
    selectedGender=u.userGender;
    print('The gender is $selectedGender');
    print('Raw user gender from model: "${u.userGender}"');

    try {
    selectedGenderNotifier.value = userGender.firstWhere(
      (g) => g.toLowerCase() == u.userGender.toLowerCase().trim(),
    );
  } catch (e) {
    selectedGenderNotifier.value = null;
  }

  
   
    userAddressController.text=u.userAddress;
  }
   String? selectedGender;
  final userNameController = TextEditingController();
  final userEmailController = TextEditingController();
  final userPasswordController = TextEditingController();
  final userPasswordReconfirmController = TextEditingController();
  final userAddressController = TextEditingController();
  final ValueNotifier<String?> selectedGenderNotifier = ValueNotifier<String?>(null);

  List<String> userGender = ['Male', 'Female', 'Other'];
  final _regFormKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Welcome<Name>', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            onPressed: () {
              isEditableNotifier.value = true;
            },
            icon: Icon(Icons.edit, color: Colors.white),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.logout, color: Colors.white),
          ),
        ],
      ),
      body: Form(
        key: _regFormKey,
        child: ValueListenableBuilder(
          valueListenable: isEditableNotifier,
          builder: (context, bool newIsEditable, _) {
            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextFormField(
                    enabled: newIsEditable,
                    controller: userNameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Name required';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextFormField(
                    enabled: newIsEditable,
                    controller: userEmailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email required';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                ),

                Padding(
  padding: const EdgeInsets.all(18.0),
  
  child:DropdownButton(
  value: selectedGender,
  items:userGender.map((gender){
    return DropdownMenuItem(child: Text(gender),
    value: gender,
    );
  }) .toList(),
  onChanged: (newGender)
  {
    selectedGender=newGender!;
  }
  )
),

                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextFormField(
                    enabled: newIsEditable,

                    controller: userAddressController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Address required';
                      }
                      return null;
                    },
                    maxLines: 5,

                    decoration: InputDecoration(
                      hintText: 'Address',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed:
  newIsEditable == true
    ? () async {  // ✅ make it async here
        if (_regFormKey.currentState!.validate()) {
          print({
  'userName': userNameController.text,
  'userEmail': userEmailController.text,
  'userGender': selectedGenderNotifier.value,
  'userAddress': userAddressController.text,
});

          final updatedUser = UserModel(
          u.Id,
  userNameController.text,
  userEmailController.text,
  selectedGenderNotifier.value ?? '',
  u.userPassword,
  userAddressController.text
);

  final result = await editUser(updatedUser); // ✅ await only allowed in async

          if (result) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Profile updated successfully')),
            );
            isEditableNotifier.value = false;
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Update failed')),
            );
          }
        }
      }
    : null,
child: Text('Save Changes'),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

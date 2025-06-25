import 'package:contact_list/core/core.dart';
import 'package:contact_list/model/contact_model.dart';
import 'package:hive_flutter/adapters.dart';

void addcontact(ContactsModel s)async{
  final result = await Hive.openBox<ContactsModel>('contact_db');
  int id = await result.add(s);
  s.contactId=id.toString();
  await result.put(id,s);
  getAllContact();
  
}

void getAllContact() async {
  final result = await Hive.openBox<ContactsModel>('contact_db');
  final contacts = result.values.toList();

  contactlist.value = contacts; // full list
  filteredContactList.value = contacts; // displayed list
}


void editcontact(ContactsModel s) async {

  final contactBox = await Hive.openBox<ContactsModel>('contact_db');
  final key = int.tryParse(s.contactId);

  if (key != null && contactBox.containsKey(key)) {
    await contactBox.put(key, s); 
    getAllContact(); 
  }
}

void editFavorite(String contactId, String newFavoriteStatus) async {
  final box = await Hive.openBox<ContactsModel>('contact_db');

  final key = int.tryParse(contactId); 
  if (key != null && box.containsKey(key)) {
    final contact = box.get(key);

    if (contact != null) {
      final updatedContact = ContactsModel(
        contactId: contact.contactId,
        contactFirstName: contact.contactFirstName,
        contactLastName: contact.contactLastName,
        contactEmail: contact.contactEmail,
        favouriteContact: newFavoriteStatus, 
      );

      await box.put(key, updatedContact);
      getAllContact(); 
    }
  } 
}

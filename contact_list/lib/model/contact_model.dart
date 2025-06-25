import 'package:hive_flutter/adapters.dart';
part 'contact_model.g.dart';

@HiveType(typeId: 1)
class ContactsModel {
  @HiveField(0)
  String contactId;
  @HiveField(1)
  String contactFirstName;
  @HiveField(2)
  String contactLastName;
  @HiveField(3)
  String contactEmail;
  @HiveField(4)
  String favouriteContact;

  ContactsModel({
    required this.contactId,
    required this.contactFirstName,
    required this.contactLastName,
    required this.contactEmail,
    required this.favouriteContact,
  });
}
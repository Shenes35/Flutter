import 'package:contact_list/model/contact_model.dart';
import 'package:flutter/material.dart';

ValueNotifier<List<ContactsModel>> contactlist= ValueNotifier([ContactsModel(
    contactId: '1',
    contactFirstName: 'John',
    contactLastName: 'Doe',
    contactEmail: 'johndoe@hotmail.com',
    favouriteContact: '1',
  ),
  ContactsModel(
    contactId: '2',
    contactFirstName: 'Jane',
    contactLastName: 'Smith',
    contactEmail: 'janesmith@hotmail.com',
    favouriteContact: '0',
  ),
  ContactsModel(
    contactId: '3',
    contactFirstName: 'Alice',
    contactLastName: 'Johnson',
    contactEmail: 'alicejohnson@yahoo.co.in',
    favouriteContact: '0',
  ),
  ContactsModel(
    contactId: '4',
    contactFirstName: 'Bob',
    contactLastName: 'Brown',
    contactEmail: 'bobbrown@hotmail.com',
    favouriteContact: '1',
  ),
  ContactsModel(
    contactId: '5',
    contactFirstName: 'Charlie',
    contactLastName: 'Davis',
    contactEmail: 'charliedavis@hotmail.com',
    favouriteContact: '1',
  ),
  ContactsModel(
    contactId: '6',
    contactFirstName: 'Diana',
    contactLastName: 'Evans',
    contactEmail: 'dianaevans@hotmail.com',
    favouriteContact: '1',
  ),
  ContactsModel(
    contactId: '7',
    contactFirstName: 'Ethan',
    contactLastName: 'Green',
    contactEmail: 'ethangreen@hotmail.com',
    favouriteContact: '0',
  ),
  ContactsModel(
    contactId: '8',
    contactFirstName: 'Fiona',
    contactLastName: 'Hill',
    contactEmail: 'fionahill@hotmail.com',
    favouriteContact: '0',
  ),
  ContactsModel(
    contactId: '9',
    contactFirstName: 'George',
    contactLastName: 'Ivory',
    contactEmail: 'georgeivory@hotmail.com',
    favouriteContact: '1',
  ),
  ContactsModel(
    contactId: '10',
    contactFirstName: 'Hannah',
    contactLastName: 'Jones',
    contactEmail: 'hannahjones@hotmail.com',
    favouriteContact: '0',
  ),]);
  ValueNotifier<List<ContactsModel>> filteredContactList = ValueNotifier([]);

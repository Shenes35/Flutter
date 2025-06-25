import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/Core/core.dart';
import 'package:firebase/Model/item_category_model.dart';
import 'package:firebase/Model/item_model.dart';

Future<void> addItemCategory(ItemCategoryModel c) async {
  final firebaseInstance = await FirebaseFirestore.instance
      .collection('category')
      .add({'category_name': c.itemCategoryName});
  getAllItems();
}

void getAllItems() async {
  final documentSnapshot = await FirebaseFirestore.instance
      .collection('category')
      .get();
  itemCategoryNotifier.value.clear();
  for (var doc in documentSnapshot.docs) {
    ItemCategoryModel c = ItemCategoryModel(
      itemCategoryID: doc.id,
      itemCategoryName: doc['category_name'],
    );
    itemCategoryNotifier.value.add(c);
  }

  final itemSnapshot = await FirebaseFirestore.instance
      .collection('items')
      .get();
  itemNotifier.value.clear();
  for (var doc in itemSnapshot.docs) {
    ItemModel i = ItemModel(
      itemId: doc.id,
      itemCategoryID: doc['item_category'],
      itemName: doc['item_name'],
      itemMrp: doc['item_mrp'],
      itemSaleRate: doc['item_sales_rate'],
    );
    itemNotifier.value.add(i);
  }
  itemNotifier.notifyListeners();
  itemCategoryNotifier.notifyListeners();
}

Future<void> addItem(ItemModel i) async {
  final firebaseInstance = await FirebaseFirestore.instance
      .collection('items')
      .add({
        'item_name': i.itemName,
        'item_category': i.itemCategoryID,
        'item_mrp': i.itemMrp,
        'item_sales_rate': i.itemSaleRate,
      });
  itemNotifier.notifyListeners();
}

Future<void> editItem(ItemModel i) async {
  try {
    // Update the Firestore document
    await FirebaseFirestore.instance
        .collection('items')
        .doc(i.itemId)
        .update({
          'item_name': i.itemName,
          'item_category': i.itemCategoryID,
          'item_mrp': i.itemMrp,
          'item_sales_rate': i.itemSaleRate,
        });

    
    itemNotifier.notifyListeners();
  } catch (e) {
    print('Error editing item: $e');
  }
}


Future<void> deleteItem(String itemId) async {
  try {
    await FirebaseFirestore.instance
        .collection('items')
        .doc(itemId)
        .delete(); // Deletes from Firestore

    // Remove from local list
    itemNotifier.value.removeWhere((item) => item.itemId == itemId);
    itemNotifier.notifyListeners();
  } catch (e) {
    print('Error deleting item: $e');
  }
}

import 'package:flutter/material.dart';
import 'package:tracker/model/tracker_model.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
class MainScreen extends StatefulWidget {
   const MainScreen({super.key});
   State<MainScreen> createState() => _MainScreenState();
}
class _MainScreenState extends State<MainScreen> {
  int transactionCounter=10;
  final _formKey = GlobalKey<FormState>();
  final narrationController = TextEditingController();
  final amountController = TextEditingController();
  String? selectedType;

  final List<transaction> trans_list = [transaction(
      transactionId: '1',
      transactionNarration: 'Grocery',
      transactiontype: '-1',
      transactionAmount: '2000',
    ),
    transaction(
      transactionId: '2',
      transactionNarration: 'Salary',
      transactiontype: '+1',
      transactionAmount: '50000',
    ),
    transaction(
      transactionId: '3',
      transactionNarration: 'Electricity Bill',
      transactiontype: '-1',
      transactionAmount: '3445',
    ),
    transaction(
      transactionId: '4',
      transactionNarration: 'Freelance Project',
      transactiontype: '+1',
      transactionAmount: '1569',
    ),
    transaction(
      transactionId: '5',
      transactionNarration: 'Restaurant',
      transactiontype: '-1',
      transactionAmount: '700',
    ),
    transaction(
      transactionId: '6',
      transactionNarration: 'Stock Dividend',
      transactiontype: '+1',
      transactionAmount: '20000',
    ),
    transaction(
      transactionId: '7',
      transactionNarration: 'Online Shopping',
      transactiontype: '-1',
      transactionAmount: '5089',
    ),
    transaction(
      transactionId: '8',
      transactionNarration: 'Interest Income',
      transactiontype: '+1',
      transactionAmount: '15678',
    ),
    transaction(
      transactionId: '9',
      transactionNarration: 'Movie Ticket',
      transactiontype: '-1',
      transactionAmount: '960',
    ),
    transaction(
      transactionId: '10',
      transactionNarration: 'Gift Received',
      transactiontype: '+1',
      transactionAmount: '5000',
    ),
  ];
   void saveentry(String narration, String type, String amount){
    
      transactionCounter++;
      transaction newtransaction = transaction(
        transactionId: transactionCounter.toString(),
        transactionNarration: narration,
        transactiontype: type,
        transactionAmount: amount
      );
      setState(() {
        trans_list.add(newtransaction);
        narrationController.clear();
        amountController.clear();
        selectedType = null;
        
      });
    
  }
  void updateentry(transaction itemToUpdate,narration, type, amount){
    
      setState(() {
      itemToUpdate.transactionNarration = narration;
      itemToUpdate.transactiontype = type;
      itemToUpdate.transactionAmount = amount;

      narrationController.clear();
      amountController.clear();
      selectedType = null;
    });
    
  }
  void deleteentry(String Id) {
    setState(() {
      trans_list.removeWhere((item) => item.transactionId == Id);
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueAccent,
            title: Text('Money Tracker',style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold)),
          ),
          body: Form(
            key: _formKey,
            child: ListView.separated(
              itemBuilder: (context,index) {
                final item=trans_list[index];
                return ListTile(
                  leading: Text('${index + 1}.',style: TextStyle(fontSize: 15)),
                  title: Text(item.transactionNarration),
                  subtitle: Text('Amount: ${item.transactionAmount}',
                          style: TextStyle(
                            color: item.transactiontype == '+1' ? Colors.green : Colors.red,),),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                        children: [
                          
                          
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () {
                              
                              final _editFormKey = GlobalKey<FormState>();
    final narrationController = TextEditingController();
    final amountController = TextEditingController();
    String? selectedType;
    narrationController.text = item.transactionNarration;
amountController.text = item.transactionAmount;
selectedType = item.transactiontype;

                              showDialog(
                context: context, 
                barrierDismissible: false,
                builder: (BuildContext context){
                  return AlertDialog(
                    title: Center(child: Text('Edit a Transaction',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold))),
                    content: SizedBox(
                      width: 200,
                      height: 240,
                      child: Form(
                        key: _editFormKey,
                        child: Column(
                          
                          children: [
                            TextFormField(
                              controller: narrationController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Need an entry here';
                          }
                          return null;
                        },
                              decoration: InputDecoration(
                                hintText: 'Narration',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(),
                                )
                            ),
                            
                            DropdownButtonFormField(decoration: InputDecoration(
                              hintText: 'Transaction type'),
                              value: selectedType,
                              validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Need an entry here';
                          }
                          return null;
                        },
                              items: <String>['+1','-1'].map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(), 
                              onChanged: (String? newValue) {
                                            print('Selected: $newValue');
                                            selectedType=newValue;
                                          },
                                        
                            ),
                            
                          SizedBox(height: 30),
                            TextFormField(
                              controller: amountController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Need an entry here';
                          }
                          return null;
                        },
                              decoration: InputDecoration(
                                hintText: 'Transaction Amount',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(),
                                )
                            ),
                            
                          ],
                        ),
                      )
                    ),
                    actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () {
                            if (_editFormKey.currentState!.validate()) {
  updateentry(item, narrationController.text, selectedType!, amountController.text);
  Navigator.of(context).pop();
}
                          },
              child: Text("Save")
                        ),
                      ],
                  );
                }
              );
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              
                              showDialog(
                                barrierDismissible: false,
                context: context, 
                builder: (BuildContext context){
                  return SizedBox(
                    height: 100,
                    child: AlertDialog(
                      title: Center(child: Text('Are u sure about this?',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold))),
                      
                      actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("No"),
                          ),
                          TextButton(
                            onPressed: () {
                              deleteentry(item.transactionId);
                              Navigator.of(context).pop();
                            },
                            child: const Text("Yes Proceed"),
                          ),
                        ],
                    ),
                  );
                }
              );
                            },
                          ),
                
                        ],
                      ),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: trans_list.length),
          ),
          floatingActionButton: FloatingActionButton(onPressed: (){
             final _addFormKey = GlobalKey<FormState>();
    final narrationController = TextEditingController();
    final amountController = TextEditingController();
    String? selectedType;
    showDialog(
              barrierDismissible: false,
              context: context, 
              builder: (BuildContext context){
                return AlertDialog(
                  title: Center(child: Text('Add a Transaction',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold))),
                  content: SizedBox(
                    width: 200,
                    height: 240,
                    child: Form(
                      key:_addFormKey,
                      child: Column(
                        
                        children: [
                          TextFormField(
                            controller: narrationController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Need an entry here';
                          }
                          return null;
                        },
                            decoration: InputDecoration(
                              hintText: 'Narration',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(),
                              )
                          ),
                          
                          DropdownButtonFormField(decoration: InputDecoration(
                            hintText: 'Transaction type'),
                            value: selectedType,
                            validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Need an entry here';
                          }
                          return null;
                        },
                            items: <String>['+1','-1'].map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(), 
                            onChanged: (String? newValue) {
                                          print('Selected: $newValue');
                                          selectedType=newValue;
                                        },
                                      
                          ),
                          SizedBox(height: 30),
                            TextFormField(
                              controller: amountController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Need an entry here';
                          }
                          return null;
                        },
                              decoration: InputDecoration(
                                hintText: 'Transaction Amount',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(),
                                )
                            ),
                          
                        ],
                      ),
                    )
                  ),
                  actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () {if (_addFormKey.currentState!.validate()) {
  saveentry(narrationController.text, selectedType!, amountController.text);
  Navigator.of(context).pop();
}
                        },
                        child: const Text("Add"),
                      ),
                    ],
                );
              }
            );
          },backgroundColor: Colors.blueAccent,child: Icon(Icons.add,color: Colors.white,),),
        ) 
        );
  }
}
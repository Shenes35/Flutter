import 'package:contact_list/core/core.dart';
import 'package:contact_list/infrastructure/db_functions.dart';
import 'package:contact_list/presentation/add_screen.dart';
import 'package:contact_list/presentation/edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
final stt.SpeechToText speech = stt.SpeechToText();
final isListening = ValueNotifier<bool>(false);
class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final searchController = TextEditingController();

void _startListening() async {
    bool available = await speech.initialize(
      onStatus: (status) {
        if (status == 'done' || status == 'notListening') {
          isListening.value = false;
        }
      },
    );
    if (available) {
      isListening.value = true;
      speech.listen(
  onResult: (result) {
    searchController.text = result.recognizedWords;

    
    searchController.selection = TextSelection.fromPosition(
      TextPosition(offset: searchController.text.length),
    );
  },
);

    }
  }

  @override
  Widget build(BuildContext context) {
    getAllContact();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Center(child: Text('CONTACT',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))
        ),
        backgroundColor: Colors.black87,
        body: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .1,
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: searchController,
                    onChanged: (value) {
  final query = value.toLowerCase();

  if (query.isEmpty) {
    filteredContactList.value = List.from(contactlist.value);
  } else {
    final filtered = contactlist.value.where((contact) {
      return contact.contactFirstName.toLowerCase().contains(query);
    }).toList();

    filteredContactList.value = filtered;
  }
},
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Entry required';
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: SizedBox(width:72,child: Row(mainAxisAlignment: MainAxisAlignment.end,children: [ValueListenableBuilder(
                              valueListenable: isListening,
                              builder: (context, listening, _) {
                                return IconButton(
                                  icon: Icon(listening ? Icons.mic : Icons.mic_none),
                                  onPressed: _startListening,
                                );
                              },
                            ),Icon(Icons.more_vert)])),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6)
                      )
                    ),
                  ),
                )
                ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .9,
              child: ValueListenableBuilder(
                valueListenable: filteredContactList, 
                builder: (context, newcontactList, child){
                  return ListView.separated(
                    itemBuilder: (context,index){
                      var contactdata =newcontactList[index];
                      return ListTile(
                        onTap: () {
        Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => EditScreen(contact: contactdata)));
      },
      
                        leading: CircleAvatar(
        backgroundColor: Colors.indigo,
        child: Text(
      contactdata.contactFirstName.isNotEmpty ? contactdata.contactFirstName[0].toUpperCase() : '?',
      style: TextStyle(color: Colors.white),
        ),
      ),
      title: Text(contactdata.contactFirstName,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      subtitle: Text(contactdata.contactEmail),
      trailing: IconButton(
  icon: Icon(
    contactdata.favouriteContact == 'true'
        ? Icons.favorite       // ❤️ Filled heart
        : Icons.favorite_border, // 🤍 Outlined heart
    color: Colors.red,
  ),
  onPressed: () {
    final newStatus = contactdata.favouriteContact == 'true' ? 'false' : 'true';
    editFavorite(contactdata.contactId, newStatus);
  },
),

                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider();
                    }, 
                    itemCount: newcontactList.length
                    );
                }
              )
            )
          ]
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AddScreen()),
            
          );
          getAllContact();},
        backgroundColor: Colors.blueAccent,child: Icon(Icons.add,color: Colors.white,))
        ),
    );
  }
}
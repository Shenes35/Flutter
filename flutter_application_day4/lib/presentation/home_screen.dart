import 'package:flutter/material.dart';
import 'package:flutter_application_day4/model/chat_model.dart';

class ScreenHome extends StatelessWidget {
   ScreenHome({super.key});
  List<ChatModel> myChats=[
    ChatModel(profilepicture: 'https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&q=70&fm=webp', profilename: 'Shenes', messegecontent: 'Do this work urgently', timestamp: '10:30am', messegecount: '5')
  ,ChatModel(profilepicture: 'https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&q=70&fm=webp', profilename: 'Shenes', messegecontent: 'Do this work urgently', timestamp: '10:30am', messegecount: '5')
  ,ChatModel(profilepicture: 'https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&q=70&fm=webp', profilename: 'Shenes', messegecontent: 'Do this work urgently', timestamp: '10:30am', messegecount: '5')
  ,ChatModel(profilepicture: 'https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&q=70&fm=webp', profilename: 'Shenes', messegecontent: 'Do this work urgently', timestamp: '10:30am', messegecount: '5')
  ,ChatModel(profilepicture: 'https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&q=70&fm=webp', profilename: 'Shenes', messegecontent: 'Do this work urgently', timestamp: '10:30am', messegecount: '5')
  ,ChatModel(profilepicture: 'https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&q=70&fm=webp', profilename: 'Shenes', messegecontent: 'Do this work urgently', timestamp: '10:30am', messegecount: '5')
  ,ChatModel(profilepicture: 'https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&q=70&fm=webp', profilename: 'Shenes', messegecontent: 'Do this work urgently', timestamp: '10:30am', messegecount: '5')
  ,ChatModel(profilepicture: 'https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&q=70&fm=webp', profilename: 'Shenes', messegecontent: 'Do this work urgently', timestamp: '10:30am', messegecount: '5')
  ,ChatModel(profilepicture: 'https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&q=70&fm=webp', profilename: 'Shenes', messegecontent: 'Do this work urgently', timestamp: '10:30am', messegecount: '5')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 12, 12, 12),
        title: Text(
          'Whatsapp',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.qr_code, color: Colors.grey[100]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.camera_alt_outlined, color: Colors.grey[100]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert, color: Colors.grey[100]),
            ),
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          TextField(
            decoration: InputDecoration(
              prefixIcon: IconButton(
                onPressed: () {},
                icon: Icon(Icons.search, color: Colors.grey[600]),
              ),
              hintText: 'Ask Meta AI or Search',
              hintStyle: TextStyle(color: Colors.grey[600]),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.grey[900],
            ),
          ),
          SizedBox(height: 700,
          child: ListView.separated(
            itemBuilder: (context,index){
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(myChats[index].profilepicture),
                  radius: 30
                ),
                title: Text(myChats[index].profilename,style: TextStyle(color: Colors.white)),
                subtitle: Row(children: [                    Icon(Icons.done_all, size: 16, color: Colors.grey[600]),
                    SizedBox(width: 4), Text(myChats[index].messegecontent)]),
                trailing: Column(
                  children: [
                    Text(myChats[index].timestamp),
                    SizedBox(height: 4),Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          myChats[index].messegecount, // number in badge
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    ),
                 
                  ],
                ),
              );
            }, 
            separatorBuilder: (context,index){
              return Divider();
            }, 
            itemCount: myChats.length),
          ),
          
        ],
      ),
    );
  }
}

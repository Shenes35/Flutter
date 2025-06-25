import 'package:drawing_app/presentation/overlay_screen.dart';
import 'package:drawing_app/presentation/overlay_screenpath.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ImagePicker _picker = ImagePicker();

  

  List<String> imagePaths = [
    'assets/images/image1.jpg',
    'assets/images/image2.jpg',
    'assets/images/image3.jpg',
    'assets/images/image4.jpg',
    'assets/images/image5.jpg',
    'assets/images/image6.jpg',
    'assets/images/image7.jpg',
    'assets/images/image8.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Text(
            'Anime Drawing',
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.all(10),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: List.generate(imagePaths.length, (index) {
            return GestureDetector(
  onTap: () {
    
      Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => LiveCameraOverlayScreen(
      overlayImagePath: imagePaths[index],
    ),
  ),
);

    
  },
  child: Container(
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Image.asset(imagePaths[index], fit: BoxFit.contain),
  ),
);


          }),
        ),
        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
  onPressed: () async {
  final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
  if (pickedFile != null) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => LiveCameraOverlayScreen2(
          overlayImagePath: pickedFile.path,
        ),
      ),
    );
  } 
},
  backgroundColor: Colors.blueAccent,
  child: const Icon(Icons.photo, color: Colors.white),
),


            
          ],
        ),
      ),
    );
  }
} 
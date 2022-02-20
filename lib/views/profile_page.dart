import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({ Key? key }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ImagePicker _picker=ImagePicker();
  late final  XFile? image;
Future<void> getImageFromCamera()async{
  image=await _picker.pickImage(source: ImageSource.camera);
  setState(() {
    
  });


}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Profile"),backgroundColor: Colors.white,),
      body: ListView(

        children: [
          const SizedBox(height: 20,),
          CircleAvatar(
            child: image==null?Text("Foto"):Image.file(File(image!.path)),
            radius: 80,
          ),
          ElevatedButton(onPressed: (){
            getImageFromCamera();
          }, child: const Text("Select"))

        ],
      ),
      
    );
  }
}
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inter_native/widgets/my_button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ImagePicker _picker = ImagePicker();
   XFile? image;
  Future<void> getImageFromCamera() async {
    image = await _picker.pickImage(source: ImageSource.camera);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
         Container(
           alignment: Alignment.center,
           height: MediaQuery.of(context).size.height/3,

           child: Stack(
             children: [
               CircleAvatar(
                 child: image == null ? Text("Foto") : Container(decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: FileImage(File(image!.path),)

              ),)),
              radius: 80,
               ),
               Positioned( bottom: 30,right: 30,child: IconButton(onPressed: (){
                 _showkBottomShet();
               }, icon: Icon(Icons.camera_alt))),
             ],
           ),
           
         ),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Container(
             height: MediaQuery.of(context).size.height*0.3,
             color: Colors.redAccent,
           ),
         )
,const MyButton (color: Colors.white, colorControl: false, text: "Save")
, MyButton (color: Colors.grey.shade900, colorControl: true, text: "Log Out")

       
       
        ],
      ),
    );
  }
 
 void _showkBottomShet(){
   showModalBottomSheet(context: context,builder: (context){
     return SingleChildScrollView(
       child: Column(
         children: [
           Container(
             decoration: BoxDecoration(
               border: Border.all(width: 1,color: Colors.black)
             ),
             alignment: Alignment.center,
             height: MediaQuery.of(context).size.height*0.5,
             child:image==null? Icon(Icons.camera_alt):Image.file(File(image!.path)),
           ),
           SizedBox(
             width: MediaQuery.of(context).size.width,
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
     
                GestureDetector(
                  onTap: (){
                    _showImageFrom();
                  
                  },
                  child: _myPrivateButton(Colors.grey.shade900, true, "Select")),
                _myPrivateButton(Colors.white, false, "Remove"),


               ],
             ),
           )
         ],

       ),
     );
   });
 }
 Widget _myPrivateButton(Color color,bool colorControl,String text){
 return  Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
            color: color,
            borderRadius: BorderRadius.circular(20)),
        height: 50,
        width: MediaQuery.of(context).size.width*0.3,
        child: Row(
          
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Icon(
                Icons.login_outlined,
                size: 30,
                color:colorControl ? Colors.white : Colors.black,
              ),
            ),
          
            Text(
            text,
              style: TextStyle(
                  color:colorControl ? Colors.white : Colors.black,
                  fontSize: 20),
            )
          ],
        ),
      ),
    );
 }
void _showImageFrom(){
  showDialog(context: context, builder: (context){
return AlertDialog(
  content: const Center(child:  Text("Select a picture",style: TextStyle(fontWeight: FontWeight.bold),)),
  actions: [
    Center(
      child: Column(
     
        children: [
          GestureDetector(onTap: (){
            getImageFromCamera();
          },child: _myPrivateButton(Colors.grey.shade900, true, "Camera")),
          _myPrivateButton(Colors.white, false, "Gallery"),


        ],
      ),
    )
  ],
);
  });
}
}

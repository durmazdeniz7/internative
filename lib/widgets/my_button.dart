import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
 final Color color;
final  bool colorControl;
final  String text;
  const MyButton({
    Key? key,
    required this.color,
    required this.colorControl,
    required this.text,
  }) : super(key: key);

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
            color: widget.color,
            borderRadius: BorderRadius.circular(20)),
        height: 50,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Icon(
                Icons.login_outlined,
                size: 30,
                color:widget.colorControl ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(
              width: 140,
            ),
            Text(
            widget.text,
              style: TextStyle(
                  color:widget.colorControl ? Colors.white : Colors.black,
                  fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
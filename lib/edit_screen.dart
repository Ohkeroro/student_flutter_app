import 'package:flutter/material.dart';
import 'package:student_flutter_app/student.dart';

class EditScreen extends StatefulWidget {
  final int index;
  const EditScreen({super.key, required this.index});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  var nameController = TextEditingController();
  var idController = TextEditingController();
  var scoreController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var numItem = widget.index;
    if(numItem >= 0){
      idController.text = Student.studentItems[numItem]['id'];
      nameController.text = Student.studentItems[numItem]['name'];
      scoreController.text = Student.studentItems[numItem]['score'].toString();

    }

    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color:  Colors.white,
        border: Border.all(width: 0),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30)
        )
      ),
      child: Column(
        children: [
          const SizedBox(height: 20),
          TextField(
            controller: idController,
            style: const TextStyle(color: Colors.black, fontSize: 16),
            decoration: const InputDecoration(
              labelText: 'รหัสนักศึกษา',
              focusColor: Colors.pink,
              labelStyle: TextStyle(
                decorationColor: Colors.red,
                color: Colors.blue,
                fontSize: 20

              ),
              icon: Icon(Icons.code_sharp,color: Colors.blueGrey,size: 30,),
              fillColor: Colors.blueGrey,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey,style: BorderStyle.solid),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.pinkAccent)
              )

            ),
          ),
          const SizedBox(height: 20,),
          TextField(
            controller: nameController,
            style: const TextStyle(color: Colors.black, fontSize: 16),
            decoration: const InputDecoration(
              labelText: 'ชื่อนักศึกษา',
              focusColor: Colors.pink,
              labelStyle: TextStyle(
                decorationColor: Colors.red,
                color: Colors.blue,
                fontSize: 20

              ),
              icon: Icon(Icons.person_outline,color: Colors.blueGrey,size: 30,),
              fillColor: Colors.blueGrey,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey,style: BorderStyle.solid),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.pinkAccent)
              )

            ),
          ),
          const SizedBox(height: 20,),
          TextField(
            controller: scoreController,
            style: const TextStyle(color: Colors.black, fontSize: 16),
            decoration: const InputDecoration(
              labelText: 'คะแนน',
              focusColor: Colors.pink,
              labelStyle: TextStyle(
                decorationColor: Colors.red,
                color: Colors.blue,
                fontSize: 20

              ),
              icon: Icon(Icons.score_outlined,color: Colors.blueGrey,size: 30,),
              fillColor: Colors.blueGrey,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey,style: BorderStyle.solid),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.pinkAccent)
              )

            ),
          ),
          const SizedBox(height: 30,),
          buildButton(),
        ],
      ),
    );
  }
  Widget buildButton(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: (){
            Navigator.of(context).pop();
          }, 
          child: const Text('ยกเลิก',
          style: TextStyle (fontWeight: FontWeight.bold, fontSize: 16),),
        ),
        const SizedBox(width: 20,),
        ElevatedButton(
          onPressed: (){
            setState(() {
              Student.studentItems[widget.index]['id']=idController.text;
              Student.studentItems[widget.index]['name']=nameController.text;
              Student.studentItems[widget.index]['score']=int.parse(scoreController.text);
              Student.updateStudentItem();
            });
            Navigator.of(context).pop();
          }, 
          child: const Text('แก้ไข',
          style: TextStyle (fontWeight: FontWeight.bold, fontSize: 16),),
        ),
      ],);
  }
}
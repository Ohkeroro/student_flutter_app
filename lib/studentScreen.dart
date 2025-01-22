import 'package:flutter/material.dart';
import 'package:student_flutter_app/add_screen.dart';
import 'package:student_flutter_app/edit_screen.dart';
import 'package:student_flutter_app/student.dart';


class Studentscreen extends StatefulWidget {
  const Studentscreen({super.key});

  @override
  State<Studentscreen> createState() => _StudentscreenState();
}

class _StudentscreenState extends State<Studentscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children:[
              const CircleAvatar(
                radius: 40,
                backgroundColor: Colors.pink,
                child: Icon(Icons.people_alt, size: 40,color:Colors.white),
                ),
              const SizedBox(height: 10,),
              const Text('นายชื่อนักศึกษา',style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.grey
              ),),
              const SizedBox(),
              Text('นักศึกษาทั้งหมด${Student.countItem}คน')
            ],
          ),
          Expanded(
        child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: Padding(padding: const EdgeInsets.only(
            top: 50, bottom: 50
          ),
          child: studentList(context),
          ),
        ),
      ),
        ],
      ),
    ),
    floatingActionButton: FloatingActionButton(backgroundColor: Colors.pink, 
    onPressed: () {
        Navigator.push(context,
        MaterialPageRoute(builder: (context) => const AddScreen())
      );
    },
    child:  const Icon(Icons.add, size: 40,color: Colors.blue,),
    ),
    );
  }

  Widget studentList(BuildContext ctx){
    return ListView.builder(
      itemCount: Student.countItem,
      itemBuilder: (ctx, index){
        return Column(
          children: [
            Dismissible(key: Key(Student.studentItems[index]['id']),
            background: Container(
              decoration: const BoxDecoration(color: Colors.pink),
            ), 
            onDismissed: (direction){
              if(direction==DismissDirection.endToStart){
                Student.studentItems.removeAt(index);
                setState(() {
                  Student.countItem = Student.studentItems.length;
                });
              }
            },
            direction: DismissDirection.endToStart,
            child: studentTile(index)),
          const Divider(
            color: Colors.blueGrey, indent: 20, endIndent: 20, height: 1,
          )
          ],
        );
      });
  }

  Widget studentTile(int index){
    var id = Student.studentItems[index]['id'];
    var name = Student.studentItems[index]['name'];
    var score = Student.studentItems[index]['score'];
    return ListTile(
      contentPadding: const EdgeInsets.only(
        left: 60, right: 60,
      ),
      title: Text('${index+1}. $id $name',
                  style: const TextStyle(
                    color: Colors.pinkAccent, 
                    fontSize: 10,
                    fontWeight: FontWeight.w500),
      ),
      trailing: Text(score.toString(),
                  style: const TextStyle(
                    color: Colors.pinkAccent, 
                    fontSize: 10,
                    fontWeight: FontWeight.w500),
      ),
      onTap: (){
        showModalBottomSheet(
          isScrollControlled: true,
          context: context, 
          builder: (context){return EditScreen(index: index);});
      },
    );

  }
}
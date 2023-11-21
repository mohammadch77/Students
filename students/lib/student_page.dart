import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:students/student_create.dart';
import 'package:students/students_model.dart';

class StudentPage extends StatefulWidget {
  const StudentPage({super.key});

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {

 
  @override
  void initState() {
    getStudents();
    super.initState();
   
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color.fromARGB(255, 215, 215, 215),
      //appbar
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.green,
        title: const Text(
          "لیست دانش آموزان",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      //float_button
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => StudentCreate(),
              ));
        },
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(100),
          ),
        ),
        backgroundColor: Colors.green,
        child: const Icon(CupertinoIcons.plus),
      ),
      //list of students
      body: SafeArea(
          child:   ListView.builder(
                  padding: const EdgeInsets.all(20),
                  itemCount: students?.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: Container(
                        width: 100,
                        height: 100,
                        margin: const EdgeInsets.only(bottom: 20),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            )),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: students?[index].avatar == null
                                      ? Image.asset(
                                          "assets/images/avatar.png",
                                          height: 80,
                                          width: 80,
                                        )
                                      : Image.network(
                                          students![index].avatar!,
                                          height: 80,
                                          width: 80,
                                          fit: BoxFit.cover,
                                        )),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Text(
                                        "نام : ${students?[index].name}",
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green,
                                        ),
                                      )),
                                      const Icon(Icons.edit),
                                      const Icon(CupertinoIcons.delete),
                                    ],
                                  ),
                                  Text(
                                    "سن : ${students?[index].age}",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ))
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )),
    ));
  }
}

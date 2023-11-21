import 'package:dio/dio.dart';

class Student {
   String? name;
   int? age;
   int? grade;
   String? avatar;
   String? description;

  Student.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    age = json["age"];
    avatar = json["avatar"];
    description = json["description"];
    grade = json["grade"];
  }
}

var dio = Dio();
List<Student>? students;

Future<void> getStudents() async {
  var response = await dio.get("https://hitaldev.ir/api/students");
  //students = [];
  for (var item in response.data["data"]) {
    students?.add(Student.fromJson(item));
  }

  //print(response.data);
}

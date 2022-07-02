class SpringUser {
  int id;
  String name;
  String age;
  String course;
  String college;
  String matric;
  SpringUser({
    this.id,
    this.name,
    this.age,
    this.course,
    this.college,
    this.matric,
  });

  factory SpringUser.fromJson(Map<String, dynamic> json) {
    return SpringUser(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      course: json['course'],
      college: json['college'],
       matric: json['matric'],
    );
  }
}

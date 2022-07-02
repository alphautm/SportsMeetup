class TaskEvent {
  int id;
  String title;
  String date;
  String priority;
  String notifcation;
  String description;
  TaskEvent({
    this.id,
    this.title,
    this.description,
    this.date,
    this.priority,
    this.notifcation,
  });

  factory TaskEvent.fromJson(Map<String, dynamic> json) {
    return TaskEvent(
      id: json['id'],
      title: json['title'],
      date: json['date'],
      priority: json['priority'],
      notifcation: json['notifcation'],
       description: json['description'],
    );
  }
}

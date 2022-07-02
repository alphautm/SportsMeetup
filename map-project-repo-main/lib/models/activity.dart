class Activity {
  int id;
  String name;
  String date;
  String venue;
  String time;
  String description;
  Activity({
    this.id,
    this.name,
    this.description,
    this.date,
    this.venue,
    this.time,
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      id: json['id'],
      name: json['name'],
      date: json['date'],
      venue: json['venue'],
      time: json['time'],
       description: json['description'],
    );
  }
}

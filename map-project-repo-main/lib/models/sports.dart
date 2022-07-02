class Sports {
  dynamic id;
  String category;
  String date;
  String gender;
  String imgUrl;

  dynamic hostid;
  String time;
  String description;
  String venue;

  Sports(
      {this.id,
      this.category,
      this.date,
      this.gender,
      this.imgUrl,
      this.hostid,
      this.time,
      this.description,
      this.venue});
  Sports.copy(Sports from)
      : this(
            id: from.id,
            category: from.category,
            date: from.date,
            gender: from.gender,
            imgUrl: from.imgUrl,
            hostid: from.hostid,
            time: from.time,
            description: from.description,
            venue: from.venue);

  Sports.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          category: json['category'],
          date: json['date'],
          gender: json['gender'],
          imgUrl: json['imgUrl'],
          hostid: json['hostid'],
          time: json['time'],
          description: json['description'],
          venue: json['venue'],
        );

  Map<String, dynamic> toJson() => {
        'id': id,
        'category': category,
        'date': date,
        'gender': gender,
        'imgUrl': imgUrl,
        'hostid': hostid,
        'time': time,
        'description': description,
        'venue': venue,
      };
}

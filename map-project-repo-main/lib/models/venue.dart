class Venue {
  int id;
  String name;
  String location;

  Venue({
    this.id,
    this.name,
    this.location,
 
  });

  factory Venue.fromJson(Map<String, dynamic> json) {
    return Venue(
      id: json['id'],
      name: json['name'],
      location: json['location'],

    );
  }
}

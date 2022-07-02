class Participant {
  dynamic id;
  dynamic participantId;
  dynamic sportsId;

  Participant({this.id, this.participantId, this.sportsId});

  get sportsid => sportsId;

  Participant.copy(Participant from)
      : this(
            id: from.id,
            participantId: from.participantId,
            sportsId: from.sportsId);

  Participant.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          participantId: json['participantId'],
          sportsId: json['sportsId'],
        );

  Map<String, dynamic> toJson() => {
        'id': id,
        'participantId': participantId,
        'sportsId': sportsId,
      };
}

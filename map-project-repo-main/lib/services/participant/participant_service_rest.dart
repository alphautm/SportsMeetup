import '../../models/participant.dart';

import '../../app/dependencies.dart';
import '../../services/participant/participant_service.dart';
import '../../services/rest.dart';

class ParticipantServiceRest implements ParticipantService {
  RestService get rest => dependency();

  Future<List<Participant>> getParticipants() async {
    final List listJson = await rest.get('participants');
    return listJson.map((json) => Participant.fromJson(json)).toList();
  }

  Future<List<Participant>> getParticipantsById(dynamic id) async {
    final List listJson = await rest.get('participants?sportsId=$id');
    return listJson.map((json) => Participant.fromJson(json)).toList();
  }

  Future<Participant> joinSports(Participant participant) async {
    final json = await rest.post('participants', data: participant);
    return Participant.fromJson(json);
  }

  Future<void> leaveSports(Participant participant) async {
    await rest.delete('participants/${participant.id}');
  }

  Future<List<Participant>> getParticipantsByUserId(String id) async {
    final List listJson = await rest.get('participants?participantId=$id');
    return listJson.map((json) => Participant.fromJson(json)).toList();
  }
}

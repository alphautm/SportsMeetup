import '../../models/participant.dart';

abstract class ParticipantService {
  Future<Participant> joinSports(Participant participant);
  Future<void> leaveSports(Participant participant);
  Future<List<Participant>> getParticipants();
  Future<List<Participant>> getParticipantsById(dynamic id);
  Future<List<Participant>> getParticipantsByUserId(String id);
}

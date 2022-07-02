import '../../app/dependencies.dart';
import '../../models/sports.dart';
import '../../services/rest.dart';
import '../../services/sport/sport_service.dart';

class SportServiceRest implements SportService {
  RestService get rest => dependency();

  Future<List<Sports>> getSports() async {
    final List listJson = await rest.get('sports');
    return listJson.map((json) => Sports.fromJson(json)).toList();
  }

  Future<List<Sports>> getSportsById(dynamic id) async {
    final List listJson = await rest.get('sports?hostid=$id');

    return listJson.map((json) => Sports.fromJson(json)).toList();
  }

  Future<Sports> addSports(Sports sports) async {
    final json = await rest.post('sports', data: sports);
    return Sports.fromJson(json);
  }

  Future<Sports> updateSports(Sports sports) async {
    final json = await rest.put('sports/${sports.id}', data: sports);
    return Sports.fromJson(json);
  }

  Future<void> removeSports(Sports sports) async {
    await rest.delete('sports/${sports.id}');
  }
}

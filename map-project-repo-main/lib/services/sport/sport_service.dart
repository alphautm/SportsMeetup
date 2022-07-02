import '../../models/sports.dart';

abstract class SportService {
  Future<List<Sports>> getSports();
  Future<List<Sports>> getSportsById(dynamic id);
  Future<Sports> addSports(Sports sports);
  Future<Sports> updateSports(Sports sports);
  Future<void> removeSports(Sports sports);
}

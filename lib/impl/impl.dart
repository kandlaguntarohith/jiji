import 'dart:async';

import 'package:jiji/data/network/repository.dart';

class Impl {
  Repository _repository = new Repository();
  Future<Map<String, dynamic>> registerUser(Map<String, dynamic> body) async {
    final Map<String, dynamic> response = await _repository.registerUser(body);
    return response;
  }

  Future<Map<String, dynamic>> checkCredentials(
      Map<String, dynamic> body) async {
    final Map<String, dynamic> response =
        await _repository.checkCredentials(body);
    return response;
  }

  // Future<List<VehicleName>> getVehicalNamesList() async {
  //   VehicalRepository _repository = new VehicalRepository();
  //   final List<VehicleName> vehicalNames =
  //       await _repository.fetchVehicalNames();
  //   return vehicalNames;
  // }

  // Future<List<VehicleModel>> getVehicalModelsList() async {
  //   VehicalRepository _repository = new VehicalRepository();
  //   final List<VehicleModel> vehicalModels =
  //       await _repository.fetchVehicalModels();
  //   return vehicalModels;
  // }

  // Future<List<VehicleAddon>> getVehicalAddons() async {
  //   VehicalRepository _repository = new VehicalRepository();
  //   final List<VehicleAddon> vehicalAddons =
  //       await _repository.fetchVehicalAddons();
  //   return vehicalAddons;
  // }
}

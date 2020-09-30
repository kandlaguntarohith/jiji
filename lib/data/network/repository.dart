import 'package:jiji/constants/endpoints.dart';
import 'package:jiji/data/network/api_helper.dart';

class Repository {
  ApiHelper _helper = ApiHelper();
  Future<Map<String, dynamic>> registerUser(Map<String, dynamic> body) async {
    Map<String, dynamic> response =
        await _helper.postAndGetResponseNumber(Endpoints.registerUser, body);
    return response;
  }

  // Future<List<VehicleName>> fetchVehicalNames() async {
  //   List<VehicleName> vehicalNames = [];
  //   Map<String, dynamic> response =
  //       await _helper.get("http://happymoney.in/api/v1/vehicle/makes");
  //   response["data"].toList().forEach((element) {
  //     vehicalNames.add(VehicleName.fromJson(element));
  //   });
  //   return vehicalNames;
  // }

}

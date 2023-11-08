import 'dart:convert';
import 'package:transforms/features/machine/models/machine_model.dart';
import 'package:transforms/tools/configuration.dart';
import 'package:transforms/tools/connection.dart';
import 'package:transforms/tools/enum.dart';
import 'package:transforms/tools/exception.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as p;

class MachineService {
  final _connection = APIConnection(
    alice: ConfigEnvironments.getEnvironments()['alice']
  );

  String get _getMachinesPrefix => 'machines';
  String machineByVenue(int venueId) {
    return p.join(_getMachinesPrefix, "$venueId");
  }
  
  Future<MachineResponseModel> getMachinesByVenue(int venueId) async {
    try {
      final response = await _connection.request(
        endpoint: machineByVenue(venueId),
        method: RequestMethod.GET
      );
      return MachineResponseModel.fromJson(jsonDecode(response.body));
    } catch (err) {
      throw DefaultException(message: err.toString());
    }
  }
}

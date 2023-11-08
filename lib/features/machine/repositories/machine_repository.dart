import 'package:transforms/features/machine/models/machine_model.dart';
import 'package:transforms/features/machine/services/machine_service.dart';

class MachineRepository {
  final MachineService _machineService;

  MachineRepository({
    required MachineService machineService,
  }) : _machineService = machineService;

  Future<MachineResponseModel> getMachine(int venueId) async {
    try {
      final response = await _machineService.getMachinesByVenue(venueId);
      return response;
    } catch (err) {
      rethrow;
    }
  }
}


// ignore_for_file: constant_identifier_names
enum RequestMethod { GET, POST, PATCH, PUT, DELETE, HEAD }

enum MaintenanceType {
  Fixing,
  ChangePart,
  Others
}

enum MachineStatus {
  Breakdown,
  Maintenance,
  Running
}

enum AccessType {
  read,
  create,
  update,
}

enum HomeSegmentType {
  machine,
  employee,
}

enum PickerType {
  employee,
  machine,
  machineProfile,
}

enum UserRole {
  Admin,
  Technician
}
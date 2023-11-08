class LogoutResponseModel {
  String message;
  bool success;

  LogoutResponseModel({
    required this.message,
    required this.success
  });

  factory LogoutResponseModel.fromJson(Map<String, dynamic> json) {
    return LogoutResponseModel(
      message: json["message"], 
      success: json["success"]
    );
  }
}
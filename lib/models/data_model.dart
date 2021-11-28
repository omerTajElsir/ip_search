class DataModel {
  DataModel({
    required this.ip,
    required this.country,
    required this.cc
  });

  final String ip;
  final String country;
  final String cc;

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      ip: json['ip'],
      country: json['country'],
      cc: json['cc'],
    );
  }
}

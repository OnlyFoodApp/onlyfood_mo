// {
//   "campaignName": "string",
//   "description": "string",
//   "startDate": "2023-11-10T10:06:30.884Z",
//   "endDate": "2023-11-10T10:06:30.884Z",
//   "chefID": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
//   "status": 0
// }
class Campaign {
  late String campaignName;
  late String description;
  late String startDate;
  late String endDate;
  late String chefID;
  late int status;


  Campaign({
    required this.campaignName,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.chefID,
    required this.status,
  });

  factory Campaign.fromJson(Map<String, dynamic> json) {
    return Campaign(
      campaignName: json['campaignName'] as String? ?? '',
      description: json['description'] as String? ?? '',
      startDate: json['startDate'] as String? ?? '',
      endDate: json['endDate'] as String? ?? '',
      chefID: json['chefID'] as String? ?? '',
      status: json['isDeleted'] as int? ?? 0,
    );
  }
}

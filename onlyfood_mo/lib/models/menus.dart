// {
//   "isDeleted": 0,
//   "isEdited": 0,
//   "campaignId": "3fa85f64-5717-4562-b3fc-2c963f66afa6"
// }
class Campaign {
  late String campaignId;
  late int isDeleted;
  late int isEdited;

  Campaign({
    required this.campaignId,
    required this.isDeleted,
    required this.isEdited,
  });

  factory Campaign.fromJson(Map<String, dynamic> json) {
    return Campaign(
      campaignId: json['campaignId'] as String? ?? '',
      isDeleted: json['isDeleted'] as int? ?? 0,
      isEdited: json['isEdited'] as int? ?? 0,
    );
  }
}

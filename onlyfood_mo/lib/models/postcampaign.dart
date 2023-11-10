class PostCampaign {
  late String id;
  late String campaignName;
  late String description;
  late String startDate;
  late String endDate;
  late String chefID;
  late String username;

  PostCampaign({
    required this.id,
    required this.campaignName,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.chefID,
    required this.username,
  });

  factory PostCampaign.fromJson(Map<String, dynamic> json) {
    return PostCampaign(
      id: json['id'] as String? ?? '',
      campaignName: json['campaignName'] as String? ?? '',
      description: json['description'] as String? ?? '',
      startDate: json['startDate'] as String? ?? '',
      endDate: json['endDate'] as String? ?? '',
      chefID: json['isDeleted'] as String? ?? '',
      username: json['username'] as String? ?? '',
    );
  }
}

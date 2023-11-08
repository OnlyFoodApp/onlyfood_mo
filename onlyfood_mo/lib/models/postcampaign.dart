class PostCampaign {
  late String id;
  late String campaignName;
  late String description;
  late DateTime startDate;
  late DateTime endDate;
  late String chefID;
  late Object chef;

  PostCampaign({
    required this.id,
    required this.campaignName,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.chefID,
    required this.chef,
  });

  factory PostCampaign.fromJson(Map<String, dynamic> json) {
    return PostCampaign(
      id: json['id'] as String? ?? '',
      campaignName: json['campaignName'] as String? ?? '',
      description: json['description'] as String? ?? '',
      startDate: json['startDate'],
      endDate: json['endDate'],
      chefID: json['isDeleted'] as String? ?? '',
      chef: json['chef'] as Object? ?? [],
    );
  }
}

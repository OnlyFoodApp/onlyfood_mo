import 'dart:convert';

class Post {
  late String title;
  late String content;
  late String accountID;
  late int displayIndex;
  late String mediaURLs;
  late int isDeleted;
  late int isUpdate;

  Post({
    required this.title,
    required this.content,
    required this.accountID,
    required this.displayIndex,
    required this.mediaURLs,
    required this.isDeleted,
    required this.isUpdate,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      title: json['title'] as String? ?? '',
      content: json['content'] as String? ?? '',
      accountID: json['accountID'] as String? ?? '',
      displayIndex: json['displayIndex'] as int? ?? 0,
      mediaURLs: json['mediaURLs'] as String? ?? '',
      isDeleted: json['isDeleted'] as int? ?? 0,
      isUpdate: json['isUpdate'] as int? ?? 0,
    );
  }
}

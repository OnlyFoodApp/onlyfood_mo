
class Post {
  late String id;
  late String title;
  late String content;
  late Object account;
  late String username;

  late int displayIndex;
  late String mediaURLs;
  late int isDeleted;
  late int isUpdate;

  Post({
    required this.id,
    required this.title,
    required this.content,
    required this.account,
    required this.displayIndex,
    required this.mediaURLs,
    required this.isDeleted,
    required this.isUpdate,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      content: json['content'] as String? ?? '',
      account: json['account'] as Object? ?? [],
      displayIndex: json['displayIndex'] as int? ?? 0,
      mediaURLs: json['mediaURLs'] as String? ?? '',
      isDeleted: json['isDeleted'] as int? ?? 0,
      isUpdate: json['isUpdate'] as int? ?? 0,
    );
  }
}

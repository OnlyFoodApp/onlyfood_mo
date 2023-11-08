class Comment {
  late String id;
  late String username;
  late String postId;
  late String text;
  late int displayIndex;
  late String parentCommentId;
  late int isDelete;
  late int isEdited;

  Comment({
    required this.id,
    required this.username,
    required this.postId,
    required this.text,
    required this.displayIndex,
    required this.parentCommentId,
    required this.isDelete,
    required this.isEdited,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'] as String? ?? '',
      username: json['username'] as String? ?? '',
      postId: json['postId'] as String? ?? '',
      text: json['text'] as String? ?? '',
      displayIndex: json['displayIndex'] as int? ?? 0,
      parentCommentId: json['parentCommentId'] as String? ?? '',
      isDelete: json['isDelete'] as int? ?? 0,
      isEdited: json['isEdited'] as int? ?? 0,
    );
  }
}

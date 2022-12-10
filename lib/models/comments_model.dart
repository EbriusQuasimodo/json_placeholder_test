class CommentsModel {
  final int id;
  final int postId;
  final String name;
  final String body;

  CommentsModel({
    required this.id,
    required this.postId,
    required this.name,
    required this.body,
  });

  factory CommentsModel.fromJson(Map<String, dynamic> json) {
    return CommentsModel(
      id: json['id'],
      postId: json['postId'],
      body: json['body'],
      name: json['name'],
    );
  }
}

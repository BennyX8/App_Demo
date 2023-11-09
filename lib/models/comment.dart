class Comment {
  final String text;
  final String name;
  final String username;
  final String userAvatar;
  final String time;
  final String? likes;
  final String? replies;

  const Comment( {
    required this.text,
    required this.name,
    required this.username,
    required this.userAvatar,
    required this.time,
    this.likes,
    this.replies,
  });

  factory Comment.fromMap(Map data) {
    return Comment(
      text: data['comment'],
      name: data['name'],
      username: data['username'],
      userAvatar: data['userAvatar'],
      time: data['time'],
    );
  }
}

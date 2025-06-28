class GithubCommitModel {
  final String message;
  final String content;
  final Committer committer;

  GithubCommitModel({
    required this.message,
    required this.content,
    required this.committer,
  });

  factory GithubCommitModel.fromJson(Map<String, dynamic> json) {
    return GithubCommitModel(
      message: json['message'] as String,
      content: json['content'] as String,
      committer: Committer.fromJson(json['committer'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
    'message': message,
    'content': content,
    'committer': committer.toJson(),
  };
}

class Committer {
  final String name;
  final String email;

  Committer({required this.name, required this.email});

  factory Committer.fromJson(Map<String, dynamic> json) {
    return Committer(
      name: json['name'] as String,
      email: json['email'] as String,
    );
  }

  Map<String, dynamic> toJson() => {'name': name, 'email': email};
}

class QuoteModel {
  final String quote;
  final String author;

  QuoteModel({required this.quote, required this.author});

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
      quote: json['quote'] as String,
      author: json['author'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'quote': quote, 'author': author};
  }
}

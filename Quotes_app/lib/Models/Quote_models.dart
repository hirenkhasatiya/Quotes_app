class Quote {
  final String quote;
  final String category;
  final String author;

  Quote({required this.quote, required this.category, required this.author});

  factory Quote.fromMap({required Map data})
  {
    return Quote(quote: data["quote"], category: data["category"], author: data["author"]);
  }
}
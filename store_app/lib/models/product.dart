class Product {
  final int id;
  final String title;
  final String price;
  final String description;
  final String category;
  final String image;
  Rating? rating;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory Product.fromJson(jsonData) {
    return Product(
      id: jsonData['id'],
      title: jsonData['title'],
      price: jsonData['price'].toString(),
      description: jsonData['description'],
      category: jsonData['category'],
      image: jsonData['image'],
      rating: jsonData['rating'] == null
          ? null
          : Rating.fromJson(jsonData['rating']),
    );
  }
}

class Rating {
  final String rate;
  final int count;

  Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromJson(jsonData) {
    return Rating(
      rate: jsonData['rate'].toString(),
      count: jsonData['count'],
    );
  }
}

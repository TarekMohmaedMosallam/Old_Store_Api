class ProductLists {
  final String title;
  final double price;
  final String description;
  final List<String> images;

  ProductLists({
    required this.title,
    required this.price,
    required this.description,
    required this.images,
  });

  factory ProductLists.fromJson(Map<String, dynamic> json) {
    return ProductLists(
      // Ensure this is parsed as an integer
      title: json['title'],
      price: json['price'].toDouble(), // Ensure this is parsed as a double
      description: json['description'],
      
      images: List<String>.from(json['images']), // Ensure this is a list of strings
    );
  }
}
class Category {
  final int id; // Changed from String to int
  final String name;
  final String image; // Added this field

  Category({
    required this.id,
    required this.name,
    required this.image,
a  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'], // Ensure this is parsed as an integer
      name: json['name'],
      image: json['image'], // Map the image field
    );
  }
}

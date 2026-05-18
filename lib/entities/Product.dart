class Product {
  final int id;
  String name;
  String? image;
  int price;

  static List<Product> products = [
    Product(id: 1, name: "Teddy bear", image: "image.img", price: 120000),
    Product(id: 2, name: "Computer", image: "image.img", price: 390000),
    Product(id: 3, name: "Barbie Doll", image: "image.img", price: 90000),
    Product(id: 4, name: "Mobile", image: "image.img", price: 980000),
  ];

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      name: json["name"],
      image: json["image"],
      price: json["price"],
    );
  }

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
  });

  void addProduct({ required int id, required String name, String? image, required int price}) {
    products.add(Product(id: id, name: name, image: image, price: price));
  }

  void editProduct({ required int id, String? name, String? image, int? price}) {

  }
}

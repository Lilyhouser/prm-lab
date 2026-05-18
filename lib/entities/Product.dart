class Product {
  final int id;
  String name;
  String? image;
  double price;

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

  void addProduct({
    required int id,
    required String name,
    String? image,
    required double price,
  }) {
    products.add(Product(id: id, name: name, image: image, price: price));
  }

  void editProduct({String? name, String? image, double? price}) {
    this.name = name ?? this.name;
    this.image = image ?? this.image;
    this.price = price ?? this.price;
  }

  List<Product> searchByName({required String search}) {
    List<Product> searchList = [];
    searchList = products
        .where((e) => (e.name.toLowerCase()).contains(search.toLowerCase()))
        .toList();
    return searchList;
  }

  Product searchById({required int id}) {
    return products.firstWhere((e) => e.id == id);
  }

  List<Product> searchByPriceRange({double? max, double? min}) {
    List<Product> searchList = [];

    if (max != null && min != null) {
      searchList = products
          .where((e) => e.price >= min && e.price <= max)
          .toList();
    } else if (max != null) {
      searchList = products.where((e) => e.price <= max).toList();
    } else if (min != null) {
      searchList = products.where((e) => e.price >= min).toList();
    }
    return searchList;
  }

  void increasePriceBy10Percent() {
    products = products
        .map(
          (e) => (Product(
            id: e.id,
            name: e.name,
            price: (e.price * 1.1).roundToDouble(),
            image: e.image,
          )),
        )
        .toList();
  }

  List<Product> getListProduct() => products;

  void printProduct() {
    print(
      'product id: ${this.id}, product name: ${this.name}, product price: ${this.price}, product image: ${this.image}',
    );
  }

  void printListProduct() {
    products.forEach(
      (e) => print(
        'product id: ${e.id}, product name: ${e.name}, product price: ${e.price}, product image: ${e.image}',
      ),
    );
  }
}

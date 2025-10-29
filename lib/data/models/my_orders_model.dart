class MyOrdersModel {
  final int id;
  final String title;
  final String image;
  final double price;
  final bool isFavorite;
  final int quantity;
  final DateTime date;
  final String status;

  MyOrdersModel({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.isFavorite,
    required this.quantity,
    required this.date,
    required this.status,
  });

  factory MyOrdersModel.fromJson(Map<String, dynamic> json) {
    return MyOrdersModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      price: json['price'],
      isFavorite: json['isFavorite'],
      quantity: json['quantity'],
      date: DateTime.parse(json['date']),
      status: json['status'],
    );
  }

  MyOrdersModel copyWith({
    int? id,
    String? title,
    String? image,
    double? price,
    bool? isFavorite,
    int? quantity,
    DateTime? date,
    String? status,
  }) {
    return MyOrdersModel(
      id: id ?? this.id,
      title: title ?? this.title,
      image: image ?? this.image,
      price: price ?? this.price,
      isFavorite: isFavorite ?? this.isFavorite,
      quantity: quantity ?? this.quantity,
      date: date ?? this.date,
      status: status ?? this.status,
    );
  }
}

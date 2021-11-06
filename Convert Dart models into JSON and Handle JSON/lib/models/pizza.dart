const keyId = 'id';
const keyName = 'pizzaName';
const keyDescription = 'description';
const keyPrice = 'price';
const keyImage = 'imageUrl';
class Pizza {
  int id = 0;
 String pizzaName = '';
 String description = '';
 double price = 0;
 String imageUrl = '';

  Pizza(
    this.id,
    this.pizzaName,
    this.description,
    this.price,
    this.imageUrl,
  );

  factory Pizza.fromMap(Map<String, dynamic> map) => Pizza(
        map["id"],
        map["pizzaName"],
        map["description"],
        map["price"],
        map["imageUrl"],
      );
  Pizza.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.pizzaName = json['pizzaName'];
    this.description = json['description'];
    this.price = json['price'];
    this.imageUrl = json['imageUrl'];
  }
}

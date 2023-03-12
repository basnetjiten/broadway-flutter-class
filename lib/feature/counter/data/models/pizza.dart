/* 
* @Author:Jiten Basnet on 12/03/2023
* @Company: EB Pearls
*/

class Pizza {
  //Member variables
  late int id;
  late double price;
  late String name;

  /// default constructor
  Pizza(this.id, this.price, this.name);

  /// Factory constructor which returns [Pizza] object
  factory Pizza.fromJson(Map<String, dynamic> json) {
    return Pizza(json['id'], json['price'], json['name']);
  }

  static List<Pizza> pizzaList = [
    Pizza(1, 200, 'Pizza 1'),
    Pizza(2, 300, 'Pizza2'),
    Pizza(3, 350, 'Pizza3'),
    Pizza(4, 350, 'Pizza4'),
    Pizza(5, 370, 'Pizza5'),
    Pizza(6, 390, 'Pizza6'),
    Pizza(7, 400, 'Pizza7'),
  ];
}

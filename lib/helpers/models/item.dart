import 'package:albin_abx/helpers/item_request.dart';

class Item {
  final int id;
  final String title;
  final String body;
  final int userId;

  Item(
      {required this.id,
      required this.title,
      required this.body,
      required this.userId});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
        id: json['id'],
        title: json['title'],
        body: json['body'],
        userId: json['userId']);
  }
}

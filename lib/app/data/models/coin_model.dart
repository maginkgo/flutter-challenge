import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class CoinModel extends Equatable {
  CoinModel({
    @required this.id,
    @required this.symbol,
    @required this.name,
    this.image = '',
    this.usdPrice,
  });

  final String id;
  final String symbol;
  final String name;
  final String image;
  final double usdPrice;

  CoinModel copyWith({
    String id,
    String symbol,
    String name,
    String image,
    double usdPrice,
  }) =>
      CoinModel(
        id: id ?? this.id,
        symbol: symbol ?? this.symbol,
        name: name ?? this.name,
        image: image ?? this.image,
        usdPrice: usdPrice ?? this.usdPrice,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "symbol": symbol,
        "name": name,
        "image": image,
        "usdPrice": usdPrice,
      };

  factory CoinModel.fromMap(Map<String, dynamic> json) => CoinModel(
        id: json["id"],
        symbol: json["symbol"].toString().toUpperCase(),
        name: json["name"].toString().toUpperCase(),
        image: json["image"] == null ? null : json["image"],
        usdPrice: json["usdPrice"] == null ? null : json["usdPrice"],
      );

  @override
  List<Object> get props => [id];

  @override
  bool get stringify => true;
}

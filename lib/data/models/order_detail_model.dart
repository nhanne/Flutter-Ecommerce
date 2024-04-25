
class OrderDetailModel{
  final String orderId;
  final int stockId;
  final int quantity;
  final int unitPrice;

  OrderDetailModel({
    required this.orderId,
    required this.stockId,
    required this.quantity,
    required this.unitPrice
  });

  static OrderDetailModel empty() => OrderDetailModel(orderId: '', stockId: 0, quantity: 0, unitPrice: 0);

  Map<String, dynamic> toJson(){
    return {
      'OrderFlutterId': orderId,
      'StockId': stockId,
      'Quantity': quantity,
      'UnitPrice': unitPrice,
    };
  }
}
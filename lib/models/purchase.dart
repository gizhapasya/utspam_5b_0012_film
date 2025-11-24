class Purchase {
  final int? id;
  final int userId;
  final int movieId;
  final String movieTitle;
  final String moviePoster;
  final String movieSchedule;
  final String buyerName;
  final int quantity;
  final String purchaseDate;
  final double totalPrice;
  final String paymentMethod;
  final String? cardNumber;
  final String status;

  Purchase({
    this.id,
    required this.userId,
    required this.movieId,
    required this.movieTitle,
    required this.moviePoster,
    required this.movieSchedule,
    required this.buyerName,
    required this.quantity,
    required this.purchaseDate,
    required this.totalPrice,
    required this.paymentMethod,
    this.cardNumber,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'movieId': movieId,
      'movieTitle': movieTitle,
      'moviePoster': moviePoster,
      'movieSchedule': movieSchedule,
      'buyerName': buyerName,
      'quantity': quantity,
      'purchaseDate': purchaseDate,
      'totalPrice': totalPrice,
      'paymentMethod': paymentMethod,
      'cardNumber': cardNumber,
      'status': status,
    };
  }

  factory Purchase.fromMap(Map<String, dynamic> map) {
    return Purchase(
      id: map['id'],
      userId: map['userId'],
      movieId: map['movieId'],
      movieTitle: map['movieTitle'],
      moviePoster: map['moviePoster'],
      movieSchedule: map['movieSchedule'],
      buyerName: map['buyerName'],
      quantity: map['quantity'],
      purchaseDate: map['purchaseDate'],
      totalPrice: map['totalPrice'],
      paymentMethod: map['paymentMethod'],
      cardNumber: map['cardNumber'],
      status: map['status'],
    );
  }

  Purchase copyWith({
    int? id,
    int? userId,
    int? movieId,
    String? movieTitle,
    String? moviePoster,
    String? movieSchedule,
    String? buyerName,
    int? quantity,
    String? purchaseDate,
    double? totalPrice,
    String? paymentMethod,
    String? cardNumber,
    String? status,
  }) {
    return Purchase(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      movieId: movieId ?? this.movieId,
      movieTitle: movieTitle ?? this.movieTitle,
      moviePoster: moviePoster ?? this.moviePoster,
      movieSchedule: movieSchedule ?? this.movieSchedule,
      buyerName: buyerName ?? this.buyerName,
      quantity: quantity ?? this.quantity,
      purchaseDate: purchaseDate ?? this.purchaseDate,
      totalPrice: totalPrice ?? this.totalPrice,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      cardNumber: cardNumber ?? this.cardNumber,
      status: status ?? this.status,
    );
  }
}

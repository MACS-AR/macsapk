class Invoice {
  final int id;
  final double total;
  final String date;

  Invoice({
    required this.id,
    required this.total,
    required this.date,
  });

  factory Invoice.fromJson(Map<String, dynamic> json) {
    return Invoice(
      id: json['id'],
      total: json['total'].toDouble(),
      date: json['date'],
    );
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';
import '../models/invoice.dart';

const String baseUrl = 'https://example.com/api'; // Replace with your API URL

class ApiService {
  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<List<Invoice>> fetchInvoices() async {
    final response = await http.get(Uri.parse('$baseUrl/invoices'));
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((item) => Invoice.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load invoices');
    }
  }

  Future<void> createInvoice(double total) async {
    final response = await http.post(
      Uri.parse('$baseUrl/create_invoice'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'total': total}),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to create invoice');
    }
  }

  Future<void> updateProductQuantity(int productId, int quantity) async {
    final response = await http.put(
      Uri.parse('$baseUrl/products/$productId'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'quantity': quantity}),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update product quantity');
    }
  }
}

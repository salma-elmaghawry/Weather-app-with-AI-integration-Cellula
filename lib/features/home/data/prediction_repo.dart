import 'dart:convert';
import 'package:http/http.dart' as http;

class PredictionService {
  PredictionService();

  Future<int> getPrediction(List<int> features) async {
    final url = Uri.parse('http://127.0.0.1:5001/predict');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'features': features}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['prediction'][0];
    } else {
      throw Exception('Failed to get prediction');
    }
  }
}

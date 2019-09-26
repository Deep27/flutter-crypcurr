import 'package:http/http.dart' as http;
import 'dart:convert';

import 'currency_data.dart';

class DataLoader {
  static Future<List<CurrencyData>> loadData() async {
    print('Loading data...');
    final Map<String, String> params = {
      'start': '1',
      'limit': '20',
      'convert': 'USD'
    };
    final Uri latestUri = Uri.https(
      'pro-api.coinmarketcap.com',
      '/v1/cryptocurrency/listings/latest',
      params,
    );
    final response = await http.get(
      latestUri,
      headers: {'X-CMC_PRO_API_KEY': '217453be-4d5e-4af0-a0f0-a046e720e188'},
    );
    if (response.statusCode == 200) {
      print(response.body);
      List<dynamic> data =
          (json.decode(response.body) as Map)['data'] as List<dynamic>;
      List<CurrencyData> currenciesData = data.map((m) => CurrencyData(
              name: m['name'],
              cmcRank: m['cmc_rank'],
              symbol: m['symbol'],
              dataQuote: DataQuote(
                name: 'USD',
                price: m['quote']['USD']['price'],
              )))
          .toList();
      return currenciesData;
    }
    return <CurrencyData>[];
  }
}

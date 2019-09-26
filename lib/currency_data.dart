class CurrencyData {
  String name;
  String symbol;
  int cmcRank;
  DataQuote dataQuote;

  CurrencyData({this.name, this.symbol, this.cmcRank, this.dataQuote});
}

class DataQuote {
  String name;
  double price;
  double percentChange1h;
  double percentChange24h;
  double percentChange7d;

  DataQuote(
      {this.name,
        this.price,
        this.percentChange1h,
        this.percentChange24h,
        this.percentChange7d});
}

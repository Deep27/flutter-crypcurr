import 'package:flutter/material.dart';

import 'data_loader.dart';
import 'currency_data.dart';

class CurrenciesList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CurrenciesListState();
}

class CurrenciesListState extends State<CurrenciesList> {

  List<CurrencyData> _currenciesData = [];


  @override
  void initState() {
    super.initState();
    setData();
  }

  void setData() async {
    List<CurrencyData> currenciesData = await DataLoader.loadData();
    setState(() {
      _currenciesData = currenciesData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CC Tracker')),
      body: Container(
        child: ListView(
          children: _buildList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setData(),
        child: Icon(Icons.refresh),
      ),
    );
  }

  List<Widget> _buildList() {
    return _currenciesData
        .map((CurrencyData d) => ListTile(
              title: Text(d.name),
              subtitle: Text(d.symbol),
              leading: CircleAvatar(child: Text(d.cmcRank.toString())),
              trailing: Text('${d.dataQuote.name} ${d.dataQuote.price.toStringAsFixed(3)}'),
            ))
        .toList();
  }
}

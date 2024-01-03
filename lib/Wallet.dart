import 'package:cryptoapp/View/home.dart';
import 'package:flutter/material.dart';

import 'B/SCoin.dart';
import 'coinModel.dart';

class Wallet extends StatefulWidget {
  Wallet({Key? key}) : super(key: key);

  @override
  _WalletState createState() {
    return _WalletState();
  }
}

class _WalletState extends State<Wallet> {

 // List<Coin>? boughtCoins = [];

  @override
  void initState() {
    super.initState();
   // boughtCoins ??= <Coin>[];
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    // Retrieve the boughtCoins list from the route settings
    List<Coin> boughtCoins = ModalRoute.of(context)!.settings.arguments as List<Coin>;



    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto Wallet'),
        backgroundColor: Color(0x6C7093FF),
      ),
      body: Column(
        children: [
          Text("My Cryptos"),

          Expanded(
            child: ListView.builder(
              itemCount: boughtCoins.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage('${boughtCoins[index].image}'),
                  ),
                  title: Text(boughtCoins[index].id),
                  subtitle: Text('${boughtCoins[index].price} - Quantity: ${boughtCoins[index].quantity} ${boughtCoins[index].id }'),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Home(),
                ),
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Color(0x6C7093FF)), // Change to your desired color
            ),
            child: Text(
              "Add more Crypto",
              style: TextStyle(
                color: Colors.white, // Text color
              ),
            ),
          ),
          SizedBox(height: 50,)

        ],
      ),
    );
  }}
//////////////


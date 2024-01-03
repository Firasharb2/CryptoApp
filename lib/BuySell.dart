import 'package:cryptoapp/Wallet.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;





import 'B/SCoin.dart';


class BuySell extends StatefulWidget {
  BuySell({Key? key}) : super(key: key);

  @override
  _BuySellState createState() {
    return _BuySellState();
  }
}

class _BuySellState extends State<BuySell> {
  TextEditingController _Amount = TextEditingController();
  String Error = "";
//  List<Coin>? boughtCoins = [];// i made it nullable
  Future<void> addCoin(Coin coin) async {
    final response = await http.post(
      'https://cryptoappharb.000webhostapp.com/cryptoapp/Wallet.php' as Uri,
      body: {
        'operation': 'add',
        'id': coin.id,
        'image': coin.image,
        'price': coin.price,
        'quantity': coin.quantity.toString(),
      },
    );

    if (response.statusCode == 200) {
      print(response.body); // Output the server response
    } else {
      print('Failed to add coin: ${response.statusCode}');
    }
  }

  Future<void> removeCoin(String coinId) async {
    final response = await http.post(
      'https://cryptoappharb.000webhostapp.com/cryptoapp/Wallet.php' as Uri,
      body: {
        'operation': 'remove',
        'id': coinId,
      },
    );

    if (response.statusCode == 200) {
      print(response.body); // Output the server response
    } else {
      print('Failed to remove coin: ${response.statusCode}');
    }
  }

  Future<List<Coin>> fetchCoins() async {
    final response = await http.get('https://cryptoappharb.000webhostapp.com/cryptoapp/Wallet.php' as Uri);

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      List<Coin> coins = jsonResponse.map((data) => Coin.fromJson(data)).toList();
      return coins;
    } else {
      throw Exception('Failed to load coins');
    }
  }

  @override
  void initState() {
    super.initState();
    boughtCoins ??= <Coin>[]; //
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var settings = ModalRoute.of(context)!.settings;
    var arguments = settings.arguments as Map<String, dynamic>;

    var image = arguments['image'];
    var id = arguments['id'];
    var price = arguments['price'];

    var walletImage = image;
    var walletId = id;
    var walletPrice = price;
    String msg = "";

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage('$image'),
            ),
            SizedBox(width: 8),
            Text('  $price\$'),
          ],
        ),
        centerTitle: true,
        backgroundColor: Color(0x6C7093FF),
      ),
      body: Container(
        color: Colors.blueGrey,
        child: Column(
          children: [
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

        ElevatedButton(
                onPressed: () {
          // Try to parse the input as an integer
          int? buyC = int.tryParse(_Amount.text);

        if (_Amount.text.isEmpty || buyC == null) {
            setState(() {
        msg = "Kindly enter a valid amount to proceed";
                     });
              } else {
                   setState(()  {
                     msg = "";
    // Creating a new Coin instance with the bought coin info
                     Coin boughtCoin = Coin(
                      id: "$walletId",
                      image: "$walletImage",
                      price: "$walletPrice",
                      quantity: buyC.toDouble(),
                                      );

    // Add the bought coin to the list
    //await addCoin(boughtCoin);
    boughtCoins?.add(boughtCoin);
    });

    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => Wallet(),
    settings: RouteSettings(
    arguments: boughtCoins,
    ),
    ),
    );
    }
    },
    style: ButtonStyle(
    minimumSize: MaterialStateProperty.all(Size(200.0, 50.0)),
    backgroundColor: MaterialStateProperty.all(Colors.green),
    foregroundColor: MaterialStateProperty.all(Colors.white),
    ),
    child: Text('Buy'),
    ),

    ElevatedButton(
                  onPressed: () {
                    // Try to parse the input as an integer
                    int? soldC = int.tryParse(_Amount.text);

                    if (_Amount.text.isEmpty || soldC == null) {
                      setState(() {
                        msg = "Kindly enter a valid amount to proceed";
                      });
                    } else {
                      setState(() {
                        msg = "";
                        for (var coin in boughtCoins!) {
                          if (coin.id == walletId && coin.quantity > double.parse(_Amount.text)) {
                            coin.quantity -= double.parse(_Amount.text);
                            if (coin.id == walletId && coin.quantity == double.parse(_Amount.text))
                              boughtCoins?.remove(coin);
                            else {
                              Error = "Operation Failed, Check your wallet again";
                            }
                          }
                        }
                      });

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Wallet(),
                          settings: RouteSettings(
                            arguments: boughtCoins,
                          ),
                        ),
                      );
                    }
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(200.0, 50.0)),
                    backgroundColor: MaterialStateProperty.all(Colors.redAccent),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: Text('Sell '),
                ),
              ],
            ),
            SizedBox(height: 30,),
            Container(
              child: Column(
                children: [
                  Text(
                    'Amount:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0x803857FF),),
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: _Amount,
                    decoration: InputDecoration(
                      labelText: 'Enter Buy/Sell Amount',
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Colors.black45),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0x6C7093FF)),
                      ),
                    ),
                  ),
                  Text("$msg"),
                  Text(
                    "$Error",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}




/*
class BuySell extends StatefulWidget {
  BuySell({Key ?key}) : super(key: key);

  @override
  _BuySellState createState() {
    return _BuySellState();
  }
}

class _BuySellState extends State<BuySell> {
  TextEditingController _Amount = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var settings = ModalRoute.of(context)!.settings;
    var arguments = settings.arguments as Map<String, dynamic>;

    var image = arguments['image'];
    var id = arguments['id'];
    var price = arguments['price'];

    var walletImage=image;
    var walletId=id;
    var walletPrice=price;
    String msg="";
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage('$image'),
            ),
            SizedBox(width: 8), // Add spacing between CircleAvatar and Text
            Text('  $price\$'),
          ],
        ),
        centerTitle: true,
        backgroundColor: Color(0x6C7093FF),
      ),


      body: Container(color: Colors.blueGrey,
        child:Column(

          children: [SizedBox(height: 15,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {

    ///////////////////////////
    if (_Amount.text.isEmpty || _Amount.text == null) {
      setState(() {
        msg="Kindly enter Amount to proceed";
      });

          }

          else{
      int buyC=int.parse(_Amount.text);
    Navigator.push(context, MaterialPageRoute(builder:(context)=>Wallet(),
    settings: RouteSettings(
    arguments: {
    'image': walletImage,
    'id': walletId,
    'price': walletPrice,

    // Add more arguments if needed
    },
    ),
    ));
    } },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(200.0, 50.0)), // Set the width and height
                    backgroundColor: MaterialStateProperty.all(Colors.green), // Background color
                    foregroundColor: MaterialStateProperty.all(Colors.white), // Text color
                  ),
                  child: Text('Buy'),
                ),
                ElevatedButton(
                  onPressed: () {

                    ///////////////////////////
                    if (_Amount.text.isEmpty || _Amount.text == null) {
                      setState(() {
                        msg="Kindly enter Amount to proceed";
                      });


                    }

                    else {
                      int soldC=int.parse(_Amount.text);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Wallet(),
                            settings: RouteSettings(
                              arguments: {
                                'image': walletImage,
                                'id': walletId,
                                'price': walletPrice,

                                // Add more arguments if needed
                              },
                            ),
                          ));


                      //////////////////////
                    } },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(200.0, 50.0)), // Set the width and height
                    backgroundColor: MaterialStateProperty.all(Colors.redAccent), // Background color
                    foregroundColor: MaterialStateProperty.all(Colors.white), // Text color
                  ),
                  child: Text('Sell '),
                ),
              ],
            ),

            SizedBox(height: 30,),
            //container of coin contained in wallet:
            Container(
              child:Column(children: [
                Text(
                  'Amount:',
                  style: TextStyle(fontSize: 20 ,fontWeight: FontWeight.bold,color: Color(
                      0x803857FF),),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: _Amount,
                  decoration: InputDecoration(
                    labelText: 'Enter Buy/Sell Amount',
                    border: OutlineInputBorder(

                    ),
                    labelStyle: TextStyle(color: Colors.black45),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:  Color(0x6C7093FF)),
                    ),
                  ),
                ),

                Text("$msg"),],)

            )
          ],
        ) ,
      ),
    );
  }
}*/
/*import 'package:cryptoapp/Wallet.dart';
import 'package:flutter/material.dart';

import 'B/SCoin.dart';
import 'View/navBar.dart';

class BuySell extends StatefulWidget {
  BuySell({Key? key}) : super(key: key);

  @override
  _BuySellState createState() {
    return _BuySellState();
  }
}

class _BuySellState extends State<BuySell> {
  TextEditingController _Amount = TextEditingController();
 String Error="";
  List<Coin> boughtCoins = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var settings = ModalRoute.of(context)!.settings;
    var arguments = settings.arguments as Map<String, dynamic>;

    var image = arguments['image'];
    var id = arguments['id'];
    var price = arguments['price'];

    var walletImage = image;
    var walletId = id;
    var walletPrice = price;
    String msg = "";

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage('$image'),
            ),
            SizedBox(width: 8), // Add spacing between CircleAvatar and Text
            Text('  $price\$'),
          ],
        ),
        centerTitle: true,
        backgroundColor: Color(0x6C7093FF),
      ),
      body: Container(
        color: Colors.blueGrey,
        child: Column(
          children: [
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Try to parse the input as an integer
                    int? buyC = int.tryParse(_Amount.text);

                    if (_Amount.text.isEmpty || buyC == null) {
                      setState(() {
                        msg = "Kindly enter a valid amount to proceed";
                      });
                    } else {
                      setState(() {

                        msg = "";
                  // Creating a new Coin instance with the bought coin info
                        Coin boughtCoin = Coin(
                          id: "$walletId",
                          image: "$walletImage",
                          price: "$walletPrice",
                          quantity: buyC.toDouble(),
                        );

                        // Add the bought coin to the list
                        boughtCoins.add(boughtCoin);
                      });

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Wallet(),
                         settings: RouteSettings(
                           // Pass the boughtCoins list as arguments
                           arguments: boughtCoins,

                          ),
                        ),
                      );
                    }
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(200.0, 50.0)),
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: Text('Buy'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Try to parse the input as an integer
                    int? soldC = int.tryParse(_Amount.text);

                    if (_Amount.text.isEmpty || soldC == null) {
                      setState(() {
                        msg = "Kindly enter a valid amount to proceed";
                      });
                    } else {
                      setState(() {
                        msg = "";
                        for (var coin in boughtCoins) {
                          if (coin.id==walletId && coin.quantity>double.parse(_Amount.text)) {
                            coin.quantity-=double.parse(_Amount.text);
                            if (coin.id==walletId && coin.quantity==double.parse(_Amount.text))
                               boughtCoins.remove(coin);
                            else {
                              Error="Operation Failed,Chech ur wallet again";

                            /*  Fluttertoast.showToast(
                                msg: "Operation Failed,Chech ur wallet again",
                                toastLength: Toast.LENGTH_SHORT, // Duration for which the toast should be visible
                                gravity: ToastGravity.BOTTOM, // Position of the toast on the screen
                                timeInSecForIosWeb: 1, // Time duration for iOS
                                backgroundColor: Colors.grey, // Background color of the toast
                                textColor: Colors.white, // Text color of the toast
                                fontSize: 16.0, // Font size of the text
                              );*/


                            }

                          }
                       }
                        // i need to check  first if the coin quantity is available
                        // Check if the coin with a specific ID is available in the list
                      /*  bool isCoinAvailable(String coinId) {
                          for (var coin in boughtCoins) {
                            if (coin.id==walletId && coin.quantity>=double.parse(_Amount.text)) {
                              return true;
                            }
                          }
                          return false;
                        }*/

// Check if the quantity of a coin with a specific ID is greater than or equal to 0
                        bool isQuantityValid(String coinId) {
                          for (var coin in boughtCoins) {
                            if (coin.id == coinId) {
                              return coin.quantity >= 0;
                            }
                          }
                          return false;
                        }
                      });

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Wallet(),
                          settings: RouteSettings(
                            arguments: {
                              'image': walletImage,
                              'id': walletId,
                              'price': walletPrice,
                            },
                          ),
                        ),
                      );
                    }
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(200.0, 50.0)),
                    backgroundColor: MaterialStateProperty.all(Colors.redAccent),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: Text('Sell '),
                ),
              ],
            ),
            SizedBox(height: 30,),
            Container(
              child: Column(
                children: [
                  Text(
                    'Amount:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0x803857FF),),
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: _Amount,
                    decoration: InputDecoration(
                      labelText: 'Enter Buy/Sell Amount',
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Colors.black45),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0x6C7093FF)),
                      ),
                    ),
                  ),
                  Text("$msg"),
                  Text("$Error",style:  TextStyle(
                    color: Colors.red,

                  ),),
                  //to delete
                  /*Container(
                    child: ListView.builder(
                      itemCount: boughtCoins.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            //'https://api.coingecko.com/api/v3/coins/'
                            backgroundImage: NetworkImage('${boughtCoins[index].image}'),
                          ),
                          title: Text(boughtCoins[index].id),
                          subtitle: Text('${boughtCoins[index].price} - Quantity: ${boughtCoins[index].quantity} ${boughtCoins[index].id }'),

                        );
                      },
                    ),
                  ),*/
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}
*/
import 'package:cryptoapp/Wallet.dart';
import 'package:flutter/material.dart';
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
import 'package:cryptoapp/Wallet.dart';
import 'package:flutter/material.dart';

class BuySell extends StatefulWidget {
  BuySell({Key? key}) : super(key: key);

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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

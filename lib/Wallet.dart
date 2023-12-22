import 'package:flutter/material.dart';

import 'coinModel.dart';

class Wallet extends StatefulWidget {
  Wallet({Key? key}) : super(key: key);

  @override
  _WalletState createState() {
    return _WalletState();
  }
}

class _WalletState extends State<Wallet> {

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
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;

    var settings = ModalRoute.of(context)!.settings;
    var arguments = settings.arguments as Map<String, dynamic>;

    var image = arguments['image'];
    var id = arguments['id'];
    var price = arguments['price'];
    return Scaffold(
     // body:
    );
   /*
      appBar: AppBar(title: Text("Wallet"),centerTitle: true,),
      body: Container(
        margin: EdgeInsets.all(30),
        child: ListView.builder(itemBuilder: (b,position){
          String u=data[position].uName;
          String p=data[position].uPass;
          return Container(
            width: double.infinity,
            height: 90,
            color: Colors.orangeAccent,
            child: Column(
              children: [
                Row(children: [Icon(Icons.email_outlined,size: 38,),Text(u,style: TextStyle(fontSize: 18,fontWeight:FontWeight.bold ),)],),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text(p,style: TextStyle(fontSize: 18,fontWeight:FontWeight.bold),),IconButton(onPressed: (){setState(() {
                    data.removeAt(position);
                  });},icon: Icon(Icons.remove_circle),)],),
              ],
            ),
          );
        },
          itemCount: data.length,),
      ),
    */

}}



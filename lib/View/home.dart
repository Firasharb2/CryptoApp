import 'package:cryptoapp/coinModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Components/item.dart';
import 'Components/item2.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    getCointMarket();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double myHeight=MediaQuery.of(context).size.height;
    double myWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: myHeight,
        width: myWidth,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end:Alignment.bottomRight,
            colors:[
              Color.fromARGB(255, 253, 225, 112),
              Color(0xffFBC700),
            ]
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding:EdgeInsets.symmetric(
                  vertical: myHeight*0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding:EdgeInsets.symmetric(
                        horizontal: myWidth*0.02,
                        vertical: myHeight*0.005),
                    decoration:
                    BoxDecoration(color: Colors.white.withOpacity(0.5),
                        borderRadius:BorderRadius.circular(5) ),
                    child: const Text("Main portfolio",
                      style:TextStyle(fontSize: 18),

                    ),
                  ),
                  const Text(" Top 10 coins",
                    style:TextStyle(fontSize: 18),
                  ),
                  const Text("Experimental",
                    style:TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: myWidth*0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("\$7048.2",
                    style:TextStyle(fontSize: 35),
                  ),
                  Container(
                    padding:  EdgeInsets.all(myWidth*0.02),
                    height: myHeight*0.05,
                    width: myWidth*0.1,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.5)),
                    child: Image.asset(
                        "assets/openchart.png",
                      ),
                    ),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: myWidth*0.05),
              child: const Row(
                children: [
                  Text(
                    "+120% all time",
                    style:TextStyle(fontSize: 16),),
                ],
              ),
            ),
            SizedBox(
              height: myHeight*0.02,
            ),
            Container(
              height: myHeight*0.7,
              width: myWidth,
              decoration: BoxDecoration(
                boxShadow:
                [
                  BoxShadow(
                blurRadius: 5,
                color: Colors.grey.shade300,
                spreadRadius: 3,
                offset: const Offset(0,3))
                ],
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                )),
              child: Column(
                children: [
                  SizedBox(
                    height: myHeight*0.03,
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: myWidth*0.03),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Assests",
                          style:TextStyle(fontSize: 20),
                        ),
                        Icon(Icons.add)
                      ],
                    ),
                  ),
                   SizedBox(
                     height: myHeight*0.02,
                   ),
                   isRefreshing==true? const Center(
                     child: CircularProgressIndicator(),
                   )
                       //for the first 4 coins:
                       : ListView.builder(
                       itemCount: 4,
                       physics:const NeverScrollableScrollPhysics() ,
                       shrinkWrap: true,
                       itemBuilder: (context,index){
                     return Item(
                       item:cointMarket![index],

                     );
                   }
                   ),
                  SizedBox(
                    height: myHeight*0.02,
                  ),
                   Padding(
                     padding:  EdgeInsets.symmetric(horizontal: myWidth*0.05),
                     child: const Row(
                        children: [
                          Text("Recommended to Buy",
                            style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                   ),
                  SizedBox(
                    height: myHeight*0.01,
                  ),

                  Expanded(
                    child: Padding(
                      padding:  EdgeInsets.only(left: myWidth*0.03),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                          itemCount: cointMarket!.length,
                          itemBuilder:(context,index){
                        return Item2(
                          item:cointMarket![index],
                        );
                      },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: myHeight*0.01,
                  ),
                ]
              ),
            )
          ],
        ) ,
      ),
    );
  }
  bool isRefreshing=true;
  List? cointMarket=[];
  var coinMarketList;
  Future<List<CoinModel>?>getCointMarket() async {
    const url =
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&sparkline=true';
    setState(() {
      isRefreshing=true;
    });
    var response=await http.get(Uri.parse(url),headers: {
    "content-Type": "application/json",
    "Accept":"application/json",
  });
    setState(() {
      isRefreshing=false;
    });
    if (response.statusCode==200) {
      var x = response.body;
      coinMarketList = coinModelFromJson(x);
      setState(() {
        cointMarket = coinMarketList;
      });
    }else{
      print(response.statusCode);
    }
    return null;
  }
}

import 'package:flutter/material.dart';


class SelectCoin extends StatefulWidget {
  var selectItem;

  SelectCoin({super.key, this.selectItem});

  @override
  State<SelectCoin> createState() => _SelectCoinState();
}

class _SelectCoinState extends State<SelectCoin> {


  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return const Scaffold(
        );




  }
}

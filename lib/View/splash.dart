import 'package:cryptoapp/View/navBar.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() {
    return _SplashState();
  }
}

class _SplashState extends State<Splash> {
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
    double myHeight=MediaQuery.of(context).size.height;
    double myWidth=MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
         //i can delete the decoration iza bade reda bayda
          decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end:Alignment.bottomRight,
            colors:[
             //Color.fromARGB(255, 245, 181, 21),
              Color.fromARGB(190, 145, 96, 21),
              Color(0xFFFDE269),Color(0xFFFDE269),
             // Color(0xff71747d),
              Color(0xff71747d),
            //  Color(0xff6D7193),
              Color(0xC5D6841E),
              Color(0xFFBEFD70),


              /*#F0B539
              * #A65A12
              * #CA7B18
              * #D6841E
              * #FDE269*/
            ]
          )
        ),
          height: myHeight,
          width: myWidth,
          child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //i added this container to design this pic
             Container(
                 decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0x000ff700), // Border color
            width: 2.0, // Border width
          ),
          borderRadius: BorderRadius.circular(1.0), // Border radius
        ),
        child: Image.asset('assets/btc.png'), // Replace with your image path
      ),

             const Column(
               children: [
                 Text(
                   "The Future",
                   style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),
                 ),
                 Text("Learn more about Cryptocurrency,look to",
                   style:TextStyle(fontSize: 20,fontWeight: FontWeight.normal,color: Colors.black) ,
                 ),
                 Text("The future in ICTHARB Crypto",
                   style: TextStyle(
                       fontSize: 20,
                       fontWeight: FontWeight.normal,
                       color: Colors.black),
                 ),
               ],
             ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: myWidth*0.14),
              child: GestureDetector(
                onTap: (){
                  // route to another page
                  /*Navigator.of(context).push( MaterialPageRoute(builder:(c){return Navbar()}));*/
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>const NavBar()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xB6C57416),
                    borderRadius: BorderRadius.circular(50)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: myWidth*0.05,vertical:myHeight*0.013),


                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Start Investing", style:TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                       ),
                      ),
                 RotationTransition(turns: AlwaysStoppedAnimation(310/360),
                 child: Icon(Icons.arrow_forward_rounded)) ],
                    ),
                  ),
                ),
              ),
            ),

           ],
              ),
            ),
          ),
        );

  }
}
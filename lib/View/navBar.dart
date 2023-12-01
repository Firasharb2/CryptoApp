import 'package:flutter/material.dart';
import '../anotherPage.dart';
import 'home.dart';
class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() {
    return _NavBarState();
  }
}

class _NavBarState extends State<NavBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
int _currentIndex=0;
  List<Widget>pages=[
   const Home(),
    const Home(),
    AnotherPage(),
    AnotherPage(),
    AnotherPage(),
  ];
  @override
  Widget build(BuildContext context) {
    double myHeight=MediaQuery.of(context).size.height;
    double myWidth=MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,

          body: pages.elementAt(_currentIndex),
          bottomNavigationBar:BottomNavigationBar(
            currentIndex:_currentIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: Colors.white,
            //selectedItemColor: Color(0xffFBC700),
            //unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            onTap: ((value){
              setState(() {
                _currentIndex=value;
              });
            }),
            items: [//items of navbar
              BottomNavigationBarItem(
          icon:Image.asset("assets/homepressed.png",
               height: myHeight*0.03,
               color:Colors.grey,),
              label: "Firas",
              activeIcon:Image.asset("assets/home1.png",
                height: myHeight*0.03,
                color:const Color(0xffFBC700),
              )),

              BottomNavigationBarItem(
                  icon:Image.asset("assets/safa.png",
                    height: myHeight*0.03,
                    ),
                  label: "",
                  activeIcon:Image.asset("assets/safapressed.png",
                    height: myHeight*0.03,
                     )),
              BottomNavigationBarItem(
                  icon:Image.asset("assets/notificationpressed.png",
                    height: myHeight*0.03,
                    color:Colors.grey,),
                  label: "",
                  activeIcon:Image.asset("assets/notification.png",
                    height: myHeight*0.03,
                    color:const Color(0xffFBC700),)),
              BottomNavigationBarItem(
                  icon:Image.asset("assets/walletpressed.png",
                    height: myHeight*0.03,
                    color:Colors.grey,),
                  label: "",
                  activeIcon:Image.asset("assets/wallet.png",
                    height: myHeight*0.03,
                    color:const Color(0xffFBC700),)),
            ],),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
/*
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<String> buttonTitles = ['Trust Wallet', 'PancakeSwap', 'Binance', 'Bybit'];
  final List<String> buttonUrls = [
    'https://trustwallet.com/',
    'https://pancakeswap.finance/',
    'https://www.binance.com/en',
    'https://www.bybit.com/en',
  ];
  final List<String> buttonImages = [
    'assets/trust.png',
    'assets/pancake.png',
    'assets/binance.png',
    'assets/bybit.png',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Choose your exchange'),
          centerTitle: true,
          backgroundColor: Colors.orangeAccent,
        ),
        body: ListView.builder(
          itemCount: buttonTitles.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: ElevatedButton.icon(
                onPressed: () {
                  _launchURL(buttonUrls[index]);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 253, 225, 112),
                  ),
                ),
                icon: Image.asset(
                  buttonImages[index],
                  height: 50, // Adjust the height as needed
                  width: 50,  // Adjust the width as needed
                ),
                label: Text(buttonTitles[index]),
              ),
            );
          },
        ),
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
*/
//Second one:
/*
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<String> buttonTitles = ['Trust Wallet', 'PancakeSwap', 'Binance', 'Bybit'];
  final List<String> buttonUrls = [
    'https://trustwallet.com/',
    'https://pancakeswap.finance/',
    'https://www.binance.com/en',
    'https://www.bybit.com/en',
  ];
  final List<String> buttonImages = [
    'assets/trust.png',
    'assets/pancake.png',
    'assets/binance.png',
    'assets/bybit.png',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Choose your exchange'),
          centerTitle: true,
          backgroundColor: Colors.orangeAccent,
        ),
        body: ListView.builder(
          itemCount: buttonTitles.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WebViewPage(url: buttonUrls[index]),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 253, 225, 112),
                  ),
                ),
                icon: Image.asset(
                  buttonImages[index],
                  height: 50,
                  width: 50,
                ),
                label: Text(buttonTitles[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}

class WebViewPage extends StatelessWidget {
  final String url;

  WebViewPage({required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Web Page'),
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
*/
/* third:
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<String> buttonTitles = ['Trust Wallet', 'PancakeSwap', 'Binance', 'Bybit'];
  final List<String> buttonUrls = [
    'https://trustwallet.com/',
    'https://pancakeswap.finance/',
    'https://www.binance.com/en',
    'https://www.bybit.com/en',
  ];
  final List<String> buttonImages = [
    'assets/trust.png',
    'assets/pancake.png',
    'assets/binance.png',
    'assets/bybit.png',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Choose your exchange'),
          centerTitle: true,
          backgroundColor: Colors.orangeAccent,
        ),
        body: ListView.builder(
          itemCount: buttonTitles.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WebViewPage(url: buttonUrls[index]),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 253, 225, 112),
                  ),
                ),
                icon: Image.asset(
                  buttonImages[index],
                  height: 50,
                  width: 50,
                ),
                label: Text(buttonTitles[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}

class WebViewPage extends StatelessWidget {
  final String url;

  WebViewPage({required this.url});

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        title: Text("title")
      ),
      url: url,
    );
  }
}
*/

/* fourth:
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<String> buttonTitles = ['Trust Wallet', 'PancakeSwap', 'Binance', 'Bybit'];
  final List<String> buttonUrls = [
    'https://trustwallet.com/',
    'https://pancakeswap.finance/',
    'https://www.binance.com/en',
    'https://www.bybit.com/en',
  ];
  final List<String> buttonImages = [
    'assets/trust.png',
    'assets/pancake.png',
    'assets/binance.png',
    'assets/bybit.png',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Choose your exchange'),
          centerTitle: true,
          backgroundColor: Colors.orangeAccent,
        ),
        body: ListView.builder(
          itemCount: buttonTitles.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WebViewPage(url: buttonUrls[index]),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 253, 225, 112),
                  ),
                ),
                icon: Image.asset(
                  buttonImages[index],
                  height: 50,
                  width: 50,
                ),
                label: Text(buttonTitles[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}

class WebViewPage extends StatelessWidget {
  final String url;

  WebViewPage({required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Web Page'),
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<String> buttonTitles = ['Trust Wallet', 'PancakeSwap', 'Binance', 'Bybit'];
  final List<String> buttonUrls = [
    'https://trustwallet.com/',
    'https://pancakeswap.finance/',
    'https://www.binance.com/en',
    'https://www.bybit.com/en',
  ];
  final List<String> buttonImages = [
    'assets/trust.png',
    'assets/pancake.png',
    'assets/binance.png',
    'assets/bybit.png',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Choose your exchange'),
          centerTitle: true,
          backgroundColor: Color(0x6C7093FF),
        ),
        body: Container(
          //decoration:
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end:Alignment.bottomRight,
                  colors:[
                    //Color.fromARGB(255, 245, 181, 21),
                    Color.fromARGB(190, 145, 96, 21),
                    Color(0xFFFDE269),Color(0xFFFDE269),
                     Color(0xff71747d),

                      Color(0xff6D7193),
                    Color(0xC5D6841E), Color(0xff71747d),
                    Color(0xFFBEFD70),


                    /*#F0B539
              * #A65A12
              * #CA7B18
              * #D6841E
              * #FDE269*/
                  ]
              )
          ),
          //
          child: ListView.builder(
            itemCount: buttonTitles.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WebViewPage(url: buttonUrls[index]),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                     // Color.fromARGB(255, 253, 225, 112),
                      Color(0xFF2B2B2C),
                    ),
                  ),
                  icon: Image.asset(
                    buttonImages[index],
                    height: 50,
                    width: 50,
                  ),
                  label: Text(buttonTitles[index]),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class WebViewPage extends StatelessWidget {
  final String url;

  WebViewPage({required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0x6C7093FF),
        title: Text('Web Page'),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse(url)),
      ),
    );
  }
}

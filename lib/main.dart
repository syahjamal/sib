import 'package:sibeton/pages/account.dart';
import 'package:sibeton/pages/cart.dart';
import 'package:sibeton/pages/home.dart';
import 'package:sibeton/pages/orders.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'MaisonNeue',
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedTab = 0;
  final _layout = [Home(), Orders(), Cart(), Account()];

  void _onTabItem(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          height: 35.0,
          child: Image.asset('images/Sibeton-logo.png'),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.grey,
              size: 30.0,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: _layout.elementAt(_selectedTab),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedTab,
        onTap: _onTabItem,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Image.asset('images/home.png', scale: 2.5),
              ),
              icon: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Image.asset('images/home-non.png', scale: 2.5),
              ),
              title: Text("Home")),
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Image.asset('images/orders.png', scale: 2.5),
              ),
              icon: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Image.asset('images/orders-non.png', scale: 2.5),
              ),
              title: Text("Orders")),
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Image.asset('images/cart.png', scale: 2.5),
              ),
              icon: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Image.asset('images/cart-non.png', scale: 2.5),
              ),
              title: Text("Cart")),
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Image.asset('images/account.png', scale: 2.5),
              ),
              icon: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Image.asset('images/account-non.png', scale: 2.5),
              ),
              title: Text("Account")),
        ],
      ),
    );
  }
}

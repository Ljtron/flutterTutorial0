import 'package:flutter/material.dart';

import 'second.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  Widget _buildFoodItem(String imgPath, String foodName, String price) {
    return Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SecondPage(
                      heroTag: imgPath, foodName: foodName, foodPrice: price)));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    child: Row(children: [
                  Hero(
                      tag: imgPath,
                      child: Image(
                          image: NetworkImage(imgPath),
                          fit: BoxFit.cover,
                          height: 75.0,
                          width: 75.0)),
                  SizedBox(width: 10.0),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(foodName, // This is for the name of the food
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold)),
                        Text(price, // This is for the price of the food
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 15.0,
                                color: Colors.grey))
                      ])
                ])),
                IconButton(
                    icon: Icon(Icons.add),
                    color: Colors.black,
                    onPressed: () {})
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Color(0xFF21BFBD),
      body: ListView(primary: false,
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 15.0, left: 10.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                    Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(Icons.filter_list),
                          onPressed: () {},
                          color: Colors.white,
                        ),
                        IconButton(
                          icon: Icon(Icons.menu),
                          onPressed: () {},
                          color: Colors.white,
                        )
                      ],
                    ))
                  ]),
            ),
            SizedBox(height: 25.0),
            Padding(
                padding: EdgeInsets.only(left: 40.0),
                child: Row(
                  children: [
                    Text("Healthy",
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0)),
                    SizedBox(width: 10.0),
                    Text(
                      "Food",
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontSize: 25.0),
                    )
                  ],
                )),
            SizedBox(height: 40.0),
            Container(
              height: MediaQuery.of(context).size.height - 180,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(90))),
              child: ListView(
                  primary: false,
                  padding: EdgeInsets.only(left: 25.0, right: 20.0),
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 45.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height - 300.0,
                        child: ListView(children: [
                          _buildFoodItem(
                              'https://raw.githubusercontent.com/rajayogan/flutterui-curveddesigns/master/assets/plate1.png',
                              'Salmon bowl',
                              '\$24.00'),
                          _buildFoodItem(
                              'https://raw.githubusercontent.com/rajayogan/flutterui-curveddesigns/master/assets/plate2.png',
                              'Spring bowl',
                              '\$22.00'),
                          _buildFoodItem(
                              'https://raw.githubusercontent.com/rajayogan/flutterui-curveddesigns/master/assets/plate6.png',
                              'Avocado bowl',
                              '\$26.00'),
                          _buildFoodItem(
                              'https://raw.githubusercontent.com/rajayogan/flutterui-curveddesigns/master/assets/plate5.png',
                              'Berry bowl',
                              '\$24.00'),
                          _buildFoodItem(
                              'https://raw.githubusercontent.com/rajayogan/flutterui-curveddesigns/master/assets/plate3.png',
                              'Salmon Zing',
                              '\$28.00'),
                          _buildFoodItem(
                              'https://raw.githubusercontent.com/rajayogan/flutterui-curveddesigns/master/assets/plate4.png',
                              'Curry punch',
                              '\$36.00'),
                        ]),
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            height: 65.0,
                            width: 65.0,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey,
                                    style: BorderStyle.solid,
                                    width: 1.0),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Center(
                              child: Icon(Icons.search, color: Colors.black),
                            ),
                          ),
                          Container(
                              height: 65.0,
                              width: 65.0,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey,
                                      style: BorderStyle.solid,
                                      width: 1.0),
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Center(
                                child: Stack(children: [
                                  Center(
                                    child: Icon(Icons.shopping_basket,
                                        color: Colors.black),
                                  ),
                                  Positioned(
                                      bottom: 40.5,
                                      right: 2.5,
                                      child: Container(
                                          child: Text("2",
                                              style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17.0))))
                                ]),
                              )),
                          Container(
                            height: 65.0,
                            width: 150.0,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey,
                                    style: BorderStyle.solid,
                                    width: 1.0),
                                borderRadius: BorderRadius.circular(10.0),
                                color: Color(0xFF1C1428)),
                            child: Center(
                                child: Text('Checkout',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        color: Colors.white,
                                        fontSize: 20.0))),
                          )
                        ])
                  ]),
            )
          ]),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

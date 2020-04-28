import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  String heroTag, foodName, foodPrice;
  SecondPage({this.heroTag, this.foodName, this.foodPrice});

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  int selectedCard = 0;
  int amount = 0, cost=0;

  void selectCard(int data) {
    setState(() {
      selectedCard = data;
    });
  }

  void increment(){
    setState(() {
      amount ++;
    });
  }

  void decrease(){
    setState(() {
      amount --;
    });
  }

  Widget _buildCard(String category, String info, String unit, int duration, int id) {
    return InkWell(
        onTap: () {
          selectCard(id);
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: duration),
          curve: Curves.easeIn,
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: selectedCard == id ? Colors.blueAccent : Colors.transparent,
            borderRadius: BorderRadius.circular(25.0),
            border: Border.all(
                color: selectedCard == id
                    ? Colors.transparent
                    : Colors.grey.withOpacity(0.3),
                style: BorderStyle.solid),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Text(
                    category,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: selectedCard == id ? Colors.white : Colors.black,
                        letterSpacing: 1.5),
                  ),
                ),
                Container(
                  child: Column(children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text(
                        info,
                        style: TextStyle(
                          fontSize: 20,
                          color:
                              selectedCard == id ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      unit,
                      style: TextStyle(
                        fontSize: 13,
                        color: selectedCard == id ? Colors.white : Colors.black,
                      ),
                    ),
                  ]),
                )
              ]),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF7A9BEE),
        appBar: AppBar(
          leading: IconButton(
            color: Colors.white,
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text(
            'Details',
            style: TextStyle(
                fontFamily: 'Montserrat', fontSize: 25.0, color: Colors.white),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () {},
              color: Colors.white,
            )
          ],
        ),
        body: ListView(children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height - 82.0,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
              ),
              Positioned(
                  top: 75.0,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(45),
                            topRight: Radius.circular(45)),
                        color: Colors.white),
                    height: MediaQuery.of(context).size.height - 108.0,
                    width: MediaQuery.of(context).size.width,
                  )),
              Positioned(
                  top: 30.0,
                  left: (MediaQuery.of(context).size.width / 2) - 100,
                  child: Hero(
                      tag: widget.heroTag,
                      child: Container(
                        height: 200.0,
                        width: 200.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(widget.heroTag),
                                fit: BoxFit.cover)),
                      ))),
              Positioned(
                  top: 250.0,
                  right: 25,
                  left: 25,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.foodName,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0),
                        ),
                        SizedBox(height: 20),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                widget.foodPrice,
                                style: TextStyle(
                                    fontFamily: 'Montserrat', fontSize: 25),
                              ),
                              Text(
                                "|",
                                style: TextStyle(
                                  fontSize: 40,
                                  fontFamily: 'Montserrat',
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.blueAccent),
                                child: Row(children: <Widget>[
                                  IconButton(
                                    icon: Icon(Icons.remove),
                                    onPressed: () {
                                      decrease();
                                    },
                                    color: Colors.white,
                                  ),
                                  Text(
                                    amount.toString(),
                                    style: TextStyle(
                                        fontFamily: "Montserrat",
                                        color: Colors.white,
                                        fontSize: 20),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () {
                                      increment();
                                    },
                                    color: Colors.white,
                                  )
                                ]),
                              ),
                            ]),
                        SizedBox(height: 20.0),
                        Container(
                            height: 150,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                _buildCard("Weight", "300", "Q", 1500, 0),
                                SizedBox(width: 15.0),
                                _buildCard("Calories", "267", "CAL", 2000, 1),
                                SizedBox(width: 15.0),
                                _buildCard("VITAMINS", "A, B6", "VIT", 2500, 2),
                                SizedBox(width: 15.0),
                                _buildCard("AVAIL", "NO", "AV", 3000, 3),
                              ],
                            )),
                        SizedBox(height: 35.0),
                        Padding(
                          padding: EdgeInsets.only(bottom: 5.0),
                          child: Container(
                              height: 52,
                              child: Center(
                                child: Text("\$52.00",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Arial",
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  gradient: new LinearGradient(
                                      colors: [Color(0xFF7A9BEE), Colors.blue],
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.bottomRight),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.8),
                                      spreadRadius: 7,
                                      blurRadius: 5,
                                    )
                                  ])),
                        )
                      ]))
            ],
          )
        ]));
  }
}

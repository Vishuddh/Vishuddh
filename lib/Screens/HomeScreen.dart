import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:vishuddh/Screens/more.dart';
import 'package:http/http.dart' as http;

// youtube api key
const apiKey = 'need your own api here';

// url for getting the youtube notifications
// const url =
//     'https://www.googleapis.com/youtube/v3/search?part=snippet&channelId=UCP3jcS24PoNGNtKgE7iABmw&type=video&eventType=live&key=$apiKey';

// new url for getting the notifications
const newUrl =
    'https://www.googleapis.com/youtube/v3/search?part=snippet&channelId=UCt4t-jeY85JegMlZ-E5UWtA&type=video&eventType=live&key=AIzaSyD_78DvsgLsmUVc_-tDoIaIurJbSAgg2K4';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // the property below is used to store the status of the channel
  String status = '';

  

  Future getData() async {
    http.Response response = await http.get(newUrl);

    // the line of code used below is for debugging purpose to see whether we are
    // getting the data or not from the api
    // print(response.body);

    // var decodedData = jsonDecode(response.body);

    // storing the data in a map named decodedData since we are getting a key
    // value pair from the api
    Map<String, dynamic> decodedData = jsonDecode(response.body);

    // the below line of code is used for debugging purpose to print the decoded
    // data
    // print(decodedData);

    // // the property below is used to store the status of the channel
    String currentStatus = '';

    List<dynamic> dataItems = decodedData['items'];

    // the below line of code is for debugging purpose to print the list of
    // data present in the dataItems List
    // print(dataItems);

    var isLive = dataItems[0]['snippet']['liveBroadcastContent'];

    currentStatus = isLive;

    print('the current status is: $currentStatus');

    return currentStatus;
  }

  // // the method below is for printing the current data
  String printData() {
    String liveStatus = status;

    // the below line of code is for debugging purpose to see whether we are getting
    // the current status of the youtube channel or not
    print('The channel is currently: $liveStatus');
    return liveStatus;
  }

  // calling the init method here
  @override
  void initState() {
    super.initState();

    // calling the getData method() here
    getData();

    // calling the printData() method here
    // printData();
  }

  @override
  Widget build(BuildContext context) {
    // calling getData() method here

    // print(currentStatus);
    // getData();

    // printData();
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: new AppBar(
          title: Text("Vishuddh"),
          backgroundColor: Colors.deepOrange,
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountName: Text("Jatin Jain"),
                accountEmail: Text("jatinjain20022001@gmail.com"),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/drawer.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
                currentAccountPicture: GestureDetector(
                  child: CircleAvatar(
                    backgroundColor: Colors.white70,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text("Home Page"),
                  leading: Icon(Icons.home, color: Colors.green),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                    title: Text("Rate this app"),
                    leading: Icon(Icons.star, color: Colors.green)),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text("Settings"),
                  leading: Icon(
                    Icons.settings,
                    color: Colors.green,
                  ),
                ),
              ),
              Divider(),
              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text("About"),
                  leading: Icon(Icons.help, color: Colors.blue),
                ),
              )
            ],
          ),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/more/homescreen.jpg"),
                    fit: BoxFit.fill),
              ),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black.withOpacity(0.4).withAlpha(100),
            )
          ],
        ),
        floatingActionButton: new FloatingActionButton(
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => More())),
            child: Icon(Icons.dashboard),
            backgroundColor: Colors.orange),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        Icons.notifications,
                        color: Colors.blue,
                      ),
                      onPressed: null,),
                  Text(
                    "Notifications",
                    style: TextStyle(color: Colors.orange,),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {},
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage("images/bio.jpg"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Biography",
                    style: TextStyle(color: Colors.orange),
                  )
                ],
              ),
            ],
          ),
          shape: CircularNotchedRectangle(),
        ),
      ),
    );
  }
}

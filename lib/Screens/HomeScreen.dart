import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:vishuddh/Screens/more.dart';
import 'package:http/http.dart' as http;
import 'package:vishuddh/services/app_localizations_delegate.dart';
import 'package:vishuddh/services/language_data.dart';
import 'package:vishuddh/services/languages.dart';
import 'package:vishuddh/services/locale_constants.dart';

// youtube api key
const apiKey = 'need your own api here';

// url for getting the youtube notifications
// const url =
//     'https://www.googleapis.com/youtube/v3/search?part=snippet&channelId=UCP3jcS24PoNGNtKgE7iABmw&type=video&eventType=live&key=$apiKey';

// new url for getting the notifications
const newUrl =
    'https://www.googleapis.com/youtube/v3/search?part=snippet&channelId=UCt4t-jeY85JegMlZ-E5UWtA&type=video&eventType=live&key=AIzaSyD_78DvsgLsmUVc_-tDoIaIurJbSAgg2K4';

class HomePage extends StatefulWidget {
  static void setLocale(BuildContext context, Locale newLocale) {
    var state = context.findAncestorStateOfType<_HomePageState>();
    state.setLocale(newLocale);
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Locale _locale;

  // the function below is used to create a drop down
  // button to chage the language of the app
  DropdownButton createlanguageButtonDropdown() {
    DropdownButton<LanguageData>(
      iconSize: 30,
      hint: Text(Languages.of(context).labelSelectLanguage),
      onChanged: (LanguageData language) {
        changeLanguage(context, language.languageCode);
      },
      items: LanguageData.languageList()
          .map<DropdownMenuItem<LanguageData>>(
            (e) => DropdownMenuItem<LanguageData>(
              value: e,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    e.flag,
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(e.name)
                ],
              ),
            ),
          )
          .toList(),
    );
  }

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() async {
    getLocale().then((locale) {
      setState(() {
        _locale = locale;
      });
    });
    super.didChangeDependencies();
  }

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
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaleFactor: 1.0,
          ),
          child: child,
        );
      },
      locale: _locale,
      supportedLocales: [
        Locale('en', ''),
        Locale('hi', ''),
      ],
      localizationsDelegates: [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale?.languageCode == locale?.languageCode &&
              supportedLocale?.countryCode == locale?.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales?.first;
      },
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: new AppBar(
          title: Text(
            Languages.of(context).appBarName,

            // change the above line of code to visuddh
          ),
          backgroundColor: Colors.deepOrange,
          // need to remove the actions button below
          actions: [
            IconButton(
              icon: Icon(
                Icons.more_vert,
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return createlanguageButtonDropdown();
                    });
              },
            ),
          ],
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
                child: ListTile(
                  title: Text(
                    'Change Language',
                  ),
                  leading: Icon(
                    Icons.language,
                    color: Colors.green,
                  ),
                ),
              ),
              // InkWell(
              //   onTap: () {
              //     createlanguageButtonDropdown();
              //   },
              //   child: ListTile(
              //     title: Text("Home Page"),
              //     leading: Icon(Icons.home, color: Colors.green),
              //   ),
              // ),
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
                    onPressed: null,
                  ),
                  Text(
                    "Notifications",
                    style: TextStyle(
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextButton(
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

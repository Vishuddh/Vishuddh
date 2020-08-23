import 'package:flutter/material.dart';
import 'package:vishuddh/Screens/more.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepOrange
      ),
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
                        fit: BoxFit.fill),
                  ),
                  currentAccountPicture: GestureDetector(
                      child: new CircleAvatar(
                    backgroundColor: Colors.white70,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  )),
                ),
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    title: Text("Home Page"),
                    leading: Icon(
                      Icons.home,color: Colors.green
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    title: Text("Rate this app"),
                    leading: Icon(Icons.star,color: Colors.green
                    )
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    title: Text("Settings"),
                    leading: Icon(
                      Icons.settings,color: Colors.green,
                    ),
                  ),
                ),
                Divider(),
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    title: Text("About"),
                    leading: Icon(
                      Icons.help,color: Colors.blue
                    ),
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
                   image: DecorationImage(image: AssetImage("images/more/homescreen.jpg"),fit: BoxFit.fill)
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
              onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>More())),child: Icon(Icons.dashboard),backgroundColor: Colors.orange),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                     new IconButton(icon: Icon(Icons.notifications,color: Colors.blue,), onPressed: null),
                     Text("Notifications",style: TextStyle(color: Colors.orange),)
                  ],
                ),
                 Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                     FlatButton(onPressed: (){}, child: Container(
                       width: 40,
                       height: 40,
                
                       decoration: BoxDecoration(
                         shape: BoxShape.circle,
                         image: DecorationImage(image: 
                         AssetImage("images/bio.jpg"),
                         fit: BoxFit.fill)
                       ),
                     )),
                     Text("Biography",style: TextStyle(color: Colors.orange),)
                  ],
                ),
                

              ],
            ),
            shape: CircularNotchedRectangle(),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:vishuddh/Screens/ImageScreen.dart';
import 'package:vishuddh/Screens/full_image.dart';

// the code below is for showing the image gallery
class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  // creating a new property here for selected index number
  int selectedIndexNumber = 0;

  // creating a method for doing the functionality when an item is tapped
  void onItemTap(int index) {
    setState(() {
      selectedIndexNumber = index;
    });

    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return Images();
          },
        ),
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return Images();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Gallery"),
            backgroundColor: Colors.deepOrange,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: GestureDetector(
                  // going to the full image screen
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return FullImage(
                            imageName: 'Drawer',
                            imagePath: 'images/drawer.jpg',
                          );
                        },
                      ),
                    );
                  },
                  child: GridTile(
                    child: Container(
                      child: Image.asset(
                        "images/drawer.jpg",
                        height: 100.0,
                      ),
                    ),
                    // footer: Container(
                    //   color: Colors.white,
                    //   child: InkWell(
                    //     onTap: () => Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => Images(),
                    //       ),
                    //     ),
                    //     child: ListTile(
                    //       title: Text("Acharya Shree"),
                    //       leading: Icon(Icons.folder),
                    //     ),
                    //   ),
                    // ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  // going to the full image screen
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return FullImage(
                            imageName: 'Edit',
                            imagePath: 'images/edit.jpg',
                          );
                        },
                      ),
                    );
                  },
                  child: Container(
                    child: Image.asset(
                      "images/edit.jpg",
                      height: 100.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return FullImage(
                            imageName: 'Bio',
                            imagePath: "images/bio.jpg",
                          );
                        },
                      ),
                    );
                  },
                  child: GridTile(
                    child: Container(
                      child: Image.asset(
                        "images/bio.jpg",
                        height: 100.0,
                      ),
                    ),
                    // footer: Container(
                    //   color: Colors.white,
                    //   child: InkWell(
                    //     onTap: () => Navigator.push(context,
                    //         MaterialPageRoute(builder: (context) => Sasangh())),
                    //     child: ListTile(
                    //       title: Text("Sasangh"),
                    //       leading: Icon(Icons.folder),
                    //     ),
                    //   ),
                    // ),
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.folder,
                ),
                label: 'Acharya Shree',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.folder,
                ),
                label: 'Sasangh',
              ),
            ],
            currentIndex: selectedIndexNumber,
            onTap: onItemTap,
            selectedItemColor: Colors.amber[800],
          ),
        ),
      ),
    );
  }
}

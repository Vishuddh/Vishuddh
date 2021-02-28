import 'package:flutter/material.dart';

// the code below is for creating a full size image when an image is tapped
class FullImage extends StatelessWidget {
  // creating a new property here to get the path of the image
  final String imagePath;
  // creating a property to get the name on the app bar according to the name
  // of the image
  final imageName;

  // initializing the above property using dart constructor
  FullImage({
    @required this.imagePath,
    @required this.imageName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: buildAppBar(
          nameOnAppBar: imageName,
        ),
        body: Container(
          child: Image.network(
            // "images/drawer.jpg",

            // using the image path property here
            imagePath,
            height: double.infinity,
            width: double.infinity,
          ),
          // color: Colors.amber,
          // height: double.infinity,
        ),
      ),
    );
  }

  AppBar buildAppBar({String nameOnAppBar}) {
    return AppBar(
      title: Text(
        // 'Drawer',

        // using the nameOnAppBar property here
        nameOnAppBar,
      ),
    );
  }
}

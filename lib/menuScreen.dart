import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class MenuScreen extends StatefulWidget {
  MenuScreen({
    required this.menu,
    required this.indexPage,
  });

  final List menu;
  final int indexPage;

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int indexPage2 = 0;

  @override
  void initState() {
    super.initState();
    indexPage2 = widget.indexPage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.deepOrange),
      ),
      body: Container(
        height: double.infinity,
        color: Colors.black,
        child: Stack(
          children: [
            Center(
              child: PhotoView(
                imageProvider: AssetImage(widget.menu[indexPage2]),
                customSize: Size(320, double.infinity),
                minScale: 0.3,
                maxScale: 0.6,
                initialScale: 0.3,
              ),
            ),
            Center(
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (indexPage2 > 0) {
                          indexPage2--;
                        }
                      });
                    },
                    icon: Icon(Icons.arrow_back),
                    color: Colors.deepOrange,
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (indexPage2 < widget.menu.length - 1) {
                          indexPage2++;
                        }
                      });
                    },
                    icon: Icon(Icons.arrow_forward),
                    color: Colors.deepOrange,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


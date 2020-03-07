import 'package:Matchfox/bracketPage.dart';
import 'package:Matchfox/bracketView.dart';
import 'package:Matchfox/firebase/database.dart';
import 'package:Matchfox/landing.dart';
import 'package:Matchfox/profilePage.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String title = 'Brackets';
  Widget page = BracketPage();

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  var qrText = '';
  QRViewController controller;
  bool isScanned = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              setState(() {
                page = Column(
                  children: <Widget>[
                    Expanded(
                      child: QRView(key: qrKey, onQRViewCreated: _onQRViewCreated)
                    ),
                    
                  ],
                );
                while (qrText == '');
                try {
                  page = BracketPage();
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                    return BracketView(qrText);
                  }));
                } catch (e) {
                  page = BracketPage();
                }
              });
            }
          ),
        ],
      ),
      body: PageStorage(
        child: page,
        bucket: PageStorageBucket(),
      ),
      // bottomNavigationBar: BottomAppBar(
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     children: <Widget>[
      //       IconButton(
      //         icon: Icon(Icons.home),
      //         onPressed: () {
      //           setState(() {
      //             title = 'Home';
      //             page = Landing();
      //           });
      //         }
      //       ),
      //       IconButton(
      //         icon: Icon(Icons.apps),
      //         onPressed: () {
      //           setState(() {
      //             title = 'Brackets';
      //             page = BracketPage();
      //           });
      //         }
      //       ),
      //       IconButton(
      //         icon: Icon(Icons.person),
      //         onPressed: () {
      //           setState(() {
      //             title = 'Profile';
      //             page = ProfilePage();
      //           });
      //         }
      //       ),
      //     ],
      //   ),
      // ),
    );
  }

    void _onQRViewCreated(QRViewController controller) {
    if(!isScanned) {
      this.controller = controller;
      controller.scannedDataStream.listen((scanData) {
        setState(() {
          qrText = scanData;
        });
      });
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
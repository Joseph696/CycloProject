import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScan extends StatefulWidget {
  //const QRScan({super.key});

  @override
  State<QRScan> createState() => _QRScanState();
}

class _QRScanState extends State<QRScan> {
  bool _flashon = false;
  bool _frontCam = false;
  GlobalKey _qrkey = GlobalKey();
  late QRViewController _controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('QR Code Scan'),
      ),
      body: Stack(
        children: <Widget>[
          QRView(
              key: _qrkey,
              overlay: QrScannerOverlayShape(borderColor: Colors.purple),
              onQRViewCreated: (QRViewController controller) {
                this._controller = controller;
              }),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: 60),
              child: Text(
                'Scanner',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ButtonBar(
              alignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        _flashon = !_flashon;
                      });
                      _controller.toggleFlash();
                    },
                    icon: Icon(
                      _flashon ? Icons.flash_on : Icons.flash_off,
                      color: Colors.white,
                    )),
                IconButton.filled(
                    onPressed: () {
                      setState(() {
                        _frontCam = !_frontCam;
                      });
                    },
                    icon: Icon(
                      _frontCam ? Icons.camera_front : Icons.camera_rear,
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close,
                      color: Colors.red,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

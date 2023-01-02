import 'dart:io';
import 'package:flutter/material.dart';
import 'package:moon_walker/custom_classes/AllColors.dart';
import 'package:moon_walker/custom_classes/AllDimension.dart';
import 'package:moon_walker/routes/RoutesGetters.dart';
import 'package:moon_walker/view/GlobalWidgets/GlobalMain.dart';
import 'package:moon_walker/view/GlobalWidgets/GlobalToolbar.dart';
import 'package:moon_walker/view_model/FilterListViewModel.dart';
import 'package:moon_walker/view_model/ProductDetailsViewModel.dart';
import 'package:moon_walker/view_model/ProductViewModel.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:get/get.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {

  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return GlobalMain.globalMainWidget(
        Stack(
          children: <Widget>[

            GlobalToolbar.backToolbar("Scan",context),

            Container(
              margin: EdgeInsets.only(top: AllDimension.fortyEight),
              child: Column(
                children: <Widget>[

                  Expanded(flex: 6, child: _buildQrView(context)),


                  Container(
                    margin: const EdgeInsets.all(8),
                    child: ElevatedButton(
                        onPressed: () async {
                          await controller?.resumeCamera();
                        },
                        child: Icon(Icons.camera,
                          size: AllDimension.fourty,)
                    ),
                  )

                ],
              ),
            ),

          ],
        )
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 450 ||
        MediaQuery.of(context).size.height < 450)
        ? 200.0
        : 350.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {

    final filterViewModel = Get.put(FilterListViewModel());
    final productViewModel = Get.put(ProductViewModel());
    final productDetailViewModel = Get.put(ProductDetailsViewModel());

    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        if(result !=null){

          String input = "${result!.code}";

          List<String> pairs = input.split("&");

          //https://www.qr-code-generator.com/
          // create qr code like   productId=78&color=Yellow&color_code=#000000
          Map<String, String> values = {};

          for (String pair in pairs) {
            List<String> keyValue = pair.split("=");
            String key = keyValue[0];
            String value = keyValue[1];
            values[key] = value;
          }
          if(values.isNotEmpty){
            controller.stopCamera();
            controller.pauseCamera();
            controller.dispose();

            Get.back();
            productDetailViewModel.selectedColor(1);
            productViewModel.selectedColor(values['color']!);
            productViewModel.getProductDetailsVm(int.parse(values['productId']!),values['color']!);
            Get.toNamed(RoutesGetters.getProductDetailRoute());

          }
        }
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
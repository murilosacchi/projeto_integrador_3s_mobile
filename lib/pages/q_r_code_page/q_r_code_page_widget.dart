import 'package:mobile_scanner/mobile_scanner.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'q_r_code_page_model.dart';
export 'q_r_code_page_model.dart';
import '/main.dart';

void _navigateToConsulta(BuildContext context) {
  pageNotifier.value = 'ConsultaPage';
}

class QRCodePageWidget extends StatefulWidget {
  const QRCodePageWidget({super.key});

  @override
  State<QRCodePageWidget> createState() => _QRCodePageWidgetState();
}

class _QRCodePageWidgetState extends State<QRCodePageWidget> {
  late QRCodePageModel _model;
  String? qrCodeData;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QRCodePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Color(0xFF001489),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.qr_code_2_sharp,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () {
              print('IconButton pressed ...');
            },
          ),
          title: Text(
            'QR Code',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Inter Tight',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              MobileScanner(
                onDetect: (barcodeCapture) {
                  final barcode = barcodeCapture.barcodes.first;
                  setState(() {
                    qrCodeData = barcode.rawValue;
                    print(qrCodeData);
                    if(qrCodeData!.contains('qrcode://open/')){
                    _navigateToConsulta(context);
                    context.goNamed(
                    'Detalhes_ExtintorPage',
                    queryParameters: {
                   'id': qrCodeData!.split('/').last,
                    },
    );
                    }
                   // Access scanned data here
                  });
                },
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromRGBO(255, 255, 255, 0.40),
                          width: 4),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 10),
                        Icon(Icons.qr_code,
                            color: Color.fromRGBO(255, 255, 255, 0.40),
                            size: 100),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

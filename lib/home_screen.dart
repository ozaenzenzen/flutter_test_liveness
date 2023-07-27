import 'dart:convert';

import 'package:camera/camera.dart';
// import 'package:face_sdk/ui/screen/liveness_screen.dart';
// import 'package:face_sdk/ui/widget/oval_clip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_liveness/camera_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qoin_saas_liveness/qoin_saas_liveness.dart';

class HomeScreen extends StatefulWidget {
  final int motionCount;
  final Function(String)? onSuccess;
  final Function(String)? onFailed;

  const HomeScreen({
    super.key,
    required this.motionCount,
    this.onSuccess,
    this.onFailed,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CameraController? cameraController;
  bool faceFound = false;
  List<List<dynamic>>? selectedMotion;
  int motionProgress = 0;

  String? dataOcr;

  String? dataGambar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Flutter Test Liveness",
          style: GoogleFonts.mukta(),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              (dataGambar != null)
                  ? Container(
                      height: 100,
                      width: 100,
                      color: Colors.blue,
                      child: Image.memory(
                        base64Decode(dataGambar!),
                      ),
                    )
                  : const SizedBox(),
              (dataOcr != null)
                  ? Text(
                      "dataOcr $dataOcr",
                    )
                  : const SizedBox(),
              Text(
                "Flutter Test Liveness",
                style: GoogleFonts.mukta(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const QoinSaasOCRCameraMLKitVer();
                            // return CameraScreenTest();
                            // return Test2Widget();
                            // return const CameraScreen(
                            //   testMode: false,
                            // );
                          },
                        ),
                      );
                    },
                    child: Text(
                      "Test OCR 0",
                      style: GoogleFonts.mukta(),
                    ),
                  ),
                  const SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        dataOcr = null;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            // return const QoinSaasOCRCamera();
                            return QoinSaasOCRCamera(
                              // actionAfterTakePicture: (base64Image, textValueInsideImage) {
                              //   return Container(
                              //     height: MediaQuery.of(context).size.height,
                              //     width: MediaQuery.of(context).size.width,
                              //     color: Colors.white,
                              //     child: Column(
                              //       children: [
                              //         Image.asset(
                              //           base64Image,
                              //           height: 150,
                              //           width: 150,
                              //         ),
                              //         const SizedBox(height: 30),
                              //         Text(
                              //           textValueInsideImage,
                              //         ),
                              //       ],
                              //     ),
                              //   );
                              // },
                              getDataString: (String data) {
                                setState(() {
                                  dataOcr = data;
                                });
                              },
                              // captureButton: Container(
                              //   height: 30,
                              //   width: 30,
                              //   color: Colors.blue,
                              // ),
                            );
                            // return Test2Widget();
                            // return const CameraScreen(
                            //   testMode: false,
                            // );
                          },
                        ),
                      );
                    },
                    child: Text(
                      "Test OCR",
                      style: GoogleFonts.mukta(),
                    ),
                  ),
                  const SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: () {
                      dataGambar = null;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const CameraScreen(
                              testMode: true,
                              // gambar: (String gambar) {
                              //   setState(() {
                              //     dataGambar = gambar;
                              //   });
                              // },
                            );
                            // return const QoinSaasOCRCamera();
                            // return const TextRecognizerView();
                          },
                        ),
                      );
                    },
                    child: Text(
                      "Test Liveness (FR)",
                      style: GoogleFonts.mukta(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

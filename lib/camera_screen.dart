import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qoin_saas_liveness/qoin_saas_liveness.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? cameraController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Flutter Test Liveness Camera",
          style: GoogleFonts.mukta(),
        ),
      ),
      // body: const QoinSaasLivenessCamera(),
      body: QoinSaasLivenessCamera(
        onControllerCreated: (controller) {
          cameraController = controller;
        },
        child: const OvalClip(),
        onOpenMouthDetected: (face) {
          debugPrint("onOpenMouthDetected");
        },
        onNodDetected: (face) {
          debugPrint("onNodDetected");
        },
        onBlinkDetected: (face) {
          debugPrint("onBlinkDetected");
        },
        onFaceDetected: (face) {
          debugPrint("onFaceDetected");
        },
        onFaceLoss: () {
          debugPrint("onFaceLoss");
        },
        // onMultipleFaceDetected: () {
        //   debugPrint("onMultipleFaceDetected");
        // },
      ),
    );
  }
}

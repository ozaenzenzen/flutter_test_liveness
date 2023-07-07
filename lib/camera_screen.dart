import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qoin_saas_liveness/qoin_saas_liveness.dart';

class CameraScreen extends StatefulWidget {
  final bool testMode;

  const CameraScreen({
    this.testMode = false,
    super.key,
  });

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  String currentAction = "notyet";
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
      body: (widget.testMode)
          ? Stack(
              children: [
                QoinSaasLivenessCamera(
                  onControllerCreated: (controller) {
                    cameraController = controller;
                  },
                  child: const OvalClip(),
                  onOpenMouthDetected: (face) {
                    setState(() {
                      currentAction = 'onOpenMouthDetected';
                    });
                    debugPrint("onOpenMouthDetected");
                  },
                  onNodDetected: (face) {
                    setState(() {
                      currentAction = 'onNodDetected';
                    });
                    debugPrint("onNodDetected");
                  },
                  onBlinkDetected: (face) {
                    setState(() {
                      currentAction = 'onBlinkDetected';
                    });
                    debugPrint("onBlinkDetected");
                  },
                  onFaceDetected: (face) {
                    debugPrint("onFaceDetected");
                  },
                  onFaceLoss: () {
                    setState(() {
                      currentAction = 'onFaceLoss';
                    });
                    debugPrint("onFaceLoss");
                  },
                  // onMultipleFaceDetected: () {
                  //   debugPrint("onMultipleFaceDetected");
                  // },
                ),
                Center(
                  child: Container(
                    color: Colors.black,
                    child: Text(
                      // "Flutter Test Liveness Camera",
                      currentAction,
                      style: GoogleFonts.mukta(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
              ],
            )
          : QoinSaasLivenessCamera(
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

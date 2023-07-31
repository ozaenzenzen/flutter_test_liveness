import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qoin_saas_liveness/qoin_saas_liveness.dart';

class CameraOCRScreen extends StatefulWidget {
  final bool testMode;
  const CameraOCRScreen({
    super.key,
    this.testMode = false,
  });

  @override
  State<CameraOCRScreen> createState() => _CameraOCRScreenState();
}

class _CameraOCRScreenState extends State<CameraOCRScreen> {
  CameraController? cameraController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.testMode ? "Flutter Test OCR Camera Test Mode" :"Flutter Test OCR Camera",
          style: GoogleFonts.mukta(),
        ),
      ),
      body: (widget.testMode)
          ? Stack(
              children: [
                QoinSaasOCRCamera(
                  captureButton: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 64,
                          height: 64,
                          alignment: Alignment.bottomCenter,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Container(
                              margin: const EdgeInsets.all(6.81),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(0xFF6F6F6F),
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                  onControllerCreated: (controller) {
                    cameraController = controller;
                  },
                  onTakePict: (String base64Image) {
                    debugPrint('data base64Image $base64Image');
                  },
                  onTextDetected: (RecognizedText recognizedText) {
                    debugPrint('data recognizedText ${recognizedText.text}');
                  },
                ),
              ],
            )
          : Stack(
              children: [
                QoinSaasOCRCamera(
                  onControllerCreated: (controller) {
                    cameraController = controller;
                  },
                  onTakePict: (String base64Image) {
                    debugPrint('data base64Image $base64Image');
                  },
                  onTextDetected: (RecognizedText recognizedText) {
                    debugPrint('data recognizedText ${recognizedText.text}');
                  },
                ),
              ],
            ),
    );
  }
}

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
                            return const CameraScreen(
                              testMode: false,
                            );
                          },
                        ),
                      );
                    },
                    child: Text(
                      "Test Liveness",
                      style: GoogleFonts.mukta(),
                    ),
                  ),
                  const SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const CameraScreen(
                              testMode: true,
                            );
                          },
                        ),
                      );
                    },
                    child: Text(
                      "Test Liveness (test mode)",
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

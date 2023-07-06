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
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const CameraScreen();
                        // return QoinSaasLivenessCamera(
                        //   onControllerCreated: (controller) {
                        //     cameraController = controller;
                        //   },
                        //   child: const OvalClip(),
                        //   onOpenMouthDetected: (face) {
                        //     debugPrint("onOpenMouthDetected");
                        //   },
                        //   onNodDetected: (face) {
                        //     debugPrint("onNodDetected");
                        //   },
                        //   onBlinkDetected: (face) {
                        //     debugPrint("onBlinkDetected");
                        //   },
                        //   onFaceDetected: (face) {
                        //     debugPrint("onFaceDetected");
                        //   },
                        //   onFaceLoss: () {
                        //     debugPrint("onFaceLoss");
                        //   },
                        //   // onMultipleFaceDetected: () {
                        //   //   debugPrint("onMultipleFaceDetected");
                        //   // },
                        // );

                        // return const FaceDetectorView();

                        // return const LivenessScreen();

                        // return QoinSaasLivenessCamera(
                        //   onControllerCreated: (controller) {
                        //     cameraController = controller;
                        //   },
                        //   child: OvalClip(),
                        //   onOpenMouthDetected: (face) {
                        //     debugPrint("onOpenMouthDetected");
                        //   },
                        //   onNodDetected: (face) {
                        //     debugPrint("onNodDetected");
                        //   },
                        //   onBlinkDetected: (face) {
                        //     debugPrint("onBlinkDetected");
                        //   },
                        //   onFaceDetected: (face) {
                        //     debugPrint("onFaceDetected");
                        //   },
                        //   onFaceLoss: () {
                        //     debugPrint("onFaceLoss");
                        //   },
                        //   onMultipleFaceDetected: () {
                        //     debugPrint("onMultipleFaceDetected");
                        //   },
                        //   onResult: (image, result) async {
                        //     debugPrint("onResult");
                        //     // List<Face> faceResult = result;
                        //     // bool isPassed = false;
                        //     // if (faceResult.isEmpty && faceFound) {
                        //     //   debugPrint("Face Lost");
                        //     // } else if (faceResult.length > 1) {
                        //     //   debugPrint("Multiple Face Detected");
                        //     // } else if (faceResult.isNotEmpty) {
                        //     //   faceFound = true;
                        //     //   setState(() {});
                        //     //   //same face checker
                        //     //   // var valid = await validateFace();
                        //     //   // if (valid != null) {
                        //     //   //   fail(valid);
                        //     //   //   return;
                        //     //   // }
                        //     //   if (selectedMotion![motionProgress][0] != MotionType.TakePict) {
                        //     //     isPassed = motionCheck(faceResult.last);
                        //     //   }
                        //     // }
                        //     // if (isPassed) {
                        //     //   if (motionProgress < widget.motionCount) {
                        //     //     motionProgress++;
                        //     //   } else {
                        //     //     Navigator.pop(context);
                        //     //   }
                        //     // }

                        //     // setState(() {});
                        //   },
                        // );
                      },
                    ),
                  );

                  // showDialog(
                  //   context: context,
                  //   builder: (context) {
                  //     return Dialog(
                  //       child: Container(
                  //         padding: const EdgeInsets.all(16),
                  //         color: Colors.white,
                  //         width: MediaQuery.of(context).size.width * 0.7,
                  //         child: Column(
                  //           mainAxisSize: MainAxisSize.min,
                  //           children: const [
                  //             Text("Title"),
                  //             Text("Subtitle"),
                  //           ],
                  //         ),
                  //       ),
                  //     );
                  //   },
                  // );
                },
                child: Text(
                  "Test Liveness",
                  style: GoogleFonts.mukta(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Offset? highestY(List<Offset> offsets) {
  //   Offset? max;
  //   for (var element in offsets) {
  //     if (max == null) {
  //       max = element;
  //     } else if (max.dy < element.dy) {
  //       max = element;
  //     }
  //   }
  //   return max;
  // }

  // Offset? lowestY(List<Offset> offsets) {
  //   Offset? min;
  //   for (var element in offsets) {
  //     if (min == null) {
  //       min = element;
  //     } else if (min.dy > element.dy) {
  //       min = element;
  //     }
  //   }
  //   return min;
  // }

  // bool motionCheck(Face face) {
  //   bool isPassed = false;

  //   //blink checker
  //   if (face.leftEyeOpenProbability! < 0.1 && face.rightEyeOpenProbability! < 0.1) {
  //     if (selectedMotion![motionProgress][0] == MotionType.Blink) {
  //       isPassed = true;
  //     }
  //   }

  //   //open mouth checker
  //   List<Offset>? upperLipBottom = face.getContour(FaceContourType.upperLipBottom)?.positionsList;
  //   List<Offset>? lowerLipTop = face.getContour(FaceContourType.lowerLipTop)?.positionsList;
  //   var openMouthProbablity = highestY(upperLipBottom!)!.dy - lowestY(lowerLipTop!)!.dy < -10 ? true : false;
  //   if (openMouthProbablity) {
  //     if (selectedMotion![motionProgress][0] == MotionType.OpenMouth) {
  //       isPassed = true;
  //     } else {
  //       debugPrint("Wrong movement");
  //     }
  //   }

  //   //nod checker
  //   var headEulerAngleY = face.headEulerAngleY!;
  //   if (headEulerAngleY > 20 || headEulerAngleY < -20) {
  //     if (selectedMotion![motionProgress][0] == MotionType.ShakeHead) {
  //       isPassed = true;
  //     } else {
  //       debugPrint("Wrong movement");
  //     }
  //   }
  //   return isPassed;
  // }
}

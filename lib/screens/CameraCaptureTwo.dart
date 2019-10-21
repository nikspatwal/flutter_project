import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'package:vinnoba/screens/DisplayPictureScreen.dart';

class CameraCaptureTwo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CameraCaptureTwoState();
  }
}

class CameraCaptureTwoState extends State<CameraCaptureTwo> {
  CameraController camController;
  Future<void> initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    initiate();
  }

  initiate() async {
    final cameras = await availableCameras();
    final firstCam = cameras.first;
    camController = CameraController(firstCam, ResolutionPreset.medium);
    initializeControllerFuture = camController.initialize();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    camController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Say CHEESE!!..."),
        ),
        body: FutureBuilder<void>(
            future: initializeControllerFuture,
            builder: (context, snapshot) {
              print(snapshot);
              print('The string is    ${snapshot.connectionState}');
              if (snapshot.connectionState == ConnectionState.done)  {
                return  CameraPreview(camController);
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.camera_alt),
            onPressed: () async {
              try {
                await initializeControllerFuture;

                final imagePath = join((await getTemporaryDirectory()).path,
                    '${DateTime.now()}.png');

                await camController.takePicture(imagePath);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DisplayPictureScreen(imagePath)),
                );
              } catch (e) {
                print(e);
              }
            }));
  }
}

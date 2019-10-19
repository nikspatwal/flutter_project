import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'package:vinnoba/screens/DisplayPictureScreen.dart';

class CameraCaptureTwo extends StatefulWidget {
  @override
  State<StatefulWidget> createState(
      ) {
    // TODO: implement createState
    return CameraCaptureTwoState( );
  }
}

class CameraCaptureTwoState extends State<CameraCaptureTwo> {
  CameraController camController;
  Future<void> initializeControllerFuture;
  List<CameraDescription> cameras;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    camController = CameraController(
      // Get a specific camera from the list of available cameras.
      cameras[0],
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    initializeControllerFuture = camController.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    camController.dispose();
    super.dispose();
  }

  selectCam() async {
    cameras = await availableCameras();}

  @override
  Widget build(
      BuildContext context
      ) {

     selectCam();
    return Scaffold(
        appBar: AppBar(
          title: Text( "Say CHEESE!!..." ) , ) ,


        body: FutureBuilder<void>(
            future: initializeControllerFuture ,
            builder: (
                context ,snapshot
                ) {
              if(snapshot.connectionState == ConnectionState.done){
                return CameraPreview( camController );
              }
              else {
                return Center(
                  child: CircularProgressIndicator( ) ,
                );
              }
            }
        ) ,


        floatingActionButton: FloatingActionButton(
            child: Icon( Icons.camera_alt ) ,
            onPressed: (
                ) async {
              selectCam( );

              try {
                await initializeControllerFuture;

                final imagePath = join(
                    (await getTemporaryDirectory( )).path ,
                    '${DateTime.now( )}.png' );

                await camController.takePicture(imagePath);

                Navigator.push(
                    context, MaterialPageRoute(
                  builder: (context)=> DisplayPictureScreen(imagePath)),);
              }
              catch(e){

                print(e);
              }
            }

        )

    );
  }


}




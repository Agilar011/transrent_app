import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:camera/camera.dart';
import 'form_view.dart';
import 'package:image/image.dart' as img;

class ScanView extends StatefulWidget {
  const ScanView({Key? key}) : super(key: key);

  @override
  _ScanViewState createState() => _ScanViewState();
}

class _ScanViewState extends State<ScanView> {
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;

  File? _image;
  final picker = ImagePicker();

  Future<void> processImage() async {
    // Read image from file
    img.Image? image = img.decodeImage(File(_image!.path).readAsBytesSync());

    if (image != null) {
      // Convert image to grayscale
      image = img.grayscale(image);

      // Increase contrast by 20%
      image = img.adjustColor(image, contrast: 50);

      image = img.adjustColor(image, brightness: 50);

      // Save the processed image
      File(_image!.path).writeAsBytesSync(img.encodeJpg(image));
    }
  }

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        processImage();
        recognizeText();
      } else {
        // Use a logging framework instead of print
        debugPrint('No image selected.');
      }
    });
  }

  Future<String> recognizeText() async {
    final inputImage = InputImage.fromFile(_image!);
    final textRecognizer = GoogleMlKit.vision.textRecognizer();
    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);

    return recognizedText.text;
  }

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    _controller = CameraController(
      firstCamera,
      ResolutionPreset.medium,
    );

    _initializeControllerFuture = _controller?.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
      _controller?.startImageStream((image) => null); // Start the camera stream
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Container 1 - Camera Preview
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 600,
              width: 450,
              child: FutureBuilder<void>(
                future: _initializeControllerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    // Make sure _controller is initialized before using it
                    return _controller != null
                        ? AspectRatio(
                            aspectRatio: _controller!.value.aspectRatio,
                            child: CameraPreview(_controller!),
                          )
                        : Container();
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ),

          Container(
            // Container 2 - Header
            height: 130.0,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              margin: const EdgeInsets.only(top: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                          child: const Icon(
                            Icons.chevron_left,
                            color: Colors.black,
                            size: 20.0,
                          ),
                        ),
                        const SizedBox(width: 15.0),
                        const Text(
                          'Scan KTP',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Container 3 - Align Bottom Center
          Positioned(
            bottom: 45.0,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        await _initializeControllerFuture;

                        final image = await _controller?.takePicture();

                        // Process the image with text recognition
                        _image = File(image!.path);
                        final recognizedText = await recognizeText();

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FormPage(
                              ocrResult: recognizedText,
                            ),
                          ),
                        );
                      } catch (e) {
                        print(e);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: const CircleBorder(),
                      side: const BorderSide(color: Colors.white, width: 2.0),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(25.0),
                      child: Icon(
                        FontAwesomeIcons.camera,
                        color: Colors.black,
                        size: 30.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  const Text(
                    'Or',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  Container(
                    width: 370.0,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () async {
                        await getImage();
                        final recognizedText = await recognizeText();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FormPage(
                              ocrResult: recognizedText,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      child: const Text(
                        'Upload KTP',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          fontFamily: 'Poppins ',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

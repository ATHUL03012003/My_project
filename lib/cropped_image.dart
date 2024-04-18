// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_cropper/image_cropper.dart';

// class CroppedImage extends StatefulWidget {
//   final CroppedFile image;
//   const CroppedImage({super.key, required this.image});

//   @override
//   State<CroppedImage> createState() => _CroppedImageState();
// }

// class _CroppedImageState extends State<CroppedImage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Cropped Image'),
//         centerTitle: true,
//         backgroundColor: Color.fromARGB(246, 120, 121, 120),
//         foregroundColor: Colors.white,
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(5),
//           child: InteractiveViewer(
//               child: Image(
//             image: FileImage(
//               File(widget.image.path),
//             ),
//           )),
//         ),
//       ),
//     );
//   }
// }
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

// Define a new page where you want to navigate
class PredictionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prediction Page'),
      ),
      body: Center(
        child: Text('Your prediction content goes here'),
      ),
    );
  }
}

class CroppedImage extends StatefulWidget {
  final CroppedFile image;
  const CroppedImage({Key? key, required this.image}) : super(key: key);

  @override
  State<CroppedImage> createState() => _CroppedImageState();
}

class _CroppedImageState extends State<CroppedImage> {
  // Method to navigate to the prediction page
  void _navigateToPredictionPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PredictionPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prediction Image'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(246, 120, 121, 120),
        foregroundColor: Colors.white,
        actions: [
          // Add Predict button to the AppBar
          IconButton(
            icon: Icon(Icons.play_arrow), // Changed the icon to play_arrow
            onPressed: () {
              _navigateToPredictionPage(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: InteractiveViewer(
                  child: Image(
                    image: FileImage(
                      File(widget.image.path),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.grey),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      Icon(Icons.remove_red_eye),
                      Spacer(),
                      Text(
                        'Predict Images',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

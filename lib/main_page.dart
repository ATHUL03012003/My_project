import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_cropperapp/cropped_image.dart';
import 'package:image_picker/image_picker.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  void pickImage(bool pickGalleryImage) async {
    XFile? image;
    final picker = ImagePicker();

    if (pickGalleryImage == true) {
      image = await picker.pickImage(source: ImageSource.gallery);
    } else {
      image = await picker.pickImage(source: ImageSource.camera);
    }

    if (image != null) {
      final croppedImage = await cropImages(image);

      if (!mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: ((context) => CroppedImage(
                image: croppedImage,
              )),
        ),
      );
    }
  }

  Future<CroppedFile> cropImages(XFile image) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: image.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
      ],
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop Image',
          toolbarColor: Color.fromARGB(246, 120, 121, 120),
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(
          title: 'Crop Image',
        ),
      ],
    );

    return croppedFile!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eye-Doc'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(246, 120, 121, 120),
        foregroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      body: Center(
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            Image(image: AssetImage('assets/eyedoclogo.png')),
            // MaterialButton(
            //   color: const Color.fromARGB(255, 34, 126, 255),
            //   textColor: Colors.white,
            //   padding: const EdgeInsets.all(35),
            //   onPressed: () {
            //     pickImage(true);
            //   },
            
            //   child: const Text('Pick Gallery Images'),
            // ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('''Instructions here :
1. Update OS, camera app for security.
2. Upload better quality images for better prediction results
3. Supported image file formats: jpeg,png'''),
                    action: SnackBarAction(
                      label: 'OK',
                      onPressed: () {
                        pickImage(true);
                      },
                    ),
                  ),
                );
              },
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
                      Icon(Icons.upload),
                      Spacer(),
                      Text(
                        'Upload A Photo',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('''Instructions here :
1. Update OS, camera app for security.
2. Avoid background lighting, as well as the use of flash
3. Distance range between camera and eye : 30-50 cm
4. Capture the images in a well lit environmet'''),
                    action: SnackBarAction(
                      label: 'OK',
                      onPressed: () {
                        pickImage(false);
                      },
                    ),
                  ),
                );
              },
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
                      Icon(Icons.camera),
                      Spacer(),
                      Text(
                        'Capture Images',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // MaterialButton(
            //   color: const Color.fromARGB(255, 27, 162, 220),
            //   textColor: Colors.white,
            //   padding: const EdgeInsets.all(20),
            //   onPressed: () {
            //     pickImage(false);
            //   },
            //   child: const Text('Capture Camera Images'),
            // ),
          ],
        ),
      ),
    );
  }
}

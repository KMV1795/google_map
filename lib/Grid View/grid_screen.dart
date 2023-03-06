import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageGridScreen extends StatefulWidget {
  const ImageGridScreen({super.key});

  @override
  ImageGridScreenState createState() => ImageGridScreenState();
}

class ImageGridScreenState extends State<ImageGridScreen> {

  final List<File> _imageList = [];

  /* Get Image From Gallery */

  Future<void> _getImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      _imageList.add(File(image.path));
    }
    setState(() {});
  }

  /* Get Image From Camera */
  Future<void> _getImageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      _imageList.add(File(image.path));
    }
    setState(() {});
  }


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        elevation: 2,
        title: const Text(
          'Image Grid View',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: _getImageFromGallery, icon: const Icon(Icons.add_box)),
        ],
      ),
      body: GridView.builder(
        itemCount: _imageList.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 4,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
            ),
            child: Image.file(
              _imageList[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: _getImageFromCamera,
        tooltip: 'Take a Photo',
        child: const Icon(
          Icons.camera_alt,
          color: Colors.black,
        ),
      ),
    );
  }
}

import 'dart:io';

// import 'package:bd1/login.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:bd1/confirm.dart';

class UnelgeePage extends StatefulWidget {
  @override
  _UnelgeePageState createState() => _UnelgeePageState();
}

class _UnelgeePageState extends State<UnelgeePage> {
  XFile? _image;

  Future getImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      print('image $image');
      if (image == null) return;

      setState(() {
        _image = image;
      });
    } catch (e) {
      print('get image error $e');
    }
  }

  void uploadImage() {
    // Implement your upload image logic here
    // You can use _image variable to get the selected image
    // For example, you can use http package to send the image file to your server
    if (_image != null) {
      // Perform your image upload logic here
      print('Uploading image...');
      // Example: You can use http package to send the image file to your server
      // http.post('your-upload-url', body: {'image': _image!.path});
    } else {
      print('No image selected.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Үнэлгээ хийх'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image == null
                ? Text('No image selected.')
                : Container(
                    height: 200,
                    width: 200,
                    child: Image.file(
                      File(_image!.path),
                      fit: BoxFit.cover,
                    ),
                  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: getImage,
                  child: Text('Зураг сонгох'),
                ),
                SizedBox(width: 10), // Adding some space between the buttons
                ElevatedButton(
                  onPressed: _image == null ? null : uploadImage,
                  child: Text('Бүртгэх'),
                ),
              ],
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.all(10.0),
                color: Color.fromARGB(255, 216, 216, 216),
                width: 300.0,
                height: 288.0,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Тээврийн хэрэгслийн нэр',
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Он',
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Төрөл',
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Боломжит үнийн санал',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15.0),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => ConfirmPage()),
                );
              },
              child: const Text(
                "Дараагийн",
                style: TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

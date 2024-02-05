import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class PictureUploader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Picture'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _uploadPicture(context);
          },
          child: Text('Upload Picture'),
        ),
      ),
    );
  }

  Future<void> _uploadPicture(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    if (pickedFile != null) {
      final File file = File(pickedFile.path);

      // Prepare the request
      var uri = Uri.parse('http://localhost/project/location/uploadphoto.php');
      var request = http.MultipartRequest('POST', uri);
      request.files.add(
        http.MultipartFile(
          'image',
          file.readAsBytes().asStream(),
          file.lengthSync(),
          filename: file.path.split('/').last,
        ),
      );

      // Send the request
      var response = await request.send();

      if (response.statusCode == 200) {
        // Picture uploaded successfully
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Picture uploaded successfully'),
        ));
      } else {
        // Error uploading picture
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error uploading picture'),
        ));
      }
    }
  }
}

class PictureViewer extends StatefulWidget {
  @override
  _PictureViewerState createState() => _PictureViewerState();
}

class _PictureViewerState extends State<PictureViewer> {
  List<PictureInfo> pictures = [];

  @override
  void initState() {
    super.initState();
    _fetchPictures();
  }

  Future<void> _fetchPictures() async {
    final response = await http.get(Uri.parse('http://localhost/project/location/get.php'));

    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      setState(() {
        pictures = list.map((model) => PictureInfo.fromJson(model)).toList();
      });
    } else {
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pictures'),
      ),
      body: ListView.builder(
        itemCount: pictures.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(pictures[index].path),
            subtitle: Text(
              'Latitude: ${pictures[index].latitude}, Longitude: ${pictures[index].longitude}',
            ),
            leading: Image.network('http://localhost/${pictures[index].path}'),
          );
        },
      ),
    );
  }
}

class PictureInfo {
  final String path;
  final double latitude;
  final double longitude;

  PictureInfo({required this.path, required this.latitude, required this.longitude});

  factory PictureInfo.fromJson(Map<String, dynamic> json) {
    return PictureInfo(
      path: json['path'],
      latitude: double.parse(json['latitude']),
      longitude: double.parse(json['longitude']),
    );
  }
}

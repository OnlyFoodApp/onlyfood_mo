import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:onlyfood_mo/models/post.dart';
import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http_parser/http_parser.dart';

import 'package:async/async.dart';

class CreatePostScreen extends StatefulWidget {
  final Function()? onPostSuccess;

  const CreatePostScreen({Key? key, this.onPostSuccess}) : super(key: key);

  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  String? _imagePath;

  String? userId;

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  @override
  void initState() {
    super.initState();

    getAccountId();
  }

  Future<void> getAccountId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accountId = prefs.getString('accountId');
    setState(() {
      userId = accountId;
    });
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imagePath = pickedFile.path;
      });
    }
  }

  Future<Post> createPost(
    String title,
    String content,
    String accountId,
    int displayIndex,
    int isDeleted,
    int isEdited,
    String imagePath,
  ) async {
    try {
      // Create a multipart request
      var request = http.MultipartRequest(
        'POST',
        Uri.parse("https://onlyfoods.azurewebsites.net/api/v1/posts"),
      );

      // Attach image file to the request
      var file = await http.MultipartFile.fromPath(
        'file',
        imagePath,
        contentType: MediaType('image', 'jpeg'),
      );
      request.files.add(file);

      // Add other fields to the request
      request.fields['Title'] = title;
      request.fields['Content'] = content;
      request.fields['AccountID'] = accountId;
      request.fields['DisplayIndex'] = displayIndex.toString();
      request.fields['IsDeleted'] = isDeleted.toString();
      request.fields['IsEdited'] = isEdited.toString();

      // Open a stream to read the image file
      var stream =
          http.ByteStream(DelegatingStream.typed(File(imagePath).openRead()));
      var length = await File(imagePath).length();

      // Add the stream as a file to the request
      var fileStream = http.ByteStream(stream);
      var fileLength = length;
      var fileName = path.basename(imagePath);
      request.files.add(http.MultipartFile(
        'ImageLogo',
        fileStream,
        fileLength,
        filename: fileName,
        contentType: MediaType('image', 'jpeg'),
      ));

      // Send the request
      var response = await request.send();

      // Check the response
      if (response.statusCode == 200) {
        print("oke nè");

        return Post.fromJson(
            json.decode(await response.stream.bytesToString()));
      } else {
        throw Exception('Failed to post!!!');
      }
    } catch (e) {
      print('Error occurred: $e');
      throw Exception('Error occurred: $e');
    }
  }

  Future<void> submitPost() async {
    if (_imagePath == null ||
        titleController.text.isEmpty ||
        contentController.text.isEmpty ||
        userId == null) {
      return;
    }

    try {
      await createPost(
        titleController.text,
        contentController.text,
        userId!,
        0,
        0,
        0,
        _imagePath!,
      );
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Post Successful'),
            content: const Text('Your post has been added successfully.'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                  Navigator.of(context).pop(); // Navigate back to NewFeedScreen
                  widget.onPostSuccess?.call(); // Call the callback
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } catch (e) {
      print('Error submitting post: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Thực hiện các hành động khi nhấn nút back
            Navigator.of(context).pop();
          },
        ),
        title: const Text('New Post', style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: const Text(
                "Create an new post!",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ),
            InkWell(
              onTap: _pickImage,
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.black,
                  ),
                  borderRadius:
                      BorderRadius.circular(10), // Set the border radius
                ),
                child: (_imagePath != null)
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(
                            10), // Match the border radius here
                        child: Image.file(
                          File(_imagePath!),
                          fit: BoxFit.cover,
                        ),
                      )
                    : const Icon(
                        Icons.photo,
                        size: 50,
                        color: Colors.black,
                      ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: titleController,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: 'Title',
                labelText: 'Title',
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Colors.grey), // Default border color
                  borderRadius:
                      BorderRadius.circular(10), // Optional: Border radius
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.black), // Focused border color
                ),
                labelStyle:
                    const TextStyle(color: Colors.black), // Label (Title) color
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: contentController,
              style: TextStyle(color: Colors.black),
              maxLines: 2,
              decoration: InputDecoration(
                hintText: 'Content',
                labelText: 'Content',
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Colors.grey), // Default border color
                  borderRadius:
                      BorderRadius.circular(10), // Optional: Border radius
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.black), // Focused border color
                ),
                labelStyle: const TextStyle(
                    color: Colors.black), // Label (Content) color
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: submitPost,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
              child:
                  const Text('Submit', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

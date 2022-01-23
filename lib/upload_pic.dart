import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ImageUpload extends StatefulWidget {
  final String? userId;
  const ImageUpload({Key? key, this.userId}) : super(key: key);

  get snapshotEvents => null;

  @override
  State<ImageUpload> createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  File? _image;
  final imagePicker = ImagePicker();
  String? downloadURL;

  // picking the image

  Future imagePickerMethod(ImageSource source) async {
    final pick = await imagePicker.pickImage(source: source);
    setState(() {
      if (pick != null) {
        _image = File(pick.path);
      } else {
        showSnackBar("No File selected", Duration(milliseconds: 400));
      }
    });
  }

  // uploading the image to firebase cloudstore

  Future uploadImage(File _image) async {
    final imgId = DateTime.now().millisecondsSinceEpoch.toString();
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    Reference reference = FirebaseStorage.instance
        .ref()
        .child('${widget.userId}/images')
        .child("post_$imgId");

    await reference.putFile(_image);


    downloadURL = await reference.getDownloadURL();

    // cloud firestore
    await firebaseFirestore
        .collection("users")
        .doc(widget.userId)
        .collection("images")
        .add({'downloadURL': downloadURL}).whenComplete(
            () => showSnackBar("Image Uploaded", Duration(seconds: 2)));

      setState(() {});

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(15),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: SizedBox(
                    height: 650,
                    width: double.infinity,
                    child: Column(children: [
                      const  Text(
                        'Image Picker',
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold
                        )
                    ),
                      const SizedBox(
                        height: 30,
                      ),
                      Expanded(
                        flex: 4,
                        child: Container(
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.blueAccent),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // the image that we wanted to upload
                                Expanded(
                                    child: _image == null
                                        ? const Center(
                                        child: Text("No image selected"))
                                        : Image.file(_image!)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      FlatButton(
                        onPressed: () => {imagePickerMethod(ImageSource.gallery)},
                        color: Colors.indigo[100],
                        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                        minWidth: MediaQuery.of(context).size.width,
                        child: Row( // Replace with a Row for horizontal icon + text
                          children: <Widget>[
                            Icon(Icons.image_outlined),
                            const SizedBox(width: 12,),
                            Text("Pick Gellery",style: TextStyle(fontSize: 20),),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      FlatButton(
                        onPressed: () => {imagePickerMethod(ImageSource.camera)},
                        color: Colors.indigo[100],
                        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                        minWidth: MediaQuery.of(context).size.width,
                        child: Row( // Replace with a Row for horizontal icon + text
                          children: <Widget>[
                            Icon(Icons.camera_alt_outlined),
                            const SizedBox(width: 12,),
                            Text("Pick Camera",style: TextStyle(fontSize: 20),),
                          ],
                        ),
                      ),

                      /*ElevatedButton(
                          onPressed: () {
                            imagePickerMethod();
                          },
                          child: const Text("Select Image")),

                       */
                      const SizedBox(height: 50),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.indigo[600],
                          ),
                          onPressed: () {
                            if (_image != null) {
                              uploadImage(_image!);
                            } else {
                              showSnackBar("Select Image first",
                                  Duration(milliseconds: 400));
                            }
                          },
                          child: const Text("Upload Image"),
                      ),
                      const SizedBox(height: 24),
                      imagePicker != null ? buildUploadStatus(imagePicker) : Container(),

                    ]
                    )
                )
            )
        ),
      ),
    );
  }

  // show snack bar

  showSnackBar(String snackText, Duration d) {
    final snackBar = SnackBar(content: Text(snackText), duration: d);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget buildUploadStatus(ImagePicker task) => StreamBuilder<TaskSnapshot>(
   // stream: task.snapshotEvents,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        final snap = snapshot.data!;
        final progress = snap.bytesTransferred / snap.totalBytes;
        final percentage = (progress * 100).toStringAsFixed(2);

        return Text(
          '$percentage %',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      );
      } else {
        return Container();
      }
    },
  );
}
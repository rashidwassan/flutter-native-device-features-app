import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;

class ImageInput extends StatefulWidget {
  const ImageInput({Key? key}) : super(key: key);

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;

  Future<void> _takePicture() async {
    final picker = ImagePicker();
    final imageFile =
        await picker.pickImage(source: ImageSource.camera, maxWidth: 600);

    setState(() {
      _storedImage = File(imageFile!.path);
    });

    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final String fileName = path.basename(imageFile!.path);
    final savedImage = await _storedImage!.copy('${appDir.path}/$fileName');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 150,
          height: 100,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey),
              borderRadius: BorderRadius.circular(6)),
          child: (_storedImage != null)
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.file(
                    _storedImage!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                )
              : const Text(
                  'No Image Taken',
                  textAlign: TextAlign.center,
                ),
          alignment: Alignment.center,
        ),
        const SizedBox(
          width: 12,
        ),
        Expanded(
            child: ElevatedButton.icon(
          onPressed: () {
            _takePicture();
          },
          label: const Text('Take Picture'),
          icon: const Icon(Icons.camera),
        )),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({Key? key}) : super(key: key);

  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImageUrl;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(
            width: 1,
            color: Colors.grey,
          )),
          child: _previewImageUrl == null
              ? const Center(
                  child: Text(
                    'No location chosen',
                    textAlign: TextAlign.center,
                  ),
                )
              : Image.network(
                  _previewImageUrl!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.location_on),
              label: const Text('Current Location'),
              style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(
                      TextStyle(color: Theme.of(context).primaryColor))),
            ),
            const SizedBox(
              width: 12,
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.map),
              label: const Text('Select on Map'),
              style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(
                      TextStyle(color: Theme.of(context).primaryColor))),
            )
          ],
        )
      ],
    );
  }
}

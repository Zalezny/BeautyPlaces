import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class NewPlaceDialog extends StatefulWidget {
  const NewPlaceDialog({super.key});

  @override
  State<NewPlaceDialog> createState() => _NewPlaceDialogState();
}

class _NewPlaceDialogState extends State<NewPlaceDialog> {
  final _formKey = GlobalKey<FormState>();

  final LatLng _currentLatLng = const LatLng(50.1545, 19.0118);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close)),
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'New Place',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text('Add a new place to the map'),
              ),
              TextFormField(
                maxLines: 1,
                decoration: const InputDecoration(
                  hintText: 'Title',
                ),
                validator: _validator,
              ),
              TextFormField(
                maxLines: 1,
                decoration: const InputDecoration(
                  hintText: 'Description',
                ),
                validator: _validator,
              ),
              TextFormField(
                maxLines: 1,
                decoration: const InputDecoration(
                  hintText: 'Image URL',
                ),
                validator: _validator,
              ),
              const SizedBox(height: 25),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Pick location',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 300,
                child: FlutterMap(
                  options: MapOptions(
                    initialCenter: _currentLatLng,
                    initialZoom: 6.2,
                    onTap: (tapPosition, point) {},
                    onPositionChanged: (mapPosition, hasGesture) {},
                  ),
                  children: [
                    TileLayer(
                      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.app',
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState != null && _formKey.currentState!.validate()) {}
                  // Navigator.pop(context);
                },
                child: const Text('Add Place'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a value';
    }
    return null;
  }
}

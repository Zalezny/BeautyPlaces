import 'package:beauty_places/bloc/cubit/map_cubit.dart';
import 'package:beauty_places/data/models/place_model.dart';
import 'package:beauty_places/enums/category_enum.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class NewPlaceDialog extends StatefulWidget {
  const NewPlaceDialog({super.key});

  @override
  State<NewPlaceDialog> createState() => _NewPlaceDialogState();
}

class _NewPlaceDialogState extends State<NewPlaceDialog> {
  final _formKey = GlobalKey<FormState>();

  LatLng _currentLatLng = const LatLng(50.1545, 19.0118);
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _imageUrlController = TextEditingController();
  CategoryEnum? _categoryEnum;

  final Map<CategoryEnum, String> _categoryEnumToString = {
    CategoryEnum.lake: 'Jezioro',
    CategoryEnum.cities: 'Miasto',
    CategoryEnum.nationalParks: 'Park Narodowy',
    CategoryEnum.picks: 'Szczyt',
    CategoryEnum.places: 'Miejsce atrakcji',
    CategoryEnum.riversAndCanals: 'Rzeki i Kanały',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
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
                controller: _titleController,
                maxLines: 1,
                decoration: const InputDecoration(
                  hintText: 'Title',
                ),
                validator: _validator,
              ),
              TextFormField(
                controller: _descriptionController,
                maxLines: 1,
                decoration: const InputDecoration(
                  hintText: 'Description',
                ),
                validator: _validator,
              ),
              TextFormField(
                controller: _imageUrlController,
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
                    onTap: (tapPosition, point) {
                      setState(() {
                        _currentLatLng = point;
                      });
                    },
                    onPositionChanged: (mapPosition, hasGesture) {},
                  ),
                  children: [
                    TileLayer(
                      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.app',
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          height: 48,
                          width: 48,
                          alignment: Alignment.topCenter,
                          point: _currentLatLng,
                          child: const Icon(
                            Icons.location_on,
                            size: 48,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              DropdownMenu(
                label: const Text('Kategoria'),
                onSelected: (value) {
                  _categoryEnum = value;
                },
                dropdownMenuEntries: CategoryEnum.values.map((e) {
                  return DropdownMenuEntry(
                    value: e,
                    label: _categoryEnumToString[e] ?? 'Nieznany',
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState != null && _formKey.currentState!.validate() && _categoryEnum != null) {
                    final place = PlaceModel(
                      title: _titleController.text,
                      description: _descriptionController.text,
                      imageUrl: _imageUrlController.text,
                      location: GeoPoint(_currentLatLng.latitude, _currentLatLng.longitude),
                      category: _categoryEnum!,
                    );
                    context.read<MapCubit>().writePlace(place, (id) {
                      Navigator.pop(context);
                      
                    });
                  }
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

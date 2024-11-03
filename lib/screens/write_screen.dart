import 'package:beauty_places/bloc/cubit/write_cubit.dart';
import 'package:beauty_places/data/firestore/write_repository.dart';
import 'package:beauty_places/data/models/place_model.dart';
import 'package:beauty_places/enums/category_enum.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../services/injection.dart';

class WriteScreen extends StatefulWidget {
  const WriteScreen({super.key});

  @override
  State<WriteScreen> createState() => _WriteScreenState();
}

class _WriteScreenState extends State<WriteScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _imgUrlController = TextEditingController();
  final _locationLatitudeController = TextEditingController();
  final _locationLongtitudeController = TextEditingController();
  final _writeCubit = WriteCubit(getIt<WriteRepository>());
  CategoryEnum? _categoryEnum;
  final ftoast = FToast();

  @override
  void initState() {
    super.initState();
    ftoast.init(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _imgUrlController.dispose();
    _locationLatitudeController.dispose();
    _locationLongtitudeController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  label: Text('Tytuł'),
                ),
              ),
              SizedBox(
                height: 200,
                child: TextField(
                  controller: _descriptionController,
                  expands: true,
                  decoration: const InputDecoration(
                    label: Text('Opis'),
                  ),
                  maxLines: null,
                ),
              ),
              TextField(
                controller: _imgUrlController,
                decoration: const InputDecoration(
                  label: Text('link do zdjęcia'),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _locationLatitudeController,
                      decoration: const InputDecoration(
                        label: Text('Lokalizacja lat'),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextField(
                      controller: _locationLongtitudeController,
                      decoration: const InputDecoration(
                        label: Text('Lokalizacja lot'),
                      ),
                    ),
                  ),
                ],
              ),
              DropdownMenu(
                onSelected: (value) {
                  _categoryEnum = value;
                },
                dropdownMenuEntries: CategoryEnum.values.map((e) {
                  return DropdownMenuEntry(
                    value: e,
                    label: e.toString(),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 60,
                width: 200,
                child: ElevatedButton(
                  onPressed: () async {
                    final model = PlaceModel(
                      title: _titleController.text,
                      description: _descriptionController.text,
                      imageUrl: _imgUrlController.text,
                      location: GeoPoint(
                        double.parse(_locationLatitudeController.text),
                        double.parse(_locationLongtitudeController.text),
                      ),
                      category: _categoryEnum!,
                      comments: [],
                    );

                    _writeCubit.sendModel(model).then((value) {
                      _categoryEnum = null;
                      _titleController.clear();
                      _descriptionController.clear();
                      _imgUrlController.clear();
                      _locationLatitudeController.clear();
                      _locationLongtitudeController.clear();

                      ftoast.showToast(child: const Text('Dodano nowe miejsce!'));
                    });
                  },
                  child: const Text('Dodaj'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

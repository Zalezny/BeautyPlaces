import 'package:flutter/material.dart';

class NewPlaceDialog extends StatelessWidget {
  NewPlaceDialog({super.key});

  final _formKey = GlobalKey<FormState>();

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
              TextFormField(
                maxLines: 1,
                decoration: const InputDecoration(
                  hintText: 'Latitude',
                ),
                validator: _validator,
              ),
              TextFormField(
                maxLines: 1,
                decoration: const InputDecoration(
                  hintText: 'Longitude',
                ),
                validator: _validator,
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

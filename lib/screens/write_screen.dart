import 'package:flutter/material.dart';

class WriteScreen extends StatelessWidget {
  const WriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              const TextField(
                decoration: InputDecoration(
                  label: Text('Tytuł'),
                ),
              ),
              const SizedBox(
                height: 200,
                child: TextField(
                  expands: true,
                  decoration: InputDecoration(
                    label: Text('Opis'),
                  ),
                  maxLines: null,
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  label: Text('link do zdjęcia'),
                ),
              ),
              const Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        label: Text('Lokalizacja lat'),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        label: Text('Lokalizacja lot'),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 60,
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    
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

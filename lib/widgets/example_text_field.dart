import 'package:flutter/material.dart';

import 'images_widget.dart';

// // Example TextField

class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  final myTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // const imageTree = AppImages.tree;
    // const imageSun = AppImages.sun;
    return ListView(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: myTextController.clear,
                    child: const Text('Clear')),
                const SizedBox(height: 30),
                TextField(
                  controller: myTextController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const Image(
                  image: AppImages.tree,
                ),
                const SizedBox(height: 30),
                const Image(image: AppImages.funSun),
                const SizedBox(height: 30),
                const Image(image: AppImages.shishki)
              ],
            ),
          ),
        ),
      ],
    );
  }
}

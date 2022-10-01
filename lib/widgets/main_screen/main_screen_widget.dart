import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:themoviedb/widgets/images_widget.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Example(),
    // Text(
    //   'Index 0: Home'),
    Text(
      'Index 1: Films',
    ),
    Text(
      'Index 2: Serials',
    ),
  ];

  void onSelectedTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TMDB'),
      ),
      body: Center(
        child: _widgetOptions[_selectedTab],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_outlined),
            label: 'Films',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: 'Serials',
          ),
        ],
        onTap: onSelectedTab,
      ),
    );
  }
}

// Example TextField

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

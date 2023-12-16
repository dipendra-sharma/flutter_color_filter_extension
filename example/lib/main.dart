import 'package:flutter/material.dart';
import 'package:color_filter_extension/color_filter_extension.dart';

void main() async {
  runApp(MaterialApp(
    title: 'ColorFilterExt Example',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
      useMaterial3: true,
    ),
    home: const FilterPage(),
  ));
}

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ColorFilter Extensions'),
      ),
      body: Center(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5, mainAxisSpacing: 1, crossAxisSpacing: 1),
          padding: const EdgeInsets.all(1),
          itemBuilder: (context, position) => ColorFiltered(
            colorFilter: ColorFilterExt.preset(presetFiltersList[position]),
            child: Image.asset(
              'assets/sample.jpg',
              fit: BoxFit.cover,
            ),
          ),
          itemCount: presetFiltersList.length,
        ),
      ),
    );
  }
}

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
        title: Text(
            'Color Filter Extension (${presetFiltersList.length} presets)'),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MediaQuery.of(context).size.width > 600 ? 6 : 4,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
          childAspectRatio: 0.8,
        ),
        padding: const EdgeInsets.all(8),
        itemBuilder: (context, position) {
          final preset = presetFiltersList[position];
          return Card(
            elevation: 2,
            child: Column(
              children: [
                Expanded(
                  child: ColorFiltered(
                    colorFilter: ColorFilterExt.preset(preset).colorFilter,
                    child: Image.asset(
                      'assets/sample.jpg',
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    preset.name,
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: presetFiltersList.length,
      ),
    );
  }
}

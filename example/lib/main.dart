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
  int _selectedIndex = 0;

  // Categorized filter lists
  final List<Map<String, dynamic>> filterCategories = [
    {
      'title': 'All Presets',
      'filters': presetFiltersList,
    },
    {
      'title': 'Film Emulation',
      'filters': [
        ColorFiltersPreset.kodakPortra400(),
        ColorFiltersPreset.kodakEktar100(),
        ColorFiltersPreset.kodakGold200(),
        ColorFiltersPreset.kodakTriX400(),
        ColorFiltersPreset.fujiVelvia50(),
        ColorFiltersPreset.fujiProvia100(),
        ColorFiltersPreset.fujiAstia100(),
        ColorFiltersPreset.fujiSuperia400(),
        ColorFiltersPreset.fujiAcros100(),
        ColorFiltersPreset.ilfordHP5(),
        ColorFiltersPreset.ilfordDelta3200(),
        ColorFiltersPreset.ilfordPanF50(),
        ColorFiltersPreset.polaroid600(),
        ColorFiltersPreset.polaroidSX70(),
        ColorFiltersPreset.impossibleProject(),
      ],
    },
    {
      'title': 'Cinema Looks',
      'filters': [
        ColorFiltersPreset.cinematic(),
        ColorFiltersPreset.blockbuster(),
        ColorFiltersPreset.matrixGreen(),
        ColorFiltersPreset.madMaxOrange(),
        ColorFiltersPreset.bladeRunner2049(),
        ColorFiltersPreset.moonlight(),
        ColorFiltersPreset.joker(),
        ColorFiltersPreset.wesAnderson(),
        ColorFiltersPreset.marvel(),
        ColorFiltersPreset.dcDark(),
      ],
    },
    {
      'title': 'Seasonal & Moods',
      'filters': [
        ColorFiltersPreset.spring(),
        ColorFiltersPreset.summer(),
        ColorFiltersPreset.autumn(),
        ColorFiltersPreset.winter(),
        ColorFiltersPreset.sunrise(),
        ColorFiltersPreset.sunset(),
        ColorFiltersPreset.twilight(),
        ColorFiltersPreset.cheerful(),
        ColorFiltersPreset.dramatic(),
        ColorFiltersPreset.romantic(),
        ColorFiltersPreset.mysterious(),
        ColorFiltersPreset.calm(),
      ],
    },
    {
      'title': 'Custom Filters',
      'filters': [], // Will be populated with individual filter examples
    },
  ];

  @override
  void initState() {
    super.initState();
    // Add some individual filter examples to the Custom Filters category
    filterCategories[4]['filters'] = [
      {'name': 'Hue Rotation 45°', 'filter': ColorFilterExt.hueRotation(45)},
      {'name': 'Vintage Warm', 'filter': ColorFilterExt.vintage(0.7, 0.5)},
      {'name': 'Cyberpunk', 'filter': ColorFilterExt.cyberpunk()},
      {'name': 'Film Noir', 'filter': ColorFilterExt.noir()},
      {'name': 'Pop Art', 'filter': ColorFilterExt.popArt()},
      {'name': 'Golden Hour', 'filter': ColorFilterExt.goldenHour()},
      {'name': 'Blue Hour', 'filter': ColorFilterExt.blueHour()},
      {'name': 'Infrared', 'filter': ColorFilterExt.infrared()},
      {'name': 'Night Vision', 'filter': ColorFilterExt.nightVision()},
      {'name': 'Thermal', 'filter': ColorFilterExt.thermal()},
      {'name': 'Cross Process', 'filter': ColorFilterExt.crossProcess()},
      {'name': 'Duotone B&O', 'filter': ColorFilterExt.duotone(Colors.blue, Colors.orange)},
    ];
  }

  @override
  Widget build(BuildContext context) {
    final currentCategory = filterCategories[_selectedIndex];
    final filters = currentCategory['filters'] as List;

    return Scaffold(
      appBar: AppBar(
        title: Text('${currentCategory['title']} (${filters.length})'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Category tabs
          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filterCategories.length,
              itemBuilder: (context, index) {
                final isSelected = index == _selectedIndex;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: FilterChip(
                    label: Text(filterCategories[index]['title']),
                    selected: isSelected,
                    onSelected: (bool selected) {
                      if (selected) {
                        setState(() {
                          _selectedIndex = index;
                        });
                      }
                    },
                  ),
                );
              },
            ),
          ),
          // Filter grid
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).size.width > 600 ? 6 : 3,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                childAspectRatio: 1.0,
              ),
              padding: const EdgeInsets.all(8),
              itemCount: filters.length,
              itemBuilder: (context, position) {
                final item = filters[position];

                // Handle both preset and custom filter types
                ColorFilter colorFilter;
                String filterName;

                if (item is ColorFiltersPreset) {
                  colorFilter = ColorFilterExt.preset(item);
                  filterName = item.name;
                } else if (item is Map<String, dynamic>) {
                  colorFilter = item['filter'];
                  filterName = item['name'];
                } else {
                  return Container(); // Fallback
                }

                return GestureDetector(
                  onTap: () {
                    // Show filter details
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(filterName),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 200,
                              height: 200,
                              child: ColorFiltered(
                                colorFilter: colorFilter,
                                child: Image.asset(
                                  'assets/sample.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text('Filter: $filterName'),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('Close'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Card(
                    elevation: 2,
                    child: Column(
                      children: [
                        Expanded(
                          child: ColorFiltered(
                            colorFilter: colorFilter,
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
                            filterName,
                            style: Theme.of(context).textTheme.bodySmall,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const NutritionApp());
}

class NutritionApp extends StatelessWidget {
  const NutritionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Oziqlanish Maslahatchisi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final double _currentCalories = 1200; // Misol: kunlik kaloriya (max 2000)
  final List<String> _tips = const [
    'Kunda kamida 8 stakan suv iching!',
    'Har kuni meva va sabzavotlar yeng.',
    'Shakar miqdorini kamaytiring.',
    'Sport bilan shug\'ullaning.',
  ];

  final List<Map<String, dynamic>> _mealPlans = const [
    {'name': 'Nonushta', 'calories': 400, 'icon': Icons.restaurant},
    {'name': 'Tushlik', 'calories': 600, 'icon': Icons.lunch_dining},
    {'name': 'Kechki ovqat', 'calories': 500, 'icon': Icons.dinner_dining},
    {'name': 'Gazak', 'calories': 200, 'icon': Icons.fastfood},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Oziqlanish Maslahatchisi',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.green,
        actions: const [
          IconButton(
            icon: Icon(Icons.person, color: Colors.white),
            onPressed: null, // Placeholder
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Kunlik kaloriya progress
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Bugungi kaloriya',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: _currentCalories / 2000,
                      backgroundColor: Colors.grey[300],
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(Colors.green),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${_currentCalories.toInt()}/2000 kcal',
                      style: TextStyle(fontSize: 16, color: Colors.green[700]),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Tez maslahatlar
            const Text(
              'Tez maslahatlar',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ..._tips.map((tip) => Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    leading: const Icon(Icons.lightbulb_outline,
                        color: Colors.amber),
                    title: Text(tip),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: null, // Placeholder
                  ),
                )),
            const SizedBox(height: 20),
            // Ovqat rejalari
            const Text(
              'Bugungi reja',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _mealPlans.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final meal = _mealPlans[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.green[100],
                    child: Icon(meal['icon'] as IconData, color: Colors.green),
                  ),
                  title: Text(meal['name'] as String,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('${meal['calories']} kcal'),
                  trailing: const Icon(Icons.edit, color: Colors.grey),
                  onTap: null, // Placeholder
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null, // Placeholder
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
      ),
    );
  }
}

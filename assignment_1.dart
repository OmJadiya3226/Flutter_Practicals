import 'package:flutter/material.dart';

void main() => runApp(KidsLearningApp());

class KidsLearningApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kids Learn ABC & 123',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'ComicSans', // works only if browser supports it
        primarySwatch: Colors.purple,
      ),
      home: LearningHomePage(),
    );
  }
}

class LearningHomePage extends StatelessWidget {
  final List<String> letters = List.generate(
    26,
    (i) => String.fromCharCode(65 + i),
  ); // A-Z
  final List<String> numbers = List.generate(
    10,
    (i) => (i + 1).toString(),
  ); // 1–10

  void fakePlaySound(String label) {
    print("Clicked on $label");
  }

  Widget buildSection(String title, List<String> items, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 30),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.pink.shade200, Colors.purple.shade300],
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 15),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            String value = items[index];
            return GestureDetector(
              onTap: () => fakePlaySound(value),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.orange, Colors.deepOrangeAccent],
                  ),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.orange.shade200,
                      blurRadius: 6,
                      offset: Offset(2, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    value,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [Shadow(color: Colors.black26, blurRadius: 2)],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(
        title: const Text('🎉 Learn ABC & 123'),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildSection("🅰️ Alphabets (A–Z)", letters, context),
              buildSection("🔢 Numbers (1–10)", numbers, context),
            ],
          ),
        ),
      ),
    );
  }
}

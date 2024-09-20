import 'dart:async'; // Import this to use Timer
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int currentIndex = 0;
  Timer? _pageTimer;

  List<Map<String, String>> onboardingData = [
    {
      'title': "Track Your Shopping",
      'description': "Manage your to-buy and bought items easily.",
      'image': 'assets/images/shopping.png',
    },
    {
      'title': "Organize with Categories",
      'description': "Categorize items for quick and easy tracking.",
      'image': 'assets/images/shopping.png',
    },
    {
      'title': "Never Miss a Thing",
      'description': "Get reminders to buy important items.",
      'image': 'assets/images/shopping.png',
    },
  ];

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _pageTimer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (currentIndex < onboardingData.length - 1) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      } else {
        _pageController.jumpToPage(0); // Loop back to the first page
      }
    });
  }

  @override
  void dispose() {
    _pageTimer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              itemCount: onboardingData.length,
              itemBuilder: (context, index) => OnboardingContent(
                image: onboardingData[index]["image"],
                title: onboardingData[index]["title"],
                description: onboardingData[index]["description"],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(onboardingData.length, (index) =>
                buildDot(index: index)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login'); // Go to login/signup screen
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text("Get Started"),
            ),
          )
        ],
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 5),
      height: 8,
      width: currentIndex == index ? 20 : 8,
      decoration: BoxDecoration(
        color: currentIndex == index ? Colors.pinkAccent : Colors.grey,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}

class OnboardingContent extends StatelessWidget {
  final String? image, title, description;
  const OnboardingContent({
    super.key,
    this.image,
    this.title,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(image!, height: 300),
        const SizedBox(height: 20),
        Text(
          title!,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Text(
          description!,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

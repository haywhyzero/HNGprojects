import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HNGFirst App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:const  MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  final String githubUrl = 'https://github.com/haywhyzero/HNGprojects';
  final String hngHirePageUrl = 'http://hng.tech/hire/flutter-developers';

  void _launchURL(url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Git-ting Started App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Welcome to My HNG Github Repo App!'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _launchURL(githubUrl),
              child: const Text('Visit GitHub Repository'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _launchURL(hngHirePageUrl),
              child: const Text('Visit HNG Hire Pages'),
            ),
          ],
        ),
      ),
    );
  }
}
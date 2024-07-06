import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Portfolio',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Left Sidebar
          Container(
            height: double.infinity,
            width: 300,
            color: Color.fromARGB(255, 46, 45, 45),
            child: Column(
              children: [
                const SizedBox(height: 50),
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      75,
                    ), // Half of height or width to make it circular
                    color: Colors.white,
                  ),
                  child: ClipRRect(
                    // ClipRRect to clip the image to the circular border
                    borderRadius: BorderRadius.circular(75),
                    child: Image.asset(
                      'images/MyPic.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Sumanth G",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Product Engineering Intern",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5),
                GestureDetector(
                  onTap: () {
                    launch('https://liquidmind.ai');
                  },
                  child: const Text(
                    "@liquidmind.ai",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Skills",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      skillItem("Python Programming"),
                      skillItem("Machine Learning"),
                      skillItem("Flask"),
                      skillItem("Flutter"),
                      skillItem("Blender 3D"),
                      skillItem("C Programming"),
                    ],
                  ),
                ),
                // Icons for social media and reference links
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        launch(
                            'https://www.instagram.com/your_instagram_handle/');
                      },
                      child: Image.asset(
                        'images/instagram_icon.png', // Replace with your Instagram icon image asset
                        width: 30,
                        height: 30,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        launch('https://github.com/Siuumanth');
                      },
                      child: Image.asset(
                        'images/github_icon.png', // Replace with your GitHub icon image asset
                        width: 30,
                        height: 30,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        launch(
                            'https://example.com'); // Replace with your reference link
                      },
                      child: Image.asset(
                        'images/reference_icon.png', // Replace with your reference icon image asset
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Right Content Area
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sectionTitle("About Me"),
                    const SizedBox(height: 10),
                    const Text(
                      "A Computer Science and Engineering Student who is really passionate about machine learning and backend development.",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 20),
                    sectionTitle("Projects"),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Flexible(
                          child: projectItem(
                            "Celebrity-Image-Classifier",
                            "https://github.com/Siuumanth/Celebrity-Classifier-Model",
                            "An AI model that can classify images of 5 celebrities into the respective class. \n Technologies used : scikitlearn ,openCV ,haarcascades ,flask.",
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Flexible(
                          child: projectItem(
                            "Flask - CRUD backend",
                            "https://github.com/Siuumanth/Flask--CRUD-backend",
                            "A CRUD backend architecture for a vending machine menu, tested using POSTMAN.",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    sectionTitle("Contact"),
                    const SizedBox(height: 10),
                    Text(
                      "Email: gsumanth3005@gmail.com",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget skillItem(String skill) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          const Icon(Icons.check, color: Colors.white),
          const SizedBox(width: 10),
          Text(
            skill,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }

  Widget projectItem(String title, String githubUrl, String description) {
    return GestureDetector(
      onTap: () async {
        if (await canLaunch(githubUrl)) {
          await launch(githubUrl);
        } else {
          throw 'Could not launch $githubUrl';
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            SelectableText(
              description,
              style: const TextStyle(fontSize: 16),
              showCursor: true,
              cursorColor: Colors.blue,
              cursorWidth: 2.0,
            ),
          ],
        ),
      ),
    );
  }
}

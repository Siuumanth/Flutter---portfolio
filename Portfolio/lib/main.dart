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
                        "Skills & Interests",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      skillItem("Python Programming"),
                      skillItem("Machine Learning"),
                      skillItem("Deep Learning"),
                      skillItem("Flask"),
                      skillItem("Flutter"),
                      skillItem("Blender 3D"),
                      skillItem("C Programming"),
                    ],
                  ),
                ),
                // Icons for social media and reference links
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
                      "A Computer Science and Engineering Student who is really passionate about machine learning and backend development. Currently interning at Liquidmind AI as a product engineer(April 2024 - August 2024) \n\n Currenly learning App development with Flutter and Machine learning. \n \n Have worked a lot with google colab for small machine learning projects. \n Confident, always aspiring to learn something new and will put my best effort into every task I am assigned.",
                      style: TextStyle(fontSize: 16),
                    ),
                    /*        sectionTitle("Education"),
                    const SizedBox(height: 10),
                    educationItem(
                      "B.Tech CSE, UVCE",
                      "2023-2027",
                    ),
                    educationItem(
                      "Sri Chaitanya Techno School , 11th - 12th \n Grade - 90.2 %",
                      ", 2021-2023",
                    ),
                    const SizedBox(height: 20),*/
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
                        SizedBox(
                          width: 50,
                        ),
                        Flexible(
                          child: projectItem(
                            "Number Image Classifier",
                            "https://colab.research.google.com/drive/1Hc8RN_ioytNvSfLzIsNg9ghNs9b6FTKQ",
                            "A Number image classifier made with Deep learning using Tensorflow,with the Mnist Dataset.",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    sectionTitle("Contact"),
                    const SizedBox(height: 10),
                    SelectableText(
                      "Email: gsumanth3005@gmail.com",
                      style: const TextStyle(fontSize: 16),
                      showCursor: true, // Enables the text cursor
                      cursorColor: Colors.blue, // Sets the cursor color
                      cursorWidth: 2.0, // Sets the cursor width
                    ),
                    const SizedBox(height: 20),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          child: SizedBox(
                            child: Image.asset(
                              'images/linkedin.png',
                              fit: BoxFit.cover,
                              height: 53,
                              width: 53,
                            ),
                          ),
                          onTap: () => launch(
                              'https://www.linkedin.com/in/sumanth-g-a444552b7/'),
                        ),
                        const SizedBox(width: 5),
                        GestureDetector(
                          child: SizedBox(
                            child: Image.asset(
                              'images/github.png',
                              fit: BoxFit.cover,
                              height: 40,
                              width: 40,
                            ),
                          ),
                          onTap: () => launch('https://github.com/Siuumanth'),
                        ),
                        const SizedBox(width: 7),
                        GestureDetector(
                          child: Container(
                            child: Image.asset(
                              'images/instagram.png',
                              fit: BoxFit.cover,
                              height: 40,
                              width: 40,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15)),
                          ),
                          onTap: () =>
                              launch('https://www.instagram.com/chubs_3d'),
                        ),
                      ],
                    ),
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
          //    const Icon(Icons.check, color: Colors.white),
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

Widget educationItem(String institution, String year) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          institution,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          year,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    ),
  );
}

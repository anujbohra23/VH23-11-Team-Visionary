import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:virtual_study_buddy/colors.dart';

import '../home.dart';

class MotivatingBook {
  String title;
  String link;

  MotivatingBook({
    required this.title,
    required this.link,
  });
}

class MotivatingBooks extends StatelessWidget {
  // Hardcoded list of Book objects
  final List<MotivatingBook> books = [
    MotivatingBook(title: 'Think and Grow Rich', link: 'https://wiki.python.org/moin/PythonBooks'),
    MotivatingBook(title: 'The Power Of Positive Thinking', link: 'https://www.geeksforgeeks.org/learn-data-structures-and-algorithms-dsa-tutorial/'),
    MotivatingBook(title: 'The Four Agreements', link: 'https://www.geeksforgeeks.org/operating-systems/')

    // Add more books as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(),
        body: ListView.builder(
          itemCount: books.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primary), // Border color
                borderRadius: BorderRadius.circular(10), // Border radius
              ),
              margin: EdgeInsets.all(10), // Margin around the container
              child: ListTile(
                title: Text(books[index].title),
                onTap: () {
                  _launchURL(books[index].link); // Open the URL when ListTile is tapped
                },
              ),
            );
          },
        )

    );
  }

  // Function to launch URL in a web browser
  // Function to launch URL in a web browser
  _launchURL(String url) async {
    try {
      await launch(url); // Launch the provided URL
    } catch (e) {
      print('Error launching URL: $e');
    }
  }

  AppBar appBar() {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          //Navigator.push(
          //context, MaterialPageRoute(builder: (context) => HomePage()));
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          width: 37,
          child: SvgPicture.asset(
            'assets/icons/Arrow - Left 2.svg',
            height: 25,
            width: 25,
          ),
          decoration: BoxDecoration(
            color: const Color(0xffF7F8F8),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      title: const Text(
        'Best Sellers',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 37,
            child: SvgPicture.asset(
              'assets/icons/dots.svg',
              height: 5,
              width: 5,
            ),
            decoration: BoxDecoration(
              color: const Color(0xffF7F8F8),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }

}


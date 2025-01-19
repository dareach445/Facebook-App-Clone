import 'package:flutter/material.dart';

class MainViewScreen extends StatelessWidget {
  const MainViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        _buildTypeVideos(),
        _buildVideosConatent(),
        _buildPostVideos(),
      ],
    ));
  }

  Widget _buildTypeVideos() {
    return const Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(children: [
        Text("For you",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(width: 20),
        Text("Live",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(width: 20),
        Text("Reels",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(width: 20),
        Text("Following",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ]),
    );
  }

  Widget _buildVideosConatent() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
          child: Row(
            children: [
              ClipOval(
                child: Image.asset(
                  'images/profile_mind.webp',
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Dareach",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      Text("Oct 8,2024 .", style: TextStyle(fontSize: 15)),
                      Icon(Icons.public, size: 12),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              const Row(
                children: [
                  Icon(Icons.more_horiz, size: 30, color: Colors.black),
                  SizedBox(width: 10),
                  Icon(Icons.close, size: 30, color: Colors.black),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "ក្លាយជាមនុស្សដែលមានវិន័យដោយមិនដឹងខ្លួន",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w100),
          ),
        ),
        const SizedBox(height: 5),
      ]),
    );
  }

  Widget _buildPostVideos() {
    return Container(
      color: Colors.white,
      child: const Column(
        children: [
          Image(
            image: AssetImage("images/profile_mind.webp"),
            fit: BoxFit.cover,
            width: 420,
            height: 300,
          ),
          Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.thumb_up,
                    size: 20,
                    color: Colors.blue,
                  ),
                  Icon(
                    Icons.favorite,
                    size: 20,
                    color: Colors.pink,
                  ),
                  Text("100", style: TextStyle(fontSize: 16)),
                  SizedBox(width: 50),
                  Text("100 comments 50 shares 14k views",
                      style: TextStyle(fontSize: 15)),
                ],
              )),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.thumb_up,
                      size: 20,
                      color: Colors.blue,
                    ),
                    Text("Like", style: TextStyle(fontSize: 16)),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.comment_outlined,
                      size: 20,
                      color: Colors.black,
                    ),
                    Text("Comment", style: TextStyle(fontSize: 16)),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.screen_share_outlined,
                      size: 20,
                      color: Colors.black,
                    ),
                    Text("Share", style: TextStyle(fontSize: 16)),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

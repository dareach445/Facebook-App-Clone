import 'package:flutter/material.dart';
import 'package:facebookapp_clone/data/PostList.dart';
import 'package:facebookapp_clone/data/image_story.dart';

class MainListView extends StatefulWidget {
  const MainListView({super.key});

  @override
  State<MainListView> createState() => _MainListViewState();
}

class _MainListViewState extends State<MainListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.white,
              elevation: 1,
              floating: true, // Makes the AppBar appear when scrolling up.
              snap:
                  true, // Works with floating to make the AppBar snap into view when scrolling.
              pinned:
                  false, // Keeps the AppBar visible at the top when scrolling.
              toolbarHeight: 100, // AppBar height
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Text(
                      'Facebook',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add,
                          size: 30,
                        ),
                        color: Colors.black,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          size: 30,
                        ),
                        color: Colors.black,
                      ),
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const SizedBox(
                              width: 30,
                              height: 30,
                              child: Image(
                                image: AssetImage("images/messenger.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 8,
                            right: 8,
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              child: const Text(
                                "2",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ];
        },
        body: Container(
          color: Colors.white,
          child: CustomScrollView(
            slivers: [
              // 'What's on your mind?' section
              SliverToBoxAdapter(
                child: _buildMindView(),
              ),
              // Stories section
              SliverToBoxAdapter(
                child: _buildStoriesView(),
              ),
              // Posts section (with ListView of posts)
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final post = posts[index];
                    return Container(
                      color: Colors.white,
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage:
                                          NetworkImage(post.imageUrl),
                                    ),
                                    title: Text(post.username),
                                    subtitle: Text(post.postTime),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(post.IconOptions),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: Icon(post.IconCancel),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(post.postContent),
                            ),
                            if (post.imageUrl.isNotEmpty)
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Image.network(
                                      post.imageUrl,
                                      fit: BoxFit.cover,
                                      width: 500,
                                      height: 300,
                                    ),
                                  ],
                                ),
                              ),
                            Container(
                              padding: const EdgeInsets.only(top: 20, left: 5),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Reaction icons stacked together
                                  Stack(
                                    clipBehavior: Clip
                                        .none, // Allows icons to overflow for better stacking
                                    children: [
                                      // First Reaction (Like)
                                      Container(
                                        padding: const EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                          color: Colors
                                              .blue, // Blue background for 'Like'
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            // Add white border
                                            color: Colors.white,
                                            width: 2, // Thickness of the border
                                          ),
                                        ),
                                        child: const Icon(
                                          Icons.thumb_up,
                                          size: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                      // Second Reaction (Love) - Slightly shifted left
                                      Positioned(
                                        left: 15,
                                        child: Container(
                                          padding: const EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                            color: Colors
                                                .red, // Red background for 'Love'
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              // Add white border
                                              color: Colors.white,
                                              width:
                                                  2, // Thickness of the border
                                            ),
                                          ),
                                          child: const Icon(
                                            Icons.favorite,
                                            size: 14,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 16),
                                  // Reaction count
                                  Text(
                                    '${post.likeCount}',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  const SizedBox(width: 120),
                                  Text(
                                    "${post.commentCount} Comments ${post.shareCount} Shares",
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(
                                            Icons.thumb_up_alt_outlined,
                                            size: 30),
                                        onPressed: () {
                                          setState(() {
                                            post.likeCount++;
                                          });
                                        },
                                      ),
                                      Text("Like", style: TextStyle(fontSize: 18, color: Colors.grey[600])),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.comment_outlined),
                                        onPressed: () {
                                          setState(() {
                                            post.commentCount++;
                                          });
                                        },
                                      ),
                                      Text("Comment", style: TextStyle(fontSize: 18, color: Colors.grey[600])),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: Image.asset(
                                          'images/share.png', // Path to your local image
                                          width: 23,
                                          height: 23,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            post.shareCount++;
                                          });
                                        },
                                      ),
                                      Text("share", style: TextStyle(fontSize: 18, color: Colors.grey[600])),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  childCount: posts.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMindView() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.white,
        child: Row(
          children: [
            ClipOval(
              child: Image.asset(
                "images/profile_mind.webp", // Use a valid path
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              "What's on your mind?",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(width: 150),
            const Icon(Icons.image),
          ],
        ),
      ),
    );
  }

  Widget _buildStoriesView() {
    return Container(
      color: Colors.white,
      height: 280,
      margin: const EdgeInsets.only(top: 5),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: imageListStory.length,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Container(
                margin: const EdgeInsets.all(3),
                height: 220,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.0),
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade200, width: 3),
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(14.0),
                        topRight: Radius.circular(14.0),
                      ),
                      child: Image.network(
                        imageListStory[index],
                        fit: BoxFit.cover,
                        height: 180,
                        width: 120,
                      ),
                    ),
                    Positioned(
                      right: 40,
                      bottom: 60,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 3),
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ),
                    const Positioned(
                      right: 20,
                      bottom: 25,
                      child: Text(
                        textAlign: TextAlign.center,
                        "Create story",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Container(
                margin: const EdgeInsets.all(3),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(14.0),
                      child: Image.network(
                        imageListStory[index],
                        height: 255,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue, width: 3),
                          shape: BoxShape.circle,
                        ),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(imageListStory[index]),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: Text(
                        storyName[index],
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

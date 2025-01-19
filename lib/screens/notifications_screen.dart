import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: NotificationsPage(
        isDarkMode: isDarkMode,
        toggleTheme: () {
          setState(() {
            isDarkMode = !isDarkMode;
          });
        },
      ),
    );
  }
}


class NotificationsPage extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback toggleTheme;

  NotificationsPage({required this.isDarkMode, required this.toggleTheme});
  final List<Map<String, dynamic>> notifications = [
    {
      'profileImage':
          'https://cdn.pixabay.com/photo/2020/05/17/20/21/cat-5183427_640.jpg',
      'title': "You're on a streak with Khann Teymeta",
      'subtitle': "and are on their public engagement list again! 🎉",
      'time': "1h",
      'icon': Icons.notifications,
    },
    {
      'profileImage':
          'https://cdn.pixabay.com/photo/2014/11/29/19/33/bald-eagle-550804_640.jpg',
      'title': "You're featured on public engagement lists this week.",
      'subtitle': "See who you've engaged with the most.",
      'time': "1h",
      'icon': Icons.notifications,
    },
    {
      'profileImage':
          'https://cdn.pixabay.com/photo/2023/09/24/14/05/dog-8272860_640.jpg',
      'title': "Nat Chantra mentioned you in a comment:",
      'subtitle': '"Dareach Ren 🤔"',
      'time': "4h",
      'icon': Icons.message,
    },
    {
      'profileImage':
          'https://cdn.pixabay.com/photo/2021/08/17/01/07/spider-man-6551673_640.jpg',
      'title': "Nat Chantra reacted to your comment:",
      'subtitle': '"Nothing to say 🫣😅"',
      'time': "4h",
      'icon': Icons.emoji_emotions,
    },
    {
      'profileImage':
          'https://cdn.pixabay.com/photo/2021/04/24/08/30/zoo-6203486_640.jpg',
      'title': "Vann Da posted 2 new videos:",
      'subtitle': '"Talking about the latest topic..."',
      'time': "1h",
      'icon': Icons.video_collection,
    },
    {
      'profileImage':
          'https://cdn.pixabay.com/photo/2022/10/15/21/23/cat-7523894_640.jpg',
      'title': "2D Animation Film invited you to join:",
      'subtitle': '"Sinchanrithy Official Group."',
      'time': "2h",
      'icon': Icons.group,
    },
    {
      'profileImage':
          'https://cdn.pixabay.com/photo/2021/08/17/01/07/spider-man-6551673_640.jpg',
      'title': "Your account got a new follower!",
      'subtitle': "Rithy Sen is now following you.",
      'time': "3h",
      'icon': Icons.person_add,
    },
    {
      'profileImage':
          'https://cdn.pixabay.com/photo/2018/11/08/23/52/man-3803551_640.jpg',
      'title': "You were tagged in a photo by Dara Seila.",
      'subtitle': '"Cycling adventure in Phnom Penh."',
      'time': "5h",
      'icon': Icons.photo,
    },
    {
      'profileImage':
          'https://cdn.pixabay.com/photo/2016/06/20/04/30/asian-man-1468032_640.jpg',
      'title': "New event near you: Tech Meetup 2025",
      'subtitle': "Join fellow enthusiasts this Saturday.",
      'time': "8h",
      'icon': Icons.event,
    },
    {
      'profileImage':
          'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg',
      'title': "Amit shared a post:",
      'subtitle': '"Check out this new product!"',
      'time': "2h",
      'icon': Icons.share,
    },
    {
      'profileImage':
          'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg',
      'title': "Sanjay commented on your photo:",
      'subtitle': '"This looks so good!"',
      'time': "1d",
      'icon': Icons.comment,
    },
    {
      'profileImage':
          'https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg',
      'title': "Priya sent you a message:",
      'subtitle': '"Let’s catch up this weekend!"',
      'time': "5h",
      'icon': Icons.message,
    },
    {
      'profileImage':
          'https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg',
      'title': "Nikhil started following you.",
      'subtitle': '',
      'time': "2d",
      'icon': Icons.person_add,
    },
    {
      'profileImage':
          'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg',
      'title': "Ravi reacted to your post:",
      'subtitle': '"Interesting perspective!"',
      'time': "3h",
      'icon': Icons.thumb_up,
    },
    {
      'profileImage':
          'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg',
      'title': "Neha invited you to an event:",
      'subtitle': '"Join me at the tech conference!"',
      'time': "1d",
      'icon': Icons.event,
    },
    {
      'profileImage':
          'https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg',
      'title': "Aarav commented on your status:",
      'subtitle': '"This is a great idea!"',
      'time': "4h",
      'icon': Icons.comment,
    },
    {
      'profileImage':
          'https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg',
      'title': "Anjali liked your status update.",
      'subtitle': '',
      'time': "2h",
      'icon': Icons.thumb_up,
    },
    {
      'profileImage':
          'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg',
      'title': "Rohan mentioned you in a comment:",
      'subtitle': '"You should definitely check this out!"',
      'time': "6h",
      'icon': Icons.thumb_down,
    },
    {
      'profileImage':
          'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg',
      'title': "Vikram invited you to join a group.",
      'subtitle': '"We’re discussing new startups!"',
      'time': "1d",
      'icon': Icons.group_add,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            backgroundColor: isDarkMode ? Colors.black : Colors.white,
            elevation: 1,
            floating: true,
            snap: true,
            pinned: false,
            toolbarHeight: 150,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Notifications',
                        style: TextStyle(
                          color: isDarkMode ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.search,
                              color: isDarkMode ? Colors.white : Colors.black),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon:  Icon(Icons.more_vert,
                             color: isDarkMode ? Colors.white : Colors.black),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 3.0, vertical: 2.0),
                  child: Text(
                    'New',
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
        body: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            final notification = notifications[index];
            return Card(
              color: isDarkMode ? Colors.grey[800] : Colors.white,
              margin:
                  const EdgeInsets.symmetric(vertical: 2.0, horizontal: 16.0),
              child: ListTile(
                leading: Stack(
                  clipBehavior: Clip
                      .none, // Allows the icon to overflow the profile picture
                  children: [
                    CircleAvatar(
                      radius: 24.0,
                      backgroundImage:
                          NetworkImage(notification['profileImage']),
                    ),
                    Positioned(
                      bottom: -5,
                      right: -5,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isDarkMode ? Colors.white : Colors.black,
                          border: Border.all(color: Colors.white, width: 1.5),
                        ),
                        child: CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.green,
                          child: Icon(
                            notification['icon'],
                            size: 12,
                            color: isDarkMode ? Colors.white70 : Colors.black87,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                title: Text(notification['title'],
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(notification['subtitle']),
                trailing: const Icon(Icons.more_vert),
              ),
            );
          },
        ),
      ),
    );
  }
}

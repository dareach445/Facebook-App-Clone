import 'package:facebookapp_clone/components/Marketplace/TypeMarketplace.dart';
import 'package:flutter/material.dart';

class PostMarketplace extends StatelessWidget {
  final List<Map<String, String>> items = [
    {
      "image":
          "https://images.pexels.com/photos/11952741/pexels-photo-11952741.jpeg?auto=compress&cs=tinysrgb&w=600",
      "price": "£23",
      "title": "Hyundai H1",
    },
    {
      "image":
          "https://images.pexels.com/photos/18231632/pexels-photo-18231632/free-photo-of-range-rover-evoque.jpeg?auto=compress&cs=tinysrgb&w=600",
      "price": "£185",
      "title": "Range Rover Evoque",
    },
    {
      "image":
          "https://images.pexels.com/photos/276517/pexels-photo-276517.jpeg?auto=compress&cs=tinysrgb&w=600",
      "price": "£2,300",
      "title": "XR 250ccc",
    },
    {
      "image":
          "https://images.pexels.com/photos/240222/pexels-photo-240222.jpeg?auto=compress&cs=tinysrgb&w=600",
      "price": "£3,400",
      "title": "Vespa Sprint",
    },
    {
      "image":
          "https://images.pexels.com/photos/7880024/pexels-photo-7880024.jpeg?auto=compress&cs=tinysrgb&w=400",
      "price": "£10",
      "title": "Vacuum Bottle 500ml",
    },
    {
      "image":
          "https://images.pexels.com/photos/1034653/pexels-photo-1034653.jpeg?auto=compress&cs=tinysrgb&w=400",
      "price": "£50",
      "title": "Bluetooth Speaker",
    },
  ];

  PostMarketplace({super.key});

  @override
  Widget build(BuildContext context) {
  return SingleChildScrollView(  // Wrap everything in a SingleChildScrollView
    scrollDirection: Axis.vertical,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const TypeMarketplace(), // Non-scrollable widget
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Today's picks",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.blue),
                    Text("Phnom Penh"),
                    SizedBox(width: 10),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          // No need for Expanded here
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),  // Disable GridView's internal scrolling
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,  // Two items per row
              crossAxisSpacing: 8,  // Horizontal spacing
              mainAxisSpacing: 8,  // Vertical spacing
              childAspectRatio: 0.75,  // Height-to-width ratio
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return buildItemCard(items[index]);
            },
          ),
        ],
      ),
    ),
  );
}


  Widget buildItemCard(Map<String, String> item) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.network(
                item["image"]!,
                fit: BoxFit.cover,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                      Icons.error); // Show an error icon if image fails
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item["price"]!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item["title"]!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              item["title"]!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

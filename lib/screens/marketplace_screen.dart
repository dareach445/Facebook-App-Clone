import 'package:facebookapp_clone/components/Marketplace/appbar.dart';
import 'package:facebookapp_clone/components/Marketplace/postVideosScreen.dart';
import 'package:flutter/material.dart';

class MarketplaceScreen extends StatelessWidget {
  const MarketplaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMKSreen(
        isDarkMode: Theme.of(context).brightness == Brightness.dark,
      ),
      body: PostMarketplace(),
    );
  }
}

import 'package:flutter/material.dart';

class SocialMediaPost {
  final String username;
  final String postTime;
  final IconData IconOptions;
  final IconData IconCancel;
  final String postContent;
  final String imageUrl;
  int likeCount;
  int commentCount;
  int shareCount;
  final String nameAudiunce;
  final List<IconData> reactionIcons; // New field for reactions

  SocialMediaPost({
    required this.username,
    required this.postTime,
    required this.IconOptions,
    required this.IconCancel,
    required this.postContent,
    required this.imageUrl,
    required this.nameAudiunce,
    required this.reactionIcons, // Initialize in constructor
    required this.likeCount,
    required this.commentCount,
    required this.shareCount,
  });
}

import 'package:flutter/material.dart';

import '../reusable/postcard.dart';
import '../util/images.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Text(
              'Wellness Hub',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2D1437),
              ),
            ),
          ),
          _buildCategoryList(),
          Expanded(
            child: ListView.builder(
              itemCount: postData.length,
              itemBuilder: (context, index) => PostCard(post: postData[index]),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {},
        child: const Icon(Icons.edit, color: Colors.white),
      ),
    );
  }

  Widget _buildCategoryList() {
    final categories = ['Trending', 'Relationship', 'Self Care'];
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          bool isSelected = index == 0;
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: isSelected ? Colors.orange : const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: Text(
              categories[index],
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey[700],
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        },
      ),
    );
  }
}

class Post {
  final String userName;
  final String timeAgo;
  final String content;
  final String avatar;
  final int likes;
  final int comments;

  Post({
    required this.userName,
    required this.timeAgo,
    required this.content,
    required this.avatar,
    required this.likes,
    required this.comments,
  });
}

final List<Post> postData = [
  Post(
    userName: 'Coal Dingo',
    timeAgo: 'just now',
    avatar: AppImages.avatar1,
    content:
        'Is there a therapy which can cure crossdressing & bdsm compulsion?',
    likes: 2,
    comments: 0,
  ),
  Post(
    userName: 'Pigeon Car',
    timeAgo: '3 hrs ago',
    avatar: AppImages.avatar2,
    content:
        'Is there a therapy which can cure crossdressing & bdsm compulsion?',
    likes: 12,
    comments: 2,
  ),
  Post(
    userName: 'Pigeon Car',
    timeAgo: '1 hr ago',
    avatar: AppImages.avatar3,
    content:
        'Is there a therapy which can cure crossdressing & bdsm compulsion?',
    likes: 12,
    comments: 2,
  ),
  Post(
    userName: 'Pigeon Car',
    timeAgo: '2 min ago',
    avatar: AppImages.avatar4,
    content:
        'Is there a therapy which can cure crossdressing & bdsm compulsion?',
    likes: 12,
    comments: 2,
  ),
];

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../views/profilescreen.dart';

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(post.avatar),
                    radius: 20,
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            post.userName,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Icon(Icons.circle, size: 4, color: Colors.grey),
                          const SizedBox(width: 8),
                          Text(
                            post.timeAgo,
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                post.content,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black87,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  _ActionButton(
                    icon: Icons.thumb_up_alt_outlined,
                    label: post.likes.toString(),
                  ),
                  const SizedBox(width: 24),
                  _ActionButton(
                    icon: Icons.chat_bubble_outline,
                    label: post.comments.toString(),
                  ),
                  const Spacer(),
                  const Icon(
                    CupertinoIcons.arrowshape_turn_up_right_fill,
                    color: Colors.grey,
                    size: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
        const Divider(height: 1, thickness: 0.5, color: Color(0xFFEEEEEE)),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  const _ActionButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey, size: 20),
        const SizedBox(width: 6),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}

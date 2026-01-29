import 'package:flutter/material.dart';

class EmptyFeaturedBooksState extends StatelessWidget {
  const EmptyFeaturedBooksState({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            children: [
              Icon(Icons.library_books_outlined, size: 64, color: Colors.grey),
              SizedBox(height: 16),
              Text(
                'No books available',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

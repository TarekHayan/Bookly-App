import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerNewestBooksVirtical extends StatelessWidget {
  const ShimmerNewestBooksVirtical({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 6,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Row(
            children: [
              // صورة الكتاب
              Shimmer.fromColors(
                baseColor: Colors.grey.shade800,
                highlightColor: Colors.grey.shade700,
                child: Container(width: 60, height: 90, color: Colors.white),
              ),
              const SizedBox(width: 15),

              // النصوص
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey.shade800,
                      highlightColor: Colors.grey.shade700,
                      child: Container(
                        height: 15,
                        width: double.infinity,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Shimmer.fromColors(
                      baseColor: Colors.grey.shade800,
                      highlightColor: Colors.grey.shade700,
                      child: Container(
                        height: 15,
                        width: 150,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

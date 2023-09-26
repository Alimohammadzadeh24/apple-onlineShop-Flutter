import 'package:apple_online_shop/Constant/color.dart';
import 'package:flutter/material.dart';

class CategoryHorizontalListItem extends StatelessWidget {
  const CategoryHorizontalListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20, left: 20),
            child: CategoryListItem(),
          );
        },
      ),
    );
  }
}

class CategoryListItem extends StatelessWidget {
  const CategoryListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 58,
          height: 58,
          decoration: BoxDecoration(
            color: CustomColors.green,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: CustomColors.green,
                blurRadius: 20,
                spreadRadius: -10,
                offset: Offset(0.00, 10),
              ),
            ],
          ),
          child: const Center(
            child: Icon(
              Icons.mouse,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 12),
        const Text('همه'),
      ],
    );
  }
}

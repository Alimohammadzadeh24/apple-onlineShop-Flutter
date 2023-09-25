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
          return Padding(
            padding: const EdgeInsets.only(left: 20, top: 31, bottom: 31),
            child: Column(
              children: [
                Container(
                  width: 58,
                  height: 58,
                  decoration: BoxDecoration(
                    color: CustomColors.red,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: CustomColors.red,
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
            ),
          );
        },
      ),
    );
  }
}

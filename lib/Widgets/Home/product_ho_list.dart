import 'package:apple_online_shop/Constant/color.dart';
import 'package:flutter/material.dart';

class ProductHorizontalListItem extends StatelessWidget {
  const ProductHorizontalListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 24),
            child: SizedBox(
              height: 200,
              child: Column(
                children: [
                  Container(
                    width: 160,
                    height: 190,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: double.infinity,
                          height: 16,
                        ),
                        Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            const SizedBox(width: double.infinity),
                            Image.asset(
                              'assets/images/iphone.png',
                            ),
                            Positioned(
                              top: 0,
                              right: 8,
                              child: Image.asset(
                                'assets/images/active_fav_product.png',
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 8,
                              child: Container(
                                width: 30,
                                height: 16,
                                decoration: BoxDecoration(
                                  color: CustomColors.red,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Center(
                                  child: Text(
                                    '5%',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 0, right: 10),
                          child: Text(
                            'آیفون 13 پرومکس',
                            style: TextStyle(
                              fontFamily: 'SB',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 160,
                    height: 48,
                    decoration: const BoxDecoration(
                      color: CustomColors.blue,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: CustomColors.blue,
                          blurRadius: 30,
                          spreadRadius: -12,
                          offset: Offset(0.00, 15),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'تومان',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(width: 5),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '48،800،000',
                                style: TextStyle(
                                  color: Colors.white,
                                  decoration: TextDecoration.lineThrough,
                                  decorationThickness: 2,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                '47،800،000',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Image.asset(
                            width: 24,
                            'assets/images/icon_right_arrow_cricle.png',
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

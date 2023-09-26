import 'package:apple_online_shop/Constant/color.dart';
import 'package:apple_online_shop/Widgets/Home/banner_slider.dart';
import 'package:apple_online_shop/Widgets/Home/category_ho_list.dart';
import 'package:apple_online_shop/Widgets/Home/product_ho_list.dart';
import 'package:apple_online_shop/screens/product_list_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
            child: Container(
              height: 46.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Image.asset('assets/images/icon_search.png'),
                    const Expanded(
                      child: Text(
                        'جست و جوی محصولات',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: CustomColors.grey,
                        ),
                      ),
                    ),
                    Image.asset('assets/images/icon_apple_blue.png'),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: BannerSlider(),
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20, right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'دسته بندی',
                  style: TextStyle(
                    fontFamily: 'SB',
                    color: CustomColors.grey,
                  ),
                ),
                CategoryHorizontalListItem()
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'پرفروش ترین ها',
                        style: TextStyle(
                          fontFamily: 'SB',
                          color: CustomColors.grey,
                        ),
                      ),
                      InkWell(
                        onTap: () => NavigateToProductList(context),
                        child: Row(
                          children: [
                            const Text(
                              'مشاهده همه',
                              style: TextStyle(
                                fontFamily: 'SB',
                                color: CustomColors.blue,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Image.asset('assets/images/icon_left_categroy.png')
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                const ProductHorizontalListItem()
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'پر بازدیدترین ها',
                        style: TextStyle(
                          fontFamily: 'SB',
                          color: CustomColors.grey,
                        ),
                      ),
                      InkWell(
                        onTap: () => NavigateToProductList(context),
                        child: Row(
                          children: [
                            const Text(
                              'مشاهده همه',
                              style: TextStyle(
                                fontFamily: 'SB',
                                color: CustomColors.blue,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Image.asset('assets/images/icon_left_categroy.png')
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                const ProductHorizontalListItem()
              ],
            ),
          ),
        ),
      ],
    );
  }

  void NavigateToProductList(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ProductListScreen()));
  }
}

import 'package:apple_online_shop/Constant/color.dart';
import 'package:apple_online_shop/Widgets/Home/product_ho_list.dart';
import 'package:apple_online_shop/Widgets/screen_app_bar.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: CustomColors.backgroundColor,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                  child: ScreenAppBar(
                    title: 'پربازدید و پرفروش ترین ها',
                    havePop: true,
                  ),
                ),
              ),
              SliverPadding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return const ProductItem();
                    },
                    childCount: 10,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 30,
                    childAspectRatio: 2 / 3,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

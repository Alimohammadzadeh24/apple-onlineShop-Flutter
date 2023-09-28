import 'package:apple_online_shop/Constant/color.dart';
import 'package:apple_online_shop/Widgets/Home/banner_slider.dart';
import 'package:apple_online_shop/Widgets/Home/category_ho_list.dart';
import 'package:apple_online_shop/Widgets/Home/product_ho_list.dart';
import 'package:apple_online_shop/bloc/home/home_bloc.dart';
import 'package:apple_online_shop/bloc/home/home_event.dart';
import 'package:apple_online_shop/screens/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(HomeGetInitializedDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      builder: (context, state) {
        return const CustomScrollView(
          slivers: [
            _SearchBox(),
            _BannerSlider(),
            _CategoryList(),
            _ProductList()
          ],
        );
      },
    );
  }
}

class _ProductList extends StatelessWidget {
  const _ProductList();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
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
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProductListScreen())),
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
    );
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList();

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
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
    );
  }
}

class _BannerSlider extends StatelessWidget {
  const _BannerSlider();

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: BannerSlider(),
      ),
    );
  }
}

class _SearchBox extends StatelessWidget {
  const _SearchBox();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
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
    );
  }
}

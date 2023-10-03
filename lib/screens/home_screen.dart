import 'package:card_swiper/card_swiper.dart';
import 'package:ecommerce_app/consts/global_colors.dart';
import 'package:ecommerce_app/models/products_model.dart';
import 'package:ecommerce_app/screens/categories_Screen.dart';
import 'package:ecommerce_app/screens/feed_screen.dart';
import 'package:ecommerce_app/screens/user_screen.dart';
import 'package:ecommerce_app/services/api_handler.dart';
import 'package:ecommerce_app/widgets/appbar_icons.dart';
import 'package:ecommerce_app/widgets/feeds_grid.dart';
import 'package:ecommerce_app/widgets/sales_Widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:page_transition/page_transition.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ProductsModel> productList = [];
  @override
  void didChangeDependencies() {
    getProducts();
    ApiHandler.getAllProducts();
    super.didChangeDependencies();
  }

  Future<void> getProducts() async {
    productList = await ApiHandler.getAllProducts();
    setState(() {});
  }

  late TextEditingController _controller;
  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Home"),
            leading: AppBarIicons(
                function: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          child: const CategoriesScreen()));
                },
                icon: IconlyBold.category),
            actions: [
              AppBarIicons(
                  function: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            child: const UserScreen()));
                  },
                  icon: IconlyBold.user3),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 18,
                ),
                TextField(
                  controller: _controller,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: "Search",
                      filled: true,
                      fillColor: Theme.of(context).cardColor,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            width: 1, color: Theme.of(context).cardColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            width: 1,
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                      suffixIcon: Icon(
                        IconlyLight.search,
                        color: lightIconsColor,
                      ),
                      border: const OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.22,
                          child: Swiper(
                            itemCount: 3,
                            autoplay: true,
                            curve: Curves.ease.flipped,
                            itemBuilder: (context, index) {
                              return const SaleWidgets();
                            },
                            pagination: const SwiperPagination(
                                alignment: Alignment.bottomCenter,
                                builder: DotSwiperPaginationBuilder(
                                  color: Colors.white,
                                  activeColor: Colors.redAccent,
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Text(
                                "Latest Product",
                                style: TextStyle(fontSize: 18),
                              ),
                              const Spacer(),
                              AppBarIicons(
                                  function: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            type: PageTransitionType.fade,
                                            child: const FeedScreen()));
                                  },
                                  icon: IconlyBold.arrowRight2)
                            ],
                          ),
                        ),
                        FeedGrid(productList: productList)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

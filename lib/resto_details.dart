import 'package:dicodingproject_restaurantapp/restaurant.dart';
import 'package:dicodingproject_restaurantapp/widgets/button.dart';
import 'package:dicodingproject_restaurantapp/widgets/usable_menus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailPage extends StatefulWidget {
  static const routeName = "/detail_page";
  final Restaurant resto;

  const DetailPage({Key? key, required this.resto}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with TickerProviderStateMixin {
  final int gottenStar = 3;
  int selectedFoodIndex = -1;
  int selectedDrinkIndex = -1;

  Restaurant? _resto;

  @override
  void initState() {
    super.initState();

    setState(() {
      _resto = widget.resto;
    });
  }

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 400,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(_resto!.pictureId),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 20,
                right: 5,
                left: 5,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.more_vert,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 200,
                child: Container(
                  padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _resto!.name,
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.8),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: Colors.grey,
                                ),
                                const SizedBox(
                                  width: 7,
                                ),
                                Text(
                                  _resto!.city,
                                  style: TextStyle(
                                    color: Colors.grey.withOpacity(0.5),
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            RatingBar(
                              itemSize: 25,
                              initialRating: _resto!.rating,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              ratingWidget: RatingWidget(
                                  full: const Icon(Icons.star,
                                      color: Colors.orange),
                                  half: const Icon(
                                    Icons.star_half,
                                    color: Colors.orange,
                                  ),
                                  empty: const Icon(
                                    Icons.star_outline,
                                    color: Colors.orange,
                                  )),
                              onRatingUpdate: (value) {},
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              _resto!.rating.toString(),
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(
                          color: Colors.black,
                        ),
                        Text(
                          "Description",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(0.8),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 100,
                          child: Scrollbar(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Text(
                                    // "${_resto!.description.characters.take(200).toString()} .....",
                                    _resto!.description,
                                    style: TextStyle(
                                      color: Colors.grey.withOpacity(0.8),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Divider(
                          color: Colors.black,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(10)),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: TabBar(
                              labelPadding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              isScrollable: true,
                              labelColor: Colors.black,
                              indicatorColor: Colors.black,
                              unselectedLabelColor:
                                  Colors.black.withOpacity(0.5),
                              indicatorSize: TabBarIndicatorSize.label,
                              controller: _tabController,
                              tabs: const [
                                Tab(
                                  text: "Foods",
                                ),
                                Tab(
                                  text: "Drink",
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: double.maxFinite,
                          height: 180,
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              Scrollbar(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    height: 150,
                                    child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: _resto!.menus.foods.length,
                                      itemBuilder: (_, index) {
                                        return InkWell(
                                          onTap: () {
                                            setState(() {
                                              if (selectedFoodIndex == index) {
                                                selectedFoodIndex = -1;
                                              } else {
                                                selectedFoodIndex = index;
                                              }
                                            });
                                          },
                                          child: UsableMenus.selection(
                                            menus:
                                                "${index + 1}. ${_resto!.menus.foods[index].name}",
                                            isSelected:
                                                selectedFoodIndex == index
                                                    ? true
                                                    : false,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Scrollbar(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Container(
                                      margin: const EdgeInsets.only(top: 10),
                                      height: 150,
                                      child: ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        itemCount: _resto!.menus.drinks.length,
                                        itemBuilder: (_, index) {
                                          return InkWell(
                                            onTap: () {
                                              setState(() {
                                                if (selectedDrinkIndex ==
                                                    index) {
                                                  selectedDrinkIndex = -1;
                                                } else {
                                                  selectedDrinkIndex = index;
                                                }
                                              });
                                            },
                                            child: UsableMenus.selection(
                                              menus:
                                                  "${index + 1}. ${_resto!.menus.drinks[index].name}",
                                              isSelected:
                                                  selectedDrinkIndex == index
                                                      ? true
                                                      : false,
                                            ),
                                          );
                                        },
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Divider(
                          color: Colors.black,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.maxFinite,
                          height: 70,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ButtonReusable.icon(
                                backgroundColor: Colors.grey.withOpacity(0.4),
                                height: 50,
                                itemSize: 20,
                                width: 70,
                                borderColor: Colors.black,
                                icon: Icons.favorite_border,
                              ),
                              ButtonReusable.text(
                                text: "Order now",
                                height: 50,
                                width: 290,
                                itemSize: 20,
                                backgroundColor: Colors.grey.withOpacity(0.4),
                                borderColor: Colors.black,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

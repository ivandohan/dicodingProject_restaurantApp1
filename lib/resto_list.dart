import 'package:dicodingproject_restaurantapp/restaurant.dart';
import 'package:dicodingproject_restaurantapp/resto_details.dart';
import 'package:flutter/material.dart';

class RestoList extends StatelessWidget {
  static const routeName = '/resto_list';

  RestoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _appBarAdjustment,
        body: bodyAdjustment(context));
  }

  // Components Detail
  // I tried to split them up from build, i thought this is the way to make it looks clean
  final _appBarAdjustment = AppBar(
    title: const Text('Restaurant App'),
    backgroundColor: Colors.black87.withOpacity(0.9),
    elevation: 0.1,
    actions: <Widget>[
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.list),
      ),
    ],
  );

  FutureBuilder<String> bodyAdjustment(BuildContext context) =>
      FutureBuilder<String>(
        future: DefaultAssetBundle.of(context)
            .loadString('assets/local_restaurants.json'),
        builder: (context, snapshot) {
          // final List<Restaurant> resto = restaurantFromJson(snapshot.data!);
          final List<Restaurant> resto = parseResto(snapshot.data);
          return ListView.builder(
            itemCount: resto.length,
            itemBuilder: (context, index) {
              return _buildItem(context, resto[index]);
            },
          );
        },
      );

  // Tiling
  Widget _buildItem(BuildContext context, Restaurant resto) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.4),
          borderRadius: BorderRadius.circular(10),
        ),
        child: tilingItemAdjustment(context, resto),
      ),
    );
  }

  ListTile tilingItemAdjustment(BuildContext context, Restaurant resto) =>
      ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          padding: const EdgeInsets.only(right: 12),
          decoration: const BoxDecoration(
              border:
                  Border(right: BorderSide(width: 2.4, color: Colors.black26))),
          child: Image.network(
            resto.pictureId,
            width: 85,
            errorBuilder: (ctx, error, _) => const Center(
              child: Icon(Icons.error),
            ),
          ),
        ),
        title: Text(
          resto.name,
          style: const TextStyle(
              color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: Colors.black45,
                  size: 15,
                ),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  resto.city,
                  style: const TextStyle(color: Colors.black45),
                )
              ],
            ),
            Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.black45,
                  size: 15,
                ),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  (resto.rating).toString(),
                  style: const TextStyle(
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
          ],
        ),
        trailing: const Icon(
          Icons.keyboard_arrow_right,
          color: Colors.black26,
          size: 30,
        ),
        onTap: () {
          Navigator.pushNamed(
            context,
            DetailPage.routeName,
            arguments: resto,
          );
        },
      );
}

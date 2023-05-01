import 'package:dicodingproject_restaurantapp/restaurant.dart';
import 'package:flutter/material.dart';

class RestoList extends StatelessWidget {
  static const routeName = '/resto_list';

  RestoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(58, 66, 86, 1.0),
        appBar: appBarAdjustment,
        body: bodyAdjustment(context));
  }

  // Components Detail
  // I tried to split them up from build, i thought this is the way to make it looks clean

  final appBarAdjustment = AppBar(
    title: const Text('Restaurant App'),
    backgroundColor: const Color.fromRGBO(58, 66, 86, 1.0),
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
      elevation: 1.0,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Container(
        decoration: const BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
        child: tilingItemAdjustment(resto),
      ),
    );
  }

  ListTile tilingItemAdjustment(Restaurant resto) => ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          padding: const EdgeInsets.only(right: 12),
          decoration: const BoxDecoration(
              border:
                  Border(right: BorderSide(width: 1.0, color: Colors.white24))),
          child: Image.network(
            resto.pictureId,
            width: 85,
            errorBuilder: (ctx, error, _) => const Center(
              child: Icon(Icons.error),
            ),
          ),
        ),
        title: Row(
          children: [
            Text(
              resto.name,
              style: const TextStyle(
                  color: Colors.white70, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: Colors.white54,
                  size: 15,
                ),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  resto.city,
                  style: const TextStyle(color: Colors.white38),
                )
              ],
            ),
            Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.white54,
                  size: 15,
                ),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  (resto.rating).toString(),
                  style: const TextStyle(color: Colors.white38),
                ),
              ],
            ),
          ],
        ),
        trailing: const Icon(
          Icons.keyboard_arrow_right,
          color: Colors.white,
          size: 30,
        ),
        onTap: () {},
      );
}

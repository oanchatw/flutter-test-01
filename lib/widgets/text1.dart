import 'package:abc12/model/cloths.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) => Text("AZAAAAAABBCCaa");
}

class StFulW extends StatefulWidget {
  const StFulW({super.key});

  @override
  State<StFulW> createState() => _StFulWState();
}

class _StFulWState extends State<StFulW> {
  int count = 0;

  void onClick() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(" count: ${count}"),
          TextButton(onPressed: onClick, child: const Text("tap me"))
        ],
      );
}

class ClothView extends StatelessWidget {
  final Cloth cloth;
  const ClothView({super.key, required this.cloth});

  @override
  Widget build(BuildContext context) => Card(
        child: Column(
          children: [
            Text(cloth.title),
            if (cloth.images.isNotEmpty)
              SizedBox(
                height: 240,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: cloth.images.length,
                  scrollDirection: Axis.horizontal,
                  physics: AlwaysScrollableScrollPhysics(),
                  itemBuilder: (ctx, id) => Image.network(
                    cloth.images[id],
                    width: 240,
                    height: 240,
                  ),
                ),
              ),
            Text(cloth.description),
            Text(cloth.price.toString()),
            Text(cloth.category.name),
          ],
        ),
      );
}

import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';

import 'package:flutter/material.dart';

class ArticlesWidget extends StatelessWidget {
  const ArticlesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Theme.of(context).cardColor,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      child: Row(children: [
        FancyShimmerImage(
            height: size.height * 0.12,
            width: size.height * 0.12,
            boxFit: BoxFit.fill,
            imageUrl:
                'https://st2.depositphotos.com/2448349/7085/v/450/depositphotos_70856769-stock-illustration-animal-watercolor-illustration-decorative-silhouette.jpg')
      ]),
    );
  }
}

// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:weatherapp/constants/my_colors.dart';
import 'package:weatherapp/constants/strings.dart';
import 'package:weatherapp/data/models/charachters.dart';

// build one pic of all the grid
class CharachterItem extends StatelessWidget {
  final Charachter charachter;
  const CharachterItem({Key? key, required this.charachter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: MyColors.myWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, charachterDetailsScreen,
            arguments: charachter),
        child: GridTile(
          //animation

          child: Hero(
            tag: charachter.charId,
            child: Container(
                color: MyColors.myGrey,
                child: charachter.image.isNotEmpty
                    ? FadeInImage.assetNetwork(
                        width: double.infinity,
                        height: double.infinity,
                        placeholder: 'assets/images/97930-loading.gif',
                        image: charachter.image,
                        fit: BoxFit.cover,
                      )
                    : Image.asset('assets/images/notfound.jpg')),
          ),
          footer: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            child: Text(
              '${charachter.name}',
              style: const TextStyle(
                height: 1.3,
                fontSize: 16,
                color: MyColors.myWhite,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

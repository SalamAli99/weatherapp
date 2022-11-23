import 'package:flutter/material.dart';
import 'package:weatherapp/constants/my_colors.dart';
import 'package:weatherapp/data/models/charachters.dart';

class CharachterDetailsScreen extends StatelessWidget {
  final Charachter charachter;

  const CharachterDetailsScreen({Key? key, required this.charachter})
      : super(key: key);
  buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      centerTitle: true,
      backgroundColor: MyColors.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          charachter.nickName,
          style: const TextStyle(color: MyColors.myWhite),
        ),
        background: Hero(
            tag: charachter.charId,
            child: Image.network(
              charachter.image,
              fit: BoxFit.cover,
            )),
      ),
    );
  }

  Widget charachterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(
              color: MyColors.myWhite,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
              text: value,
              style: const TextStyle(
                color: MyColors.myWhite,
                fontSize: 16,
              ))
        ],
      ),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
        color: MyColors.myYellow,
        height: 30,
        endIndent: endIndent,
        thickness: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(slivers: [
        buildSliverAppBar(),
        SliverList(
            delegate: SliverChildListDelegate([
          Container(
            margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                charachterInfo('Job : ', charachter.jobs.join(' / ')),
                buildDivider(315),
                charachterInfo(
                    'Appeared in : ', charachter.categoryForTwoSeries),
                buildDivider(250),
                charachterInfo(
                    'seassons : ', charachter.apperanceOfSessons.join(' / ')),
                buildDivider(280),
                charachterInfo('status : ', charachter.statusIfDeadOrAlive),
                buildDivider(300),
                charachter.betterCallSaulApperance.isEmpty
                    ? Container()
                    : charachterInfo('Better Call Saul Season : ',
                        charachter.betterCallSaulApperance.join(' / ')),
                charachter.betterCallSaulApperance.isEmpty
                    ? Container()
                    : buildDivider(150),
                charachterInfo('Actor/Actress : ', charachter.actorName),
                buildDivider(235),
              ],
            ),
          ),
          const SizedBox(height: 500)
        ]))
      ]),
    );
  }
}

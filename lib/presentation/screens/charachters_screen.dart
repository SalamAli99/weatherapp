import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/business_logic/cubit/charachters_cubit.dart';
import 'package:weatherapp/constants/my_colors.dart';
import 'package:weatherapp/data/models/charachters.dart';
import 'package:weatherapp/presentation/widgets/charachter_item.dart';

class CharachtersScreen extends StatefulWidget {
  const CharachtersScreen({Key? key}) : super(key: key);

  @override
  State<CharachtersScreen> createState() => _CharachtersScreenState();
}

class _CharachtersScreenState extends State<CharachtersScreen> {
  late List<Charachter> allCharachters;
  late List<Charachter> searchedForCharachter;
  bool _isSearching = false;
  final _searchTextController = TextEditingController();

  Widget _buildSearchField() {
    return TextField(
      controller: _searchTextController,
      cursorColor: MyColors.myGrey,
      decoration: const InputDecoration(
        hintText: 'Find a Charachter',
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: MyColors.myGrey,
          fontSize: 18,
        ),
      ),
      style: const TextStyle(
        color: MyColors.myGrey,
        fontSize: 18,
      ),
      onChanged: (searchedCharachter) {
        addSearchedForItemsToSearchedList(searchedCharachter);
      },
    );
  }

  void addSearchedForItemsToSearchedList(String searchedCharachter) {
    searchedForCharachter = allCharachters
        .where((charachter) =>
            charachter.name.toLowerCase().startsWith(searchedCharachter))
        .toList();
    setState(() {});
  }

  List<Widget> _buildAppBarActions() {
    if (_isSearching) {
      return [
        IconButton(
            onPressed: () {
              _clearSearch();
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.clear,
              color: MyColors.myGrey,
            ))
      ];
    } else {
      return [
        IconButton(
            onPressed: _startSearch,
            icon: const Icon(
              Icons.search,
              color: MyColors.myGrey,
            ))
      ];
    }
  }

  void _startSearch() {
    //to make a back button
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearch();
    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearch() {
    setState(() {
      _searchTextController.clear();
    });
  }

  @override
  void initState() {
    super.initState();
    //ask for state

    BlocProvider.of<CharachtersCubit>(context).getAllCharachter();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharachtersCubit, CharachtersState>(
      builder: (context, state) {
        if (state is CharachtersLoaded) {
          allCharachters = (state).charachter;
          return buildLoadedListWidgets();
        } else {
          return showLoadingIndecator();
        }
      },
    );
  }

  Widget showLoadingIndecator() {
    return const Center(
      child: CircularProgressIndicator(
        color: MyColors.myYellow,
      ),
    );
  }

  Widget buildCharachtersList() {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: _searchTextController.text.isEmpty
            ? allCharachters.length
            : searchedForCharachter.length,
        itemBuilder: (ctx, index) {
          return CharachterItem(
            charachter: _searchTextController.text.isEmpty
                ? allCharachters[index]
                : searchedForCharachter[index],
          );
        });
  }

  Widget buildLoadedListWidgets() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.myGrey,
        child: Column(
          children: [
            buildCharachtersList(),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBarTitle() {
    return const Text(
      'Charachters',
      style: TextStyle(color: MyColors.myGrey),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myYellow,
        title: _isSearching ? _buildSearchField() : _buildAppBarTitle(),
        actions: _buildAppBarActions(),
        leading: _isSearching
            ? const BackButton(
                color: MyColors.myGrey,
              )
            : Container(),
      ),
      body: buildBlocWidget(),
    );
  }
}

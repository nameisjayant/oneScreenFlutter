import 'package:flutter/material.dart';
import 'package:one_screen_flutter/components/spacer_component.dart';
import 'package:one_screen_flutter/ui/colors.dart';
import 'package:one_screen_flutter/utils/image_path.dart';

class MatchScoreApp extends StatelessWidget {
  const MatchScoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: MatchScoreScreen(),
        backgroundColor: AppColors.matchBg,
      ),
    );
  }
}

class MatchScoreScreen extends StatefulWidget {
  const MatchScoreScreen({super.key});

  @override
  State<MatchScoreScreen> createState() => _MatchScoreScreenState();
}

class _MatchScoreScreenState extends State<MatchScoreScreen> {
  final TextEditingController search = TextEditingController();
  final List<SportModal> sportModalList = [
    SportModal(id: 1, title: 'Soccer', icon: ImagePath.soccer),
    SportModal(id: 2, title: 'Basket Ball', icon: ImagePath.basketball),
    SportModal(id: 3, title: 'Rubgy', icon: ImagePath.rubgy),
    SportModal(id: 4, title: 'Base Ball', icon: ImagePath.baseball),
    SportModal(id: 5, title: 'Cricket', icon: ImagePath.cricket)
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _searchTextField(controller: search),
        spacerHeight(height: 20),
        sportSection(
            selectedIndex: selectedIndex,
            onValueUpdate: (val) {
              setState(() {
                selectedIndex = val;
              });
            })
      ],
    );
  }

  // search text field
  Widget _searchTextField({required TextEditingController controller}) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 54,
          decoration: BoxDecoration(
              color: AppColors.matchTextField,
              borderRadius: BorderRadius.circular(14)),
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(
                hintText: 'Search your competition...',
                hintStyle: TextStyle(
                    color: AppColors.matchDarkGray,
                    fontSize: 14,
                    fontFamily: 'SourceSansPro',
                    fontWeight: FontWeight.normal),
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.matchDarkGray,
                  size: 30,
                ),
                border: InputBorder.none),
            style: const TextStyle(color: Colors.white),
          ),
        ));
  }

  // sport section
  Widget sportSection(
      {required int selectedIndex, required Function(int) onValueUpdate}) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        itemBuilder: (BuildContext context, index) {
          return selectionRow(
              title: sportModalList[index].title,
              index: index,
              icon: sportModalList[index].icon,
              selected: selectedIndex == index,
              onValueUpdate: onValueUpdate);
        },
        itemCount: sportModalList.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }


  // sport selection Row
  Widget selectionRow(
      {required String title,
      required int index,
      required String icon,
      required bool selected,
      required Function(int) onValueUpdate}) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0,left: 16),
      child: InkWell(
        onTap: () {
          onValueUpdate(index);
        },
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
              color: selected
                  ? AppColors.matchTextField
                  : AppColors.matchTextField,
              gradient: selected
                  ? const LinearGradient(colors: [
                      AppColors.matchLightOrange,
                      AppColors.matchOrange
                    ])
                  : const LinearGradient(colors: [
                      AppColors.matchTextField,
                      AppColors.matchTextField
                    ]),
              borderRadius: BorderRadius.circular(50)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Image.asset(
                  icon,
                  width: 24,
                  height: 24,
                ),
                if (selected)
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'SourceSansPro'),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SportModal {
  int id;
  String title;
  String icon;

  SportModal({required this.id, required this.title, required this.icon});
}

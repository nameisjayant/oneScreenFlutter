import 'package:flutter/material.dart';
import 'package:one_screen_flutter/components/icon_component.dart';
import 'package:one_screen_flutter/ui/colors.dart';
import 'package:one_screen_flutter/utils/image_path.dart';

class MatchScoreApp extends StatelessWidget {
  const MatchScoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MatchScoreScreen(),
        backgroundColor: AppColors.matchBg,
      ),
    );
  }
}

class MatchScoreScreen extends StatelessWidget {
  MatchScoreScreen({super.key});

  final TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [_searchTextField(controller: search)],
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
            decoration: InputDecoration(
                hintText: 'Search your competition',
                hintStyle: const TextStyle(
                    color: AppColors.matchDarkGray,
                    fontSize: 14,
                    fontFamily: 'SourceSansPro',
                    fontWeight: FontWeight.normal),
                prefixIcon: svgIconComponent(icon: ImagePath.searchIcon),
                border: InputBorder.none),
            style: const TextStyle(color: Colors.white),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/constants.dart';
import 'package:notesapp/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notesapp/widgets/custom_colors_item.dart';

class CustomColorsListViewBuilder extends StatefulWidget {
  const CustomColorsListViewBuilder({super.key});

  @override
  State<CustomColorsListViewBuilder> createState() =>
      _CustomColorsListViewBuilderState();
}

class _CustomColorsListViewBuilderState
    extends State<CustomColorsListViewBuilder> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        itemCount: kColorsList.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 6,
            ),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                BlocProvider.of<AddNoteCubit>(context).color =
                    kColorsList[index];
                setState(
                  () {},
                );
              },
              child: CustomColorsItem(
                color: kColorsList[index],
                isPicked: currentIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}

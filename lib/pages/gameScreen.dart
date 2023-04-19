import 'package:flutter/material.dart';
import 'package:my_bingo/constants/colorCode.dart';
import 'package:my_bingo/constants/constants.dart';
import 'package:my_bingo/constants/enum.dart';
import 'package:my_bingo/model/grid.dart';
import 'package:my_bingo/widgets/gridWidget.dart';

class GameScreen extends StatefulWidget {
  GameScreen({
    super.key,
    required this.grid,
    required this.difficulty,
  });

  Grid grid;
  Difficulty difficulty;

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          0, Constants.PAGE_MARGIN_TOP, 0, Constants.PAGE_MARGIN_BOTTOM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // const SizedBox(height: Constants.PAGE_MARGIN_TOP),
          getHeading(),
          const SizedBox(height: Constants.VERTICAL_GAP),
          getSubheading(),
          const SizedBox(height: Constants.VERTICAL_GAP),
          getGame(),
          const SizedBox(height: Constants.VERTICAL_GAP),
          getActions(),
        ],
      ),
    );
  }

  Text getHeading() {
    return Text(
      widget.grid.title,
      style: const TextStyle(
        color: ColorCode.BLUE,
        fontFamily: 'Orbitron',
        fontWeight: FontWeight.w500,
        fontSize: 32.0,
        letterSpacing: 3.0,
      ),
    );
  }

  Text getSubheading() {
    return Text(
      widget.difficulty.description,
      style: const TextStyle(
        color: ColorCode.GREY,
        fontFamily: 'Indie Flower',
        fontWeight: FontWeight.bold,
        fontSize: 16.0,
        letterSpacing: 2.0,
      ),
    );
  }

  Row getGameDetails() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        getLeftAlignedIcon(
          Icons.speed_rounded,
          widget.difficulty.level,
        ),
        getRightAlignedIcon(
          Icons.timer_outlined,
          "10:20",
        ),
      ],
    );
  }

  Widget getGame() {
    return Expanded(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              getLeftAlignedIcon(
                Icons.speed_rounded,
                widget.difficulty.level,
              ),
              getRightAlignedIcon(
                Icons.timer_outlined,
                "10:20",
              ),
            ],
          ),
          const SizedBox(height: Constants.VERTICAL_GAP),
          SizedBox.square(
            dimension: MediaQuery.of(context).size.width,
            child: GridWidget(grid: widget.grid),
          ),
        ],
      ),
    );
  }

  Row getActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        getLeftAlignedIcon(
          Icons.swap_horizontal_circle_outlined,
          "SWAP",
        ),
        const DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: ColorCode.BLACK_SHADOW,
                offset: Offset(0, 4),
                blurRadius: 8,
              )
            ],
          ),
          child: CircleAvatar(
            backgroundColor: ColorCode.CYAN,
            radius: 35.0,
            child: Center(
              child: Text(
                "Wild Cards",
                style: TextStyle(
                  color: ColorCode.GREY,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  letterSpacing: 2.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        getRightAlignedIcon(
          Icons.cyclone_outlined,
          "SPIN",
        ),
      ],
    );
  }

  Row getLeftAlignedIcon(IconData icon, String description) {
    return Row(
      children: [
        Icon(
          icon,
          color: ColorCode.BLUE,
        ),
        const SizedBox(
          width: Constants.ICON_ICON_DESCRIPTION_GAP,
        ),
        Text(
          // todo: add timer
          description,
          style: const TextStyle(
            color: ColorCode.BLUE,
            fontSize: 16.0,
            letterSpacing: 2.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Row getRightAlignedIcon(IconData icon, String description) {
    return Row(
      children: [
        Text(
          // todo: add timer
          description,
          style: const TextStyle(
            color: ColorCode.BLUE,
            fontSize: 16.0,
            letterSpacing: 2.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          width: Constants.ICON_ICON_DESCRIPTION_GAP,
        ),
        Icon(
          icon,
          color: ColorCode.BLUE,
        ),
      ],
    );
  }
}

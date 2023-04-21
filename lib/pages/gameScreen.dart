import 'package:flutter/material.dart';
import 'package:my_bingo/constants/colorCode.dart';
import 'package:my_bingo/constants/constants.dart';
import 'package:my_bingo/constants/enum.dart';
import 'package:my_bingo/model/grid.dart';
import 'package:my_bingo/services/actions.dart';
import 'package:my_bingo/widgets/backButton.dart';
import 'package:my_bingo/widgets/gridWidget.dart';
import 'package:my_bingo/widgets/winAlertBox.dart';

class GameScreen extends StatefulWidget {
  GameScreen({
    super.key,
  });

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late Grid grid;
  late Difficulty difficulty;

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)?.settings.arguments as Map;
    // debugPrint(data.toString());

    grid = data["grid"];
    difficulty = data["difficulty"];
    grid.initCounts();

    // debugPrint(grid.toString());
    // debugPrint(difficulty.toString());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
                0, Constants.PAGE_MARGIN_TOP, 0, Constants.PAGE_MARGIN_BOTTOM),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    getHeading(),
                    const SizedBox(height: Constants.VERTICAL_GAP),
                    getSubheading(),
                    const SizedBox(height: Constants.VERTICAL_GAP),
                    getGame(),
                    const SizedBox(height: Constants.VERTICAL_GAP),
                    getActions(),
                  ],
                ),
                const backButton(),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: ColorCode.PEACH,
    );
  }

  Text getHeading() {
    return Text(
      grid.title,
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
      difficulty.description,
      style: const TextStyle(
        color: ColorCode.GREY,
        fontFamily: 'Indie Flower',
        fontWeight: FontWeight.bold,
        fontSize: 16.0,
        letterSpacing: 2.0,
      ),
    );
  }

  Widget getGame() {
    return Expanded(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getLeftAlignedIcon(
                Icons.speed_rounded,
                difficulty.level,
              ),
              // getRightAlignedIcon(
              //   Icons.timer_outlined,
              //   "10:20",
              // ),
            ],
          ),
          const SizedBox(height: Constants.VERTICAL_GAP),
          SizedBox.square(
            dimension: MediaQuery.of(context).size.width,
            child: GridWidget(
              grid: grid,
              difficulty: difficulty,
              onWin: (value) => showDialog(
                context: context,
                builder: ((context) => const WinAlertBox()),
                barrierColor: ColorCode.WHITE_SHADOW,
              ),
              // {if (value) print("${difficulty.level} level BINGO!!")},
            ),
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
          ActionService.swap,
          {
            "tiles": grid.tiles,
            "n_col": grid.n_col,
          },
        ),
        // getWildCardButton(),
        getRightAlignedIcon(
          Icons.cyclone_outlined,
          "SPIN",
          ActionService.spin,
          {
            "tiles": grid.tiles,
            "n_col": grid.n_col,
          },
        ),
      ],
    );
  }

  DecoratedBox getWildCardButton() {
    return const DecoratedBox(
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
    );
  }

  TextButton getLeftAlignedIcon(IconData icon, String description,
      [Function? onPressed, Map? arguments]) {
    return TextButton(
      onPressed: () {
        if (onPressed != null) {
          setState(() {
            onPressed(arguments);
          });
        }
      },
      style: const ButtonStyle(
        overlayColor: MaterialStatePropertyAll(Colors.transparent),
      ),
      child: Row(
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
      ),
    );
  }

  TextButton getRightAlignedIcon(IconData icon, String description,
      [Function? onPressed, Map? arguments]) {
    return TextButton(
      onPressed: () {
        if (onPressed != null) {
          setState(() {
            onPressed(arguments);
          });
        }
      },
      style: const ButtonStyle(
        overlayColor: MaterialStatePropertyAll(Colors.transparent),
      ),
      child: Row(
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
      ),
    );
  }
}

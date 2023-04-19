enum Difficulty {
  EASY(
    level: "Easy",
    description: "Complete any line to BINGO!!",
  ),
  MEDIUM(
    level: "Medium",
    description: "Complete a row and column to BINGO!!",
  ),
  HARD(
    level: "Hard",
    description: "Complete full grid to BINGO!!",
  );

  final String level, description;

  const Difficulty({required this.level, required this.description});
}

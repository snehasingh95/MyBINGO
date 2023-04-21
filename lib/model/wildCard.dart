class WildCard {
  String title;
  String description;
  Function? action;
  Map? arguments;

  WildCard({
    required this.title,
    required this.description,
    required this.action,
    required this.arguments,
  });

  void useCard() {
    if (action != null) {
      action!(arguments);
    }
  }
}

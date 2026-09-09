class CliclableButtonModel {
  final String iconName;
  final String? title;
  final void Function()? onTap;

  CliclableButtonModel({
    required this.iconName,
    this.title,
    this.onTap,
  });
}

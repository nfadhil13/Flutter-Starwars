part of '../species_detail_screen.dart';

class _Error extends StatelessWidget {
  final String errorMessage;
  const _Error({Key? key, required this.errorMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(errorMessage),
        PrimaryButton(text: "Retry to get data", onPressed: () {})
      ],
    );
  }
}

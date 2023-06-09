part of 'a_components.dart';

class Pad extends StatelessWidget {
  final double width, height;

  const Pad({super.key, this.width = 0, this.height = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
    );
  }
}

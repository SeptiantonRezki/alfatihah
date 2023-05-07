part of "a_widgets.dart";

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int index)? onTap;

  const CustomBottomNavBar({super.key, this.selectedIndex = 0, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      color: Theme.of(context).primaryColor,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          // color: "#192126".toColor(),
        ),
        // padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 1,
              child: GestureDetector(
                  onTap: () => onTap != null ? onTap!(0) : () {},
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        // color: "#192126".toColor(),
                      ),
                      height: 60,
                      child: Icon(((selectedIndex == 0) ? FlutterIslamicIcons.solidQuran2 : FlutterIslamicIcons.quran2), color: Colors.white))),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                  onTap: () => onTap != null ? onTap!(1) : () {},
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        // color: "#192126".toColor(),
                      ),
                      height: 60,
                      child: Icon(((selectedIndex == 0) ? FlutterIslamicIcons.prayer : FlutterIslamicIcons.solidPrayer), color: Colors.white))),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                  onTap: () => onTap != null ? onTap!(2) : () {},
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        // color: "#192126".toColor(),
                      ),
                      height: 60,
                      child: Icon(((selectedIndex == 1) ? Icons.settings : Icons.settings), color: Colors.white))),
            ),
            // Expanded(
            //   flex: 1,
            //   child: GestureDetector(
            //       onTap: () => onTap != null ? onTap!(2) : () {},
            //       child: Container(
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(50),
            //             color: "#192126".toColor(),
            //           ),
            //           width: double.infinity,
            //           height: 60,
            //           child: Icon(((selectedIndex == 2) ? MdiIcons.listBox : MdiIcons.listBoxOutline), color: Colors.white))),
            // ),
            // Expanded(
            //   flex: 1,
            //   child: GestureDetector(
            //       onTap: () => onTap != null ? onTap!(3) : () {},
            //       child: Container(
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(50),
            //             color: "#192126".toColor(),
            //           ),
            //           width: double.infinity,
            //           height: 60,
            //           child: Icon(((selectedIndex == 3) ? MdiIcons.account : MdiIcons.accountOutline), color: Colors.white))),
            // )
          ],
        ),
      ),
    );
  }
}

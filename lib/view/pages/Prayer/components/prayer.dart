part of '../index.dart';

class PrayerComponent extends StatelessWidget {
  final Doa dataDoa;
  const PrayerComponent({super.key, required this.dataDoa});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dataDoa.nama.toString(), style: const TextStyle(fontSize: 25), overflow: TextOverflow.ellipsis),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                dataDoa.nama.toString(),
                style: GoogleFonts.getFont('Lato').copyWith(fontSize: 20),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
              width: MediaQuery.of(context).size.width,
              child: Text(
                dataDoa.lafal.toString(),
                style: GoogleFonts.getFont('Lato').copyWith(fontSize: 25),
                textAlign: TextAlign.right,
              ),
            ),
            const Divider(),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Text(
                "\" ${dataDoa.transliterasi.toString()} \"",
                style: GoogleFonts.getFont('Lato').copyWith(
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            const Divider(),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: BoxDecoration(
                  // color: Theme.of(context).primaryColorLight,
                  borderRadius: BorderRadius.circular(15),
                  border: Border(
                    bottom: BorderSide(color: Theme.of(context).primaryColor.withOpacity(0.3)),
                    left: BorderSide(color: Theme.of(context).primaryColor.withOpacity(0.3)),
                    right: BorderSide(color: Theme.of(context).primaryColor.withOpacity(0.3)),
                    top: BorderSide(color: Theme.of(context).primaryColor.withOpacity(0.3)),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).primaryColor.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ]),
              width: MediaQuery.of(context).size.width,
              child: Text(
                dataDoa.arti.toString(),
                style: GoogleFonts.getFont('Lato').copyWith(fontSize: 15, height: 1.5),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

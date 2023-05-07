part of 'index.dart';

class SurahComponent extends StatefulWidget {
  final Future<Surah> functionGetSurah;

  const SurahComponent({super.key, required this.functionGetSurah});

  @override
  State<SurahComponent> createState() => _SurahComponentState();
}

class _SurahComponentState extends State<SurahComponent> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Surah>(
      future: widget.functionGetSurah,
      builder: (BuildContext context, AsyncSnapshot<Surah> snapshot) {
        List<Widget> children;
        if (snapshot.hasData) {
          int index = 0;
          children = snapshot.data!.verses!.map((e) {
            index = index + 1;
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(border: Border.all(color: Theme.of(context).primaryColor), borderRadius: const BorderRadius.all(Radius.circular(15))),
                        child: Center(
                          child: Text(
                            index.toString(),
                            style: const TextStyle(fontSize: 14),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              e.text ?? '',
                              style: GoogleFonts.getFont('Lato').copyWith(fontSize: 25),
                              textAlign: TextAlign.right,
                            ),
                            Divider(color: Theme.of(context).primaryColor),
                            Text(
                              e.translationId ?? '',
                              style: const TextStyle(fontSize: 14),
                              textAlign: TextAlign.right,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(),
              ],
            );
          }).toList();
        } else if (snapshot.hasError) {
          children = <Widget>[
            const Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text('Error: ${snapshot.error}'),
            ),
          ];
        } else {
          children = const <Widget>[
            SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text('Awaiting result...'),
            ),
          ];
        }
        return Container(
          margin: const EdgeInsets.only(bottom: 70),
          child: ListView(
            children: [
              const SizedBox(height: 20),
              Column(
                children: children,
              ),
            ],
          ),
        );
      },
    );
  }
}

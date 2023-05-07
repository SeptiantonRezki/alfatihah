part of 'index.dart';

List<SurahList> surahData = [
  SurahList(id: 1, titleSurah: 'الفاتحة', titleSurahLatin: "Al-Fatiha", resource: 'assets/1.json', resourceMP3: '1.mp3'),
  SurahList(id: 36, titleSurah: 'يس', titleSurahLatin: "Yasin", resource: 'assets/36.json', resourceMP3: '36.mp3'),
];

class MainSurah extends StatefulWidget {
  const MainSurah({super.key});

  @override
  State<MainSurah> createState() => _MainSurahState();
}

class _MainSurahState extends State<MainSurah> {
  List<SurahList> copySurahList = [];

  void searchFunction(String searchValue) {
    if (searchValue == '') {
      setState(() {
        copySurahList = [...surahData];
      });
    } else {
      List<SurahList> searchResults = [];
      for (var item in surahData) {
        if (item.titleSurahLatin.toLowerCase().contains(searchValue.toLowerCase())) {
          searchResults.add(item);
        } else {}
      }
      setState(() {
        copySurahList = searchResults;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      copySurahList = [...surahData];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              onChanged: searchFunction,
              decoration: InputDecoration(
                hintText: "Search...",
                // prefixIcon: Icon(Icons.search, color: Theme.of(context).primaryColor),
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
                border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                  children: copySurahList
                      .map(
                        (item) => Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => PageSurah(surahList: item)),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    item.id.toString(),
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        item.titleSurah,
                                        textAlign: TextAlign.right,
                                        style: Theme.of(context).textTheme.titleLarge,
                                      ),
                                      Text(
                                        item.titleSurahLatin,
                                        textAlign: TextAlign.right,
                                        style: Theme.of(context).textTheme.bodySmall,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList()),
            ),
            Container(),
          ],
        ),
      ),
    );
  }
}

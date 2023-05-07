part of 'index.dart';

class MainPrayer extends StatefulWidget {
  const MainPrayer({super.key});

  @override
  State<MainPrayer> createState() => _MainPrayerState();
}

class _MainPrayerState extends State<MainPrayer> {
  List<Doa> dataDoaReal = [];
  List<Doa> copyDataDoa = [];

  Future<void> getDataDoa() async {
    String data = await DefaultAssetBundle.of(context).loadString("assets/doa.json");
    final jsonResult = jsonDecode(data);
    List<Doa> doaData = [];
    for (var item1 in jsonResult) {
      doaData.add(Doa.fromJson(item1));
    }
    setState(() {
      dataDoaReal = doaData;
      copyDataDoa = doaData;
    });
  }

  void searchFunction(String searchValue) {
    if (searchValue == '') {
      setState(() {
        copyDataDoa = [...dataDoaReal];
      });
    } else {
      List<Doa> searchResults = [];
      for (var item in dataDoaReal) {
        if (item.nama != null) {
          if (item.nama!.toLowerCase().contains(searchValue.toLowerCase())) {
            searchResults.add(item);
          }
        }
      }
      setState(() {
        copyDataDoa = searchResults;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getDataDoa();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        margin: const EdgeInsets.only(bottom: 50),
        child: Column(
          children: [
            Container(),
            Expanded(
              child: ListView(
                children: [
                  TextField(
                    onChanged: searchFunction,
                    decoration: InputDecoration(
                      hintText: "Search...",
                      prefixIcon: Icon(Icons.search, color: Theme.of(context).primaryColor),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Theme.of(context).primaryColor),
                      ),
                      border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    children: copyDataDoa.map((item) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => PrayerComponent(dataDoa: item)),
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
                            child: SizedBox(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.nama.toString(),
                                    textAlign: TextAlign.left,
                                    style: Theme.of(context).textTheme.titleMedium,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const Divider(),
                                  Text(
                                    item.riwayat.toString(),
                                    textAlign: TextAlign.left,
                                    style: Theme.of(context).textTheme.bodySmall,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            Container(),
          ],
        ),
      ),
    );
  }
}

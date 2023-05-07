part of 'index.dart';

class PageSurah extends StatefulWidget {
  final SurahList surahList;
  const PageSurah({super.key, required this.surahList});

  @override
  State<PageSurah> createState() => _PageSurahState();
}

class _PageSurahState extends State<PageSurah> {
  String titlePage = '';

  Future<Surah> getDataSurah() async {
    String data = await DefaultAssetBundle.of(context).loadString(widget.surahList.resource);
    final jsonResult = jsonDecode(data);
    Surah surah = Surah.fromJson(jsonResult);
    if (titlePage == '') setState(() => titlePage = surah.nameTranslations?.ar ?? '');
    return surah;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titlePage, style: const TextStyle(fontSize: 25)),
      ),
      body: Stack(
        children: [SurahComponent(functionGetSurah: getDataSurah()), PlaySurahComponent(surahList: widget.surahList)],
      ),
    );
  }
}

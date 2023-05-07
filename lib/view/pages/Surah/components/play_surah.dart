part of 'index.dart';

class PlaySurahComponent extends StatefulWidget {
  final SurahList surahList;

  const PlaySurahComponent({super.key, required this.surahList});

  @override
  State<PlaySurahComponent> createState() => _PlaySurahComponentState();
}

class _PlaySurahComponentState extends State<PlaySurahComponent> {
  AudioPlayer audioPlayers = AudioPlayer();
  late StreamSubscription streamAudio;
  bool conditionFileExist = false;

  // @override
  // void initState() {
  //   super.initState();
  //   streamAudio = audioPlayers.onPlayerStateChanged.listen(
  //     (it) {
  //       switch (it) {
  //         case PlayerState.stopped:
  //           toast(
  //             'Player stopped!',
  //             textKey: const Key('toast-player-stopped'),
  //           );
  //           break;
  //         case PlayerState.completed:
  //           toast(
  //             'Player complete!',
  //             textKey: const Key('toast-player-complete'),
  //           );
  //           break;
  //         default:
  //           break;
  //       }
  //     },
  //   );
  //   streamAudio = audioPlayers.onSeekComplete.listen(
  //     (it) {},
  //   );
  // }

  // Future<void> setSourceAudio() async => await audioPlayers.setSource(AssetSource(widget.surahList.resourceMP3)); //alfatihah.mp3

  Future<void> setSourceAudio() async {
    try {
      final Directory? directory = await getExternalStorageDirectory();
      String filePath = '${directory?.path}/${widget.surahList.resourceMP3}';
      await audioPlayers.setSource(DeviceFileSource(filePath));
    } catch (e) {}
  }

  Future<void> downloadFile(BuildContext context) async {
    try {
      // Get the file path on device
      final Directory? directory = await getExternalStorageDirectory();

      String filePath = '${directory?.path}/${widget.surahList.resourceMP3}';

      // Get the reference to the file on Firebase Storage
      Reference ref = FirebaseStorage.instance.ref().child(widget.surahList.resourceMP3);

      // Download the file to device
      File file = File(filePath);
      // final downloadTask = ref.writeToFile(file);
      await ref.writeToFile(file);
      // downloadTask.snapshotEvents.listen((taskSnapshot) {
      //   switch (taskSnapshot.state) {
      //     case TaskState.running:
      //       final snackBar = SnackBar(
      //         content: Text('This is a snackbar running'),
      //         action: SnackBarAction(
      //           label: 'Undo',
      //           onPressed: () {
      //             // Some code to undo the change.
      //           },
      //         ),
      //       );

      //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
      //       break;
      //     case TaskState.paused:
      //       final snackBar = SnackBar(
      //         content: Text('This is a snackbar paused'),
      //         action: SnackBarAction(
      //           label: 'Undo',
      //           onPressed: () {
      //             // Some code to undo the change.
      //           },
      //         ),
      //       );

      //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
      //       break;
      //     case TaskState.success:
      //       final snackBar = SnackBar(
      //         content: Text('This is a snackbar success'),
      //         action: SnackBarAction(
      //           label: 'Undo',
      //           onPressed: () {
      //             // Some code to undo the change.
      //           },
      //         ),
      //       );

      //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
      //       break;
      //     case TaskState.canceled:
      //       final snackBar = SnackBar(
      //         content: Text('This is a snackbar canceled'),
      //         action: SnackBarAction(
      //           label: 'Undo',
      //           onPressed: () {
      //             // Some code to undo the change.
      //           },
      //         ),
      //       );

      //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
      //       break;
      //     case TaskState.error:
      //       final snackBar = SnackBar(
      //         content: Text('This is a snackbar error'),
      //         action: SnackBarAction(
      //           label: 'Undo',
      //           onPressed: () {
      //             // Some code to undo the change.
      //           },
      //         ),
      //       );

      //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
      //       break;
      //   }
      // });
    } catch (e) {
      log(e.toString());
    } finally {
      Navigator.pop(context);
    }
  }

  Future<void> checkFileExist() async {
    final Directory? directory = await getExternalStorageDirectory();
    final file = File('${directory?.path}/${widget.surahList.resourceMP3}');
    setState(() {
      conditionFileExist = file.existsSync();
    });
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayers.dispose();
  }

  @override
  void initState() {
    super.initState();
    checkFileExist();
    setSourceAudio();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Container(),
            Expanded(
              child: Container(
                color: Theme.of(context).primaryColor,
                child: SizedBox(
                  child: Stack(
                    children: [
                      PlayerWidget(player: audioPlayers),
                      conditionFileExist
                          ? Container()
                          : Container(
                              height: 70,
                              color: Theme.of(context).primaryColor.withOpacity(0.5),
                            ),
                    ],
                  ),
                ),
              ),
            ),
            conditionFileExist == true
                ? Container()
                : Container(
                    height: 70,
                    color: Colors.white,
                    child: Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(35)),
                        child: IconButton(
                            onPressed: () async => await downloadFile(context),
                            icon: Icon(
                              Icons.download,
                              color: Theme.of(context).primaryColor,
                            ))),
                  ),
          ],
        ),
      ),
    );
  }
}

part of 'a_tabs.dart';

const useLocalServer = bool.fromEnvironment('USE_LOCAL_SERVER');

final localhost = kIsWeb || !Platform.isAndroid ? 'localhost' : '10.0.2.2';
final host = useLocalServer ? 'http://$localhost:8080' : 'https://luan.xyz';

final wavUrl1 = '$host/files/audio/coins.wav';
final wavUrl2 = '$host/files/audio/laser.wav';
final mp3Url1 = '$host/files/audio/ambient_c_motion.mp3';
final mp3Url2 = '$host/files/audio/nasa_on_a_mission.mp3';
final m3u8StreamUrl =
    useLocalServer ? '$host/files/live_streams/nasa_power_of_the_rovers.m3u8' : 'https://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/nonuk/sbr_low/ak/bbc_radio_one.m3u8';
const mpgaStreamUrl = 'https://timesradio.wireless.radio/stream';

const asset1 = 'laser.wav';
const asset2 = 'alfatihah.mp3';

enum InitMode { setSource, play }

class SourcesTab extends StatefulWidget {
  final AudioPlayer player;

  const SourcesTab({super.key, required this.player});

  @override
  State<SourcesTab> createState() => _SourcesTabState();
}

class _SourcesTabState extends State<SourcesTab> with AutomaticKeepAliveClientMixin<SourcesTab> {
  InitMode initMode = InitMode.setSource;

  AudioPlayer get player => widget.player;

  Future<void> setSource(Source source) async {
    if (initMode == InitMode.setSource) {
      await player.setSource(source);
      toast('Completed setting source.', textKey: const Key('toast-source-set'));
    } else {
      await player.stop();
      await player.play(source);
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return TabContent(
      children: [
        EnumTgl(
          options: {for (var e in InitMode.values) 'initMode-${e.name}': e},
          selected: initMode,
          onChange: (InitMode m) => setState(() {
            initMode = m;
          }),
        ),
        Btn(
          key: const Key('setSource-asset-mp3'),
          txt: 'Asset 2 - nasa.mp3',
          onPressed: () => setSource(AssetSource(asset2)),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}

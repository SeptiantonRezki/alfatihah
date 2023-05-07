part of 'a_tabs.dart';

class LoggerTab extends StatefulWidget {
  const LoggerTab({super.key});

  @override
  _LoggerTabState createState() => _LoggerTabState();
}

class _LoggerTabState extends State<LoggerTab> {
  static GlobalPlatformInterface get _logger => AudioPlayer.global;

  LogLevel currentLogLevel = _logger.logLevel;

  @override
  Widget build(BuildContext context) {
    return TabContent(
      children: [
        ListTile(
          title: Text(currentLogLevel.toString()),
          subtitle: const Text('Log Level'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: LogLevel.values
              .map(
                (e) => Btn(
                  txt: e.toString().replaceAll('LogLevel.', ''),
                  onPressed: () async {
                    await _logger.changeLogLevel(e);
                    setState(() => currentLogLevel = _logger.logLevel);
                  },
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

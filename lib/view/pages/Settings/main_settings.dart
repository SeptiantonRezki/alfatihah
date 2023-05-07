part of 'index.dart';

class MainSettings extends StatefulWidget {
  const MainSettings({super.key});

  @override
  State<MainSettings> createState() => _MainSettingsState();
}

class _MainSettingsState extends State<MainSettings> {
  bool darkMode = false;

  @override
  void initState() {
    super.initState();
    if (MyApp.themeNotifier.value == ThemeMode.light) {
      setState(() {
        darkMode = false;
      });
    } else {
      setState(() {
        darkMode = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 0, top: 20),
          child: Column(
            children: [
              Container(
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
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Dark Mode',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(),
                    ),
                    Switch(
                      value: darkMode,
                      onChanged: (value) {
                        if (darkMode == true) {
                          MyApp.themeNotifier.value = MyApp.themeNotifier.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
                          setState(() {
                            darkMode = false;
                          });
                        } else {
                          MyApp.themeNotifier.value = MyApp.themeNotifier.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
                          setState(() {
                            darkMode = true;
                          });
                        }
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

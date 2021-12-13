import 'package:flutter/material.dart';

import 'custom_expansion_tile.dart';

class ExampleApp extends StatelessWidget {
  static const String _title = 'Expansion Example';

  const ExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const ExampleAppStatefulWidget(),
      ),
    );
  }
}

class ExampleAppStatefulWidget extends StatefulWidget {
  const ExampleAppStatefulWidget({Key? key}) : super(key: key);

  @override
  State<ExampleAppStatefulWidget> createState() => _ExampleAppStatefulWidgetState();
}

class _ExampleAppStatefulWidgetState extends State<ExampleAppStatefulWidget> {
  final List<GlobalKey<AppExpansionTileState>> globalKeys = [GlobalKey(), GlobalKey(), GlobalKey()];
  int currentIndexExpanded = -1;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: Column(
              children: <Widget>[
                CustomExpansionTile(
                  key: globalKeys[0],
                  title: const Text('ExpansionTile 1'),
                  initiallyExpanded: false,
                  children: const <Widget>[
                    ListTile(title: Text('This is tile number 1')),
                    ListTile(title: Text('This is tile number 2')),
                    ListTile(title: Text('This is tile number 3')),
                    ListTile(title: Text('This is tile number 4')),
                  ],
                  onExpansionChanged: (bool expanded) {
                    if (currentIndexExpanded != -1 && currentIndexExpanded != 0) {
                      globalKeys[currentIndexExpanded].currentState?.collapse();
                    }
                    currentIndexExpanded = expanded ? 0 : -1;
                  },
                ),
                CustomExpansionTile(
                  key: globalKeys[1],
                  title: const Text('ExpansionTile 2'),
                  initiallyExpanded: false,
                  children: const <Widget>[
                    ListTile(title: Text('This is tile number 5')),
                    ListTile(title: Text('This is tile number 6')),
                    ListTile(title: Text('This is tile number 7')),
                    ListTile(title: Text('This is tile number 8')),
                  ],
                  onExpansionChanged: (bool expanded) {
                    if (currentIndexExpanded != -1 && currentIndexExpanded != 1) {
                      globalKeys[currentIndexExpanded].currentState?.collapse();
                    }
                    currentIndexExpanded = expanded ? 1 : -1;
                  },
                ),
                CustomExpansionTile(
                  key: globalKeys[2],
                  title: const Text('ExpansionTile 3'),
                  initiallyExpanded: false,
                  children: const <Widget>[
                    ListTile(title: Text('This is tile number 9')),
                    ListTile(title: Text('This is tile number 10')),
                    ListTile(title: Text('This is tile number 11')),
                    ListTile(title: Text('This is tile number 12')),
                  ],
                  onExpansionChanged: (bool expanded) {
                    if (currentIndexExpanded != -1 && currentIndexExpanded != 2) {
                      globalKeys[currentIndexExpanded].currentState?.collapse();
                    }
                    currentIndexExpanded = expanded ? 2 : -1;
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';


class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<String> _entries = [];
  Future<void>? _futureEntries;

  Future<void> _loadEntries() async {
    // Simuliere eine Verzögerung von 2 Sekunden
    await Future.delayed(Duration(seconds: 2));
    // Hier würdest du die Einträge aus einer Datenquelle laden
    // Für dieses Beispiel verwenden wir eine leere Liste
  }

  void _addEntry() {
    setState(() {
      _entries.add(_textController.text);
      _textController.clear();
    });
  }

  void _removeEntry(int index) {
    setState(() {
      _entries.removeAt(index);
    });
  }

  @override
  void initState() {
    super.initState();
    _futureEntries = _loadEntries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste mit Textfeld'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Geben Sie einen Text ein',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _addEntry,
            child: Text('Hinzufügen'),
          ),
          Expanded(
            child: FutureBuilder<void>(
              future: _futureEntries,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    return ListView.builder(
                      itemCount: _entries.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_entries[index]),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () => _removeEntry(index),
                          ),
                        );
                      },
                    );
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}

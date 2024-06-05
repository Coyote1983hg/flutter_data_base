import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<String> _entries = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadEntries();
  }

  Future<void> _loadEntries() async {
    setState(() {
      _isLoading = true; // Setează _isLoading la true înainte de a încărca datele
    });

    // Simuliere einer Verzögerung von 2 Sekunden
    await Future.delayed(Duration(seconds: 2));
    // Hier würdest du die Einträge aus einer Datenquelle laden
    // Für dieses Beispiel verwenden wir eine leere Liste

    setState(() {
      _isLoading = false; // Setează _isLoading la false după ce datele au fost încărcate
    });
  }

  void _addEntry() {
    if (_textController.text.isNotEmpty) {
      setState(() {
        _entries.add(_textController.text);
        _textController.clear();
      });
    }
  }

  void _removeEntry(int index) {
    setState(() {
      _entries.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List with Textfeld'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Enter a text',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _addEntry,
            child: Text('Add'),
          ),
          Expanded(
            child: _isLoading
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
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

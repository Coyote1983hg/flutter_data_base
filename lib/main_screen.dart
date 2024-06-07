import 'package:flutter/material.dart';

import 'package:flutter_data_base/src/data/database_repository.dart';



class MainScreen extends StatefulWidget {
  final DatabaseRepository db;
  const MainScreen({super.key, required this.db});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String? firstName;
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
      _isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isLoading = false;
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
        title: const Text('List with Textfield'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _textController,
              decoration: const InputDecoration(
                hintText: 'Enter a text',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _addEntry,
            onLongPress: () async {
              firstName = await widget.db.getNameFromStorage();
              setState(() {});
            },
            child: const Text('Add'),
          ),
           OutlinedButton(
             onPressed: () async {
              firstName = await widget.db.getNameFromStorage();
              setState(() {});
            },
            child: const Text("Lies Vorname aus Speicher"),
          ),
          OutlinedButton(
            onPressed: () async {
              await widget.db.storeName("Giorgio");
            },
            child: const Text("Speicher Vorname"),
          ),
          Text(
            "Der Name ist: $firstName",
            style: Theme.of(context).textTheme.displayMedium,
          ),
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: _entries.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_entries[index]),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
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

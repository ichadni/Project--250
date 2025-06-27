import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PackingChecklistScreen extends StatefulWidget {
  const PackingChecklistScreen({super.key});

  @override
  State<PackingChecklistScreen> createState() => _PackingChecklistScreenState();
}

class _PackingChecklistScreenState extends State<PackingChecklistScreen> {
  final List<String> _items = [];
  final Set<int> _selectedIndexes = {};
  final TextEditingController _itemController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  Future<void> _loadItems() async {
    final prefs = await SharedPreferences.getInstance();
    final savedItems = prefs.getStringList('packing_items') ?? [];
    setState(() {
      _items.addAll(savedItems);
    });
  }

  Future<void> _saveItems() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('packing_items', _items);
  }

  void _addItem() {
    final newItem = _itemController.text.trim();
    if (newItem.isNotEmpty) {
      setState(() {
        _items.add(newItem);
        _itemController.clear();
      });
      _saveItems();
    }
  }

  void _deleteSelectedItems() {
    setState(() {
      final sortedIndexes = _selectedIndexes.toList()..sort((a, b) => b.compareTo(a));
      for (var index in sortedIndexes) {
        _items.removeAt(index);
      }
      _selectedIndexes.clear();
    });
    _saveItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Packing Checklist"),
        actions: [
          if (_selectedIndexes.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: _deleteSelectedItems,
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // Input field
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _itemController,
                    decoration: const InputDecoration(
                      labelText: "Add Item",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _addItem,
                  child: const Text("Add"),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // List
            Expanded(
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    title: Text(_items[index]),
                    value: _selectedIndexes.contains(index),
                    onChanged: (selected) {
                      setState(() {
                        if (selected!) {
                          _selectedIndexes.add(index);
                        } else {
                          _selectedIndexes.remove(index);
                        }
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/grocery_bloc.dart';
import '../bloc/grocery_event.dart';
import '../bloc/grocery_state.dart';
import '../models/grocery_item.dart';

class GroceryListScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grocery List'),
      ),
      body: BlocBuilder<GroceryBloc, GroceryState>(
        builder: (context, state) {
          if (state is GroceryInitial) {
            return Center(child: CircularProgressIndicator());
          } else if (state is GroceriesLoaded) {
            return ListView.builder(
              itemCount: state.groceries.length,
              itemBuilder: (context, index) {
                final item = state.groceries[index];
                return Dismissible(
                  key: Key(item.id),
                  onDismissed: (direction) {
                    context.read<GroceryBloc>().add(DeleteGrocery(item.id));
                  },
                  background: Container(color: Colors.red),
                  child: ListTile(
                    title: Text(item.name),
                    onTap: () => _showEditDialog(context, item),
                  ),
                );
              },
            );
          }
          return Center(child: Text('No groceries found.'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddDialog(context),
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Grocery Item'),
          content: TextField(
            controller: _controller,
            decoration: InputDecoration(hintText: 'Enter item name'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                final name = _controller.text;
                if (name.isNotEmpty) {
                  final item =
                      GroceryItem(id: DateTime.now().toString(), name: name);
                  context.read<GroceryBloc>().add(AddGrocery(item));
                  Navigator.pop(context);
                  _controller.clear();
                }
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _showEditDialog(BuildContext context, GroceryItem item) {
    _controller.text = item.name;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Grocery Item'),
          content: TextField(
            controller: _controller,
            decoration: InputDecoration(hintText: 'Enter new item name'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                final name = _controller.text;
                if (name.isNotEmpty) {
                  final updatedItem = item.copyWith(name: name);
                  context.read<GroceryBloc>().add(UpdateGrocery(updatedItem));
                  Navigator.pop(context);
                  _controller.clear();
                }
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}

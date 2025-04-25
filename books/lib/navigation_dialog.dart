import 'package:flutter/material.dart';

class NavigationDialogScreen extends StatefulWidget {
  const NavigationDialogScreen({super.key});

  @override
  State<NavigationDialogScreen> createState() => _NavigationDialogScreenState();
}

class _NavigationDialogScreenState extends State<NavigationDialogScreen> {
  Color color = Colors.purple.shade700;

  _showColorDialog(BuildContext context) async {
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('very important question'), 
          content: const Text('Choose a color'),
          actions: <Widget>[
            TextButton(
              child: const Text('brown'),
              onPressed: () {
                color = Colors.brown.shade700;
                Navigator.pop(context, color);
              },
            ),
            TextButton(
              child: const Text('lime'),
              onPressed: () {
                color = Colors.lime.shade700;
                Navigator.pop(context, color);
              },
            ),
            TextButton(
              child: const Text('orange'),
              onPressed: () {
                color = Colors.orange.shade700;
                Navigator.pop(context, color);
              },
            ),
          ],
        );
      },
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: const Text('Navigation Dialog Annisa Fitriani Rizky'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Change Color'),
          onPressed: () {
            _showColorDialog(context);
          },
        ),
      ),
    );
  }
}
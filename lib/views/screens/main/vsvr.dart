import 'package:flutter/material.dart';

class ViewSentViewReceive extends StatefulWidget {
  const ViewSentViewReceive({super.key});

  @override
  State<ViewSentViewReceive> createState() => _ViewSentViewReceiveState();
}

class _ViewSentViewReceiveState extends State<ViewSentViewReceive> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: ElevatedButton(
          child: const Text("ViewSentViewReceive"),
          onPressed: () async {},
        ),
      ),
    );
  }
}

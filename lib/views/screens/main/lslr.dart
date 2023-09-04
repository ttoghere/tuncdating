import 'package:flutter/material.dart';

class LikeSentLikeReceived extends StatefulWidget {
  const LikeSentLikeReceived({super.key});

  @override
  State<LikeSentLikeReceived> createState() => _LikeSentLikeReceivedState();
}

class _LikeSentLikeReceivedState extends State<LikeSentLikeReceived> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: ElevatedButton(
          child: const Text("LSLR Out"),
          onPressed: () async {},
        ),
      ),
    );
  }
}

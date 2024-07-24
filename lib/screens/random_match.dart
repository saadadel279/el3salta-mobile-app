import 'dart:math';

import 'package:flutter/material.dart';

class RandomMatchPage extends StatelessWidget {
  final List<String> teamNames;

  const RandomMatchPage({super.key, required this.teamNames});

  @override
  Widget build(BuildContext context) {
    // Randomly select two teams for the match
    List<String> shuffledTeams = List.from(teamNames);
    shuffledTeams.shuffle(Random());

    String firstTeam = shuffledTeams[0];
    String secondTeam = shuffledTeams[1];

    return Scaffold(
        appBar: AppBar(
          title: const Text('Random Match'),
        ),
        body: Stack(children: [
          Center(
            child: Opacity(
              opacity: 0.2, // Adjust the opacity as needed
              child: Image.asset(
                'assets/images/hammer.png', // Path to your background image
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'First Match:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Text(
                  '$firstTeam vs $secondTeam',
                  style: const TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Navigate back to previous screen
                  },
                  child: const Text('Back'),
                ),
              ],
            ),
          ),
        ]));
  }
}

import 'package:flutter/material.dart';

import 'player_names.dart';

class TeamNamesPage extends StatefulWidget {
  final int numTeams;
  final int numGoalkeepers;
  final int numAttackers;

  const TeamNamesPage({
    super.key,
    required this.numTeams,
    required this.numGoalkeepers,
    required this.numAttackers,
  });

  @override
  _TeamNamesPageState createState() => _TeamNamesPageState();
}

class _TeamNamesPageState extends State<TeamNamesPage> {
  List<TextEditingController> teamControllers = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.numTeams; i++) {
      teamControllers.add(TextEditingController());
    }
  }

  @override
  void dispose() {
    for (var controller in teamControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teams Names'),
      ),
      body: Stack(
        children: [
          // Background image with opacity
          Center(
            child: Opacity(
              opacity: 0.2, // Adjust the opacity as needed
              child: Image.asset(
                'assets/images/football.png', // Path to your background image
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Foreground content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for (int i = 0; i < widget.numTeams; i++)
                    TextField(
                      controller: teamControllers[i],
                      decoration:
                          InputDecoration(labelText: 'Team ${i + 1} Name'),
                    ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      List<String> teamNames = teamControllers
                          .map((controller) => controller.text)
                          .toList();

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PlayersPage(
                            teamNames: teamNames,
                            numGoalkeepers: widget.numGoalkeepers,
                            numAttackers: widget.numAttackers,
                          ),
                        ),
                      );
                    },
                    child: const Text('Next'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

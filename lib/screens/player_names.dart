import 'package:el3salta/screens/teams_formating.dart';
import 'package:flutter/material.dart';

class PlayersPage extends StatefulWidget {
  final List<String> teamNames;
  final int numGoalkeepers;
  final int numAttackers;

  const PlayersPage({
    super.key,
    required this.teamNames,
    required this.numGoalkeepers,
    required this.numAttackers,
  });

  @override
  _PlayersPageState createState() => _PlayersPageState();
}

class _PlayersPageState extends State<PlayersPage> {
  final List<TextEditingController> goalkeeperControllers = [];
  final List<TextEditingController> playerControllers = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.numGoalkeepers; i++) {
      goalkeeperControllers.add(TextEditingController());
    }
    for (int i = 0; i < widget.numAttackers; i++) {
      playerControllers.add(TextEditingController());
    }
  }

  @override
  void dispose() {
    for (var controller in goalkeeperControllers) {
      controller.dispose();
    }
    for (var controller in playerControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Players Names'),
      ),
      body: Stack(children: [
        Center(
          child: Opacity(
            opacity: 0.2, // Adjust the opacity as needed
            child: Image.asset(
              'assets/images/football.png', // Path to your background image
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              for (int i = 0; i < widget.numGoalkeepers; i++)
                TextField(
                  controller: goalkeeperControllers[i],
                  decoration: InputDecoration(labelText: 'Goalkeeper ${i + 1}'),
                ),
              for (int i = 0; i < widget.numAttackers; i++)
                TextField(
                  controller: playerControllers[i],
                  decoration: InputDecoration(labelText: 'Player ${i + 1}'),
                ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  List<String> goalkeepers = goalkeeperControllers
                      .map((controller) => controller.text)
                      .toList();
                  List<String> players = playerControllers
                      .map((controller) => controller.text)
                      .toList();

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TeamsFormationPage(
                        teamNames: widget.teamNames,
                        goalkeepers: goalkeepers,
                        players: players,
                      ),
                    ),
                  );
                },
                child: const Text('Generate Teams'),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

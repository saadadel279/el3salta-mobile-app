import 'package:flutter/material.dart';

import 'teams_names.dart';

class InitialInputPage extends StatefulWidget {
  const InitialInputPage({super.key});

  @override
  _InitialInputPageState createState() => _InitialInputPageState();
}

class _InitialInputPageState extends State<InitialInputPage> {
  final TextEditingController teamsController = TextEditingController();
  final TextEditingController goalkeepersController = TextEditingController();
  final TextEditingController attackersController = TextEditingController();

  @override
  void dispose() {
    teamsController.dispose();
    goalkeepersController.dispose();
    attackersController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Information about the game'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image with opacity
          Opacity(
            opacity: 0.2, // Adjust the opacity as needed
            child: Image.asset(
              'assets/images/HD-wallpaper-football-footbal-ground.jpg', // Path to your background image
              fit: BoxFit.cover,
            ),
          ),
          // Foreground content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: teamsController,
                    keyboardType: TextInputType.number,
                    decoration:
                        const InputDecoration(labelText: 'Number of Teams'),
                  ),
                  TextField(
                    controller: goalkeepersController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        labelText: 'Number of Goalkeepers'),
                  ),
                  TextField(
                    controller: attackersController,
                    keyboardType: TextInputType.number,
                    decoration:
                        const InputDecoration(labelText: 'Number of Attackers'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      int numTeams = int.parse(teamsController.text);
                      int numGoalkeepers =
                          int.parse(goalkeepersController.text);
                      int numAttackers = int.parse(attackersController.text);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TeamNamesPage(
                            numTeams: numTeams,
                            numGoalkeepers: numGoalkeepers,
                            numAttackers: numAttackers,
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

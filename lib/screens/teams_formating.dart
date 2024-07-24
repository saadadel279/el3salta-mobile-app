import 'dart:math';

import 'package:el3salta/screens/random_match.dart';
import 'package:flutter/material.dart';

class TeamsFormationPage extends StatelessWidget {
  final List<String> teamNames;
  final List<String> goalkeepers;
  final List<String> players;

  const TeamsFormationPage({
    Key? key,
    required this.teamNames,
    required this.goalkeepers,
    required this.players,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> allPlayers = List.from(players);
    allPlayers.shuffle(Random());

    List<List<String>> teams = List.generate(teamNames.length, (_) => []);
    int numTeams = teamNames.length;
    int playersPerTeam = 5; // 6 including the goalkeeper

    // Distribute players to ensure each team has 5 players
    for (int i = 0; i < allPlayers.length; i++) {
      teams[i % numTeams].add(allPlayers[i]);
    }

    // Assign goalkeepers to teams
    List<String> goalkeepersAssigned = List.filled(numTeams, 'Empty');
    for (int i = 0; i < goalkeepers.length; i++) {
      goalkeepersAssigned[i % numTeams] = goalkeepers[i];
    }

    // Ensure each team has at least 6 members
    for (int i = 0; i < numTeams; i++) {
      while (teams[i].length < playersPerTeam) {
        teams[i].add(' '); // Adding placeholders if needed
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lineup'),
      ),
      body: PageView.builder(
        itemCount: numTeams,
        itemBuilder: (context, index) {
          return Center(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/football-field.png'), // Add your football field image
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        teamNames[index],
                        style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: Text(
                          'Goalkeeper: ${goalkeepersAssigned[index]}',
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ),
                      const SizedBox(height: 10),

                      const SizedBox(height: 30),
                      // Display players in pairs or single
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            teams[index].length,
                            (playerIndex) {
                              if (playerIndex % 2 == 0) {
                                // Pair of players
                                int nextIndex = playerIndex + 1;
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Text(
                                        teams[index][playerIndex],
                                        style: const TextStyle(
                                            fontSize: 23,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Color.fromARGB(255, 0, 0, 0)),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    nextIndex < teams[index].length
                                        ? Container()
                                        : Container(),
                                  ],
                                );
                              } else {
                                // Single player
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  child: Center(
                                    child: Text(
                                      teams[index][playerIndex],
                                      style: const TextStyle(
                                          fontSize: 23,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(255, 0, 0, 0)),
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RandomMatchPage(
                    teamNames: teamNames,
                  ),
                ),
              );
            },
            child: const Text('Random Match'),
          ),
        ),
      ),
    );
  }
}

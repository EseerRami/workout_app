import 'package:flutter/material.dart';
import 'bmi_calculator.dart';

void main() => runApp(WorkoutApp());

class WorkoutApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workout App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WorkoutList(),
    );
  }
}

class WorkoutList extends StatelessWidget {
  final workouts = [
    'Push-ups',
    'Squats',
    'Sit-ups',
    'Jumping Jacks',
    'Lunges',
    'Planks',
    'BMI Calculator',
  ];

  final workoutDetails = {
    'Push-ups': 'A basic workout for upper body strength.',
    'Squats': 'A powerful workout for the lower body, particularly the legs and glutes.',
    'Sit-ups': 'A simple workout for the abdominal muscles.',
    'Jumping Jacks': 'A good cardio workout that involves the entire body.',
    'Lunges': 'Great for strengthening your legs and glutes, also improves balance.',
    'Planks': 'Excellent for core strength and improving your posture.',
    'BMI Calculator': 'Calculate your Body Mass Index.',
  };

  final workoutInstructions = {
    'Push-ups': '1. Get down on all fours, placing your hands slightly wider than your shoulders.\n2. Straighten your arms and legs.\n3. Lower your body until your chest nearly touches the floor.\n4. Push your body up to the starting position.\n5. Repeat.',
    'Squats': '1. Stand with feet a little wider than shoulder-width apart.\n2. Bend in your knees, keeping your back straight.\n3. Lower your body down as far as you can.\n4. Push yourself back to the starting position.\n5. Repeat.',
    'Sit-ups': '1. Lie down on your back. Bend your legs and place feet firmly on the ground.\n2. Cross your hands to opposite shoulders.\n3. Lift your body up towards your knees.\n4. Lower your body back down.\n5. Repeat.',
    'Jumping Jacks': '1. Stand upright with your legs together and arms at your sides.\n2. Bend your knees slightly, and jump into the air.\n3. As you jump, spread your legs to be about shoulder-width apart. Stretch your arms out and over your head.\n4. Jump back to starting position.\n5. Repeat.',
    'Lunges': '1. Stand upright.\n2. Step forward with one foot until your leg reaches a 90-degree angle.\n3. Push off with your front foot and bring it back to starting position.\n4. Repeat with the other leg.',
    'Planks': '1. Get into a push-up position, but rest on your forearms instead of your hands.\n2. Keep your body in a straight line from your shoulders to your ankles.\n3. Hold this position for the recommended amount of time.',
  };

  final workoutImages = {
    'Push-ups': 'https://cdn.discordapp.com/attachments/1010953954584182784/1131685483429232872/pushupResize.png',
    'Squats': 'https://via.placeholder.com/150',
    'Sit-ups': 'https://via.placeholder.com/150',
    'Jumping Jacks': 'https://via.placeholder.com/150',
    'Lunges': 'https://via.placeholder.com/150',
    'Planks': 'https://via.placeholder.com/150',
  };

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workout App'),
      ),
      body: ListView.builder(
        itemCount: workouts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(workouts[index]),
            onTap: () {
              if (workouts[index] == 'BMI Calculator') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BMICalculator(),
                  ),
                );
              } else if (workoutDetails[workouts[index]] != null && 
                  workoutInstructions[workouts[index]] != null && 
                  workoutImages[workouts[index]] != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WorkoutDetail(
                      workout: workouts[index],
                      details: workoutDetails[workouts[index]]!,
                      instructions: workoutInstructions[workouts[index]]!,
                      imageUrl: workoutImages[workouts[index]]!,
                    ),
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}

class WorkoutDetail extends StatelessWidget {
  final String workout;
  final String details;
  final String instructions;
  final String imageUrl;

  WorkoutDetail({Key? key, required this.workout, required this.details, required this.instructions, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(workout),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              details,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Image.network(imageUrl),
            SizedBox(height: 20),
            Text(
              'Instructions:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(instructions),
          ],
        ),
      ),
    );
  }
}

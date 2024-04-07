exercise_habits.dart
import 'package:flutter/material.dart';

class ExerciseHabitsPage extends StatefulWidget {
  @override
  _ExerciseHabitsPageState createState() => _ExerciseHabitsPageState();
}

class _ExerciseHabitsPageState extends State<ExerciseHabitsPage> {
  String? _exerciseHabit;
  String? _exerciseFrequency;
  String? _exerciseType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise Habits'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Text(
            'Do you have the habit of doing exercise or involving in play activities?',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          _buildRadioTile('Yes', 'yes'),
          _buildRadioTile('No', 'no'),
          SizedBox(height: 24.0),
          if (_exerciseHabit == 'yes')
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'How often do you exercise for at least twenty minutes apart from your daily work?',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                _buildFrequencyRadioTile('Every day', 'everyday'),
                _buildFrequencyRadioTile('More than three times a week', 'more_than_three'),
                _buildFrequencyRadioTile('Once or twice a week', 'once_or_twice'),
                _buildFrequencyRadioTile('Never', 'never'),
                SizedBox(height: 24.0),
                Text(
                  'What type of exercise do you do?',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                _buildCheckbox('Brisk walking'),
                _buildCheckbox('Jogging'),
                _buildCheckbox('Swimming'),
                _buildCheckbox('Playing shuttle'),
                // Add more exercise options here
                SizedBox(height: 24.0),
              ],
            ),
          ElevatedButton(
            onPressed: _exerciseHabit == 'no' || (_exerciseFrequency != null && _exerciseType != null)
                ? _submitForm
                : null,
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }

  Widget _buildRadioTile(String title, String value) {
    return RadioListTile(
      title: Text(title),
      value: value,
      groupValue: _exerciseHabit,
      onChanged: (selectedValue) {
        setState(() {
          _exerciseHabit = selectedValue as String?;
          // Reset exercise frequency and type when habit changes
          _exerciseFrequency = null;
          _exerciseType = null;
        });
      },
    );
  }

  Widget _buildFrequencyRadioTile(String title, String value) {
    return RadioListTile(
      title: Text(title),
      value: value,
      groupValue: _exerciseFrequency,
      onChanged: (selectedValue) {
        setState(() {
          _exerciseFrequency = selectedValue as String?;
        });
      },
    );
  }

  Widget _buildCheckbox(String title) {
    return CheckboxListTile(
      title: Text(title),
      value: _exerciseType == title,
      onChanged: (selected) {
        setState(() {
          _exerciseType = selected! ? title : null;
        });
      },
    );
  }

  void _submitForm() {
    // Implement form submission logic here
    print('Exercise Habit: $_exerciseHabit');
    if (_exerciseHabit == 'yes') {
      print('Exercise Frequency: $_exerciseFrequency');
      print('Exercise Type: $_exerciseType');
    }
    // You can navigate to the next page or perform other actions upon form submission
  }
}

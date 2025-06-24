import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(CalorieProteinApp());
}

class CalorieProteinApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Intake Calculator',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Calculator'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.6,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/fitness-man.webp'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                Spacer(flex: 6),
                ElevatedButton.icon(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => CalorieCalculatorScreen()),
                  ),
                  icon: Icon(Icons.local_fire_department, color: Colors.white),
                  label: Text('Calorie Intake Calculator'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => ProteinCalculatorScreen()),
                  ),
                  icon: Icon(Icons.restaurant_rounded, color: Colors.white),
                  label: Text('Protein Intake Calculator'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                ),
                Spacer(flex: 4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CalorieCalculatorScreen extends StatelessWidget {
  final ageController = TextEditingController();
  final weightController = TextEditingController();
  final heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calorie Intake Calculator'),
        backgroundColor: Colors.deepPurple,
      ),
      body: IntakeForm(
        title: 'Calorie Intake Calculator',
        resultLabel: 'Recommended Calorie Intake',
        resultValue: '2166 kcal/day',
        showInfoNote: false,
        ageController: ageController,
        weightController: weightController,
        heightController: heightController,
      ),
    );
  }
}

class ProteinCalculatorScreen extends StatelessWidget {
  final ageController = TextEditingController();
  final weightController = TextEditingController();
  final heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Protein Intake Calculator'),
        backgroundColor: Colors.deepPurple,
      ),
      body: IntakeForm(
        title: 'Protein Intake Calculator',
        resultLabel: 'Recommended Protein Intake',
        resultValue: '84 grams/day',
        showInfoNote: false,
        ageController: ageController,
        weightController: weightController,
        heightController: heightController,
      ),
    );
  }
}

class IntakeForm extends StatefulWidget {
  final String title;
  final String resultLabel;
  final String resultValue;
  final bool showInfoNote;
  final TextEditingController ageController;
  final TextEditingController weightController;
  final TextEditingController heightController;

  const IntakeForm({
    required this.title,
    required this.resultLabel,
    required this.resultValue,
    required this.showInfoNote,
    required this.ageController,
    required this.weightController,
    required this.heightController,
  });

  @override
  _IntakeFormState createState() => _IntakeFormState();
}

class _IntakeFormState extends State<IntakeForm> {
  String weightUnit = 'Kg';
  String heightUnit = 'Cm';
  String gender = 'Male';
  String activityLevel = '';
  String goal = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: ListView(
        children: [
          Text(
            widget.title,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 12),
          Text(
            widget.resultLabel,
            style: TextStyle(fontSize: 18, color: Colors.red, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text(
            widget.resultValue,
            style: TextStyle(fontSize: 22, color: Colors.red, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          Text('Enter your details to calculate daily calorie needs.', textAlign: TextAlign.center),
          SizedBox(height: 24),

          Text('Age:'),
          TextField(
            controller: widget.ageController,
            decoration: InputDecoration(hintText: 'Enter your age', suffixText: 'Years'),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          SizedBox(height: 16),

          Text('Weight:'),
          TextField(
            controller: widget.weightController,
            decoration: InputDecoration(
              hintText: 'Enter your weight',
              suffixIcon: DropdownButton<String>(
                value: weightUnit,
                onChanged: (val) => setState(() => weightUnit = val!),
                items: ['Kg', 'Lbs'].map((u) => DropdownMenuItem(value: u, child: Text(u))).toList(),
              ),
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          SizedBox(height: 16),

          Text('Height:'),
          TextField(
            controller: widget.heightController,
            decoration: InputDecoration(
              hintText: 'Enter your height',
              suffixIcon: DropdownButton<String>(
                value: heightUnit,
                onChanged: (val) => setState(() => heightUnit = val!),
                items: ['Cm', 'Ft'].map((u) => DropdownMenuItem(value: u, child: Text(u))).toList(),
              ),
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          SizedBox(height: 16),

          Text('Gender:'),
          Row(
            children: [
              Expanded(
                child: RadioListTile(
                  title: Text('Male'),
                  value: 'Male',
                  groupValue: gender,
                  onChanged: (val) => setState(() => gender = val!),
                ),
              ),
              Expanded(
                child: RadioListTile(
                  title: Text('Female'),
                  value: 'Female',
                  groupValue: gender,
                  onChanged: (val) => setState(() => gender = val!),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),

          Text('Activity Level:'),
          DropdownButtonFormField<String>(
            value: activityLevel.isEmpty ? null : activityLevel,
            hint: Text('Select Activity Level'),
            onChanged: (val) => setState(() => activityLevel = val!),
            items: ['Low', 'Moderate', 'High'].map((v) => DropdownMenuItem(value: v, child: Text(v))).toList(),
          ),
          SizedBox(height: 16),

          Text('Goal:'),
          DropdownButtonFormField<String>(
            value: goal.isEmpty ? null : goal,
            hint: Text('Select your goal'),
            onChanged: (val) => setState(() => goal = val!),
            items: ['Lose Weight', 'Maintain Weight', 'Gain Muscle'].map((v) => DropdownMenuItem(value: v, child: Text(v))).toList(),
          ),
          SizedBox(height: 24),

          ElevatedButton(
            onPressed: () {
              final age = int.tryParse(widget.ageController.text) ?? 0;
              final weight = double.tryParse(widget.weightController.text) ?? 0;
              final height = double.tryParse(widget.heightController.text) ?? 0;

              double weightKg = weightUnit == 'Kg' ? weight : weight * 0.453592;
              double heightCm = heightUnit == 'Cm' ? height : height * 30.48;

              if(age > 150){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Age exceeds the allowed limit.')),
                );
                return;
              }
              if ((weightUnit == 'Kg' && weight > 200) || (weightUnit == 'Lbs' && weight > 450)) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Weight exceeds the allowed limit.')));
                return;
              }
              if ((heightUnit == 'Cm' && height > 220) || (heightUnit == 'Ft' && height > 8)) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Height exceeds the allowed limit.')));
                return;
              }


              double activityFactor = 1.2;
              if (activityLevel == 'Moderate') activityFactor = 1.55;
              else if (activityLevel == 'High') activityFactor = 1.9;

              String result = '';
              if (widget.title.contains('Calorie')) {
                double bmr = gender == 'Male'
                    ? 10 * weightKg + 6.25 * heightCm - 5 * age + 5
                    : 10 * weightKg + 6.25 * heightCm - 5 * age - 161;
                double tdee = bmr * activityFactor;

                if (goal == 'Lose Weight') tdee *= 0.85;
                else if (goal == 'Gain Muscle') tdee *= 1.15;

                result = '${tdee.toStringAsFixed(0)} kcal/day';
              } else {
                double multiplier = 0.8;
                if (activityLevel == 'Moderate') multiplier = 1.2;
                else if (activityLevel == 'High') multiplier = 2.0;
                if (goal == 'Gain Muscle') multiplier += 0.3;

                double protein = weightKg * multiplier;
                result = '${protein.toStringAsFixed(0)} grams/day';
              }

              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("Your Result"),
                  content: Text(result),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("OK"),
                    )
                  ],
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 16),
              textStyle: TextStyle(fontSize: 18),
            ),
            child: Text('Calculate'),
          ),
        ],
      ),
    );
  }
}

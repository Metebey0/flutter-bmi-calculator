import 'package:bmi_app/bmi_calculator.dart';
import 'package:bmi_app/widget/bmi_button.dart';
import 'package:bmi_app/widget/bmi_card.dart';
import 'package:bmi_app/widget/custom_button.dart';
import 'package:bmi_app/screens/results_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int age = 15;
  int weight = 75;
  int height = 150;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const Drawer(),
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text('BMI CALCULATOR'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0.sp,
            vertical: 24.0.sp,
          ),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Check Your Body Mass Index (BMI) to know if you are in shape',
                style:
                    TextStyle(fontSize: 16.0.sp, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 23.0.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  bmiCard(
                    width: 156,
                    height: 215,
                    title: 'AGE',
                    value: age.toString(),
                    label: 'YRS',
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        BmiButton(
                          icon: Icons.remove,
                          onPressed: () {
                            setState(() {
                              age--;
                            });
                          },
                        ),
                        BmiButton(
                          icon: Icons.add,
                          onPressed: () {
                            setState(() {
                              age++;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  bmiCard(
                    width: 156,
                    height: 215,
                    title: 'WEIGHT',
                    value: weight.toString(),
                    label: 'KG',
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        BmiButton(
                          icon: Icons.remove,
                          onPressed: () {
                            setState(() {
                              weight--;
                            });
                          },
                        ),
                        BmiButton(
                          icon: Icons.add,
                          onPressed: () {
                            setState(() {
                              weight++;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32.h),
              bmiCard(
                width: double.infinity,
                height: 215,
                title: 'HEIGHT',
                value: height.toString(),
                label: 'CM',
                child: Slider(
                  min: 100.0,
                  max: 200.0,
                  value: height.toDouble(),
                  activeColor: Colors.white,
                  inactiveColor: Colors.white.withOpacity(0.45),
                  onChanged: (newValue) {
                    setState(() {
                      height = newValue.toInt();
                    });
                  },
                ),
              ),
              SizedBox(height: 43.h),
              Text(
                'Tap the button below to check your BMI Result',
                style: TextStyle(
                  fontSize: 16.0.sp,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              CustomButton(
                title: 'CALCULATE',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        BMICalculator bmiCalculator = BMICalculator(
                          height: height,
                          weight: weight,
                        );
                        return ResultScreen(
                          bmiResult: bmiCalculator.calculateBMI(),
                          resultText: bmiCalculator.getResult(),
                          interpretation: bmiCalculator.getInterpretation(),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MyBMI extends StatefulWidget {
  const MyBMI({super.key});

  @override
  State<MyBMI> createState() => _MyBMIState();
}

class _MyBMIState extends State<MyBMI> {
  String bmiResult = '0.0';
  String bmiStatus = '';
  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController age = TextEditingController();

  void calculateBMI() {
    try {
      double heightInCm = double.parse(height.text);
      double weightInKg = double.parse(weight.text);

      double heightInMeters = heightInCm / 100;
      double bmi = weightInKg / (heightInMeters * heightInMeters);

      String status;
      if (bmi < 18.5) {
        status = "Underweight";
      } else if (bmi < 25) {
        status = "Healthy";
      } else if (bmi < 30) {
        status = "Overweight";
      } else {
        status = "Obese";
      }

      setState(() {
        bmiResult = bmi.toStringAsFixed(1);
        bmiStatus = status;
      });
    } catch (e) {
      setState(() {
        bmiResult = "0.0";
        bmiStatus = "Invalid input";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  "assets/images/heart.png",
                  width: 250,
                  height: 250,
                ),
                Text(
                  bmiResult,
                  style: TextStyle(
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w700,
                      fontSize: 45,
                      color: Color(0XFFEA7165)),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              bmiStatus,
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Manrope',
                  color: Color(0XFF3E977E)),
            ),
            SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  spacing: 15,
                  children: [
                    Text(
                      "Male",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.black),
                    ),
                    Image.asset(
                      "assets/images/male.png",
                      width: 50,
                      height: 50,
                    )
                  ],
                ),
                SizedBox(
                  width: 45,
                ),
                Column(
                  spacing: 15,
                  children: [
                    Text(
                      "Female",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.black),
                    ),
                    Image.asset(
                      "assets/images/female.png",
                      width: 50,
                      height: 50,
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Age",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                          fontFamily: 'Manrope'),
                    ),
                    SizedBox(
                      width: 50,
                      child: TextField(
                        controller: age,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'Manrope'),
                        decoration: InputDecoration(
                          hintText: '12',
                          hintStyle: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade600,
                              fontFamily: 'Manrope'),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  color: Colors.grey,
                  width: 2,
                  height: 90,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Height",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                          fontFamily: 'Manrope'),
                    ),
                    SizedBox(
                      width: 50,
                      child: TextField(
                        controller: height,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'Manrope'),
                        decoration: InputDecoration(
                          hintText: '12',
                          hintStyle: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade600,
                              fontFamily: 'Manrope'),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  color: Colors.grey,
                  width: 2,
                  height: 90,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Weight",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                          fontFamily: 'Manrope'),
                    ),
                    SizedBox(
                      width: 50,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: weight,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'Manrope'),
                        decoration: InputDecoration(
                          hintText: '12',
                          hintStyle: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade600,
                              fontFamily: 'Manrope'),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 35,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0XFF89CFC7),
                      foregroundColor: Colors.white),
                  onPressed: calculateBMI,
                  child: Text(
                    "Calculate BMI",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

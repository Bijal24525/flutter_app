import 'package:flutter/material.dart';
import 'csv_operations.dart';


class CalculationPage extends StatefulWidget {
  @override
  _CalculationPageState createState() => _CalculationPageState();
}

class _CalculationPageState extends State<CalculationPage> {
  TextEditingController numberOfItemsController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  double averageWeight = 0.0; // Initialize averageWeight to 0.0
  int recordCounter = 0;

  void handleAddRecord() {
    String numberOfItems = numberOfItemsController.text;
    String weight = weightController.text;
    print('weight': weight);
    CsvOperations.addRecord(numberOfItems, weight);
    

    // Clear the input fields after adding the record
    numberOfItemsController.clear();
    weightController.clear();
  }

  @override
  void dispose() {
    numberOfItemsController.dispose();
    weightController.dispose();
    super.dispose();
  }

  void calculateAverage() {
    // Calculate the average weight based on the values entered
    int numberOfItems = int.tryParse(numberOfItemsController.text) ?? 0;
    double totalWeight = double.tryParse(weightController.text) ?? 0.0;

    if (numberOfItems != 0) {
      averageWeight = totalWeight / numberOfItems;
    } else {
      averageWeight = 0.0;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculation'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Add your action here when the "Add" button is pressed
              // For example, you can open a new page or perform some other action.
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // First input: No. of items (int)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'No. of Items:',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: 200,
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: numberOfItemsController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.zero,
                    ),
                    style: TextStyle(fontSize: 16),
                    onChanged: (text) {
                      // Call calculateAverage when the text changes
                      calculateAverage();
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            // Second input: Weight (Kg) (float)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Weight (Kg):',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: 200,
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: TextField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    controller: weightController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.zero,
                    ),
                    style: TextStyle(fontSize: 16),
                    onChanged: (text) {
                      // Call calculateAverage when the text changes
                      calculateAverage();
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            // Third input: Average Weight (Kg) (float, rounded to 3 decimal places)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Average Weight (Kg):',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: 200,
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    averageWeight.toStringAsFixed(3),
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            // New row for centered buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your action for "Add New Record" button here
                      handleAddRecord();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                    ),
                    child: Text('Add New Record'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your action for "Abort" button here
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                    child: Text('Abort'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

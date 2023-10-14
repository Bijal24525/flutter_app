// csv_operations.dart

import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';

class CsvOperations {
  static Future<void> addRecord(String numberOfItems, String weight) async {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyyMMdd_HHmmss');
    final String formattedDate = formatter.format(now);

    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/chicken_batch_$formattedDate.csv';
    final File csvFile = File(filePath);

    if (!csvFile.existsSync()) {
      await csvFile.writeAsString('No. of Items,Weight (Kg)\n', mode: FileMode.write);
    }

    String newRecord = '$numberOfItems,$weight\n';
    await csvFile.writeAsString(newRecord, mode: FileMode.append);
  }
}

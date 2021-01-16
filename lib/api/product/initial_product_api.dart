import 'package:cyborgs/helper/unified_project_info.dart';
import 'package:gsheets/gsheets.dart';

class InitialProductApi{
  final GSheets gsheets = GSheets(UnifiedInfoProject.credentials);
  Spreadsheet spreadsheet;
  Worksheet productSheet;
  Future<void> init() async {
    spreadsheet ??= await gsheets.spreadsheet(UnifiedInfoProject.spreadsheetId);
    productSheet ??= await spreadsheet.worksheetByTitle('products');
    productSheet ??= await spreadsheet.addWorksheet('products');
  }
}
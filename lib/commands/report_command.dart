import 'package:StateManagementMVCS/commands/base_command.dart';

class ReportCommand extends BaseCommand {
  Future<void> init() async {
    if (reportModel.currentDate == null) {
      var dt = DateTime.now();
      reportModel.currentDate = DateTime(dt.year, dt.month, dt.day);
    }
  }

  Future<void> load() async {
    var end = reportModel.currentDate.add(Duration(days: 1));
    reportModel.drunks =
        await userService.getDrunks(reportModel.currentDate, end);
  }

  void changeCurrentDate(bool isBack) {
    if (isBack)
      reportModel.currentDate = reportModel.currentDate.add(Duration(days: -1));
    else
      reportModel.currentDate = reportModel.currentDate.add(Duration(days: 1));
  }
}

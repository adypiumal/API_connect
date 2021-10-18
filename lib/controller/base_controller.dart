import 'package:newapi/helper/dialog_help.dart';
import 'package:newapi/seervices/app_exceptions.dart';

class Basecontroller {
  void handleError(error) {
   // showLoading('');
    hideLoading();

    if (error is BadRequestException) {
      var message = error.message;
      DialogHelper.showErrorDialog(description: message);
    } else if (error is FatctdataException) {
      var message = error.message;
      DialogHelper.showErrorDialog(description: message);
    } else if (error is ApiNoRespondException) {
      DialogHelper.showErrorDialog(
          description: 'Ooo! its took longer respond.');
    }
  }

  showLoading(String message) {
    DialogHelper.showLoading(message);
  }

  hideLoading() {
    DialogHelper.hideLoading();
  }
}

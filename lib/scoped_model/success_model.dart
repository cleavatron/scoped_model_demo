import 'package:scoped_model_demo/enums/view_states.dart';
import 'package:scoped_model_demo/scoped_model/base_model.dart';

class SuccessModel extends BaseModel {
  String title = 'no text yet';

  Future fetchDuplicatedText(String text) async {
    setState(ViewState.Busy);
    await Future.delayed(Duration(seconds: 2));
    title = '$text $text';

    setState(ViewState.Retrieved);
  }
}

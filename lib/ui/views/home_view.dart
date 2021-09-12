import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:scoped_model_demo/enums/view_states.dart';
import 'package:scoped_model_demo/scoped_model/home_model.dart';
import 'package:scoped_model_demo/service_locator.dart';
import 'package:scoped_model_demo/ui/views/success_view.dart';
import 'package:scoped_model_demo/ui/widgets/busy_overlay.dart';

import 'base_view.dart';
import 'error_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BaseView<HomeModel>(
      builder: (context, child, model) => BusyOverlay(
        show: model.state == ViewState.Busy,
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              var whereToNavigate = await model.saveData();
              if (whereToNavigate) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SuccessView(
                              title: "Passed in from Home",
                            )));
              } else {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ErrorView()));
              }
            },
          ),
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _getBodyUi(model.state),
                Text(model.title),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getBodyUi(ViewState state) {
    switch (state) {
      case ViewState.Busy:
        return CircularProgressIndicator();
      case ViewState.Retrieved:
      default:
        return Text('Done');
    }
  }
}

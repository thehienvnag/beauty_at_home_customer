import 'package:flutter_app/src/models/base_model.dart';
import 'package:flutter_app/src/view/interfaces/base_view.dart';

mixin IBasePresenter {
  void initModel(IBaseModel model);
  void initView(IBaseView view);
}

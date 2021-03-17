import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/src/models-new/voucher_model.dart';
import 'package:flutter_app/src/utils/utils.dart';

class VoucherProvider extends ChangeNotifier {
  List<VoucherModel> _listVoucher;
  VoucherModel _currentVoucher;

  List<VoucherModel> get listVoucher => _listVoucher;
  VoucherModel get currentVoucher => _currentVoucher;

  final dynamic fromMap =
      (Map<String, dynamic> source) => VoucherModel.fromMap(source);

  Future<void> initData() async {
    _listVoucher = await Utils.loadJsonListAsset<VoucherModel>(
      assetsPath: "vouchers.json",
      fromMap: fromMap,
    );
    log(_listVoucher.toString());
    notifyListeners();
  }

  void setCurrentVoucher(VoucherModel model) {
    _currentVoucher = model;
  }
}

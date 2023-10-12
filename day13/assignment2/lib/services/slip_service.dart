import 'dart:convert';

import 'package:assignment2/model/advice_slip.dart';
import 'package:dio/dio.dart';

class SlipService {
  Future<AdviceSlip> getSlip() async {
    try {
      Dio dio = Dio();
      String url = 'https://api.adviceslip.com/advice';
      var resp = await dio.get(url);
      if (resp.statusCode == 200) {
        var myData = jsonDecode(resp.data);
        AdviceSlip slipData = AdviceSlip.fromJson(myData['slip']);
        return slipData;
        print(slipData.id);
      }
      return AdviceSlip(id: 0, advice: '');
    } catch (e) {
      throw Exception(e);
    }
  }
}

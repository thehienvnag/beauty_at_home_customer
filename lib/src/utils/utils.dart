import 'dart:async';

import 'dart:developer';

class Utils {
  static Future sleep(int miliesSecond) {
    return Future.delayed(
      Duration(milliseconds: miliesSecond),
    );
  }

  static void redoTaskPerDuration(
      Function task, int miliesSecond, int count, Function afterTask) async {
    while (count-- > 0) {
      log('1st');
      await sleep(miliesSecond);
      task.call();
    }
    await sleep(miliesSecond);
    afterTask.call();
  }
}

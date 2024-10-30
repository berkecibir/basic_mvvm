import 'package:basic_mvmm/use_case/basic_mvvm/basic_model.dart';
import 'package:basic_mvmm/use_case/basic_mvvm/core/basic_cache.dart';

class BasicViewModel {
  BasicViewModel({required this.cache});
  final BasicCacheInterFace cache;

  Future<bool> controllToUserName(BasicModel model) async {
    await Future.delayed(const Duration(seconds: 2));

    return model.userName.length.isOdd ? true : false;
  }

  void saveUserNameToCache(String userName) {
    cache.saveStringValue(userName);
  }
}

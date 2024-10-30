abstract class BasicCacheInterFace {
  bool saveStringValue(String value);
}

class BasicCache implements BasicCacheInterFace {
  @override
  bool saveStringValue(String value) {
    return true;
  }
}

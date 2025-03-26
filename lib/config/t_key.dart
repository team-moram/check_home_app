import '../core/utils/localization.dart';

enum TKeys {
  ok,
  cancel
}

//TKeys
extension TKeysExtention on TKeys {
  String get _string => toString().split('.')[1];

  String translate(context) {
    return Localization.of(context).translate(_string) ?? '';
  }
}

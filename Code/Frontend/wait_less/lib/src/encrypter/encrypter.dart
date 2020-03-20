import 'package:encrypt/encrypt.dart';

class EncrypterUtil {

  static final _key = Key.fromUtf8('456d6d616e75656c7375636b7364696b');
  static final _iv = IV.fromLength(16);

  static String encrypt(String str) => Encrypter(AES(_key)).encrypt(str, iv: _iv).base64;

}
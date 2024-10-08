import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';

/*final strPeticion = EncriptarDesencriptarUtil.encryptAES(
        crearSolicitudInformacionPublicaModelToJson(objSolicitud));*/
class EncriptarDesencriptarUtil {
  static const _secret = 'PLataforMa';
  static final _key = Key(
    Uint8List.fromList(
      _getSHAFromSecret(_secret),
    ),
  );
  static final _iv = IV.fromLength(16);

  static List<int> _getSHAFromSecret(String secret) {
    final bytes = utf8.encode(secret);
    Digest sha1Result = sha1.convert(bytes);
    return sha1Result.bytes.sublist(0, 16);
  }

  static Encrypter _getEncrypter(Key key) {
    return Encrypter(
      AES(key, mode: AESMode.ecb, padding: 'PKCS7'),
    );
  }

  static String? encryptAES(String strToEncrypt) {
    try {
      final encrypter = _getEncrypter(_key);
      final encrypted = encrypter.encrypt(strToEncrypt, iv: _iv);

      return encrypted.base64;
    } catch (e) {
      return null;
    }
  }

  static String? decryptAES(String strToDecrypt) {
    try {
      final encrypter = _getEncrypter(_key);
      final text = Encrypted.from64(strToDecrypt);
      return encrypter.decrypt(text, iv: _iv);
    } catch (e) {
      return null;
    }
  }
}

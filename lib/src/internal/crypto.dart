import 'dart:convert';

import 'package:crypto/crypto.dart';

/// Calculate the HMAC-SHA256 hex digest of a list of bytes.
Digest hmacSha256HexFromBytes(List<int> data, String secret) {
  var secretBytes = utf8.encode(secret);
  var hmacSha256 = Hmac(sha256, secretBytes);
  return hmacSha256.convert(data);
}

/// Calculate the HMAC-SHA256 hex digest of a string.
Digest hmacSha256HexFromString(String data, String secret) {
  var dataBytes = utf8.encode(data);
  return hmacSha256HexFromBytes(dataBytes, secret);
}


/// Compare two byte arrays. This is safe against timing attacks.
bool byteArraysMatch(List<int>? bytes1, List<int>? bytes2) {
  // short-circuit if either byte array is null
  if (bytes1 == null || bytes2 == null) {
    return false;
  }

  // short-circuit if the byte arrays are different lengths
  if (bytes1.length != bytes2.length) {
    return false;
  }

  // compare each byte in the arrays, only stopping at the end (don't give away when the first byte is different)
  var result = 0;
  for (var i = 0; i < bytes1.length; i++) {
    result |= bytes1[i] ^ bytes2[i];
  }
  return result == 0;
}

/// Compare two signature strings. This is safe against timing attacks.
bool signaturesMatch(String? signature1, String? signature2) {
  // short-circuit if either signature is null
  if (signature1 == null || signature2 == null) {
    return false;
  }

  var bytes1 = utf8.encode(signature1);
  var bytes2 = utf8.encode(signature2);
  return byteArraysMatch(bytes1, bytes2);
}

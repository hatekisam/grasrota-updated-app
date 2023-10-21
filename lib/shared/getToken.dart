import 'dart:convert';
import '../main.dart;'
Future<String> getToken() async {
  final prefs = await SharedPreferences.getInstance();
  final userStat = prefs.getBool('isNewUser') ?? true;
  final savedTokenKey = "savedToken";
  final savedToken = prefs.getString(savedTokenKey);

  if (savedToken != null && savedToken.isNotEmpty && savedToken.length > 20)
    return savedToken;

  final HttpsCallable callable =
      FirebaseFunctions.instance.httpsCallable('getTokenCal');

  dynamic resp = await callable.call(<String, dynamic>{});
  print("TAG_ANDRA Response: " + resp.data);

  var decoResp = json.decode(resp.data);
  print("TAG_ANDRA Decoded: " + decoResp["access_token"]);

  token = {"token": decoResp["access_token"], "expire": decoResp["expires_on"]};

  prefs.setString(savedTokenKey, token!["token"]);

  return token!["token"];
}

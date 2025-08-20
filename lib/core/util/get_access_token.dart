import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:http/http.dart' as http;

Future<String> getAcessToken() async {
  final serviceAccountJson = {
    "type": "service_account",
    "project_id": "chat-and-noti",
    "private_key_id": "2403a96bdac4c91103ed1add1d7126c12374b6ae",
    "private_key":
        "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCd58KKJzA/Ds7h\nPi1AiX0SSekM0kvqzQZeDAZiw/uVmpd3EBNlWyIsDFe3xzvcfnQMG+aCVMrCg/Vz\nycKQ5equYPNxrvBQZv5TFKVigCQhHwKgiHWyzYUsaUv+5lE++gc5mIdRdPaTNUhU\nYcuRi13tPnYjwPidlYJZJX507snYXUV/FfBVaO3IFZLXO48Qg7iL1bSsetkeZZDU\nsBaR/8R/3AMuBrLJ09MnjPpNsYr+O0qfJuikf1qUqHVqeqzLazAfcv0mtCfe8PzP\noAsOEDyrJW37uHBFcbGtOkUgC1mR91ZzzL3HcpyCBrzfGTVh7kuV2Dm2ogs7Enim\n/ci7PvUZAgMBAAECggEABcED3qUoLcoQOZa6jykbasLQ+FfC7rDPKDbrtiZiWOyf\n05W9QTKhk4WVHjQnPyUH/Ud4fjwRAebNV01tNrq8EyPjBxva87EXGCeu0aCuAFt5\nDOjAEjaJQWmqXGTf5cm2YO/JEYuvrwRQaQvBv2Fa2DnwE+Q0owhnTjCOs7veVNEd\ni/yTg+HBHujD2auB1wtpWPrzeuxeM7sFfwH+rpcgi5grWLqRpVHMa333QTfNm32F\nQtDjNqm0pHmmV2q4XN9pWp+EdbymVYN/5/+QOmEr6FH65y0zhK/0WjiT9qB8GhFM\nnlhZ3y579Nndkfkf6XD3BvL39EOJ5XLGGkT1Xt+PwQKBgQDeujnOmkgJuArwSgV6\neE/3pAc++eHpKvtNgilM2uGzQnBnhocfXAzuOp9l6k0q4oBR988DkXWdcbexWfam\n+BS6erApFIPJn+rSP2mY5Rk+atLvedYTtVLNmQ0Wqr46YQ4QmloRQrsKttMlyQ4r\nwVxgNwzDgKVil1nLI/7XjO/72QKBgQC1fonwLwGkhHhFDlGP4Qds+1aCrpSVFzwy\nkdc7fvCZ61MX0BTce2/nqwcKDrockctRl1d2fsQwU8A2PFNuuKgNauNvKG8Y/iXB\n/ijxD4eZGSrLPmEMMMWT/0fQRurTDHmNtaW65Io12YgLCXrsaLF+CdreSaiLpOVO\ndqX0G007QQKBgQDCLTkYlgkX8AwZUW9VRm7xR1/J17DMx1wwRroa9viuf83fc7l5\n7ZaYWyN8hrigGrgkvhcM1VPk3692Pyh6iO4JZc0PA4Oh1Hm0svQtCA7qC9e6UE4D\nAKIf/L8cc99EpjjM4MSFJ9hJjvqmhpKEMx+GAnhuOUn2mlz+bXNQGN9ggQKBgGxR\n622IAIj57vX4B8HBYjcvAoDYRSF+TpU36ac+qcaTZnJN5EV6/lzb/EWKaJVohlpZ\n4v97xQe61HsKIhlw6AuqAbd0AGqANHTFhhXpWNqM5LeMsUsfSKx9rZSm3ru7NEjZ\nYuJaSAq/m6xKqiyyh0xcAV6tw4QklB7yPTWlncCBAoGAViXO84ViCR1xSD1Fw3Hq\n2lLgQIXZDqj86eWPqZfscBbIRj9RHsxfnQppG5/DkRo7dwieKuhy2KZUvwSjEyCU\nja7q4wBxkZ/u+j5W2val5owCWz6A4Hi7JQQfvhAQZ+zuQUNtfpKWaoLMEAVWe1XN\n5onKfWcURFzyCJGOgANfUcs=\n-----END PRIVATE KEY-----\n",
    "client_email":
        "firebase-adminsdk-fbsvc@chat-and-noti.iam.gserviceaccount.com",
    "client_id": "103759941579118542670",
    "auth_uri": "https://accounts.google.com/o/oauth2/auth",
    "token_uri": "https://oauth2.googleapis.com/token",
    "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
    "client_x509_cert_url":
        "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-fbsvc%40chat-and-noti.iam.gserviceaccount.com",
    "universe_domain": "googleapis.com",
  };

  List<String> scopes = [
    "https://www.googleapis.com/auth/userinfo.email",
    "https://www.googleapis.com/auth/firebase.database",
    "https://www.googleapis.com/auth/firebase.messaging",
  ];

  http.Client client = await auth.clientViaServiceAccount(
    auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
    scopes,
  );

  auth.AccessCredentials credentials = await auth
      .obtainAccessCredentialsViaServiceAccount(
        auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
        scopes,
        client,
      );

  client.close();
  return credentials.accessToken.data;
}

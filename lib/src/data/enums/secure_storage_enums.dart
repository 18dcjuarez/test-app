enum SecureStorageKey { token, refreshToken, userId }

extension SecureStorageKeyExtension on SecureStorageKey {
  String get key {
    switch (this) {
      case SecureStorageKey.token:
        return 'token';
      case SecureStorageKey.refreshToken:
        return 'refreshToken';
      case SecureStorageKey.userId:
        return 'userId';
    }
  }
}

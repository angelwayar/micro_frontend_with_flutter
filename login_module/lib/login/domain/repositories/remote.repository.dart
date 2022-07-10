abstract class RemoteRepository {
  Future<void> loginWithCredentials({
    required final String email,
    required final String password,
  });
}

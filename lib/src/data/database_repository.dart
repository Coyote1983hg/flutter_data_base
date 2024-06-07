abstract class DatabaseRepository {
  Future<void> storeName(String name);
  Future<String?> getNameFromStorage();
}

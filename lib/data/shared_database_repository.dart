abstract class SharedDatabaseRepository {
  // Gibt die Items zurück.
  Future<String> getSettings();

  // Fügt ein neues Item hinzu.
  Future<void> saveSettings(Map<String, dynamic> item);
}

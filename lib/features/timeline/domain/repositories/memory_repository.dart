import '../entities/memory.dart';

/// Contrat d'accès aux souvenirs affichés dans "Notre Histoire".
abstract class MemoryRepository {
  Future<List<Memory>> getAllMemories();
  Future<void> addMemory(Memory memory);
  Future<void> updateMemory(Memory memory);
  Future<void> deleteMemory(String memoryId);
}

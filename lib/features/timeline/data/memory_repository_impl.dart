import '../domain/entities/memory.dart';
import '../domain/repositories/memory_repository.dart';

/// Implémentation simple en mémoire, à remplacer par une
/// persistance locale (Hive/SQLite) pour conserver les souvenirs
/// entre les sessions.
class MemoryRepositoryImpl implements MemoryRepository {
  final List<Memory> _memories = [];

  @override
  Future<List<Memory>> getAllMemories() async {
    final sorted = [..._memories]..sort((a, b) => a.date.compareTo(b.date));
    return sorted;
  }

  @override
  Future<void> addMemory(Memory memory) async {
    _memories.add(memory);
  }

  @override
  Future<void> updateMemory(Memory memory) async {
    final index = _memories.indexWhere((m) => m.id == memory.id);
    if (index != -1) {
      _memories[index] = memory;
    }
  }

  @override
  Future<void> deleteMemory(String memoryId) async {
    _memories.removeWhere((m) => m.id == memoryId);
  }
}

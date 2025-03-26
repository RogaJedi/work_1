abstract class ApiService {
  Future<void> addToFavorites(int productId);
  Future<void> removeFromFavorites(int productId);
  Future<List<int>> getFavoriteIds();
}

// Create a mock implementation for testing
class MockApiService implements ApiService {
  // Simulate a database/storage
  final Set<int> _favoriteIds = {};


  @override
  Future<void> addToFavorites(int productId) async {
    _favoriteIds.add(productId);
  }

  @override
  Future<void> removeFromFavorites(int productId) async {
    _favoriteIds.remove(productId);
  }

  @override
  Future<List<int>> getFavoriteIds() async {
    return _favoriteIds.toList();
  }

  // Helper method to check if a product is favorited
  Future<bool> isFavorite(int productId) async {
    return _favoriteIds.contains(productId);
  }

  // Helper method to clear all favorites (for testing)
  Future<void> clearFavorites() async {
    _favoriteIds.clear();
  }
}
abstract class ApiService {
  Future<void> addToFavorites(String productId);
  Future<void> removeFromFavorites(String productId);
  Future<List<String>> getFavoriteIds();
}

// Create a mock implementation for testing
class MockApiService implements ApiService {
  // Simulate a database/storage
  final Set<String> _favoriteIds = {};


  @override
  Future<void> addToFavorites(String productId) async {
    _favoriteIds.add(productId);
  }

  @override
  Future<void> removeFromFavorites(String productId) async {
    _favoriteIds.remove(productId);
  }

  @override
  Future<List<String>> getFavoriteIds() async {
    return _favoriteIds.toList();
  }

  // Helper method to check if a product is favorited
  Future<bool> isFavorite(String productId) async {
    return _favoriteIds.contains(productId);
  }

  // Helper method to clear all favorites (for testing)
  Future<void> clearFavorites() async {
    _favoriteIds.clear();
  }
}
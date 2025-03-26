class ProductCardState {
  final bool favorite;

  ProductCardState({
    this.favorite = false,
  });

  ProductCardState copyWith({
    bool? favorite,
  }) {
    return ProductCardState(
      favorite: favorite ?? this.favorite,
    );
  }
}
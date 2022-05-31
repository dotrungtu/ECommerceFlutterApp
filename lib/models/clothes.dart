
class Clothes {
  String? productName;
  String? price;
  String? imageUrl;

  Clothes(
      this.productName,
      this.price,
      this.imageUrl,);

  static List<Clothes> generateClothes() {
    return [
      Clothes(
        'Fit Shirt',
        '419.000 ₫',
        'assets/images/arrival1.png',
      ),
      Clothes(
        'Laplace Shirt',
        '449.000 ₫',
        'assets/images/arrival2.png',
      ),
      Clothes(
        'Fit Shirt',
        '419.000 ₫',
        'assets/images/arrival1.png',
      ),
      Clothes(
        'Laplace Shirt',
        '449.000 ₫',
        'assets/images/arrival2.png',
      ),
      Clothes(
        'Fit Shirt',
        '419.000 ₫',
        'assets/images/arrival1.png',
      ),
      Clothes(
        'Laplace Shirt',
        '449.000 ₫',
        'assets/images/arrival2.png',
      ),
    ];
  }
}
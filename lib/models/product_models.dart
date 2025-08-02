class ProductModels {
  String title;
  String category;
  double price;
  double rating;
  String image;
  bool isFavorite;

  ProductModels({
    required this.title,
    required this.category,
    required this.price,
    required this.rating,
    required this.image,
    this.isFavorite = false,
  });
}

// NOTE di generate secara random, sehingga gambar tidak sesuai dengan isi produk
final List<ProductModels> productList = [
  ProductModels(
    title: 'Modern Light Clothes',
    category: 'T-Shirt',
    price: 212.99,
    rating: 5.0,
    image: 'assets/images/dummy1.jpg',
  ),
  ProductModels(
    title: 'Light Dress Bless',
    category: 'Dress',
    price: 162.99,
    rating: 5.0,
    image: 'assets/images/dummy2.jpg',
  ),
  ProductModels(
    title: 'Urban Streetwear',
    category: 'T-Shirt',
    price: 189.49,
    rating: 4.7,
    image: 'assets/images/dummy3.jpg',
  ),
  ProductModels(
    title: 'Casual Oversized',
    category: 'Pants',
    price: 119.00,
    rating: 4.5,
    image: 'assets/images/dummy4.jpg',
  ),
  ProductModels(
    title: 'Soft Fit Blouse',
    category: 'Dress',
    price: 143.75,
    rating: 4.8,
    image: 'assets/images/profile.png',
  ),
  ProductModels(
    title: 'Flowy Summer Tee',
    category: 'T-Shirt',
    price: 98.50,
    rating: 4.3,
    image: 'assets/images/dummy2.jpg',
  ),
  ProductModels(
    title: 'Minimal Jogger Pants',
    category: 'Pants',
    price: 250.00,
    rating: 4.9,
    image: 'assets/images/dummy3.jpg',
  ),
  ProductModels(
    title: 'Relaxed Denim',
    category: 'Pants',
    price: 178.30,
    rating: 4.6,
    image: 'assets/images/profile.png',
  ),
  ProductModels(
    title: 'Weekend Fit Shirt',
    category: 'T-Shirt',
    price: 132.99,
    rating: 4.2,
    image: 'assets/images/dummy1.jpg',
  ),
  ProductModels(
    title: 'Elegant Long Dress',
    category: 'Dress',
    price: 224.00,
    rating: 4.9,
    image: 'assets/images/dummy2.jpg',
  ),
  ProductModels(
    title: 'Comfy Lounge Pants',
    category: 'Pants',
    price: 199.99,
    rating: 4.4,
    image: 'assets/images/dummy3.jpg',
  ),
  ProductModels(
    title: 'Oversized Tee Pack',
    category: 'T-Shirt',
    price: 154.00,
    rating: 4.7,
    image: 'assets/images/dummy4.jpg',
  ),
  ProductModels(
    title: 'Everyday Dress',
    category: 'Dress',
    price: 165.45,
    rating: 4.5,
    image: 'assets/images/profile.png',
  ),
  ProductModels(
    title: 'Slim Fit Pants',
    category: 'Pants',
    price: 229.00,
    rating: 4.8,
    image: 'assets/images/dummy2.jpg',
  ),
  ProductModels(
    title: 'Chic Casual Tee',
    category: 'T-Shirt',
    price: 188.88,
    rating: 4.6,
    image: 'assets/images/dummy1.jpg',
  ),
  ProductModels(
    title: 'Work Jeans',
    category: 'Pants',
    price: 50.88,
    rating: 4.8,
    image: 'assets/images/dummy4.jpg',
  ),
];

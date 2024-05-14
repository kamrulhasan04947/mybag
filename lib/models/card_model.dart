class CardModel {
  final String dressName, dressColor, dressSize, dressImage;
  int dressPrice, quantity;

  CardModel({
    required this.dressName,
    required this.dressColor,
    required this.dressSize,
    required this.dressPrice,
    required this.dressImage,
    required this.quantity,
  });
}

List<CardModel> cardContents = [
  CardModel(
    dressName: "Pullover",
    dressColor: "Black",
    dressSize: "L",
    dressPrice: 700,
    dressImage: "https://images.pexels.com/photos/6995886/pexels-photo-6995886.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    quantity: 1,
  ),
  CardModel(
    dressName: "T-Shirt",
    dressColor: "Grey",
    dressSize: "L",
    dressPrice: 1200,
    dressImage: "https://cdn.pixabay.com/photo/2024/05/05/05/34/ai-generated-8740242_640.jpg",
    quantity: 1,
  ),
  CardModel(
    dressName: "Sport Dress",
    dressColor: "Black",
    dressSize: "M",
    dressPrice: 800,
    dressImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQItPaI6409NIQ4VEAgHSWLrDPuITFmvMl3R-C096NOx8ZtqlGKhXvO1BrtM7bFuCqmcF4&usqp=CAU",
    quantity: 1,
  )
];
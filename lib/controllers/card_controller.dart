import '../models/card_model.dart';

class CardController{

  int totalPrice(List<CardModel> items){
    int totalPrice = 0;
    for(CardModel item in items){
      totalPrice += item.dressPrice;
    }
    return totalPrice;
  }

  int increaseQuantity(int totalPrice, int index, List<CardModel> cardItems){
    cardItems[index].quantity++;
    totalPrice += cardItems[index].dressPrice;
    return totalPrice;
  }

  int decreaseQuantity(int totalPrice, int index, List<CardModel> cardItems){
    if(cardItems[index].quantity > 1){
      cardItems[index].quantity--;
      totalPrice -= cardItems[index].dressPrice;
    }
    return totalPrice;
  }

}
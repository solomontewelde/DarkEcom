
class DressModel{
  String _id;
  String _description;
  String _price;

  DressModel(String id, String description, String price){
    this._id= id;
    this._description = description;
    this._price = price;
  }

  String get price => _price;

  set price(String value) {
    _price = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }
}
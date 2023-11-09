class RecentItemModel{
  final  String image;
  final String name;
  final double rate;
  final String categoryName;
 final String type;
 final String rateNumber;
  final double prices;
  //final String recentId;
  List<dynamic> ing = [];
  //Map<String,dynamic> myMap;

  RecentItemModel( {
    required this.image, required this.name, required this.rate,required this.categoryName,
 required this.type, required this.rateNumber,required this.prices,
// required this.myMap,
    //required this.recentId,
    required this.ing,
  });
  factory RecentItemModel.fromJson(Map<String ,dynamic> json){
    return RecentItemModel(
      image : json['image'],
      name : json['name'],
      rate : json['rate'],
      categoryName : json['category_name'],
      type : json['type'],
      rateNumber :json['rate_number'],
      prices : json['price'],
       ing : json['ingredients'],
      //myMap: json['ingredients']['id'] ?? {},

    );
  }
}
class RecentItemModel{
  final  String image;
  final String name;
  final double rate;
  final String categoryName;
 final String type;
 final String rateNumber;
  RecentItemModel( {
    required this.image, required this.name, required this.rate,required this.categoryName,
 required this.type, required this.rateNumber});
  factory RecentItemModel.fromJson(Map<String ,dynamic> json){
    return RecentItemModel(
      image : json['image'],
      name : json['name'],
      rate : json['rate'],
      categoryName : json['category_name'],
      type : json['type'],
      rateNumber :json['rate_number'],
    );
  }
}
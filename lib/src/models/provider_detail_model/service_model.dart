class Service {
  String name;
  List<String> description;
  String price;
  int estimateTime;
  String status;
  String category;
  String imageUrl;
  List<String> serviceImages;
  bool isServiceCombo;
  String note;

  Service({
    this.name,
    this.description,
    this.price,
    this.estimateTime,
    this.status,
    this.category,
    this.imageUrl,
    this.serviceImages,
    this.isServiceCombo,
    this.note,
  });
}
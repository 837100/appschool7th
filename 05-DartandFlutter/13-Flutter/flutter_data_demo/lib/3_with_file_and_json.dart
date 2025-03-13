class DataItem {
  final String title;
  DataItem({required this.title});

  factory DataItem.fromJson(Map<String, dynamic> json) {
    // 키밸류의 타이틀만 가져와서 객체를 생성
    return DataItem(title: json['title']);
  }
}

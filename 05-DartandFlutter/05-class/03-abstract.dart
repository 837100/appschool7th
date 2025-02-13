abstract class Media {
  late String myId;
  late String myTitle;
  late String myType;

  void setMediaTitle(String mediaTitle); 
  String getMediaTitle();

  void setMediaType(String mediaType);
  String getMediaType();

  void setMediaId(String myId);
  String getMediaId();
}

class Book implements Media {
  @override
  late String myId;

  @override
  late String myTitle;

  @override 
  late String myType;

  @override 
  String getMediaTitle() {
    return myTitle;
  }

  @override 
  void setMediaTitle(String mediaTitle) {
    myTitle = mediaTitle;
  }

  @override
  String getMediaType() {
    return myType;
  }

  @override 
  void setMediaType(String mediaType) {
    myType = mediaType;
  }

  @override
  String getMediaId() {
    return myId;
  }

  @override 
  void setMediaId(String mediaId) {
    myId = mediaId;
  }
}

void main() {
  var myBook = Book();
  myBook.setMediaId('1234');
  myBook.setMediaTitle('Dart Programming');
  myBook.setMediaType('Book');
  print('Media ID: ${myBook.getMediaId()}');
  print('Media Title: ${myBook.getMediaTitle()}');
  print('Media Type: ${myBook.getMediaType()}');
}
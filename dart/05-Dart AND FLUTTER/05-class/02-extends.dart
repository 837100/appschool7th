class Media {
  String title = "";
  String type = "";

  Media() {
    type = "Class";
  }

  void setMediaTitle(String mediaTitle) {
    title = mediaTitle;
  }

  String getMediaTitle() {
    return title;
  }

  String getMediaType() {
    return type;
  }
}

class Book extends Media {
  String author = '';
  String publisher = '';

  Book() {
    type = "Subclass";
  }

  void setBookAuthor(String bookAuthor) {
    author = bookAuthor;
  }

  void setPublisher(String publisher) {
    this.publisher = publisher;
  }

  String getBookAuthor() {
    return author;
  }

  String getPublisher() {
    return publisher;
  }
}

void main() {
  var myMedia = Media();

  myMedia.setMediaTitle("Dart programming");
  print('Media Title: ${myMedia.getMediaTitle()}');
  print('Media Type: ${myMedia.getMediaType()}');

  var myBook = Book();
  myBook.setMediaTitle("Dart Programing");
  myBook.setBookAuthor('John Doe');
  myBook.setPublisher('Dart publisher');

  print(myBook.getMediaTitle());
  print(myBook.getBookAuthor());
  print(myBook.getPublisher());
}

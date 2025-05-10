void main() {
  // Hello.

  Library library = Library();
  library.addItem(Book('1984', '1949', 'Ahmed'));
  library.showAllItems();
}

abstract class LibraryItem {
  String title;
  String year;

  LibraryItem(this.title, this.year);

  void displayInfo();
}

class Book extends LibraryItem {
  String author;

  Book(String title, String year, this.author) : super(title, year);

  @override
  void displayInfo() {
    print('Book: $title, Year: $year, Author: $author');
  }
}

class Magazine extends LibraryItem {
  String issueNumber;

  Magazine(String title, String year, this.issueNumber) : super(title, year);

  @override
  void displayInfo() {
    print('Magazine: $title, Year: $year, Issue Number: $issueNumber');
  }
}

class Library {
  List<LibraryItem> items = [];

  void addItem(LibraryItem item) {
    items.add(item);
  }

  void displayItems() {
    for (var item in items) {
      item.displayInfo();
    }
  }

  void showAllItems() {
    for (var item in items) {
      item.displayInfo();
    }
  }
}

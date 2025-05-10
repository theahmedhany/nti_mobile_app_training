void main() {
  // Hello.

  Book book1 = Book(title: '1984', author: 'George Orwell', year: 1949);
  // book1.describe();

  Library library = Library();
  library.addBook(book1);
  library.addBook(
    Book(title: 'To Kill a Mockingbird', author: 'Harper Lee', year: 1960),
  );
  library.printAllBooks();
}

class Book {
  String title;
  String author;
  int year;

  Book({required this.title, required this.author, required this.year});

  void describe() {
    print('Title: $title');
    print('Author: $author');
    print('Year: $year');
  }
}

class Library {
  List<Book> books = [];

  void addBook(Book book) {
    books.add(book);
  }

  void removeBook(Book book) {
    books.remove(book);
  }

  void printAllBooks() {
    for (var book in books) {
      book.describe();
      print('---');
    }
  }
}

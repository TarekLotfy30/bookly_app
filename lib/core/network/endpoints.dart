class EndPoints {
  EndPoints._();

  //---------------------Base url------------------------------
  static const String baseUrl = 'https://www.googleapis.com/books/v1/';

  //----------------------Endpoints-----------------------------
  static const String featuredBooks = '''
volumes?Filtering=free-ebooks&q=subject:Programming''';

  static const String newestBooks = '''
volumes?Filtering=free-ebooks&Sorting=newest &q=computer science''';
}

//https://newsapi.org/
// v2/top-headlines?              EL PATH HAYB2A MN GHER "?"
// country=us&category=business&apiKey=6daca0ce077440d7b4ffdfda4742e424

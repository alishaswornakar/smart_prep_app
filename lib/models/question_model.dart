// we will create our question model here
// create a simple class

  //options will be like - {'1':true,'2':false} = something like these

  // create a constructor
 class Question {
  final String id;
  final String category;
  final String title;
  final Map<String, bool> options;

  Question({
    required this.id,
    required this.category,
    required this.title,
    required this.options,
  });
  // override the toString method to print the questions on console
  @override
  String toString() {
    return 'Question(id: $id, title: $title, options: $options)';
  }
}
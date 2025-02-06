class Task {
  final String title;
  final DateTime createdAt;

  Task({required this.title}) : createdAt = DateTime.now(); 
}

class Notes {
  String title;
  String description;
  bool completed;
  bool deleted;
  Notes({
    required this.title,
    required this.description,
    this.completed = true,
    this.deleted = false,
  });
  factory Notes.fromMap(Map<String, dynamic> map) {
    return Notes(
      title: map['title'],
      description: map['description'],
      completed: map['completed'] ?? false,
    );
  }
  factory Notes.fromJson(Map<String, dynamic> json) {
    return Notes(
      title: json['title'],
      description: json['description'],
    );
  }

  // Convert Note object to Map
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'completed': completed,
    };
  }

}

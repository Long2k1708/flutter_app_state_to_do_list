class TaskData {
  int id;
  String taskName;
  bool completed;

  @override
  int get hashCode => id;

  @override
  bool operator == (other) => other is TaskData && other.id == id;
}
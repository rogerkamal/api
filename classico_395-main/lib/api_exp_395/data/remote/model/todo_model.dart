
class TodoModel{
  int id;
  String todo;
  bool completed;
  int userId;

  TodoModel({required this.id,required this.todo, required this.completed, required this.userId});

  ///fromJson
  factory TodoModel.fromJson(Map<String,dynamic> json){
    return TodoModel(id: json['id'], todo: json['todo'], completed: json['completed'], userId: json['userId']);
  }

}

class TodoDataModel{
  List<TodoModel> todos;
  int total;
  int skip;
  int limit;

  TodoDataModel({
    required this.todos, required this.total, required this.skip,required this.limit
});



  ///fromJson
    factory TodoDataModel.fromJson(Map<String,dynamic> json){
      List<TodoModel> mTodos = [];
      for(Map<String,dynamic> eachTodo in json['todos']){
        mTodos.add(TodoModel.fromJson(eachTodo));
      }


      return TodoDataModel(todos: mTodos, total: json['total'], skip: json['skip'], limit: json['limit']);
    }
}
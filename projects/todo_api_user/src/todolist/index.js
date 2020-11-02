import React, { useEffect, useState } from "react";
import TodoForm from "./TodoForm";
import TodoItem from "./TodoItem";

export default function TodoList() {
  const api = "http://localhost:3001/api/v1/todos";
  const [todos, setTodos] = useState([]);
  const get_tasks = () => {
    fetch(api)
      .then((res) => res.json())
      .then((response_items) => {
        setTodos(response_items.reverse());
      });
  };
  useEffect(() => {
    get_tasks();
  }, []);

  const updateTodoList = (data) => {
    const newTodos = todos.unshift(data);
    setTodos(newTodos);
  };
  return (
    <div>
      <TodoForm />
      <ul id="todo_list">
        {todos.map((el) => (
          <TodoItem
            key={el.id}
            task={el.task}
            updateTodoList={updateTodoList}
          />
        ))}
      </ul>
    </div>
  );
}

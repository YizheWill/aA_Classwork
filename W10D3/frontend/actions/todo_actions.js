export const ADD_TODO = 'ADD_TODO';
export const CLEAR = 'CLEAR';
export const DELETE_TODO = 'DELETE_TODO';
export const TOGGLE_COMPLETE = 'TOGGLE_COMPLETE';
export const ADD_TODOS = 'ADD_TODOS';
export const addTodo = (todo) => ({
  type: ADD_TODO,
  todo: todo,
});
export const addTodos = (todos) => ({
  type: ADD_TODOS,
  todos,
});
export const clear = () => ({
  type: CLEAR,
});
export const toggleComplete = (id) => ({
  type: TOGGLE_COMPLETE,
  id,
});
export const deleteTodo = (id) => ({
  type: DELETE_TODO,
  id,
});

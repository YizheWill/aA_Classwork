export const ADD_TODO = "ADD_TODO"
export const CLEAR = "CLEAR"
export const ADD_TODOS = "ADD_TODOS"
export const addTodo = (todo) => ({
  type: ADD_TODO,
  todo: todo
})
export const addTodos = (todos) => ({
  type: ADD_TODOS,
  todos
})
export const clear = () => ({
  type: CLEAR
})

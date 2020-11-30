import React from 'react';
import { deleteTodo, toggleComplete } from '../actions/todo_actions';
import { connect } from 'react-redux';

function TodoDetailView({ todo, deleteTodo }) {
  return (
    <div>
      <li>{todo.body}</li>
      <button onClick={() => deleteTodo(todo.id)}>delete todo</button>
    </div>
  );
}
export default connect(null, (dispatch) => ({
  deleteTodo: (id) => dispatch(deleteTodo(id)),
}))(TodoDetailView);

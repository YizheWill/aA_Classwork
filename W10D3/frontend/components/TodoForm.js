import React, { useState } from 'react';
import { connect } from 'react-redux';
import { addTodo } from '../actions/todo_actions';

function TodoForm({ addTodo }) {
  const [title, setTitle] = useState('');
  const [body, setBody] = useState('');
  const id = Date.now();
  const submitForm = (e) => {
    e.preventDefault();
    const todo = { id, title, body, complete: false };
    console.log('todo', todo);
    addTodo(todo);
    setTitle('');
    setBody('');
  };
  return (
    <form>
      <input
        type='text'
        placeholder='title'
        value={title}
        onChange={(e) => setTitle(e.target.value)}
      />
      <input
        type='text'
        placeholder='body'
        value={body}
        onChange={(e) => setBody(e.target.value)}
      />
      <input type='submit' onClick={(e) => submitForm(e)} value='submit' />
    </form>
  );
}

export default connect(null, (dispatch) => ({
  addTodo: (action) => dispatch(addTodo(action)),
}))(TodoForm);

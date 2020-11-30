import React, { useState } from 'react';
import TodoDetailView from './TodoDetailView';

export default function todoListItem({ todo, toggleComplete }) {
  const [detail, setDetail] = useState(true);
  return (
    <ul>
      <li>{todo.title}</li>
      {todo.done ? <li>completed</li> : <li>not completed</li>}
      <button onClick={() => toggleComplete(todo.id)}>complete todo</button>
      {detail ? (
        <button onClick={() => setDetail(false)}>Show Less</button>
      ) : (
        <button onClick={() => setDetail(true)}>Show more</button>
      )}
      {detail ? <TodoDetailView todo={todo} /> : ''}
    </ul>
  );
}

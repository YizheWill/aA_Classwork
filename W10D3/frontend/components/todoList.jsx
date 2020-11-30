import React from 'react';
import { connect } from 'react-redux';
import { toggleComplete, deleteTodo } from '../actions/todo_actions';
import { allTodos } from '../reducers/selectors';
import TLI from './todo_list_item';
import TodoForm from './TodoForm';

function TodoList({ todos, toggleComplete, deleteTodo }) {
  console.log(todos);
  return (
    <div>
      {todos.map((el) => (
        <TLI
          todo={el}
          key={el.id}
          toggleComplete={toggleComplete}
          deleteTodo={deleteTodo}
        />
      ))}
      <TodoForm />
    </div>
  );
}

const mapStateToProps = (state) => ({
  todos: allTodos(state),
});

const mapDispatchToProps = (dispatch) => {
  return {
    toggleComplete: (id) => dispatch(toggleComplete(id)),
    deleteTodo: (id) => dispatch(deleteTodo(id)),
  };
};
export default connect(mapStateToProps, mapDispatchToProps)(TodoList);

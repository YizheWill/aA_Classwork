import React from 'react';
import { connect } from 'react-redux';
import { allTodos } from '../reducers/selectors' 
import TLI from "./todo_list_item"

function TodoList({todos}) {
    console.log(todos)
    return (
        <div>
            {todos.map(el => <TLI todo={el} key={el.id}/>)}
        </div>
    )
}

const mapStateToProps = (state) => ({
    todos: allTodos(state)
})

// const mapDispatchToProps = (dispatch) => {
//     someFunc: dispatch(action)
// }
// const mapDispatchToProps = (dispatch) => {
//   return {
//     callReceiveTea: (tea) => dispatch(receiveTea(tea)),
//   };
// };
export default connect(mapStateToProps)(TodoList)
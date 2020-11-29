import { ADD_TODO, CLEAR, ADD_TODOS } from '../actions/todo_actions'
// import { addTodo, clear } from '../actions/todo_actions'


const initialState = {
  1: {
    id: 1,
    title: "wash car",
    body: "with soap",
    done: false
  },
  2: {
    id: 2,
    title: "wash dog",
    body: "with shampoo",
    done: true
  }
};

export default function todoReducer(oldState = initialState, action){
    Object.freeze(oldState);
    const newState = {...oldState};
    switch (action.type) {
        case ADD_TODO: 
            newState[action.todo.id] = action.todo;
            return newState;
        case CLEAR:
            return {};
        case ADD_TODOS:
            action.todos.forEach(el => newState[el.id] = el);
            return newState;
        default:
            return oldState;
    }
}
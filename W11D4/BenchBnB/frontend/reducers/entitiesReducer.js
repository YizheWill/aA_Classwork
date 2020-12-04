import chirpsReducer from './chirpsReducer'
import userReducer from './userReducer'
import {combineReducers} from 'redux';
const rootReducer = combineReducers({
  user: userReducer,
  chirps: chirpsReducer,
})

export default rootReducer;
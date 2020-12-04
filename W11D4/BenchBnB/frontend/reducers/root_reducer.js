import {combineReducers} from 'redux';
import entitiesReducer from './entitiesReducer'
import errorsReducer from './errorsReducer'
import sessionReducer from './sessionReducer'
import uiReducer from './uiReducer'

const rootReducer = combineReducers({
  entities: entitiesReducer,
  session: sessionReducer,
  errors: errorsReducer,
  ui: uiReducer
})

export default rootReducer;
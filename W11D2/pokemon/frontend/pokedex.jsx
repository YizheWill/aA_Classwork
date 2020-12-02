
import React from 'react';
import ReactDOM from 'react-dom';
import {receiveAllPokemon, requestAllPokemon} from './actions/pokemon_action'
import {fetchAllPokemon} from './util/api_util'
import configureStore from './store/store'
import {selectAllPokemon} from './reducers/selector'
import Root from './components/Root'


document.addEventListener('DOMContentLoaded', () => {
    const store = configureStore();
  
    window.receiveAllPokemon = receiveAllPokemon; 
    window.requestAllPokemon = requestAllPokemon; 
    window.fetchAllPokemon = fetchAllPokemon; 
    window.store = store;
    window.getState = store.getState
    window.dispatch = store.dispatch
    window.selectAllPokemon = selectAllPokemon
    // window.getSuccess = pokemon => console.log(receiveAllPokemon(pokemon));
// fetchAllPokemon().then(getSuccess);
  const rootEl = document.getElementById('root');
  ReactDOM.render(<Root store={store}/>, rootEl);
});


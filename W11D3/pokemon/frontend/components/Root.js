import React from 'react';
import {HashRouter, Route} from 'react-router-dom';
import PokemonIndexContainer from './PokemonIndexContainer'
import PokemonDetailContainer from './pokemon/PokemonDetailContainer'
import { Provider } from 'react-redux';

const Root = ({ store }) => (
  <Provider store={store}>
    <HashRouter> 
      <Route path="/pokemon/:id" component={PokemonDetailContainer} />
      <Route path="/" component={PokemonIndexContainer} />
    </HashRouter>      
  </Provider>
);

export default Root;
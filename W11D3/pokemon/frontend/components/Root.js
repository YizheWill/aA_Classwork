import React from 'react';
import { Provider } from 'react-redux';
import PokemonIndexContainer from './PokemonIndexContainer';

const Root = ({ store }) => (
  <Provider store={store}>
    <PokemonIndexContainer />
  </Provider>
);

export default Root;

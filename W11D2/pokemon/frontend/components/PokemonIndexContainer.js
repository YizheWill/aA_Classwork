import React, { Component } from 'react';
import { connect } from 'react-redux';
import { selectAllPokemon } from '../reducers/selector';
import { requestAllPokemon } from '../actions/pokemon_action';

class PokemonIndex extends Component {
  componentDidMount() {
    this.props.requestAllPokemon();
  }
  render() {
    return (
      <ul>
        {this.props.pokemon.map((element, idx) => {
          return <li key={idx}>{element.name}</li>;
        })}
      </ul>
    );
  }
}

const mstp = (state) => ({
  pokemon: selectAllPokemon(state),
});
const mdtp = (dispatch) => ({
  requestAllPokemon: () => dispatch(requestAllPokemon()),
});

export default connect(mstp, mdtp)(PokemonIndex);

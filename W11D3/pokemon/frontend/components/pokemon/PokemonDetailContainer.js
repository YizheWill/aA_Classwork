import React from 'react';
import PokemonDetail from './PokemonDetail';
import {connect} from 'react-redux';

const mstp = (state, ownProps) => ({
  pokemon: state.entites.pokemon[ownProps.]
})
const mdtp = (dispatch) => ({
  requestSinglePokemon: (id) => dispatch(requestSinglePokemon(id))
  // ownProps.pokemon.id
  // this.props.match.params.id
})

export default withRouter(connect(mstp, mdtp)(PokemonDetail)) 
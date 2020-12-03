import React,{useEffect} from 'react'
import {connect} from 'react-redux'
import {selectAllPokemon} from '../reducers/selector'
import {requestAllPokemon} from '../actions/pokemon_action'
// import Images from '../../app/assets/images'
import PokemonIndexItem from './pokemon/pokemon_index_item'
import { withRouter } from "react-router";
import {Route} from 'react-router-dom'
class PokemonIndex extends React.Component {
  componentDidMount(){
    this.props.requestAllPokemon()
  }
  render(){
    const pokemonItems = this.props.pokemon.map(poke => (
      <PokemonIndexItem key={poke.id} pokemon={poke} />
    ));
    console.log('pokemon', this.props.pokemon)
    return (
      <ul>
        <Route path={`/pokemon/:id`} component={PokemonDetailContainer} />
          {pokemonItems}
      </ul>
    )
  }
}

const mstp = (state) => ({
  pokemon: selectAllPokemon(state)
})
const mdtp = (dispatch) => ({
  requestAllPokemon: () => dispatch(requestAllPokemon())
})

export default connect(mstp, mdtp)(PokemonIndex)
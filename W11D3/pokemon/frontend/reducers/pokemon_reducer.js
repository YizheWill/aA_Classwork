
import {RECEIVE_ALL_POKEMON, RECEIVE_SINGLE_POKEMON} from '../actions/pokemon_action'

export default function pokemonReducer (oldState = {}, action) {
    Object.freeze(oldState)
    const nextState = {...oldState}
    switch (action.type) {
      case RECEIVE_ALL_POKEMON:
        return action.pokemon
      case RECEIVE_SINGLE_POKEMON:
        // poke = {
        //   id, name, attack, move...
        //   items,
        // }
        return nextState;// TODO 
      default:
        return oldState;
    };
};

import {RECEIVE_ALL_POKEMON} from '../actions/pokemon_action'

export default function pokemonReducer (oldState = {}, action) {
    Object.freeze(oldState)
    const nextState = {...oldState}
    switch (action.type) {
      case RECEIVE_ALL_POKEMON:
        return action.pokemon
      default:
        return oldState;
    };
};
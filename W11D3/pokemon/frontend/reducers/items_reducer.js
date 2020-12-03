import {RECEIVE_SINGLE_POKEMON} from '../actions/pokemon_action'
export default function itemReducer (oldState = {}, action) {
    Object.freeze(oldState)
    const nextState = {...oldState}
    switch (action.type) {
      case RECEIVE_SINGLE_POKEMON:
        let items = action.poke.items;
        return {...oldState, ...items}
      default:
        return oldState;
    };
};
  // {
  //   'pokemon': {
  //     id: 1,
  //     name: somename
  //     attack: ...
  //     defence
  //   },
  //   pokeMoves: {
  //     id: 1,
  //     move_id: 2
  //     pokemon_id: 3
  //   },
  //   moves: {
  //     id: 2,
  //     name: 'fancy move'
  //   },
  //   items: {
  //     1: {
  //       id: 1,
  //       name: 'item name',
  //       pokemonId: 1,
  //       price: $10,
  //       happiness: very happy
  //     }
  //   }
  // }

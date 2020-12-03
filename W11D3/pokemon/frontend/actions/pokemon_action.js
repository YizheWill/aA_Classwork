import * as APIUtil from '../util/api_util'
export const RECEIVE_ALL_POKEMON = "RECEIVE_ALL_POKEMON"; 
export const RECEIVE_SINGLE_POKEMON  = 'RECEIVE_SINGLE_POKEMON';

export const receiveAllPokemon = (pokemon) => ({
    type: RECEIVE_ALL_POKEMON, 
    pokemon
}); 

export const requestAllPokemon = () => (dispatch) => (
  APIUtil.fetchAllPokemon()
    .then(pokemon => dispatch(receiveAllPokemon(pokemon)))
)

export const receiveSinglePokemon = (poke) => ({
  type: RECEIVE_SINGLE_POKEMON,
  poke
})

export const requestSinglePokemon = (id) => (dispatch, getState) => {
  // TODO write receiveSinglePokemon function
  APIUtil.fetchPokemon(id).then(poke => {
    dispatch(receiveSinglePokemon(poke))
  })
}
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

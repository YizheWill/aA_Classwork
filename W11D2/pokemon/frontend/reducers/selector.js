
export const selectAllPokemon = (state) => {
  console.log('state', state)
  return Object.values(state.entities.pokemon)
}

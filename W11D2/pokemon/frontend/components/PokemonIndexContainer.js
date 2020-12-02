import React from 'react'
import {connect} from 'react-redux'
import {selectAllPokemon} from '../reducers/selector'

function PokemonIndex() {
  return (
    <div>
      
    </div>
  )
}

const mstp = (state) => {

}
const mdtp = (dispatch) => {

}

export default connect(mstp, mdtp)(PokemonIndex)
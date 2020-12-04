const _initState = { id: null }
export default function sessionReducer(oldState=_initState, action) {
  const newState = {...oldState};
  switch (action.type) {
    default:
      return oldState; 
  }
}
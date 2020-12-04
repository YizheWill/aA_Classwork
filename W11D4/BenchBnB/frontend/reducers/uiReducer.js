const _initState = {}
export default function uiReducer(oldState=_initState, action) {
  const newState = {...oldState};
  switch (action.type) {
    default:
      return oldState; 
  }

}
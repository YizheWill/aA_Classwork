import * as APIUtil from '../util/session_api_util';
export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER';

export const receiveCurrentUser = (currentUser) =>  ({
  type: RECEIVE_CURRENT_USER,
  currentUser
})

export const login = (user) => dispatch => (
  APIUtil.login(user).then(user => dispatch(receiveCurrentUser(user)))
)

logout() (thunk action creator)
signup(user) (thunk action creator)
logoutCurrentUser() (regular action creator)
receiveErrors(errors) (regular action creator)
import { RECEIVE_ALL_POSTS, RECEIVE_POST, REMOVE_POST } from '../actions/post_actions';
import merge from 'lodash/merge';

/*
Export a `PostsReducer` that takes in the old state and appropriately handles
all post actions.
*/

export default (oldState = {}, action) => {
  Object.freeze(oldState);
  switch (action.type) {
    case RECEIVE_ALL_POSTS:
      return action.posts;
    case RECEIVE_POST:
      return Object.assign({}, oldState, { [action.post.id]: action.post });
    case REMOVE_POST:
      const newState = { ...oldState };
      delete newState[action.postId];
      return newState;
    default:
      return oldState;
  }
};

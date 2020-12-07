/*
Export the following API Util functions with the specified parameters:

1. `fetchPosts`
2. `fetchPost(postId)`
3. `createPost(post)`
4. `updatePost(post)`
5. `deletePost(postId)`
*/

export const fetchPosts = () => $.ajax({ method: 'get', url: '/api/posts' });
export const fetchPost = (postId) =>
  $.ajax({ method: 'get', url: `/api/posts/${postId}` });
export const createPost = (post) =>
  $.ajax({ method: 'post', url: `/api/posts/`, data: { post } });
export const updatePost = (post) =>
  $.ajax({ method: 'patch', url: `/api/posts/${post.id}`, data: { post } });
export const deletePost = (postId) =>
  $.ajax({ method: 'delete', url: `/api/posts/${postId}` });

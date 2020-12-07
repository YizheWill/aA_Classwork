import PostIndexItem from './post_index_item';
import CreatePostFormContainer from './create_post_form_container';

/*
Export a `PostIndex` presentational component that renders a list (`ul`) of
`PostIndexItems`. This component should receive `posts` from the store as a prop
via its container and fetch them once it has successfully mounted to the DOM.
Below the `ul`, render the `CreatePostFormContainer` component.
*/

import React, { Component } from 'react';

export class PostIndex extends Component {
  componentDidMount() {
    this.props.fetchPosts();
  }
  render() {
    return (
      <div>
        <ul>
          {this.props.posts.map((post) => {
            return (
              <PostIndexItem
                key={post.id}
                deletePost={this.props.deletePost}
                post={post}
              />
            );
          })}
        </ul>
        <CreatePostFormContainer />
      </div>
    );
  }
}

export default PostIndex;

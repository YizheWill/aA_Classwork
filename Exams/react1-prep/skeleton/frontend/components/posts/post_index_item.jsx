import { Link } from 'react-router-dom';

/*
Export a `PostIndexItem` presentational component that takes in a `post` and the
`deletePost` action via props. The component should render an `li` containing
the following:

1. A link to the post's show page with text of the post's title
2. A link to the post's edit page with text 'Edit'.
3. A button to delete the post.
*/

import React, { Component } from 'react';

export class PostIndexItem extends Component {
  render() {
    return (
      <div>
        <li>
          <Link to={`/posts/${this.props.post.id}`}>{this.props.post.title}</Link>
          <Link to={`/posts/${this.props.post.id}/edit`}>Edit</Link>
          <button onClick={() => this.props.deletePost(this.props.post.id)}>
            Delete
          </button>
        </li>
      </div>
    );
  }
}

export default PostIndexItem;
import { Link } from 'react-router-dom';

/*
Export a `PostShow` presentational component that renders a post's information
(title and body). This component should receive the `post` from the store as
props via its container and fetch it once it has successfully mounted to the
DOM. Additionally, this component should contain a link back to the `PostIndex`.
*/

import React, { Component } from 'react';

export class PostShow extends Component {
  componentDidMount() {
    this.props.fetchPost(this.props.match.params.postId);
  }
  render() {
    const { post } = this.props;
    return (
      <div>
        <h2>{post.title}</h2>
        <h5>{post.body}</h5>
        <Link to='/'>PostIndex</Link>
      </div>
    );
  }
}

export default PostShow;

import { Link } from 'react-router-dom';

/*
Export a `PostShow` presentational component that renders a post's information
(title and body). This component should receive the `post` from the store as
props via its container and fetch it once it has successfully mounted to the
DOM. Additionally, this component should contain a link back to the `PostIndex`.
*/

// import React, { Component } from 'react';

// export class PostShow extends Component {
//   componentDidMount() {
//     this.props.fetchPost(this.props.match.params.postId);
//   }
//   render() {
//     return (
//       <div>
//         <h2>{this.props.post.title}</h2>
//         <h2>{this.props.post.body}</h2>
//         <Link to='/'>Index Page</Link>
//       </div>
//     );
//   }
// }

// export default PostShow;

import React, { useEffect } from 'react';
import { useParams } from 'react-router-dom';

function PostShow({ post, fetchPost }) {
  const { postId } = useParams();
  useEffect(() => {
    fetchPost(postId);
  }, []);
  return (
    <div>
      <h2>{useParams().postId}</h2>
      <h2>{post && post.title}</h2>
      <h2>{post && post.body}</h2>
      <Link to='/'>PostIndex</Link>
    </div>
  );
}

export default PostShow;

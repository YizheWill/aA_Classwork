/*
Export a `PostForm` presentational component that creates a form to either
create or edit a post (it will be used by two separate containers). The form
should indicate whether it is a create or edit form based on the `formType`
prop. The form should initialize state to the `post` passed in from props. Use
controlled inputs and trigger the `action` passed in from the container upon
submission. Use a text input for the title and a textarea for the body.
*/
import React, { Component } from 'react';

export class PostForm extends Component {
  constructor(props) {
    super(props);
    this.state = this.props.post;

    this.handleSubmit = this.handleSubmit.bind(this);
  }

  update(field) {
    return (e) => this.setState({ [field]: e.currentTarget.value });
  }
  handleSubmit(e) {
    e.preventDefault();
    this.props.action(this.state);
  }
  render() {
    return (
      <div>
        <h3>{this.props.formType}</h3>
        <form onSubmit={this.handleSubmit}>
          <label>
            title
            <input type='text' value={this.state.title} onChange={this.update('title')} />
          </label>
          <label>
            body
            <textarea value={this.state.body} onChange={this.update('body')} />
          </label>
          <input type='submit' value={this.props.formType} />
        </form>
      </div>
    );
  }
}

export default PostForm;

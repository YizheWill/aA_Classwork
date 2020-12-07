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
  handleSubmit(e) {
    e.preventDefault();
    this.props.action(this.state);
  }
  handleChange(field) {
    return (e) => this.setState({ [field]: e.target.value });
  }
  render() {
    return (
      <form onSubmit={this.handleSubmit}>
        <h2>{this.props.formType}</h2>
        <input
          type='text'
          value={this.state.title}
          onChange={this.handleChange('title')}
        />
        <textarea value={this.state.body} onChange={this.handleChange('body')} />
        <input type='submit' value={this.props.formType} />
      </form>
    );
  }
}

export default PostForm;

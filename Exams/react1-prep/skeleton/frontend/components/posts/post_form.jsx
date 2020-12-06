/*
Export a `PostForm` presentational component that creates a form to either
create or edit a post (it will be used by two separate containers). The form
should indicate whether it is a create or edit form based on the `formType`
prop. The form should initialize state to the `post` passed in from props. Use
controlled inputs and trigger the `action` passed in from the container upon
submission. Use a text input for the title and a textarea for the body.
*/

import React, { Component } from 'react';

class PostForm extends Component {
  constructor(props) {
    super(props);
    this.state = this.props.post;
    this.handleChange = this.handleChange.bind(this);
  }

  samChange(type) {
    return (e) => this.setState({ [type]: e.target.value });
  }
  handleChange(type) {
    return (e) => this.setState({ [type]: e.target.value });
  }
  hc(e) {
    console.log(e.target.name);
    this.setState({ [e.target.name]: e.target.value });
    console.log(this.state);
  }
  handleSubmit(e) {
    e.preventDefault();
    this.props.action(this.state);
  }
  render() {
    return (
      <form onSubmit={(e) => this.handleSubmit(e)}>
        <h2>{this.props.formType}</h2>
        <label>
          title
          <input
            type='text'
            value={this.state.title}
            name='title'
            // onChange={(e) => this.hc(e)}
            onChange={this.samChange('title')}
            // onChange={this.handleChange('title')}
          />
        </label>
        <label>
          body
          <textarea
            value={this.state.body}
            name='body'
            // onChange={(e) => this.hc(e)}
            onChange={this.samChange('body')}
            // onChange={this.handleChange('body')}
          />
        </label>
        <button type='submit'>{this.props.formType}</button>
      </form>
    );
  }
}

export default PostForm;

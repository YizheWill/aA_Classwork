import React, { useState } from "react";
import { TextField, Button } from "@material-ui/core";

export default function TodoForm(props) {
  const api = "http://localhost:3001/api/v1/todos";
  const [todo, setTodo] = useState("");

  const submitForm = (formData) => {
    var data = new FormData(formData);
    fetch(api, {
      method: "POST",
      mode: "cors",
      body: data,
    })
      .then((response) => response.json())
      .then((response) => {
        props.updateTodoList(response);
      });
  };
  return (
    <div>
      <form
        onSubmit={(e) => submitForm(e.target)}
        id="todo_form"
        autoComplete="off"
      >
        <TextField
          id="standard_multiline_flexible"
          label="task description"
          variant="outlined"
          type="text"
          name="todo[task]"
          onChange={(e) => setTodo(e.target.value)}
        />
        <Button variant="contained" color="primary" type="submit">
          Add TODO
        </Button>
      </form>
    </div>
  );
}

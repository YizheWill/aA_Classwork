import React from "react";
import ReactDOM from "react-dom";
import App from "./components/app";
import {Provider} from "react-redux";
import store from "./store"; // put an index.js file in the store folder.. might not work
import {allTodos} from "./reducers/selectors"

document.addEventListener("DOMContentLoaded", () => {
    window.store = store;
    window.allTodos = allTodos;
    ReactDOM.render(<Provider store={store} ><App /></Provider>, document.getElementById("root"));
})
import React from "react";
import ReactDOM from "react-dom";
import {login, logout, signup} from './util/session_api_util'
import configureStore from './store/store'
import Root from './components/root'


document.addEventListener("DOMContentLoaded", () => {
    window.login = login
    window.logout = logout 
    window.signup = signup 
    const store = configureStore()
    window.store = store
    const root = document.getElementById("root");
    // ReactDOM.render(<h1>Welcome to BenchBnB</h1>, root);
    ReactDOM.render(<Root store = {store}/>, root);
});
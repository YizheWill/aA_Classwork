import React from 'react'
import { HashRouter, Route, Redirect } from 'react-router-dom'
import {Provider} from 'react-redux'
import App from './app'

function Root({store}) {
  return (
    <div>
        <Provider store = {store}>
            <HashRouter>
              <App />
            </HashRouter>
        </Provider>
    </div>
  )
}

export default Root

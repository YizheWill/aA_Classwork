import React from 'react'

export default function todoListItem({todo}) {
    return (
        <ul>
            <li>{todo.title}</li>
            <li>{todo.body}</li>
            <li>{todo.done ? "complete" : "not complete"}</li>
        </ul>
    )
}

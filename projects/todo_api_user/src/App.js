import "./App.css";
import Todolist from "./todolist";
import Typography from "@material-ui/core/Typography";
function App() {
  return (
    <div className="App">
      <header className="App-header">
        <Typography variant="h1">Todo Stream</Typography>
        <hr />
        <Todolist />
      </header>
    </div>
  );
}

export default App;

import { ZENELISTA } from './adat'
import './App.css'
import Zenek from './components/Zenek'

function App() {

  return (
    <>
      <header>
          <h1>React Zenék</h1>
      </header>
      <article>
        <Zenek lista = {ZENELISTA} />
      </article>
      <footer><p>Erdős Viki</p></footer>
    </>
  )
}

export default App

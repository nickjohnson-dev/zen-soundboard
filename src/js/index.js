import Elm from '../elm/Main.elm';

const app = Elm.Main.fullscreen();

app.ports.play.subscribe(value => {
  console.log(value);
})

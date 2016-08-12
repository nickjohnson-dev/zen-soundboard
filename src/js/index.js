import Tone from 'tone';
import Elm from '../elm/Main.elm';
import '../elm/main.scss';

const app = Elm.Main.fullscreen();
let synth;

app.ports.toneInit.subscribe(options => {
  console.log(options);
  const fixedOptions = Object.assign({}, options, {
    type: options.oscillator.oscType,
  });
  synth = new Tone.MonoSynth(fixedOptions).toMaster();
});

app.ports.attack.subscribe(note => {
  synth.triggerAttack(note.name);
});

app.ports.release.subscribe(() => {
  synth.triggerRelease();
});

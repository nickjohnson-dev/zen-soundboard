'use strict';

require('./index.html');
const Tone = require('tone');
const synth = new Tone.Synth({
  oscillator: {
    type: 'square'
  },
}).toMaster();

const Elm = require('./Main');

const app = Elm.Main.fullscreen();

app.ports.play.subscribe(function (val) {
  synth.triggerAttackRelease(val, '16n');
});

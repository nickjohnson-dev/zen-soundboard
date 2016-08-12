const path = require('path');
const autoprefixer = require('autoprefixer');

module.exports = {
  devServer: {
    contentBase: path.join(__dirname, 'public'),
    stats: 'errors-only',
  },
  entry: './src/js/index.js',
  output: {
    path: './public',
    filename: 'bundle.js',
  },
  module: {
    loaders: [
      {
        test: /\.scss$/,
        loader: 'style!css!postcss!sass',
      },
      {
        test: /\.js$/,
        exclude: /node_modules/,
        loader: 'babel',
      },
      {
        test: /\.elm$/,
        exclude: [/elm-stuff/, /node_modules/],
        loader: 'elm-webpack',
      },
    ],
    noParse: /\.elm$/,
  },
  postcss: function postcss() {
    return [autoprefixer];
  },
  resolve: {
    modulesDirectories: ['node_modules'],
    extensions: ['', '.js', '.elm'],
  },
};

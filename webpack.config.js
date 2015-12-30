var HtmlWebpackPlugin = require('html-webpack-plugin')
var webpackConfig = {
  entry: './src/entry.js',
  output: {
    path: 'static',
    filename: 'bundle.js',
    chunkFilename: '[name]-[chunkhash].js',
    publicPath: '/'
//  }
  },
  plugins: [
  new HtmlWebpackPlugin({
      title: '',
      template: './src/index.html', // Load a custom template
      inject: 'body' // Inject all scripts into the body
    } )
  ],
  module: {
      loaders: [
        { test: /\.css$/, loaders: [ 'style', 'css', 'postcss' ] },
        { test: /\.scss$/, loaders: [ 'style', 'css', 'postcss', 'sass' ] },
        { test: /\.(woff2?|ttf|eot|svg)$/, loader: 'url?limit=10000' },
        { test: /bootstrap-sass\/assets\/javascripts\//, loader: 'imports?jQuery=jquery' }
      ]
  }
}
module.exports = webpackConfig;
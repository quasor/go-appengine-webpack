var HtmlWebpackPlugin = require('html-webpack-plugin')
var webpackConfig = {
  entry: 'entry.js',
  output: {
    path: 'static',
    filename: 'bundle.js',
    chunkFilename: '[name]-[chunkhash].js',
    publicPath: '/'
//  }
  },
  plugins: [
//  new HtmlWebpackPlugin(
//      title: '',
//      template: 'index.html', // Load a custom template
//      inject: 'body' // Inject all scripts into the body
//    )
    ]
}
module.exports = webpackConfig;
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
    ]
}
module.exports = webpackConfig;
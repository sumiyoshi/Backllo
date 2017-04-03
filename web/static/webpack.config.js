const webpack = require("webpack");
const ExtractTextPlugin = require('extract-text-webpack-plugin');
const WebpackBuildNotifierPlugin = require('webpack-build-notifier');

let dir = __dirname + '/../..';

module.exports = [
    {
        cache: false,
        entry: {
            app: `${__dirname}/js/app.js`
        },
        output: {
            path: `${dir}/priv/static`,
            publicPath: `${dir}/priv/static/`,
            filename: "js/[name].min.js"
        },

        plugins: [
            new webpack.DefinePlugin({
                'process.env': {
                    NODE_ENV: '"production"'
                }
            }),
            new webpack.optimize.UglifyJsPlugin({
                compress: {
                    warnings: false
                }
            }),
            new WebpackBuildNotifierPlugin({
                title: "Webpack Build"
            }),
            new ExtractTextPlugin("css/[name].min.css")
        ],
        resolve: {
            modules: [
                `${__dirname}/js`,
                `${__dirname}/styles`,
                "node_modules"
            ],
            alias: {
                'vue$': 'vue/dist/vue.common.js'
            }
        },
        module: {
            rules: [
                {
                    test: /\.js$/,
                    exclude: /node_modules/,
                    loader: 'babel-loader',
                    query: {
                        presets: ['es2015']
                    }
                },
                {
                    test: /\.scss$/,
                    use: ExtractTextPlugin.extract({
                        fallback: "style-loader",
                        use: "css-loader!sass-loader"
                    })
                }
            ]
        }
    }
];
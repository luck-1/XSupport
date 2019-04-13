'use strict'
const merge = require('webpack-merge')
const prodEnv = require('./prod.env')

module.exports = merge(prodEnv, {
  NODE_ENV: '"development"',
  BASE_API: '"http://localhost:8082/"'
  // BASE_API: '"http://47.92.109.76:8082/runonce/"'
})

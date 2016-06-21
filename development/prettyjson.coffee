"use strict"

module.exports = prettyjson = (data, oprions = {})->
    JSON.stringify JSON.parse(data), true, 2
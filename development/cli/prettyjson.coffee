`#!/usr/bin/env node
`

os          = require "os"

prettyjson  = require "../prettyjson"

process.stdin.on "data", (data)->
    data = data.toString("utf8")

    res = prettyjson(data)

    process.stdout.write(res, "utf8")
    process.stdout.write(os.EOL, "utf8")

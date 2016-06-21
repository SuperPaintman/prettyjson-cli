###
Requires
###
gulp            = require "gulp"
$               = require("gulp-load-plugins")()
del             = require "del"

###
Helps
###
onError = (err)->
    $.util.log $.util.colors.red("Error"), err.toString()
    @.end()

###
Tasks
###
gulp.task "clear", -> del("./bin/**")

gulp.task "build", ->
    gulp.src("./development/**/*.coffee")
        # Error handler
        .pipe $.plumber({
            errorHandler: onError
        })
        # Source map
        .pipe $.sourcemaps.init()
        # Coffee render
        .pipe $.coffee({
            bare: true
        })
        # End source map
        .pipe $.sourcemaps.write()
        # Сохранение
        .pipe gulp.dest("./bin")

gulp.task "watch:build", ->
    gulp.watch("./development/**/*.coffee", ["build"])

gulp.task "watch", ["watch:build"]

gulp.task "default", ["build"]
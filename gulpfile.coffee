gulp  			= require "gulp"
browserify  = require "browserify"
source      = require "vinyl-source-stream"
watch				= require "gulp-watch"
coffee			= require "gulp-coffee"

gulp.task "browserify", ->
	browserify
		entries: ["./coffee/app.coffee"],
		extensions: ['.coffee']
	.bundle({ debug: true })
	.on('error', (e) -> console.log 'error', e )
	.pipe source('app.js')
	.pipe gulp.dest("./")

gulp.task "watch", ->
	gulp.watch ["./coffee/**.coffee"], ["browserify"]


gulp.task 'default', ['browserify','watch']
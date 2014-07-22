class Player

	audio: null
	buffered: 0
	progress: 0

	constructor: ->
		@audio = new Audio()
		@_events()

	play: -> @audio.play()
	pause: -> @audio.pause()
	stop: ->
		@audio.pause()
		@setTime(0)

	playing: -> return !@audio.paused

	load: (src) -> @audio.src = src
	setTime: (time) -> @audio.currentTime = time
	setVolume: (volume) -> @audio.volume = volume

	_fireState: (state) ->
		console.log 'fire event', state

	_events: ->
		@audio.addEventListener "abort", @_abortHandler.bind(@)
		@audio.addEventListener "canplay", @_canplayHandler.bind(@)
		@audio.addEventListener "canplaythrough", @_canplaythroughHandler.bind(@)
		@audio.addEventListener "durationchange", @_durationchangeHandler.bind(@)
		@audio.addEventListener "emptied", @_emptiedHandler.bind(@)
		@audio.addEventListener "ended", @_endedHandler.bind(@)
		@audio.addEventListener "error", @_errorHandler.bind(@)
		@audio.addEventListener "loadeddata", @_loadeddataHandler.bind(@)
		@audio.addEventListener "loadedmetadata", @_loadedmetadataHandler.bind(@)
		@audio.addEventListener "loadstart", @_loadstartHandler.bind(@)
		@audio.addEventListener "pause", @_pauseHandler.bind(@)
		@audio.addEventListener "play", @_playHandler.bind(@)
		@audio.addEventListener "playing", @_playingHandler.bind(@)
		@audio.addEventListener "progress", @_progressHandler.bind(@)
		@audio.addEventListener "ratechange", @_ratechangeHandler.bind(@)
		@audio.addEventListener "seeked", @_seekedHandler.bind(@)
		@audio.addEventListener "seeking", @_seekingHandler.bind(@)
		@audio.addEventListener "stalled", @_stalledHandler.bind(@)
		@audio.addEventListener "suspend", @_suspendHandler.bind(@)
		@audio.addEventListener "timeupdate", @_timeupdateHandler.bind(@)
		@audio.addEventListener "volumechange", @_volumechangeHandler.bind(@)
		@audio.addEventListener "waiting", @_waitingHandler.bind(@)

	_loadeddataHandler: (e) ->
		console.log 'loadeddataHandler'
		@buffered = (@audio.buffered.end(0) / @audio.duration) * 100

	_canplaythroughHandler: (e) ->
		console.log 'canplaythroughHandler'
		@play()

	_playHandler: (e) ->
		console.log 'playHandler'
		@_fireState(Player.PLAYING)

	_pauseHandler: (e) ->
		console.log 'pauseHandler'
		@_fireState(Player.PAUSED)

	_endedHandler: (e) ->
		console.log 'endedHandler'
		@_fireState(Player.ENDED)

	_loadstartHandler: (e) ->
		console.log 'loadstartHandler'
		@_fireState(Player.BUFFERING)

	_timeupdateHandler: (e) ->
		console.log 'timeupdateHandler'
		@progress = (@audio.currentTime / @audio.duration) * 100
		console.log @progress

	_abortHandler: (e) -> console.log 'abortHandler'
	_canplayHandler: (e) -> console.log 'canplayHandler'
	_durationchangeHandler: (e) -> console.log 'durationchangeHandler'
	_emptiedHandler: (e) -> console.log 'emptiedHandler'
	_errorHandler: (e) -> console.log 'errorHandler'
	_loadedmetadataHandler: (e) -> console.log 'loadedmetadataHandler'
	_playingHandler: (e) -> console.log 'playingHandler'
	_progressHandler: (e) -> console.log 'progressHandler'
	_ratechangeHandler: (e) -> console.log 'ratechangeHandler'
	_seekedHandler: (e) -> console.log 'seekedHandler'
	_seekingHandler: (e) -> console.log 'seekingHandler'
	_stalledHandler: (e) -> console.log 'stalledHandler'
	_suspendHandler: (e) -> console.log 'suspendHandler'
	_volumechangeHandler: (e) -> console.log 'volumechangeHandler'
	_waitingHandler: (e) -> console.log 'waitingHandler'

Player.PLAYING = 'playing'
Player.BUFFERING = 'buffering'
Player.PAUSED = 'paused'
Player.ENDED = 'ended'

module.exports = new Player()
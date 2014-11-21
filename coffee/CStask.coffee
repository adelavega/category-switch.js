# Process an anti-saccade task

# list of lists, delay then amt
asTrials = [
	["left", 0]	
	["right", 1]
	["right", 0]
	["left", 1]
]


trialLength = 2000
targetLength = 1000


class Session
	constructor: (@asTrials) ->
		@trialNumber = 0
		@max_trials = @asTrials.length

		# Create trials using TrialFactory
		@trials = trialFactory(@asTrials)

		# Show instructions
		$('#ins').modal('show')

	start: ->
		# Show ready message
		@showReady()
		setTimeout (=> @nextTrial()), 2000

	showReady: ->
		$('#tCent').html("READY?")

	nextTrial: ->
		@currTrial = @trials[@trialNumber]
		if @trialNumber >= @max_trials
			@endSession()
		else
			@currTrial.show()
			setTimeout (=> @currTrial.clear()), targetLength

			setTimeout (=> @endTrial()), trialLength

	endTrial:  ->
		## Log current response, and start next trial
		@data += [@currTrial.rt, @currTrial.resp]
		@trialNumber++
		@nextTrial()
			
	endSession: ->
		# Show finished message
		$('#done').modal('show')			


class Trial
	constructor: (@tLocation, @t_content) ->

	show: ->
		$('#tCent').html('+')
		if @tLocation == "left"
			$('#tLeft').show()
			$('#tLeft').html(@t_content)
			$('#tRight').hide()
		else
			$('#tRight').show()
			$('#tRight').html(@t_content)
			$('#tLeft').hide()

		# Log trial start time
		@startTime = (new Date).getTime()

	clear: ->
		$('#tRight').hide()
		$('#tLeft').hide()

	logResponse: (resp) ->
		if not @resp?
			@rt = (new Date).getTime() - @startTime
			@resp = resp

# Make list of trials
trialFactory = (trials) ->
	new Trial(n[0], n[1]) for n in trials


jQuery ->
	currSession = new Session(asTrials)

	$('#ins').click ->
		currSession.start()

	$(document).keypress (event) ->
		currSession.currTrial.logResponse(String.fromCharCode(event.keyCode))








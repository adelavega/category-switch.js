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

instructions = ["In each trial of this task, you will see a word that appears with a symbol above it. <br><br>
When the symbol is &hearts;, you should decide if the word describes something that is, or could have ever been living, or nonliving. 
<br><br> When the symbol is &#10021;, you should decide if the word describes something that is smaller or bigger than a soccer ball. <br><br>
Press the arrow to continue <br><br><br>", 
"The words that describe NONliving things are: snowflake, pebble, marble, knob, bicycle, coat, table, and cloud. <br><br>
The words that describe LIVING things are: sparrow, mushroom, lizard, goldfish, lion, shark, alligator, and oak. <br><br>
The words that describe SMALL things are: snowflake, pebble, marble, knob, sparrow, mushroom, lizard, and goldfish. <br><br>
The words that describe BIG things are: bicycle, coat, table, cloud, lion, shark, alligator, and oak. <br><br>
Press the right arrow to continue.<br><br>	"]

class Session
	constructor: (@asTrials) ->
		@trialNumber = 0
		@max_trials = @asTrials.length

		# Create trials using TrialFactory
		@trials = trialFactory(@asTrials)

		# Show instructions
		$('#ins').modal('show')

	start: ->
		#Clear buttons
		$(".btn").addClass('hidden')
		# Show ready message
		
		$('#tCent').text('READY?')
		setTimeout (=> @countDown(3)), 2000

	countDown:  (n) ->
		$('#tCent').text(n)

		if n > 0
			setTimeout (=> @countDown(n-1)), 2000
		else
			@nextTrial()

	startInstructions: ->
		@inst_num = 0
		@nextInstruction()

	nextInstruction: ->
		if @inst_num > 0
			$('#prev').removeClass('hidden')
		if @inst_num < instructions.length
			$('#tCent').html(instructions[@inst_num])
			@inst_num += 1
		else
			@start()

	prevInstruction: ->
		@inst_num = @inst_num - 2
		if @inst_num == 0
			$('#prev').addClass('hidden')

		$('#tCent').html(instructions[@inst_num])
		@inst_num += 1

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
	currSession.startInstructions()

	$("#next").click ->
		currSession.nextInstruction()

	$("#prev").click ->
		currSession.prevInstruction()


	$(document).keypress (event) ->
		currSession.currTrial.logResponse(String.fromCharCode(event.keyCode))








# Category-switch task

csPrac = [
	["alligator", "living"]
	["snowflake", "living"]
	["bicycle", "living"]
	["mushroom", "living"]
	["cloud", "living"]
	["goldfish", "living"]
	["lizard", "living"]
	["table", "living"]
	["marble", "living"]
	["shark", "living"]
	["knob", "living"]
	["lion", "living"]
]

trialLength = 2000
ITI = 1000

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
	constructor: (@trials_in) ->
		@trialNumber = 0
		@max_trials = @trials_in.length

		# Create trials using TrialFactory
		@trials = trialFactory(@trials_in)

	start: ->
		#Clear buttons
		$(".btn").addClass('hidden')
		# Show ready message
		
		$('#tCent').text('READY?')
		setTimeout (=> @countDown(3)), 1000

	countDown:  (n) ->
		$('#tCent').text(n)

		if n > 0
			setTimeout (=> @countDown(n-1)), 1000
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
			setTimeout (=> @currTrial.clear()), trialLength - ITI

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
	constructor: (@item, @judgment) ->

	show: ->

		# Set upper text to judgment type
		$('#uCent').html(@processJudgment(@judgment))
		# Set middle center text to stimuli
		$('#tCent').text(@item)

		$('#uCent').show()
		$('#tCent').show()

		# Log trial start time
		@startTime = (new Date).getTime()


	processJudgment: (judgment) ->
		if judgment == "living"
			symbol = "&hearts;"
		else
			symbol = "&#10021;"

		symbol

	clear: ->
		$('#uCent').hide()
		$('#tCent').hide()

	logResponse: (resp) ->
		alert(@rt)
		if not @resp?
			@rt = (new Date).getTime() - @startTime
			@resp = resp

# Make list of trials
trialFactory = (trials) ->
	new Trial(n[0], n[1]) for n in trials


jQuery ->
	currSession = new Session(csPrac)
	currSession.startInstructions()

	$("#next").click ->
		currSession.nextInstruction()

	$("#prev").click ->
		currSession.prevInstruction()


	$(document).keypress (event) ->
		currSession.currTrial.logResponse(String.fromCharCode(event.keyCode))








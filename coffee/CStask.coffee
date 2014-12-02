# Category-switch task

livingPrac = [
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

sizePrac = [
	["table", "size"]
	["knob", "size"]
	["pebble", "size"]
	["oak", "size"]
	["bicycle", "size"]
	["coat", "size"]
	["shark", "size"]
	["lizard", "size"]
	["alligator", "size"]
	["lion", "size"]
	["snowflake", "size"]
	["bicycle", "size"]
	["shark", "size"]
	["lizard", "size"]
]

mixedBlock = [
	["sparrow", "size"]
	["table", "living"]
	["lion", "size"]
	["sparrow", "living"]
	["cloud", "living"]
	["alligator", "size"]
	["lizard", "size"]
	["marble", "living"]
	["table", "size"]
	["pebble", "size"]
	["shark", "living"]
	["coat", "living"]
	["alligator", "living"]
	["pebble", "size"]
	["lion", "living"]
	["snowflake", "living"]
	["lizard", "living"]
]



blocks = [
	["livingOnly", "Get ready to begin... Only living or non-living", livingPrac]
	["sizeOnly", "Get ready for mre trials... Only size trials", sizePrac]
	["mixed", "Get ready for more trials... this is a mixed block", mixedBlock]
]

trialLength = 3500
ITI = 1000
IBI = 4000

instructions = ["In each trial of this task, you will see a word that appears with a symbol above it. <br><br>
When the symbol is &hearts;, you should decide if the word describes something that is, or could have ever been living, or nonliving. 
<br><br> When the symbol is &#10021;, you should decide if the word describes something that is smaller or bigger than a soccer ball. <br><br>
Press the arrow to continue <br><br><br>", 
"The words that describe NONliving things are: snowflake, pebble, marble, knob, bicycle, coat, table, and cloud. <br><br>
The words that describe LIVING things are: sparrow, mushroom, lizard, goldfish, lion, shark, alligator, and oak. <br><br>
The words that describe SMALL things are: snowflake, pebble, marble, knob, sparrow, mushroom, lizard, and goldfish. <br><br>
The words that describe BIG things are: bicycle, coat, table, cloud, lion, shark, alligator, and oak. <br><br>
Press the right arrow to continue.<br><br>	",
"If a item is NON-living press 'F' <br><br>
If the item is living, press 'J' <br><br>
If the item is smaller than soccer ball press 'F' <br><br>
If the item is bigger than soccer ball press 'J' <br><br>"]

data = []
saveData = (newdata) ->
	data.push([newdata])

mean = (numericArray) ->
	sum = numericArray.reduce((a, b) -> a + b)
	avg = sum / numericArray.length

	return avg

class Session
	constructor: (@blocks_in) ->
		@blockNumber = 0
		@max_blocks = @blocks_in.length

		# Create trials using TrialFactory
		@blocks = blockFactory(@blocks_in)

	start: ->
		#Clear buttons
		$(".btn").addClass('hidden')
		@nextBlock()

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

	nextBlock: ->
		@currBlock = @blocks[@blockNumber]
		if @blockNumber >= @max_blocks
			@endSession()
		else
			@blockNumber++
			@currBlock.start (=> @nextBlock())
	
	endSession: ->
		# Show finished message
		$('#done').modal('show')			

class Block
	constructor: (@condition, @message, @trials_in) ->
		@trialNumber = 0
		@max_trials = @trials_in.length

		# Create trials using TrialFactory
		@trials = trialFactory(@trials_in)

		@data = []

	start: (@endBlock) ->
		# Show ready message
		$('#tCent').show()
		$('#tCent').text(@message)

		setTimeout (=> @nextTrial()), IBI

	nextTrial: ->
		@currTrial = @trials[@trialNumber]
		if @trialNumber >= @max_trials
			@feedback()
		else
			@trialNumber++
			@currTrial.show ((arg1) => @logTrial arg1)

	feedback: ->
		goodRTs = [n[0] for n in @data][0]

		goodRTs.splice(goodRTs.indexOf('NA'), 1) while goodRTs.indexOf('NA') > -1

		$('#tCent').show()
		$('#tCent').text("Your average reaction time was: " + mean(goodRTs).toString() + "ms")

		setTimeout (=> @endBlock()), IBI

	logTrial: (trialData) ->
		# Save data to server (or big data file)
		saveData([@condition].concat(trialData))

		# Save data locally in block
		@data.push(trialData)
		@nextTrial()

class Trial
	constructor: (@item, @judgment) ->
		@rt = 'NA'
		@resp = 'NA'

	show: (endTrial)  ->

		# Set upper text to judgment type
		$('#uCent').html(@processJudgment(@judgment))
		# Set middle center text to stimuli
		$('#tCent').text(@item)

		$('#uCent').show()
		$('#tCent').show()

		# Log trial start time
		@startTime = (new Date).getTime()

		setTimeout (=> @clear()), trialLength - ITI

		## End trial 
		setTimeout (=> endTrial([@rt, @resp])), trialLength

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
		@rt = (new Date).getTime() - @startTime
		@resp = resp

# Make list of trials
trialFactory = (trials) ->
	new Trial(n[0], n[1]) for n in trials

blockFactory = (blocks) ->
	new Block(n[0], n[1], n[2]) for n in blocks


jQuery ->
	currSession = new Session(blocks)
	currSession.startInstructions()

	$("#next").click ->
		currSession.nextInstruction()

	$("#prev").click ->
		currSession.prevInstruction()

	$(document).keypress (event) ->
		currSession.currBlock.currTrial.logResponse(String.fromCharCode(event.keyCode))
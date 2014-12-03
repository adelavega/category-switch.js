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
IBI = 1000

instructions = ["In each trial of this task, you will see a word that appears with a symbol above it. \n\n
When the symbol is   " + String.fromCharCode(10084) + "  you should decide if \nthe word describes something that is, or could have ever been living, or nonliving.\n
\nWhen the symbol is   " + String.fromCharCode(10021) + "  you should decide if \nthe word describes something that is smaller or bigger than a soccer ball. \n\n
Press the arrow to continue \n", 
"The words that describe NON-LIVING things are: \nsnowflake, pebble, marble, knob, bicycle, coat, table, and cloud. \n\n
The words that describe LIVING things are: \nsparrow, mushroom, lizard, goldfish, lion, shark, alligator, and oak. \n\n
The words that describe SMALL things are: \nsnowflake, pebble, marble, knob, sparrow, mushroom, lizard, and goldfish. \n\n
The words that describe BIG things are: \nbicycle, coat, table, cloud, lion, shark, alligator, and oak. \n\n
Press the right arrow to continue.\n",
"If the item is NON-living press 'F' \n\n
If the item is living, press 'J' \n\n
If the item is smaller than soccer ball press 'F' \n\n
If the item is bigger than soccer ball press 'J' \n\n"]


living = new Image();
living.src = "img/living.png"

nonliving = new Image();
nonliving.src = "img/non_living.png"

living_col = new Image();
living_col.src = "img/living_blue.png"

nonliving_col = new Image();
nonliving_col.src = "img/non_living_blue.png"

# Set up canvas
c = document.getElementById("canvas")
ctx = c.getContext("2d")
width = canvas.width
height = canvas.height

data = []
saveData = (newdata) ->
	data.push([newdata])

mean = (numericArray) ->
	sum = numericArray.reduce((a, b) -> a + b)
	avg = sum / numericArray.length

	return avg

# Clears canvas
clear_canvas = ->
	ctx.clearRect(0, 0, canvas.width, canvas.height)

# Writes multline text onto the canvas, and by default clears
multilineText = (txt, x, y, font, lineheight=20, clear=true) ->
	clear_canvas() if clear

	ctx.font = font

	if x == "center"
		ctx.textAlign = "center"
		x = canvas.width/2 

	y = canvas.height/2 if y == "center"

	lines = txt.split('\n')
	i = 0
	while i < lines.length
	  ctx.fillText lines[i], x, y + (i * lineheight)
	  i++

class Session
	constructor: (@blocks_in) ->
		@blockNumber = 0
		@max_blocks = @blocks_in.length

		# Create trials using TrialFactory
		@blocks = blockFactory(@blocks_in)

	start: ->
		#Clear buttons
		$(".btn").css({'visibility' : 'hidden'})
		@nextBlock()

	startInstructions: ->
		@inst_num = 0
		@nextInstruction()

	nextInstruction: ->
		if @inst_num > 0
			$('#prev').css({'visibility' : 'visible'})
		if @inst_num < instructions.length
			multilineText(instructions[@inst_num], 10, 30, "20px Arial", 30)
			@inst_num += 1
		else
			@start()

	prevInstruction: ->
		@inst_num = @inst_num - 2
		if @inst_num == 0
			$('#prev').css({'visibility' : 'visible'})

		multilineText(instructions[@inst_num], 10, 30, "20px Arial", 30)
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
		multilineText(@message, 10, 75, "25px Arial", 75)

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

		multilineText("Your average reaction time was: " + mean(goodRTs).toString() + "ms", 10, 30, "20px Arial")

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

		if @judgment == "living"
			@left = nonliving
			@left_selected = nonliving_col

			@right = living
			@right_selected = living_col

	show: (endTrial)  ->

		# Set upper text to judgment type
		multilineText(@processJudgment(@judgment), "center", canvas.height/2 - 75, "40px Arial")
		# Set middle center text to stimuli
		multilineText(@item, "center", "center", "35px Arial", 20, false)

		if @judgment = "living"
			ctx.drawImage(@left, 10, canvas.height/2-100, 75, 75)
			ctx.drawImage(@right, canvas.width - 100, canvas.height/2-85, 75, 75)

		# Log trial start time
		@startTime = (new Date).getTime()
		setTimeout (=> clear_canvas()), trialLength - ITI

		## End trial 
		setTimeout (=> endTrial([@rt, @resp])), trialLength

	processJudgment: (judgment) ->
		if judgment == "living"
			symbol = String.fromCharCode(10084) 
		else
			symbol = String.fromCharCode(10021)

		symbol

	logResponse: (resp) ->
		if resp == "f" ##Check for caps
			ctx.drawImage(@left_selected, 10, canvas.height/2-100, 75, 75)
			ctx.drawImage(@left_selected, 10, canvas.height/2-100, 75, 75)
		else if resp == "j"
			ctx.drawImage(@right_selected, canvas.width - 100, canvas.height/2-85, 75, 75)

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
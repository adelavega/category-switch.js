# Category-switch task

livingPrac = [
	["alligator", "living"]
	["snowflake", "nonliving"]
	["bicycle", "nonliving"]	
	["mushroom", "living"]
	# ["cloud", "nonliving"]
	# ["goldfish", "living"]
	# ["lizard", "living"]
	# ["table", "nonliving"]
	# ["marble", "nonliving"]
	# ["shark", "living"]
	# ["knob", "nonliving"]
	# ["lion", "living"]
]

sizePrac = [
	["table", "bigger"]
	["knob", "smaller"]
	["pebble", "smaller"]
	["oak", "bigger"]
	["bicycle", "bigger"]
	# ["coat", "bigger"]
	# ["shark", "bigger"]
	# ["lizard", "size"]
	# ["alligator", "size"]
	# ["lion", "size"]
	# ["snowflake", "size"]
	# ["bicycle", "size"]
	# ["shark", "size"]
	# ["lizard", "size"]
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

trialLength = 3500
ITI = 1000
IBI = 1000

instructions = ["In this test, you'll see a series of words, one at the time \n\n
Above each word you'll see a symbol \n\n
When the symbol is   " + String.fromCharCode(10084) + "  decide if the word describes \nsomething that is, or could have ever been living\n
\nWhen the symbol is   " + String.fromCharCode(10021) + "  decide if the world describes\nsomething that is smaller or bigger than a soccer ball. \n\n", 

"\n\nIf you see a   " + String.fromCharCode(10084) + "  , do you decide if the word shown describes:\n\nsomething smaller or bigger than a soccer ball or\n
\nsomething that is living or nonliving?",

"\n\nIf you see a   " + String.fromCharCode(10021) + "  , do you decide if the word shown describes:\n\nsomething smaller or bigger than a soccer ball or\n
\nsomething that is living or nonliving?",

"You'll use the 'F' and 'J' keys to respond\n
Use your left and right index fingers\n\n
When you see the  " + String.fromCharCode(10084) + " icon\n
Press  'F' to indicate 'non-living'\n
Press 'J' to indicate 'living'\n\n
When you see the  " + String.fromCharCode(10021) + " icon\n
Press  'F' to indicate 'smaller than a soccer ball'\n
Press 'J' to indicate 'bigger than a soccer ball'",

"\n\nWhich key do you press for a item that is \n
smaller than a soccer ball?",

"\n\nWhich key do you press for a item that \n
is or could have ever been living?",

"Okay now its time to practice!\n
For now, we'll only decide if the words described are living or non-living\n\n
NON-LIVING things are: \nsnowflake, pebble, marble, knob, bicycle, coat, table, and cloud. \n\n
LIVING things are: \nsparrow, mushroom, lizard, goldfish, lion, shark, alligator, and oak. \n\n
Please respond as fast and as accurately as you can!",

"Now we're going to practice deciding if words described are\n smaller or bigger than a soccer ball\n\n
SMALL things are: \nsnowflake, pebble, marble, knob, sparrow, mushroom, lizard, and goldfish. \n\n
BIG things are: \nbicycle, coat, table, cloud, lion, shark, alligator, and oak. \n\n
Please respond as fast and as accurately as you can!"]

## Change to dicionary?
living = new Image();
living.src = "img/living.png"

nonliving = new Image();
nonliving.src = "img/non_living.png"

living_col = new Image();
living_col.src = "img/living_blue.png"

nonliving_col = new Image();
nonliving_col.src = "img/non_living_blue.png"

soccer = new Image();
soccer.src = "img/soccer.png"

soccer_col = new Image();
soccer_col.src = "img/soccer_blue.png"


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
	else
		ctx.textAlign = "start"

	y = canvas.height/2 if y == "center"

	lines = txt.split('\n')
	i = 0
	while i < lines.length
	  ctx.fillText lines[i], x, y + (i * lineheight)
	  i++

class Session
	constructor: (@blocks) ->
		@blockNumber = 0
		@max_blocks = @blocks.length
		@nextBlock()

	nextBlock: ->
		@currBlock = @blocks[@blockNumber]
		if @blockNumber >= @max_blocks
			@endSession()
		else
			@blockNumber++
			@currBlock.start ((arg1) => @exitBlock arg1)
			
	prevBlock: ->
		if @blockNumber > 1
			@blockNumber = @blockNumber - 2

		@currBlock = @blocks[@blockNumber]

		@blockNumber++
		@currBlock.start ((arg1) => @exitBlock arg1)

	exitBlock: (next = true) ->
		if next
			@nextBlock()
		else
			@prevBlock()

	buttonClick: (button) ->
		@currBlock.buttonClick(button)
	
	endSession: ->
		# Show finished message
		$('#done').modal('show')	

class Instruction
	constructor: (@message, @left_button = "Back", @right_button = "Okay", @corrResp = null) ->

	start: (@exitTrial) ->
		multilineText(@message, 10, 30, "25px Arial", 30)

		if @left_button != false
			$('#left').css({'visibility' : 'visible'})
		if @right_button?
			$('#right').css({'visibility' : 'visible'})

		$('#left').html(@left_button)
		$('#right').html(@right_button)

	buttonClick: (button) ->

		if @corrResp?
			if @corrResp == button
			## Change buttons to be "Okay continue"
				$('#correct').modal('show')
				@clearButtons()
				setTimeout (=> $('#correct').modal('hide')), 1750
				setTimeout (=> @exitTrial()), 1750
			else
			## Show incorrect message
				$('#error').modal('show')
		else
			@clearButtons()
			if button == 'left'
				@exitTrial false
			else if button == 'right'
				@exitTrial()

	clearButtons: ->
		$('#left').css({'visibility' : 'hidden'})
		$('#right').css({'visibility' : 'hidden'})

class Block
	constructor: (@condition, @message, @trials) ->
		@trials = trials[0]
		@trialNumber = 0
		@max_trials = @trials.length
		@data = []

	start: (@exitBlock) ->
		# Show ready message
		multilineText(@message, 10, 75, "25px Arial", 75)

		setTimeout (=> @nextTrial()), IBI

	nextTrial: ->
		@currTrial = @trials[@trialNumber]
		if @trialNumber >= @max_trials
			@endBlock()
		else
			@trialNumber++
			@currTrial.show ((arg1) => @logTrial arg1)

	endBlock: ->
		@exitBlock()

	logTrial: (trialData) ->
		# Save data to server (or big data file)
		saveData([@condition].concat(trialData))

		# Save data locally in block
		@data.push(trialData)
		@nextTrial()

class PracticeBlock extends Block

	endBlock: ->
		@feedback()

	feedback: ->
		# get accuracy from data
		accs = mean([n[2] for n in @data][0])

		multilineText("You got " + accs*100.toString() + "% of trials correct", 10, 30, "30px Arial")

		if accs < 0.75
			multilineText("You need to get at least 75% right to continue", 10, 100, "25px Arial", 20, false)
			
			$('#right').html("Try again")
			
			@done = false
		else
			multilineText("Good job, let's continue", 10, 100, "25px Arial", 20, false)
			$('#right').html("Okay")

			@done = true

		$('#right').css({'visibility' : 'visible'})

	buttonClick: ->
		$('#right').css({'visibility' : 'hidden'})

		if @done
			@exitBlock()
		else
			#Dont forget to log trials -add
			@restartBlock()

	restartBlock: ->
		@trialNumber = 0
		@data = []
		@nextTrial()

class RTFeedbackBlock extends Block

	endBlock: ->
		@feedback()
		setTimeout (=> @exitBlock()), IBI

	feedback: ->
		# Exclude NAs
		goodRTs = [n[0] for n in @data][0]
		goodRTs.splice(goodRTs.indexOf('NA'), 1) while goodRTs.indexOf('NA') > -1

		multilineText("Your average reaction time was: " + mean(goodRTs).toString() + "ms", 10, 30, "20px Arial")

class Trial
	constructor: (@item, @corrResp) ->
		@rt = 'NA'
		@resp = 'NA'
		@acc = 0

	show: (endTrial)  ->
		# Set upper text to judgment type
		multilineText(@processJudgment(@corrResp), "center", canvas.height/2 - 75, "40px Arial")
		# Set middle center text to stimuli
		multilineText(@item, "center", "center", "35px Arial", 20, false)

		# Log trial start time
		@startTime = (new Date).getTime()
		setTimeout (=> clear_canvas()), trialLength - ITI

		## End trial 
		setTimeout (=> endTrial([@rt, @resp, @acc])), trialLength

	processJudgment: (judgment) ->
		if judgment == "living" or judgment == "nonliving"
			symbol = String.fromCharCode(10084) 
		else
			symbol = String.fromCharCode(10021)

		symbol

	logResponse: (resp) ->
		@rt = (new Date).getTime() - @startTime
		@resp = resp

		if resp == "f"
			if @corrResp == "nonliving" or @corrResp == "smaller"
				@acc = 1
			else
				@acc = 0
		else if resp == "j"
			if @corrResp == "living" or @corrResp == "bigger"
				@acc = 1
			else
				@acc = 0

class FeedbackTrial extends Trial
	constructor: (@item, @corrResp) ->
		if @corrResp == "living" or @corrResp == "nonliving"
			@left = nonliving
			@left_selected = nonliving_col
			@left_size = 75

			@right = living
			@right_selected = living_col
			@right_size = 75
		else
			@left = soccer
			@left_selected = soccer_col
			@left_size = 60

			@right = soccer
			@right_selected = soccer_col
			@right_size = 80

		super @item, @corrResp

	show: (endTrial) ->
		super endTrial
		ctx.drawImage(@left, 10, canvas.height/2-100, @left_size, @left_size)
		ctx.drawImage(@right, canvas.width - 100, canvas.height/2-85, @right_size, @right_size)


	logResponse: (resp) ->
		super resp

		if resp == "f" ##Check for caps
			ctx.drawImage(@left_selected, 10, canvas.height/2-100,  @left_size, @left_size)
		else if resp == "j"
			ctx.drawImage(@right_selected, canvas.width - 100, canvas.height/2-85, @right_size, @right_size)
		

blocks = [
	new Instruction instructions[0], false
	new Instruction instructions[1], "Bigger/smaller<br> than soccer ball", "Living/non-living", "right"
	new Instruction instructions[2], "Bigger/smaller<br> than soccer ball", "Living/non-living", "left"
	new Instruction instructions[3]
	new Instruction instructions[4], "F", "J", "left"
	new Instruction instructions[5], "F", "J", "right"
	new Instruction instructions[6], false, "Let's practice"
	new PracticeBlock "livingPrac", "Get ready...\n10 words coming up", [new FeedbackTrial(n[0], n[1]) for n in livingPrac]
	new Instruction instructions[7], false, "Let's practice"
	new PracticeBlock "sizePrac", "Get ready...\n10 words coming up", [new FeedbackTrial(n[0], n[1]) for n in sizePrac]
	# ["livingOnly", "Get ready to begin... Only living or non-living", livingPrac]
	# ["sizeOnly", "Get ready for mre trials... Only size trials", sizePrac]
	# ["mixed", "Get ready for more trials... this is a mixed block", mixedBlock]
]


jQuery ->
	currSession = new Session(blocks)

	$("#right").click ->
		currSession.buttonClick('right')

	$("#left").click ->
		currSession.buttonClick('left')

	$("#continue").click ->
		currSession.buttonClick('continue')

	$(document).keypress (event) ->
		currSession.currBlock.currTrial.logResponse(String.fromCharCode(event.keyCode))
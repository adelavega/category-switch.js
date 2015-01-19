# Category-switch task

all_stim = {"living_real": [["marble", "nonliv"], ["oak", "living"], ["lizard", "living"], ["coat", "nonliv"], ["sparrow", "living"], ["goldfish", "living"], ["lion", "living"], ["alligator", "living"], ["pebble", "nonliv"], ["shark", "living"], ["knob", "nonliv"], ["table", "nonliv"], ["shark", "living"], ["bicycle", "nonliv"], ["cloud", "nonliv"], ["marble", "nonliv"], ["cloud", "nonliv"], ["alligator", "living"], ["sparrow", "living"], ["lizard", "living"], ["snowflake", "nonliv"], ["mushroom", "living"], ["lion", "living"], ["pebble", "nonliv"], ["bicycle", "nonliv"], ["table", "nonliv"], ["oak", "living"], ["mushroom", "living"], ["knob", "nonliv"], ["marble", "nonliv"], ["coat", "nonliv"], ["goldfish", "living"], ["snowflake", "nonliv"], ["oak", "living"]], "living_prac": [["alligator", "living"], ["snowflake", "nonliv"], ["bicycle", "nonliv"], ["mushroom", "living"], ["cloud", "nonliv"], ["goldfish", "living"], ["lizard", "living"], ["table", "nonliv"], ["marble", "nonliv"], ["shark", "living"], ["knob", "nonliv"], ["lion", "living"]], "mixed_prac": [["marble", "nonliv"], ["table", "nonliv"], ["alligator", "big"], ["sparrow", "small"], ["snowflake", "small"], ["goldfish", "small"], ["mushroom", "living"], ["cloud", "nonliv"], ["knob", "small"], ["oak", "living"], ["marble", "small"], ["bicycle", "nonliv"], ["lizard", "living"], ["knob", "nonliv"], ["lizard", "small"], ["bicycle", "big"], ["pebble", "nonliv"], ["shark", "big"], ["sparrow", "living"], ["lion", "living"], ["goldfish", "living"], ["lion", "big"], ["table", "big"], ["coat", "big"]], "size_prac": [["pebble", "small"], ["bicycle", "big"], ["sparrow", "small"], ["coat", "big"], ["lion", "big"], ["lizard", "small"], ["snowflake", "small"], ["shark", "big"], ["goldfish", "small"], ["knob", "small"], ["cloud", "big"], ["table", "big"]], "size_real": [["table", "big"], ["knob", "small"], ["pebble", "small"], ["oak", "big"], ["bicycle", "big"], ["coat", "big"], ["shark", "big"], ["lizard", "small"], ["alligator", "big"], ["lion", "big"], ["snowflake", "small"], ["bicycle", "big"], ["shark", "big"], ["lizard", "small"], ["table", "big"], ["mushroom", "small"], ["marble", "small"], ["cloud", "big"], ["oak", "big"], ["knob", "small"], ["pebble", "small"], ["sparrow", "small"], ["goldfish", "small"], ["cloud", "big"], ["mushroom", "small"], ["snowflake", "small"], ["goldfish", "small"], ["knob", "small"], ["table", "big"], ["alligator", "big"], ["sparrow", "small"], ["marble", "small"], ["lion", "big"], ["coat", "big"]], "mixed_real_1": [["marble", "nonliv"], ["sparrow", "living"], ["table", "big"], ["lion", "big"], ["sparrow", "small"], ["table", "nonliv"], ["lion", "big"], ["sparrow", "living"], ["cloud", "nonliv"], ["alligator", "big"], ["lizard", "small"], ["marble", "nonliv"], ["table", "big"], ["pebble", "small"], ["shark", "living"], ["coat", "nonliv"], ["alligator", "living"], ["pebble", "small"], ["lion", "living"], ["snowflake", "nonliv"], ["lizard", "living"], ["marble", "small"], ["bicycle", "big"], ["shark", "big"], ["alligator", "living"], ["lizard", "small"], ["lion", "big"], ["goldfish", "small"], ["alligator", "big"], ["pebble", "nonliv"], ["shark", "big"], ["snowflake", "nonliv"], ["mushroom", "living"], ["snowflake", "small"], ["knob", "small"], ["goldfish", "living"], ["cloud", "big"], ["mushroom", "small"], ["bicycle", "nonliv"], ["shark", "living"], ["knob", "small"], ["marble", "small"], ["oak", "big"], ["snowflake", "small"], ["coat", "big"], ["knob", "nonliv"], ["sparrow", "living"], ["lion", "living"], ["coat", "big"], ["mushroom", "living"], ["table", "nonliv"], ["oak", "living"], ["marble", "nonliv"], ["knob", "nonliv"], ["oak", "big"], ["lizard", "living"], ["mushroom", "small"], ["oak", "living"], ["goldfish", "living"], ["bicycle", "nonliv"], ["sparrow", "small"], ["cloud", "nonliv"], ["pebble", "nonliv"], ["goldfish", "small"], ["table", "big"], ["coat", "nonliv"], ["bicycle", "big"], ["cloud", "big"]], "mixed_real_2": [["oak", "big"], ["coat", "big"], ["goldfish", "living"], ["knob", "nonliv"], ["marble", "nonliv"], ["lizard", "small"], ["goldfish", "small"], ["cloud", "nonliv"], ["oak", "big"], ["table", "nonliv"], ["pebble", "nonliv"], ["coat", "big"], ["shark", "living"], ["table", "nonliv"], ["goldfish", "small"], ["coat", "big"], ["lizard", "small"], ["knob", "nonliv"], ["coat", "nonliv"], ["snowflake", "small"], ["marble", "nonliv"], ["mushroom", "small"], ["table", "big"], ["cloud", "big"], ["alligator", "big"], ["lizard", "living"], ["cloud", "nonliv"], ["sparrow", "small"], ["mushroom", "living"], ["alligator", "living"], ["table", "big"], ["goldfish", "living"], ["cloud", "big"], ["lion", "big"], ["snowflake", "nonliv"], ["shark", "living"], ["sparrow", "living"], ["marble", "small"], ["pebble", "nonliv"], ["knob", "nonliv"], ["alligator", "big"], ["shark", "big"], ["pebble", "small"], ["snowflake", "small"], ["bicycle", "big"], ["lion", "living"], ["oak", "living"], ["goldfish", "living"], ["shark", "big"], ["sparrow", "small"], ["oak", "living"], ["mushroom", "living"], ["lizard", "living"], ["bicycle", "big"], ["marble", "small"], ["alligator", "living"], ["snowflake", "nonliv"], ["lion", "living"], ["pebble", "small"], ["oak", "big"], ["coat", "nonliv"], ["bicycle", "nonliv"], ["knob", "small"], ["sparrow", "living"], ["lion", "big"], ["mushroom", "small"], ["knob", "small"], ["bicycle", "nonliv"]]}

trialLength = 5000
ITI = 350
IBI = 2000

instructions = ["In this assessment, we're going to test your ability \nto quickly and accurately categorize words\n\n

First, let's get familiar with the controls\n

You'll be using the F and J keys with your index fingers\n\n
At the bottom of the screen, we'll show you what each key does\n\n

Press J to continue
"

"You're going to see a series of words, one at the time \n\n
Above each word you'll see a symbol \n\n
When the symbol is   #{String.fromCharCode(10084)}  decide if the word describes \nsomething that is, or could have ever been living\n
\nWhen the symbol is   #{String.fromCharCode(10021)}  decide if the word describes\nsomething that is smaller or bigger than a soccer ball. \n\n",


"\nThe symbol ( #{String.fromCharCode(10084)}  or #{String.fromCharCode(10021)} ) will appear right before the word does\n\n
Try to use the time between when the symbol and word appear to\n
prepare yourself to categorize the word according to the symbol. "

"\nPop quiz!\n\nIf you see a  #{String.fromCharCode(10084)} , do you decide if the word shown describes:\n\nsomething smaller or bigger than a soccer ball or\n
\nsomething that is living or nonliving?"

"\n\nAnd if you see a  #{String.fromCharCode(10021)} , do you decide if the word shown describes:\n\nsomething smaller or bigger than a soccer ball or\n
\nsomething that is living or nonliving?"


"\n
Right now, let's focus on when you see the #{String.fromCharCode(10084)}\n\n
If the word describes something:\n\n
Non-living, press F and \n
Living, press J\n\n
"

"\n\n\nIf you see a #{String.fromCharCode(10084)}, which key do you press for something\n
that is or could have ever been living?"

"It's time to practice!\n\n

For this part, \n
NON-LIVING things are: \nsnowflake, pebble, marble, knob, bicycle, coat, table, and cloud \n\n
LIVING things are: \nsparrow, mushroom, lizard, goldfish, lion, shark, alligator, and oak \n\n"

"\nWe're going to give you feedback on how you're doing\n\n
If you incorrectly categorize a word, you'll see a red circle\n
If you get it right, the word and symbol will simply disappear\n\n
Soon after, the next symbol and word will appear\n\n"

"\nAs you go along, remember to respond as quickly as you can,\n 
without making ANY mistakes\n
The faster you can go while staying accurate, the better!\n\n

Ready to begin?"

"Great. We're done with this practice round\n\n

Now you're going to categorize 34 more words\n
These will be 'real', not practice trials\n\n
Remember to respond as quickly as you can \nwithout making mistakes
"

"Great, you're done! \n
Let's switch gears for a moment\n\n
Now you're going to decide if things are\nsmaller or bigger than a soccer ball\n\n

If the word describes something\n
SMALL, press F \n
for something BIG, press J"

"\n\n\nIf you see a #{String.fromCharCode(10021)}, which key do you press for something\n
that is smaller than a soccer ball?"

"Let's practice!\n\n

For this part, SMALL things are: \nsnowflake, pebble, marble, knob, sparrow, \nmushroom, lizard, and goldfish. \n\n
BIG things are: \nbicycle, coat, table, cloud, lion, shark, alligator, and oak. \n\n
Remember to respond quickly and accurately!
"

"Great! We're done with this practice round.\n\n

Now you're going to categorize 34 more words\n
These will be 'real' SIZE trials, not practice trials\n\n
Remember to respond as quickly as you can \nwithout making mistakes
"

"Now it's time to make it a bit more difficult\n\n
In this last phase, we're going to practice making both judgments\n\n

Respond according to the symbol above the word. \nIt may be different for every word.\n\n
Remember to respond as quickly as you can without making mistakes"
"Great, you're done with the practice!\n\n
Are you ready for the final round?\n\n

You will categorize 68 more words based on the symbol\n\n
Remember to respond as quickly as you can without making mistakes"
]


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
	ctx.clearRect(0, 0, canvas.width, canvas.height)# 

# Writes multline text onto the canvas, and by default clears
multilineText = (txt, x, y, font, lineheight=30, clear=true, fillColor='black') ->
	clear_canvas() if clear


	ctx.fillStyle = fillColor

	ctx.font = font

	if x is "center"
		ctx.textAlign = "center"
		x = canvas.width/2 
	else
		ctx.textAlign = "start"

	y = canvas.height/2 if y is "center"

	lines = txt.split('\n')
	i = 0
	while i < lines.length
	  ctx.fillText lines[i], x, y + (i * lineheight)
	  i++

drawCircle = (x, y, radius, fillColor=null, edgecolor='black', behind=true) ->
	ctx.arc(x, y, radius, 0, 2 * Math.PI)

	if behind
		ctx.globalCompositeOperation="destination-over"
	else
		ctx.globalCompositeOperation="source-over"
		
	if edgecolor?
		ctx.lineWidth = 4
		ctx.strokeStyle = edgecolor
		ctx.stroke()

	if fillColor?
		ctx.fillStyle = fillColor
		ctx.fill()

	ctx.globalCompositeOperation="source-over"

keyText = (text, key) ->
	if key is 'left'
		ctx.drawImage(fkey, 5, canvas.height-100, 50, 50)
		multilineText(text, 68, canvas.height-70,  "22px Arial", lineheight=20, clear=false)
	else
		ctx.drawImage(jkey, 420, canvas.height-100, 50, 50)
		multilineText(text, 483, canvas.height-70, "22px Arial", lineheight=20, clear=false)

class Session
	constructor: (@blocks) ->
		@blockNumber = 0
		@max_blocks = @blocks.length
		@imgs_loaded = 0
		
	start: ->
		@imgs_loaded++
		if @imgs_loaded is 2
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
	
	endSession: ->
		# Show finished message
		$('#done').modal('show')	

	keyPress: (e) ->
		code = e.charCode || e.keyCode
		input = String.fromCharCode(code).toLowerCase()
		
		@currBlock.keyPress input


class Instruction
	constructor: (@message, @left_key = null, @right_key = "Continue", @corrResp = null) ->

	start: (@exitTrial) ->
		multilineText(@message, 10, 30, "25px Arial", 33)
		
		if @left_key?
			keyText(@left_key, 'left')

		## Show key picture and text next to it
		keyText(@right_key, 'right')

	keyPress: (key) ->
		if @corrResp?
			if @corrResp is key
				$('#correct').modal('show')
				setTimeout (=> $('#correct').modal('hide')), 1250
				setTimeout (=> @exitTrial()), 1250
			else
			## Show incorrect message
				$('#error').modal('show')
				setTimeout (=> $('#error').modal('hide')), 1250
		else
			if key is 'f'
				@exitTrial false
			else if key is 'j'
				@exitTrial()

class Block
	constructor: (@condition, @message, @trials) ->
		@trials = trials
		@trialNumber = 0
		@max_trials = @trials.length
		@data = []

	start: (@exitBlock) ->
		# Show ready message
		multilineText(@message, "center", "center", "35px Arial", 75)

		setTimeout (=> @nextTrial()), IBI

	nextTrial: ->
		@currTrial = @trials[@trialNumber]
		if @trialNumber >= @max_trials
			@trialNumber++
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

	keyPress: (key) ->
		@currTrial.logResponse(key)

class PracticeBlock extends Block

	endBlock: ->
		@feedback()

	feedback: ->
		# get accuracy from data
		accs = ((if typeof n[2] == 'string' then 0 else n[2]) for n in @data)

		console.log(accs)

		accs = mean(accs)

		multilineText("You got #{Math.round(accs*100.toString(), )}% of trials correct", 10, 60, "30px Arial")

		if accs < 0.75
			multilineText("You need to get at least 75% right to continue", 10, 130, "25px Arial", 20, false)
			
			keyText("Try again", 'left')
			
			@done = false
		else
			multilineText("Good job, let's continue", 10, 130, "25px Arial", 20, false)
			keyText("Okay, continue", 'right')

			@done = true

	keyPress: (key) ->
		if @trialNumber > @max_trials
			if @done
				if key is 'j'
					@exitBlock()
			else if key is 'f'
				#Dont forget to log trials -add
				@restartBlock()

		else super key

	restartBlock: ->
		trial.reset() for trial in @trials
			
		@trialNumber = 0
		## Save old data -- add this
		@data = []
		@nextTrial()

		

class RTFeedbackBlock extends Block

	endBlock: ->
		@feedback()
		setTimeout (=> @exitBlock()), IBI

	feedback: ->
		# Exclude NAs
		goodRTs = n[0] for n in @data
		goodRTs.splice(goodRTs.indexOf('NA'), 1) while goodRTs.indexOf('NA') > -1

		multilineText("Your average reaction time was: #{mean(goodRTs).toString()}ms", 10, 30, "20px Arial")

class Trial
	constructor: (@item, @corrResp) ->
		@rt = 'NA'
		@resp = 'NA'
		@acc = 'NA'
		@flag = true

	reset: ->
		@rt = 'NA'
		@resp = 'NA'
		@acc = 'NA'
		@flag = true
	show: (@exitTrial)  ->
		clear_canvas()

		# Set upper text to judgment type
		multilineText(@processJudgment(@corrResp), "center", canvas.height/2 - 75, "40px Arial")

		setTimeout (=>
			@flag = false

			# Set middle center text to stimuli
			multilineText(@item, "center", "center", "35px Arial", 20, false)

			# Log trial start time
			@startTime = (new Date).getTime()
			setTimeout (=> @endTrial()), trialLength

			), 350


	processJudgment: (judgment) ->
		if judgment is "living" or judgment is "nonliv"
			symbol = String.fromCharCode(10084) 
		else
			symbol = String.fromCharCode(10021)

		symbol

	endTrial: ->
		if @flag is false
			@flag = true
			if @acc is 'NA'
				multilineText("You took too long!", "center", canvas.height/2+140, "30px Arial", lineheight = 20, clear=false)
				drawCircle(canvas.width/2, canvas.height/2-40, 100, fillColor = 'lightyellow')
			else
				drawCircle(canvas.width/2, canvas.height/2-40, 100, fillColor = 'lightyellow')

			setTimeout (=> @exitTrial([@rt, @resp, @acc])), ITI

	logResponse: (resp) ->
		if @flag is false
			@rt = (new Date).getTime() - @startTime
			@resp = resp

			if resp is "f"
				if @corrResp is "nonliv" or @corrResp is "small"
					@acc = 1
				else
					@acc = 0
			else if resp is "j"
				if @corrResp is "living" or @corrResp is "big"
					@acc = 1
				else
					@acc = 0
			else
				@acc = 'other'

			@endTrial()

class FeedbackTrial extends Trial
	endTrial: ->
		if @flag is false
			@flag = true
			console.log(@acc)
			switch @acc
				when 0
					# clear_canvas()
					drawCircle(canvas.width/2, canvas.height/2-40, 100, '#FF4719')	
				when 'NA'
					# clear_canvas()
					drawCircle(canvas.width/2, canvas.height/2-40, 100, '#FF4719')
				when 1
					clear_canvas()
				when 'other'
					# clear_canvas()
					multilineText("Use only the F or J keys!", "center", canvas.height/2+140, "30px Arial", lineheight = 20, clear=false)
					drawCircle(canvas.width/2, canvas.height/2-40, 100, '#FF4719')

			setTimeout (=> @exitTrial([@rt, @resp, @acc])), ITI*2

class PracFeedbackTrial extends Trial
	endTrial: ->
		if @flag is false
			@flag = true
			switch @acc
				when 0
					# clear_canvas()
					drawCircle(canvas.width/2, canvas.height/2-40, 100, '#FF4719')
				when 'NA'
					# clear_canvas()
					multilineText("You took too long!", "center", canvas.height/2+140, "30px Arial", lineheight = 20, clear=false)
					drawCircle(canvas.width/2, canvas.height/2-40, 100, '#FF4719')
				when 1
					clear_canvas()
				when 'other'
					# clear_canvas()
					multilineText("Use only the F or J keys!", "center", canvas.height/2+140, "30px Arial", lineheight = 20, clear=false)
					drawCircle(canvas.width/2, canvas.height/2-40, 100, '#FF4719')

			setTimeout (=> @exitTrial([@rt, @resp, @acc])), ITI*2
			

jQuery ->
	$(document).keypress (event) ->
		currSession.keyPress(event)
	
blocks = [
	new Instruction instructions[0]
	new Instruction instructions[1], "Go back"
	new Instruction instructions[2], "Go back"
	new Instruction instructions[3], "Bigger/smaller than soccer ball", "Living/non-living", "j"
	new Instruction instructions[4], "Bigger/smaller than soccer ball", "Living/non-living", "f"
	new Instruction instructions[5], "Go back"
	new Instruction instructions[6], " ", " ", "j"
	new Instruction instructions[7]	
	new Instruction instructions[8], "Go back"
	new Instruction instructions[9], "Go back", "Start practice!"
	new PracticeBlock "livingPrac", "Get ready for 12 trials!", (new PracFeedbackTrial(n[0], n[1]) for n in all_stim['living_prac'])
	new Instruction instructions[10], null, "Continue"
	new Block "livingReal", "Get ready for 34 trials!", (new FeedbackTrial(n[0], n[1]) for n in all_stim['living_real'])
	new Instruction instructions[11], null
	new Instruction instructions[12], " ", " ", "f"
	new Instruction instructions[13], "Go back", "Start practice!"
	new PracticeBlock "sizePrac", "Get ready for 12 trials!", (new PracFeedbackTrial(n[0], n[1]) for n in all_stim['size_prac'])
	new Instruction instructions[14], null, "Start!"
	new Block "sizeReal", "Get ready for 34 trials!", (new FeedbackTrial(n[0], n[1]) for n in all_stim['size_real'])
	new Instruction instructions[15], null, "Start practice!"
	new PracticeBlock "mixedPrac", "Get ready for 24 trials!", (new PracFeedbackTrial(n[0], n[1]) for n in all_stim['mixed_prac'])
	new Instruction instructions[16], null, "Start!"
	new Block "mixedReal", "Get ready for 68 trials!", (new FeedbackTrial(n[0], n[1]) for n in all_stim['mixed_real_1'])
]


currSession = new Session(blocks)

fkey = new Image()
jkey = new Image()

fkey.onload = ( -> currSession.start())
jkey.onload = ( -> currSession.start())

fkey.src = "img/f_key.png"
jkey.src = "img/j_key.png"



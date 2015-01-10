// Generated by CoffeeScript 1.6.3
(function() {
  var Block, FeedbackTrial, IBI, ITI, Instruction, PracticeBlock, RTFeedbackBlock, Session, Trial, blocks, c, clear_canvas, ctx, currSession, data, drawCircle, fkey, height, instructions, jkey, keyText, livingPrac, livingReal, mean, mixedBlock, multilineText, n, saveData, sizePrac, sizeReal, trialLength, width, _ref, _ref1, _ref2,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  livingPrac = [["alligator", "living"], ["snowflake", "nonliving"], ["bicycle", "nonliving"], ["mushroom", "living"], ["cloud", "nonliving"], ["goldfish", "living"], ["lizard", "living"], ["table", "nonliving"], ["marble", "nonliving"], ["shark", "living"], ["knob", "nonliving"], ["lion", "living"]];

  livingReal = [["alligator", "living"], ["snowflake", "nonliving"], ["bicycle", "nonliving"], ["mushroom", "living"], ["cloud", "nonliving"], ["goldfish", "living"], ["lizard", "living"], ["table", "nonliving"], ["marble", "nonliving"], ["shark", "living"], ["knob", "nonliving"], ["lion", "living"]];

  sizePrac = [["table", "bigger"], ["knob", "smaller"], ["pebble", "smaller"], ["oak", "bigger"], ["bicycle", "bigger"], ["coat", "bigger"], ["shark", "bigger"], ["lizard", "smaller"], ["alligator", "bigger"], ["lion", "bigger"], ["snowflake", "smaller"], ["bicycle", "bigger"], ["shark", "bigger"], ["lizard", "smaller"]];

  sizeReal = [["table", "bigger"], ["knob", "smaller"], ["pebble", "smaller"], ["oak", "bigger"], ["bicycle", "bigger"], ["coat", "bigger"], ["shark", "bigger"], ["lizard", "smaller"], ["alligator", "bigger"], ["lion", "bigger"], ["snowflake", "smaller"], ["bicycle", "bigger"], ["shark", "bigger"], ["lizard", "smaller"]];

  mixedBlock = [["sparrow", "smaller"], ["table", "nonliving"], ["lion", "biger"], ["sparrow", "living"], ["cloud", "nonliving"], ["alligator", "bigger"], ["lizard", "smaller"], ["marble", "nonliving"], ["table", "bigger"], ["pebble", "smaller"], ["shark", "living"], ["coat", "nonliving"], ["alligator", "living"], ["pebble", "smaller"], ["lion", "living"], ["snowflake", "nonliving"], ["lizard", "living"]];

  trialLength = 5000;

  ITI = 350;

  IBI = 2000;

  instructions = ["In this assesment, we're going to test your ability \nto quickly and accurately categorize words\n\nFirst, let's get familiar with the controls\nYou'll be using the F and J keys with your index fingers\n\nAt the bottom of the screen, we'll show you what each key does\n\nPress J to continue", "You're going to see a series of words, one at the time \n\nAbove each word you'll see a symbol \n\nWhen the symbol is   " + (String.fromCharCode(10084)) + "  decide if the word describes \nsomething that is, or could have ever been living\n\nWhen the symbol is   " + (String.fromCharCode(10021)) + "  decide if the world describes\nsomething that is smaller or bigger than a soccer ball. \n\n", "\nThe symbol ( " + (String.fromCharCode(10084)) + "  or " + (String.fromCharCode(10021)) + " ) will appear right before the word does\n\nTry to use the time between when the symbol and word appear to\nprepare yourself to categorize the word according to the symbol. ", "\nPop quiz!\n\nIf you see a  " + (String.fromCharCode(10084)) + " , do you decide if the word shown describes:\n\nsomething smaller or bigger than a soccer ball or\n\nsomething that is living or nonliving?", "\n\nAnd if you see a  " + (String.fromCharCode(10021)) + " , do you decide if the word shown describes:\n\nsomething smaller or bigger than a soccer ball or\n\nsomething that is living or nonliving?", "\nRight now, let's focus on when you see the " + (String.fromCharCode(10084)) + "\n\nIf the word describes something:\n\nNon-living, press F and \nLiving, press J\n\n", "\n\n\nIf you see a " + (String.fromCharCode(10084)) + ", which key do you press for something\nthat is or could have ever been living?", "It's time to practice!\n\nSo we're clear, \nNON-LIVING things are: \nsnowflake, pebble, marble, knob, bicycle, coat, table, and cloud \n\nLIVING things are: \nsparrow, mushroom, lizard, goldfish, lion, shark, alligator, and oak \n\n", "\nWe're going to give you feedback on how you're doing\n\nIf you correctly categorize a word, you'll see a green circle\nIf you get it wrong or take too long, you'll see a red circle\n\nSoon after, the next symbol and word will appear\n\nTry to respond as quickly as possible without making mistakes!", "Great. We're done with this practice round\n\nNow you're going to categorize 34 more words\nThese will be 'real', not practice trials\n\nRemember to respond as quickly as you can \nwithout making mistakes", "Great, you're done! \nLet's switch gears for a moment\n\nNow you're going to decide if things are\nsmaller or bigger than a soccer ball\n\nIf the word describes something\nSMALL, press F \nfor something BIG, press J", "\n\n\nIf you see a " + (String.fromCharCode(10021)) + ", which key do you press for something\nthat is smaller than a soccer ball?", "Let's practice!\n\nSMALL things are: \nsnowflake, pebble, marble, knob, sparrow, \nmushroom, lizard, and goldfish. \n\nBIG things are: \nbicycle, coat, table, cloud, lion, shark, alligator, and oak. \n\nRemember to respond quickly and accurately!", "Great! We're done with this practice round.\n\nNow you're going to categorize 34 more words\nThese will be 'real' SIZE trials, not practice trials\n\nRemember to respond as quickly as you can \nwithout making mistakes", "Now it's time to make it a bit more difficult\n\nIn this last phase, we're going to practice making both judgments\n\nRespond according to the symbol above the word. \nIt may be different for every word.\n\nRemember to prepare to categorize the word\nas soon as the symbol appears", "Great, you're done with the practice!\n\nAre you ready for the final round?\n\nYou will categorize 34 more words based on the symbol\n\nRemember to prepare to categorize the word\nas soon as the symbol appears and \nrespond quickly without making mistakes"];

  c = document.getElementById("canvas");

  ctx = c.getContext("2d");

  width = canvas.width;

  height = canvas.height;

  data = [];

  saveData = function(newdata) {
    return data.push([newdata]);
  };

  mean = function(numericArray) {
    var avg, sum;
    sum = numericArray.reduce(function(a, b) {
      return a + b;
    });
    avg = sum / numericArray.length;
    return avg;
  };

  clear_canvas = function() {
    return ctx.clearRect(0, 0, canvas.width, canvas.height);
  };

  multilineText = function(txt, x, y, font, lineheight, clear, fillColor) {
    var i, lines, _results;
    if (lineheight == null) {
      lineheight = 30;
    }
    if (clear == null) {
      clear = true;
    }
    if (fillColor == null) {
      fillColor = 'black';
    }
    if (clear) {
      clear_canvas();
    }
    ctx.fillStyle = fillColor;
    ctx.font = font;
    if (x === "center") {
      ctx.textAlign = "center";
      x = canvas.width / 2;
    } else {
      ctx.textAlign = "start";
    }
    if (y === "center") {
      y = canvas.height / 2;
    }
    lines = txt.split('\n');
    i = 0;
    _results = [];
    while (i < lines.length) {
      ctx.fillText(lines[i], x, y + (i * lineheight));
      _results.push(i++);
    }
    return _results;
  };

  drawCircle = function(x, y, radius, fillColor, edgecolor, behind) {
    if (fillColor == null) {
      fillColor = null;
    }
    if (edgecolor == null) {
      edgecolor = 'black';
    }
    if (behind == null) {
      behind = true;
    }
    ctx.arc(x, y, radius, 0, 2 * Math.PI);
    if (behind) {
      ctx.globalCompositeOperation = "destination-over";
    } else {
      ctx.globalCompositeOperation = "source-over";
    }
    if (edgecolor != null) {
      ctx.lineWidth = 4;
      ctx.strokeStyle = edgecolor;
      ctx.stroke();
    }
    if (fillColor != null) {
      ctx.fillStyle = fillColor;
      ctx.fill();
    }
    return ctx.globalCompositeOperation = "source-over";
  };

  keyText = function(text, key) {
    var clear, lineheight;
    if (key === 'left') {
      ctx.drawImage(fkey, 5, canvas.height - 100, 50, 50);
      return multilineText(text, 68, canvas.height - 70, "22px Arial", lineheight = 20, clear = false);
    } else {
      ctx.drawImage(jkey, 420, canvas.height - 100, 50, 50);
      return multilineText(text, 483, canvas.height - 70, "22px Arial", lineheight = 20, clear = false);
    }
  };

  Session = (function() {
    function Session(blocks) {
      this.blocks = blocks;
      this.blockNumber = 0;
      this.max_blocks = this.blocks.length;
      this.imgs_loaded = 0;
    }

    Session.prototype.start = function() {
      this.imgs_loaded++;
      if (this.imgs_loaded === 2) {
        return this.nextBlock();
      }
    };

    Session.prototype.nextBlock = function() {
      var _this = this;
      this.currBlock = this.blocks[this.blockNumber];
      if (this.blockNumber >= this.max_blocks) {
        return this.endSession();
      } else {
        this.blockNumber++;
        return this.currBlock.start((function(arg1) {
          return _this.exitBlock(arg1);
        }));
      }
    };

    Session.prototype.prevBlock = function() {
      var _this = this;
      if (this.blockNumber > 1) {
        this.blockNumber = this.blockNumber - 2;
      }
      this.currBlock = this.blocks[this.blockNumber];
      this.blockNumber++;
      return this.currBlock.start((function(arg1) {
        return _this.exitBlock(arg1);
      }));
    };

    Session.prototype.exitBlock = function(next) {
      if (next == null) {
        next = true;
      }
      if (next) {
        return this.nextBlock();
      } else {
        return this.prevBlock();
      }
    };

    Session.prototype.endSession = function() {
      return $('#done').modal('show');
    };

    return Session;

  })();

  Instruction = (function() {
    function Instruction(message, left_key, right_key, corrResp) {
      this.message = message;
      this.left_key = left_key != null ? left_key : null;
      this.right_key = right_key != null ? right_key : "Continue";
      this.corrResp = corrResp != null ? corrResp : null;
    }

    Instruction.prototype.start = function(exitTrial) {
      this.exitTrial = exitTrial;
      multilineText(this.message, 10, 30, "25px Arial", 33);
      if (this.left_key != null) {
        keyText(this.left_key, 'left');
      }
      return keyText(this.right_key, 'right');
    };

    Instruction.prototype.keyPress = function(key) {
      var _this = this;
      if (this.corrResp != null) {
        if (this.corrResp === key) {
          $('#correct').modal('show');
          setTimeout((function() {
            return $('#correct').modal('hide');
          }), 1250);
          return setTimeout((function() {
            return _this.exitTrial();
          }), 1250);
        } else {
          $('#error').modal('show');
          return setTimeout((function() {
            return $('#error').modal('hide');
          }), 1250);
        }
      } else {
        if (key === 'f') {
          return this.exitTrial(false);
        } else if (key === 'j') {
          return this.exitTrial();
        }
      }
    };

    return Instruction;

  })();

  Block = (function() {
    function Block(condition, message, trials) {
      this.condition = condition;
      this.message = message;
      this.trials = trials;
      this.trials = trials;
      this.trialNumber = 0;
      this.max_trials = this.trials.length;
      this.data = [];
    }

    Block.prototype.start = function(exitBlock) {
      var _this = this;
      this.exitBlock = exitBlock;
      multilineText(this.message, "center", "center", "35px Arial", 75);
      return setTimeout((function() {
        return _this.nextTrial();
      }), IBI);
    };

    Block.prototype.nextTrial = function() {
      var _this = this;
      this.currTrial = this.trials[this.trialNumber];
      console.log(this.currTrial);
      if (this.trialNumber >= this.max_trials) {
        this.trialNumber++;
        return this.endBlock();
      } else {
        this.trialNumber++;
        return this.currTrial.show((function(arg1) {
          return _this.logTrial(arg1);
        }));
      }
    };

    Block.prototype.endBlock = function() {
      return this.exitBlock();
    };

    Block.prototype.logTrial = function(trialData) {
      saveData([this.condition].concat(trialData));
      this.data.push(trialData);
      return this.nextTrial();
    };

    Block.prototype.keyPress = function(key) {
      return this.currTrial.logResponse(key);
    };

    return Block;

  })();

  PracticeBlock = (function(_super) {
    __extends(PracticeBlock, _super);

    function PracticeBlock() {
      _ref = PracticeBlock.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    PracticeBlock.prototype.endBlock = function() {
      return this.feedback();
    };

    PracticeBlock.prototype.feedback = function() {
      var accs, n;
      accs = (function() {
        var _i, _len, _ref1, _results;
        _ref1 = this.data;
        _results = [];
        for (_i = 0, _len = _ref1.length; _i < _len; _i++) {
          n = _ref1[_i];
          _results.push(n[2] === 'NA' ? 0 : n[2]);
        }
        return _results;
      }).call(this);
      accs = mean(accs);
      multilineText("You got " + (Math.round(accs * 100..toString())) + "% of trials correct", 10, 60, "30px Arial");
      if (accs < 0.75) {
        multilineText("You need to get at least 75% right to continue", 10, 130, "25px Arial", 20, false);
        keyText("Try again", 'left');
        return this.done = false;
      } else {
        multilineText("Good job, let's continue", 10, 130, "25px Arial", 20, false);
        keyText("Okay, continue", 'right');
        return this.done = true;
      }
    };

    PracticeBlock.prototype.keyPress = function(key) {
      if (this.trialNumber > this.max_trials) {
        if (this.done) {
          if (key === 'j') {
            return this.exitBlock();
          }
        } else if (key === 'f') {
          return this.restartBlock();
        }
      } else {
        return PracticeBlock.__super__.keyPress.call(this, key);
      }
    };

    PracticeBlock.prototype.restartBlock = function() {
      var trial, _i, _len, _ref1, _results;
      this.trialNumber = 0;
      this.data = [];
      this.nextTrial();
      _ref1 = this.trials;
      _results = [];
      for (_i = 0, _len = _ref1.length; _i < _len; _i++) {
        trial = _ref1[_i];
        _results.push(trial.reset());
      }
      return _results;
    };

    return PracticeBlock;

  })(Block);

  RTFeedbackBlock = (function(_super) {
    __extends(RTFeedbackBlock, _super);

    function RTFeedbackBlock() {
      _ref1 = RTFeedbackBlock.__super__.constructor.apply(this, arguments);
      return _ref1;
    }

    RTFeedbackBlock.prototype.endBlock = function() {
      var _this = this;
      this.feedback();
      return setTimeout((function() {
        return _this.exitBlock();
      }), IBI);
    };

    RTFeedbackBlock.prototype.feedback = function() {
      var goodRTs, n, _i, _len, _ref2;
      _ref2 = this.data;
      for (_i = 0, _len = _ref2.length; _i < _len; _i++) {
        n = _ref2[_i];
        goodRTs = n[0];
      }
      while (goodRTs.indexOf('NA') > -1) {
        goodRTs.splice(goodRTs.indexOf('NA'), 1);
      }
      return multilineText("Your average reaction time was: " + (mean(goodRTs).toString()) + "ms", 10, 30, "20px Arial");
    };

    return RTFeedbackBlock;

  })(Block);

  Trial = (function() {
    function Trial(item, corrResp) {
      this.item = item;
      this.corrResp = corrResp;
      this.rt = 'NA';
      this.resp = 'NA';
      this.acc = 'NA';
      this.flag = true;
    }

    Trial.prototype.reset = function() {
      this.rt = 'NA';
      this.resp = 'NA';
      this.acc = 'NA';
      return this.flag = false;
    };

    Trial.prototype.show = function(exitTrial) {
      var _this = this;
      this.exitTrial = exitTrial;
      clear_canvas();
      multilineText(this.processJudgment(this.corrResp), "center", canvas.height / 2 - 75, "40px Arial");
      return setTimeout((function() {
        _this.flag = false;
        multilineText(_this.item, "center", "center", "35px Arial", 20, false);
        _this.startTime = (new Date).getTime();
        return setTimeout((function() {
          return _this.endTrial();
        }), trialLength);
      }), 350);
    };

    Trial.prototype.processJudgment = function(judgment) {
      var symbol;
      if (judgment === "living" || judgment === "nonliving") {
        symbol = String.fromCharCode(10084);
      } else {
        symbol = String.fromCharCode(10021);
      }
      return symbol;
    };

    Trial.prototype.endTrial = function() {
      var clear, fillColor, lineheight,
        _this = this;
      if (this.flag === false) {
        this.flag = true;
        if (this.acc === 'NA') {
          multilineText("You took too long!", "center", canvas.height / 2 + 140, "30px Arial", lineheight = 20, clear = false);
          drawCircle(canvas.width / 2, canvas.height / 2 - 40, 100, fillColor = 'lightyellow');
        } else {
          drawCircle(canvas.width / 2, canvas.height / 2 - 40, 100, fillColor = 'lightyellow');
        }
        return setTimeout((function() {
          return _this.exitTrial([_this.rt, _this.resp, _this.acc]);
        }), ITI);
      }
    };

    Trial.prototype.logResponse = function(resp) {
      if (this.flag === false) {
        this.rt = (new Date).getTime() - this.startTime;
        this.resp = resp;
        if (resp === "f") {
          if (this.corrResp === "nonliving" || this.corrResp === "smaller") {
            this.acc = 1;
          } else {
            this.acc = 0;
          }
        } else if (resp === "j") {
          if (this.corrResp === "living" || this.corrResp === "bigger") {
            this.acc = 1;
          } else {
            this.acc = 0;
          }
        }
        return this.endTrial();
      }
    };

    return Trial;

  })();

  FeedbackTrial = (function(_super) {
    __extends(FeedbackTrial, _super);

    function FeedbackTrial() {
      _ref2 = FeedbackTrial.__super__.constructor.apply(this, arguments);
      return _ref2;
    }

    FeedbackTrial.prototype.endTrial = function() {
      var clear, lineheight,
        _this = this;
      if (this.flag === false) {
        this.flag = true;
        switch (this.acc) {
          case 0:
            drawCircle(canvas.width / 2, canvas.height / 2 - 40, 100, '#FF4719');
            break;
          case 1:
            drawCircle(canvas.width / 2, canvas.height / 2 - 40, 100, '#66FF33');
            break;
          case 'NA':
            multilineText("You took too long!", "center", canvas.height / 2 + 140, "30px Arial", lineheight = 20, clear = false);
            drawCircle(canvas.width / 2, canvas.height / 2 - 40, 100, '#FF4719');
        }
        return setTimeout((function() {
          return _this.exitTrial([_this.rt, _this.resp, _this.acc]);
        }), ITI);
      }
    };

    return FeedbackTrial;

  })(Trial);

  blocks = [
    new Instruction(instructions[0]), new Instruction(instructions[1], "Go back"), new Instruction(instructions[2], "Go back"), new Instruction(instructions[3], "Bigger/smaller than soccer ball", "Living/non-living", "j"), new Instruction(instructions[4], "Bigger/smaller than soccer ball", "Living/non-living", "f"), new Instruction(instructions[5], "Go back"), new Instruction(instructions[6], " ", " ", "j"), new Instruction(instructions[7]), new Instruction(instructions[8], "Go back", "Start practice!"), new PracticeBlock("livingPrac", "Get ready for 12 trials!", (function() {
      var _i, _len, _results;
      _results = [];
      for (_i = 0, _len = livingPrac.length; _i < _len; _i++) {
        n = livingPrac[_i];
        _results.push(new FeedbackTrial(n[0], n[1]));
      }
      return _results;
    })()), new Instruction(instructions[9], null, "Continue"), new Block("livingReal", "Get ready for 34 trials!", (function() {
      var _i, _len, _results;
      _results = [];
      for (_i = 0, _len = livingReal.length; _i < _len; _i++) {
        n = livingReal[_i];
        _results.push(new Trial(n[0], n[1]));
      }
      return _results;
    })()), new Instruction(instructions[10], null), new Instruction(instructions[11], " ", " ", "f"), new Instruction(instructions[12], "Go back", "Start practice!"), new PracticeBlock("sizePrac", "Get ready for 12 trials!", (function() {
      var _i, _len, _results;
      _results = [];
      for (_i = 0, _len = sizePrac.length; _i < _len; _i++) {
        n = sizePrac[_i];
        _results.push(new FeedbackTrial(n[0], n[1]));
      }
      return _results;
    })()), new Instruction(instructions[13], null, "Start!"), new Block("sizeReal", "Get ready for 34 trials!", (function() {
      var _i, _len, _results;
      _results = [];
      for (_i = 0, _len = sizeReal.length; _i < _len; _i++) {
        n = sizeReal[_i];
        _results.push(new Trial(n[0], n[1]));
      }
      return _results;
    })()), new Instruction(instructions[14], null, "Start practice!"), new PracticeBlock("mixedPrac", "Get ready for 12 trials!", (function() {
      var _i, _len, _results;
      _results = [];
      for (_i = 0, _len = mixedBlock.length; _i < _len; _i++) {
        n = mixedBlock[_i];
        _results.push(new FeedbackTrial(n[0], n[1]));
      }
      return _results;
    })()), new Instruction(instructions[15], null, "Start!"), new Block("mixedPrac", "Get ready for 34 trials!", (function() {
      var _i, _len, _results;
      _results = [];
      for (_i = 0, _len = mixedBlock.length; _i < _len; _i++) {
        n = mixedBlock[_i];
        _results.push(new Trial(n[0], n[1]));
      }
      return _results;
    })())
  ];

  jQuery(function() {
    return $(document).keypress(function(event) {
      return currSession.currBlock.keyPress(String.fromCharCode(event.keyCode).toLowerCase());
    });
  });

  currSession = new Session(blocks);

  fkey = new Image();

  jkey = new Image();

  fkey.onload = (function() {
    return currSession.start();
  });

  jkey.onload = (function() {
    return currSession.start();
  });

  fkey.src = "img/f_key.png";

  jkey.src = "img/j_key.png";

}).call(this);

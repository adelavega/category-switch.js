// Generated by CoffeeScript 1.6.3
(function() {
  var Block, FeedbackTrial, IBI, ITI, Instruction, LivingKeyMap, PracFeedbackTrial, PracticeBlock, RTFeedbackBlock, Session, SizeKeyMap, Slide1, Trial, all_stim, blocks, c, clear_canvas, ctx, currSession, drawCircle, fkey, height, hideButtons, instructions, jkey, keyText, mean, multilineText, n, psiTurk, red, saveData, trialLength, width, _ref, _ref1, _ref2, _ref3, _ref4, _ref5, _ref6,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  psiTurk = PsiTurk(uniqueId, adServerLoc);

  all_stim = {
    "living_real": [["marble", "nonliv"], ["oak", "living"], ["lizard", "living"], ["coat", "nonliv"], ["sparrow", "living"], ["goldfish", "living"], ["lion", "living"], ["alligator", "living"], ["pebble", "nonliv"], ["shark", "living"], ["knob", "nonliv"], ["table", "nonliv"], ["shark", "living"], ["bicycle", "nonliv"], ["cloud", "nonliv"], ["marble", "nonliv"], ["cloud", "nonliv"], ["alligator", "living"], ["sparrow", "living"], ["lizard", "living"], ["snowflake", "nonliv"], ["mushroom", "living"], ["lion", "living"], ["pebble", "nonliv"], ["bicycle", "nonliv"], ["table", "nonliv"], ["oak", "living"], ["mushroom", "living"], ["knob", "nonliv"], ["marble", "nonliv"], ["coat", "nonliv"], ["goldfish", "living"], ["snowflake", "nonliv"], ["oak", "living"]],
    "living_prac": [["alligator", "living"], ["snowflake", "nonliv"], ["bicycle", "nonliv"], ["mushroom", "living"], ["cloud", "nonliv"], ["goldfish", "living"], ["lizard", "living"], ["table", "nonliv"], ["marble", "nonliv"], ["shark", "living"], ["knob", "nonliv"], ["lion", "living"]],
    "mixed_prac": [["marble", "nonliv"], ["table", "nonliv"], ["alligator", "big"], ["sparrow", "small"], ["snowflake", "small"], ["goldfish", "small"], ["mushroom", "living"], ["cloud", "nonliv"], ["knob", "small"], ["oak", "living"], ["marble", "small"], ["bicycle", "nonliv"], ["lizard", "living"], ["knob", "nonliv"], ["lizard", "small"], ["bicycle", "big"], ["pebble", "nonliv"], ["shark", "big"], ["sparrow", "living"], ["lion", "living"], ["goldfish", "living"], ["lion", "big"], ["table", "big"], ["coat", "big"]],
    "size_prac": [["pebble", "small"], ["bicycle", "big"], ["sparrow", "small"], ["coat", "big"], ["lion", "big"], ["lizard", "small"], ["snowflake", "small"], ["shark", "big"], ["goldfish", "small"], ["knob", "small"], ["cloud", "big"], ["table", "big"]],
    "size_real": [["table", "big"], ["knob", "small"], ["pebble", "small"], ["oak", "big"], ["bicycle", "big"], ["coat", "big"], ["shark", "big"], ["lizard", "small"], ["alligator", "big"], ["lion", "big"], ["snowflake", "small"], ["bicycle", "big"], ["shark", "big"], ["lizard", "small"], ["table", "big"], ["mushroom", "small"], ["marble", "small"], ["cloud", "big"], ["oak", "big"], ["knob", "small"], ["pebble", "small"], ["sparrow", "small"], ["goldfish", "small"], ["cloud", "big"], ["mushroom", "small"], ["snowflake", "small"], ["goldfish", "small"], ["knob", "small"], ["table", "big"], ["alligator", "big"], ["sparrow", "small"], ["marble", "small"], ["lion", "big"], ["coat", "big"]],
    "mixed_real_1": [["marble", "nonliv"], ["sparrow", "living"], ["table", "big"], ["lion", "big"], ["sparrow", "small"], ["table", "nonliv"], ["lion", "big"], ["sparrow", "living"], ["cloud", "nonliv"], ["alligator", "big"], ["lizard", "small"], ["marble", "nonliv"], ["table", "big"], ["pebble", "small"], ["shark", "living"], ["coat", "nonliv"], ["alligator", "living"], ["pebble", "small"], ["lion", "living"], ["snowflake", "nonliv"], ["lizard", "living"], ["marble", "small"], ["bicycle", "big"], ["shark", "big"], ["alligator", "living"], ["lizard", "small"], ["lion", "big"], ["goldfish", "small"], ["alligator", "big"], ["pebble", "nonliv"], ["shark", "big"], ["snowflake", "nonliv"], ["mushroom", "living"], ["snowflake", "small"], ["knob", "small"], ["goldfish", "living"], ["cloud", "big"], ["mushroom", "small"], ["bicycle", "nonliv"], ["shark", "living"], ["knob", "small"], ["marble", "small"], ["oak", "big"], ["snowflake", "small"], ["coat", "big"], ["knob", "nonliv"], ["sparrow", "living"], ["lion", "living"], ["coat", "big"], ["mushroom", "living"], ["table", "nonliv"], ["oak", "living"], ["marble", "nonliv"], ["knob", "nonliv"], ["oak", "big"], ["lizard", "living"], ["mushroom", "small"], ["oak", "living"], ["goldfish", "living"], ["bicycle", "nonliv"], ["sparrow", "small"], ["cloud", "nonliv"], ["pebble", "nonliv"], ["goldfish", "small"], ["table", "big"], ["coat", "nonliv"], ["bicycle", "big"], ["cloud", "big"]],
    "mixed_real_2": [["oak", "big"], ["coat", "big"], ["goldfish", "living"], ["knob", "nonliv"], ["marble", "nonliv"], ["lizard", "small"], ["goldfish", "small"], ["cloud", "nonliv"], ["oak", "big"], ["table", "nonliv"], ["pebble", "nonliv"], ["coat", "big"], ["shark", "living"], ["table", "nonliv"], ["goldfish", "small"], ["coat", "big"], ["lizard", "small"], ["knob", "nonliv"], ["coat", "nonliv"], ["snowflake", "small"], ["marble", "nonliv"], ["mushroom", "small"], ["table", "big"], ["cloud", "big"], ["alligator", "big"], ["lizard", "living"], ["cloud", "nonliv"], ["sparrow", "small"], ["mushroom", "living"], ["alligator", "living"], ["table", "big"], ["goldfish", "living"], ["cloud", "big"], ["lion", "big"], ["snowflake", "nonliv"], ["shark", "living"], ["sparrow", "living"], ["marble", "small"], ["pebble", "nonliv"], ["knob", "nonliv"], ["alligator", "big"], ["shark", "big"], ["pebble", "small"], ["snowflake", "small"], ["bicycle", "big"], ["lion", "living"], ["oak", "living"], ["goldfish", "living"], ["shark", "big"], ["sparrow", "small"], ["oak", "living"], ["mushroom", "living"], ["lizard", "living"], ["bicycle", "big"], ["marble", "small"], ["alligator", "living"], ["snowflake", "nonliv"], ["lion", "living"], ["pebble", "small"], ["oak", "big"], ["coat", "nonliv"], ["bicycle", "nonliv"], ["knob", "small"], ["sparrow", "living"], ["lion", "big"], ["mushroom", "small"], ["knob", "small"], ["bicycle", "nonliv"]]
  };

  instructions = ["In this task, we're going to test your ability \nto quickly and accurately categorize words\n\n\n            This test requires 30 minutes of undivided attention\n\n\nPress          to continue or try again later", "You'll see a series of words, one at the time \n\nAbove each word you'll see a symbol, like this: \n\n\n                                   " + (String.fromCharCode(10084)) + "\n                                house", "If the symbol is   " + (String.fromCharCode(10084)) + "  decide if the word is \nsomething living or non-living\n\nIf the symbol is   " + (String.fromCharCode(10021)) + "  decide if the word is\nsmaller or bigger than a soccer ball\n\n", "\nPop quiz!\n\n\nIf you see a  " + (String.fromCharCode(10084)) + " , what do you decide about the word shown?", "\n\n\nAnd if you see a  " + (String.fromCharCode(10021)) + " ?\n\nWhat do you decide about the word shown?", "For now, let's focus on when you see a  " + (String.fromCharCode(10084)) + "\n\nIf the word describes something...\n\n\nNon-living, press \n\nLiving, press \n\n", "\n\n\nIf you see a  " + (String.fromCharCode(10084)) + "\n\nwhat key do you press if the word is something living?", "It's time to practice!\n\nFor this part, \nNON-LIVING things are: \nsnowflake, pebble, marble, knob, bicycle, coat, table, and cloud \n\nLIVING things are: \nsparrow, mushroom, lizard, goldfish, lion, shark, alligator, and oak \n\n", "Remember, respond as quickly as you can\nwithout making mistakes\n\nIf you make a mistake, you'll see a red circle\nThe faster you can go while staying accurate, the better!\n\n\nReady to try it?", "Great. We're done with this practice round\n\nNow you're going to categorize 34 more words\nThese will be 'real', not practice words\n\nRemember to respond as quickly as you can \nwithout making mistakes", "Great, you're done! Now, let's switch gears...\n\nFor now, you'll decide if things are\nsmaller or bigger than a soccer ball\n\nIf the word describes something...\n\nSmall, press  \n\nBig, press ", "\n\n\nIf you see a " + (String.fromCharCode(10021)) + ", which key do you press for something\nsmaller than a soccer ball?", "Let's practice!\n\nFor this part, SMALL things are: \nsnowflake, pebble, marble, knob, sparrow, \nmushroom, lizard, and goldfish. \n\nBIG things are: \nbicycle, coat, table, cloud, lion, shark, alligator, and oak. \n\nRemember to respond quickly and accurately!", "Great! We're done with this practice round\n\nNow you're going to categorize 34 more words\nThese will be 'real', not practice words\n\nRemember to respond as quickly as you can \nwithout making mistakes", "Now we're going to make it a bit more difficult\n\nIn this last part, you'll have to switch between both judgments\n\nRespond according to the symbol above the word. \nIt may be different for every word.\n\nRemember to respond quickly without making mistakes", "Great, you're done with the practice!\n\nNow you're going to categorize 68 more words\nThese will be 'real', not practice words\n\nRemember to respond quickly without making mistakes\n\nAre you ready?"];

  trialLength = 5000;

  ITI = 350;

  IBI = 2000;

  red = '#FF6C47';

  c = document.getElementById("canvas");

  ctx = c.getContext("2d");

  width = canvas.width;

  height = canvas.height;

  saveData = function(newdata) {
    return psiturk.recordTrialData(newdata);
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

  hideButtons = function() {
    $("#leftButton").hide();
    return $("#rightButton").hide();
  };

  keyText = function(text, key, color) {
    if (key === 'left') {
      $("#leftText").html(text);
      $("#leftButton").show();
      return $("#leftButton").css('background-color', color);
    } else {
      $("#rightText").html(text);
      $("#rightButton").show();
      return $("#rightButton").css('background-color', color);
    }
  };

  Session = (function() {
    function Session(blocks) {
      this.blocks = blocks;
      hideButtons();
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
      psiturk.saveData();
      return psiturk.completeHIT();
    };

    Session.prototype.keyPress = function(e) {
      var code, input;
      code = e.charCode || e.keyCode;
      input = String.fromCharCode(code).toLowerCase();
      if (input === "j") {
        $('rightButton').click();
      }
      return this.currBlock.keyPress(input);
    };

    return Session;

  })();

  Instruction = (function() {
    function Instruction(message, left_key, right_key, corrResp, left_color, right_color) {
      this.message = message;
      this.left_key = left_key != null ? left_key : null;
      this.right_key = right_key != null ? right_key : "Continue";
      this.corrResp = corrResp != null ? corrResp : null;
      this.left_color = left_color != null ? left_color : 'white';
      this.right_color = right_color != null ? right_color : 'white';
    }

    Instruction.prototype.start = function(exitTrial) {
      this.exitTrial = exitTrial;
      this.startTime = (new Date).getTime();
      multilineText(this.message, 10, 30, "25px Arial", 33);
      hideButtons();
      if (this.left_key != null) {
        keyText(this.left_key, 'left', this.left_color);
      }
      return keyText(this.right_key, 'right', this.right_color);
    };

    Instruction.prototype.keyPress = function(key) {
      var acc, rt,
        _this = this;
      rt = (new Date).getTime() - this.startTime;
      if (this.corrResp != null) {
        if (this.corrResp === key) {
          $('#correct').modal('show');
          setTimeout((function() {
            return $('#correct').modal('hide');
          }), 1250);
          setTimeout((function() {
            return _this.exitTrial();
          }), 1250);
          acc = 1;
        } else {
          $('#error').modal('show');
          setTimeout((function() {
            return $('#error').modal('hide');
          }), 1250);
          acc = 0;
        }
      } else {
        if (key === 'f') {
          acc = 'BACK';
          this.exitTrial(false);
        } else if (key === 'j') {
          acc = 'FORWARD';
          this.exitTrial();
        }
      }
      return saveData([this.message].concat([rt, key, acc]));
    };

    return Instruction;

  })();

  Slide1 = (function(_super) {
    __extends(Slide1, _super);

    function Slide1() {
      _ref = Slide1.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    Slide1.prototype.start = function(exitTrial) {
      var fillColor;
      this.exitTrial = exitTrial;
      Slide1.__super__.start.call(this, this.exitTrial);
      multilineText("" + (String.fromCharCode(9888)), 0, 185, "80px Arial", 30, false, fillColor = 'red');
      return ctx.drawImage(jkey, 88, canvas.height - 267, 43, 43);
    };

    return Slide1;

  })(Instruction);

  LivingKeyMap = (function(_super) {
    __extends(LivingKeyMap, _super);

    function LivingKeyMap() {
      _ref1 = LivingKeyMap.__super__.constructor.apply(this, arguments);
      return _ref1;
    }

    LivingKeyMap.prototype.start = function(exitTrial) {
      this.exitTrial = exitTrial;
      LivingKeyMap.__super__.start.call(this, this.exitTrial);
      ctx.drawImage(fkey, 205, canvas.height - 337, 50, 50);
      return ctx.drawImage(jkey, 165, canvas.height - 270, 50, 50);
    };

    return LivingKeyMap;

  })(Instruction);

  SizeKeyMap = (function(_super) {
    __extends(SizeKeyMap, _super);

    function SizeKeyMap() {
      _ref2 = SizeKeyMap.__super__.constructor.apply(this, arguments);
      return _ref2;
    }

    SizeKeyMap.prototype.start = function(exitTrial) {
      this.exitTrial = exitTrial;
      SizeKeyMap.__super__.start.call(this, this.exitTrial);
      ctx.drawImage(fkey, 165, canvas.height - 275, 50, 50);
      return ctx.drawImage(jkey, 145, canvas.height - 205, 50, 50);
    };

    return SizeKeyMap;

  })(Instruction);

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
      hideButtons();
      multilineText(this.message, "center", "center", "35px Arial", 75);
      return setTimeout((function() {
        return _this.nextTrial();
      }), IBI);
    };

    Block.prototype.nextTrial = function() {
      var _this = this;
      this.currTrial = this.trials[this.trialNumber];
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
      _ref3 = PracticeBlock.__super__.constructor.apply(this, arguments);
      return _ref3;
    }

    PracticeBlock.prototype.endBlock = function() {
      return this.feedback();
    };

    PracticeBlock.prototype.feedback = function() {
      var accs, n;
      accs = (function() {
        var _i, _len, _ref4, _results;
        _ref4 = this.data;
        _results = [];
        for (_i = 0, _len = _ref4.length; _i < _len; _i++) {
          n = _ref4[_i];
          _results.push(typeof n[2] === 'string' ? 0 : n[2]);
        }
        return _results;
      }).call(this);
      this.accs = mean(accs);
      multilineText("You got " + (Math.round(this.accs * 100..toString())) + "% of trials correct", 10, 60, "30px Arial");
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
      var trial, _i, _len, _ref4;
      _ref4 = this.trials;
      for (_i = 0, _len = _ref4.length; _i < _len; _i++) {
        trial = _ref4[_i];
        trial.reset();
      }
      this.trialNumber = 0;
      this.data = [];
      hideButtons();
      saveData([this.condition].concat(['REST', 'REST', this.accs]));
      return this.nextTrial();
    };

    return PracticeBlock;

  })(Block);

  RTFeedbackBlock = (function(_super) {
    __extends(RTFeedbackBlock, _super);

    function RTFeedbackBlock() {
      _ref4 = RTFeedbackBlock.__super__.constructor.apply(this, arguments);
      return _ref4;
    }

    RTFeedbackBlock.prototype.endBlock = function() {
      var _this = this;
      this.feedback();
      return setTimeout((function() {
        return _this.exitBlock();
      }), IBI);
    };

    RTFeedbackBlock.prototype.feedback = function() {
      var goodRTs, n, _i, _len, _ref5;
      _ref5 = this.data;
      for (_i = 0, _len = _ref5.length; _i < _len; _i++) {
        n = _ref5[_i];
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
      return this.flag = true;
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
      }), ITI);
    };

    Trial.prototype.processJudgment = function(judgment) {
      var symbol;
      if (judgment === "living" || judgment === "nonliv") {
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
          if (this.corrResp === "nonliv" || this.corrResp === "small") {
            this.acc = 1;
          } else {
            this.acc = 0;
          }
        } else if (resp === "j") {
          if (this.corrResp === "living" || this.corrResp === "big") {
            this.acc = 1;
          } else {
            this.acc = 0;
          }
        } else {
          this.acc = 'other';
        }
        return this.endTrial();
      }
    };

    return Trial;

  })();

  FeedbackTrial = (function(_super) {
    __extends(FeedbackTrial, _super);

    function FeedbackTrial() {
      _ref5 = FeedbackTrial.__super__.constructor.apply(this, arguments);
      return _ref5;
    }

    FeedbackTrial.prototype.endTrial = function() {
      var clear, lineheight, thisITI,
        _this = this;
      if (this.flag === false) {
        this.flag = true;
        switch (this.acc) {
          case 0:
            drawCircle(canvas.width / 2, canvas.height / 2 - 40, 100, red);
            thisITI = ITI * 2;
            break;
          case 'NA':
            drawCircle(canvas.width / 2, canvas.height / 2 - 40, 100, red);
            thisITI = ITI * 2;
            break;
          case 1:
            clear_canvas();
            thisITI = ITI;
            break;
          case 'other':
            multilineText("Use only the F or J keys!", "center", canvas.height / 2 + 140, "30px Arial", lineheight = 20, clear = false);
            drawCircle(canvas.width / 2, canvas.height / 2 - 40, 100, red);
            thisITI = ITI * 2;
        }
        return setTimeout((function() {
          return _this.exitTrial([_this.rt, _this.resp, _this.acc]);
        }), thisITI);
      }
    };

    return FeedbackTrial;

  })(Trial);

  PracFeedbackTrial = (function(_super) {
    __extends(PracFeedbackTrial, _super);

    function PracFeedbackTrial() {
      _ref6 = PracFeedbackTrial.__super__.constructor.apply(this, arguments);
      return _ref6;
    }

    PracFeedbackTrial.prototype.endTrial = function() {
      var clear, lineheight, thisITI,
        _this = this;
      if (this.flag === false) {
        this.flag = true;
        switch (this.acc) {
          case 0:
            drawCircle(canvas.width / 2, canvas.height / 2 - 40, 100, red);
            thisITI = ITI * 2;
            break;
          case 'NA':
            multilineText("You took too long!", "center", canvas.height / 2 + 140, "30px Arial", lineheight = 20, clear = false);
            drawCircle(canvas.width / 2, canvas.height / 2 - 40, 100, red);
            thisITI = ITI * 2;
            break;
          case 1:
            clear_canvas();
            thisITI = ITI;
            break;
          case 'other':
            multilineText("Use only the F or J keys!", "center", canvas.height / 2 + 140, "30px Arial", lineheight = 20, clear = false);
            drawCircle(canvas.width / 2, canvas.height / 2 - 40, 100, red);
            thisITI = ITI * 2;
        }
        return setTimeout((function() {
          return _this.exitTrial([_this.rt, _this.resp, _this.acc]);
        }), thisITI);
      }
    };

    return PracFeedbackTrial;

  })(Trial);

  jQuery(function() {
    return $(document).keypress(function(event) {
      return currSession.keyPress(event);
    });
  });

  blocks = [
    new Slide1(instructions[0]), new Instruction(instructions[1], "Back"), new Instruction(instructions[2], "Back"), new Instruction(instructions[3], "Bigger or smaller than soccer ball", "Living or non-living", "j"), new Instruction(instructions[4], "Bigger or smaller than soccer ball", "Living or non-living", "f"), new LivingKeyMap(instructions[5], "Back"), new Instruction(instructions[6], " ", " ", "j"), new Instruction(instructions[7]), new Instruction(instructions[8], "Back", "Start practice!", null, 'white', '#66FF99'), new PracticeBlock("livingPrac", "Get ready for 12 words!", (function() {
      var _i, _len, _ref7, _results;
      _ref7 = all_stim['living_prac'];
      _results = [];
      for (_i = 0, _len = _ref7.length; _i < _len; _i++) {
        n = _ref7[_i];
        _results.push(new PracFeedbackTrial(n[0], n[1]));
      }
      return _results;
    })()), new Instruction(instructions[9], null, "Continue")
  ];

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

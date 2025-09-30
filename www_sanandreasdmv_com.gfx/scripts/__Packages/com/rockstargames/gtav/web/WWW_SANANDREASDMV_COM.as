class com.rockstargames.gtav.web.WWW_SANANDREASDMV_COM extends com.rockstargames.ui.core.BaseWebsite
{
   var CAN_STORE_PAGE;
   var CONTENT;
   var PAGE_NAMES;
   var answers;
   var availableQuestionCount;
   var browser;
   var correctAnswers;
   var dataTextScope;
   var drivingTips;
   var failDescription;
   var failTitle;
   var mcScope;
   var optionCount;
   var passDescription;
   var passScore;
   var passTitle;
   var proceedButton;
   var proceedButtonIndex;
   function WWW_SANANDREASDMV_COM()
   {
      super();
      this.IS_SITE_DYNAMIC = 0;
      _level0.TIMELINE.DebugTextContent = true;
      this.PAGE_NAMES = new Array();
      this.PAGE_NAMES[1] = "PAGE1";
      this.PAGE_NAMES[2] = "TEST1";
      this.PAGE_NAMES[3] = "TEST2";
      this.PAGE_NAMES[4] = "RESULT";
      this.CAN_STORE_PAGE = new Array();
      this.CAN_STORE_PAGE[1] = true;
      this.CAN_STORE_PAGE[2] = true;
      this.CAN_STORE_PAGE[3] = true;
      this.CAN_STORE_PAGE[4] = false;
      this.browser = _level0.TIMELINE;
   }
   function READY()
   {
   }
   function showDrivingTip()
   {
      var _loc2_;
      var _loc5_;
      var _loc4_;
      if(!this.drivingTips)
      {
         _loc2_ = "If you see a celebrity behind the wheel of a car, exercise extreme caution - they are most likely intoxicated.";
         _loc5_ = "Play your car stereo as loudly as possible to drown out distractions.";
         _loc4_ = "Text only when driving slowly.";
         this.drivingTips = [_loc2_,_loc5_,_loc4_];
      }
      var _loc3_ = Math.floor(Math.random() * this.drivingTips.length);
      this.mcScope.tip.text = this.drivingTips[_loc3_];
   }
   function doQuestionnaireSetup(pb, pbi, aqc)
   {
      this.proceedButton = pb;
      this.proceedButtonIndex = pbi;
      this.availableQuestionCount = aqc;
      var _loc2_;
      if(!this.answers)
      {
         this.answers = [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];
         this.correctAnswers = new Array();
         this.correctAnswers.push([1,2]);
         this.correctAnswers.push([1,2,3]);
         this.correctAnswers.push([3]);
         this.correctAnswers.push([2]);
         this.correctAnswers.push([1,2,3]);
         this.correctAnswers.push([3]);
         this.correctAnswers.push([3]);
         this.correctAnswers.push([3]);
         this.correctAnswers.push([3]);
         this.correctAnswers.push([3]);
         this.passTitle = "CONGRATULATIONS";
         this.passDescription = "You are now ready to drive on the most polluted and congested roads in the USA. Welcome to San Andreas, where the sun always shines but you\'ll never get to enjoy it because you\'re trapped in gridlock.";
         this.failTitle = "YOU FAILED";
         this.failDescription = "Either try again, or take a cab. Or the Metro! Ha Ha! You have to ride the Metro! Loser. Seriously. You\'re a loser. No wonder everyone hates you.";
         this.optionCount = 4;
         this.passScore = 7;
         this.setProceedButtonActive(false);
      }
      else
      {
         _loc2_ = 0;
         while(_loc2_ < this.answers.length)
         {
            if(this.mcScope["tick_" + _loc2_ + "_0"])
            {
               this.updateQuestion(_loc2_,this.answers[_loc2_]);
            }
            _loc2_ = _loc2_ + 1;
         }
      }
   }
   function updateQuestion(q, selected)
   {
      this.answers[q] = selected;
      var _loc2_ = 0;
      while(_loc2_ < this.optionCount)
      {
         MovieClip(this.mcScope["tick_" + q + "_" + _loc2_]).gotoAndStop("OFF");
         _loc2_ = _loc2_ + 1;
      }
      MovieClip(this.mcScope["tick_" + q + "_" + selected]).gotoAndStop("SELECT");
      this.checkAnswerStatus();
   }
   function checkAnswerStatus()
   {
      var _loc3_ = true;
      var _loc2_ = 0;
      while(_loc2_ < this.availableQuestionCount)
      {
         if(parseInt(this.answers[_loc2_]) < 0)
         {
            _loc3_ = false;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.setProceedButtonActive(_loc3_);
   }
   function setProceedButtonActive(active)
   {
      var _loc2_ = this.dataTextScope[this.proceedButtonIndex];
      if(active)
      {
         this.browser.DISABLE_BUTTON(this.proceedButtonIndex,false);
         this.proceedButton._alpha = 100;
      }
      else
      {
         this.browser.DISABLE_BUTTON(this.proceedButtonIndex,true);
         this.proceedButton._alpha = 50;
      }
   }
   function checkAnswers()
   {
      var _loc5_ = 0;
      var _loc3_ = 0;
      var _loc4_;
      var _loc2_;
      while(_loc3_ < this.answers.length)
      {
         _loc4_ = false;
         _loc2_ = 0;
         while(_loc2_ < this.correctAnswers[_loc3_].length)
         {
            if(this.answers[_loc3_] == this.correctAnswers[_loc3_][_loc2_])
            {
               _loc4_ = true;
            }
            _loc2_ = _loc2_ + 1;
         }
         if(_loc4_)
         {
            _loc5_ = _loc5_ + 1;
         }
         _loc3_ = _loc3_ + 1;
      }
      if(_loc5_ >= this.passScore)
      {
         this.populateResults(this.passTitle,this.passDescription);
      }
      else
      {
         this.populateResults(this.failTitle,this.failDescription);
      }
   }
   function populateResults(title, desc)
   {
      this.mcScope.resultTitle.text = title;
      this.mcScope.resultDescription.text = desc;
   }
   function setupButtons()
   {
      this.dataTextScope = new Array();
      var _loc3_ = 0;
      var _loc2_;
      for(var _loc4_ in this.mcScope)
      {
         if(typeof this.mcScope[_loc4_] == "movieclip")
         {
            if(this.mcScope[_loc4_].btnTxt != undefined)
            {
               this.mcScope[_loc4_].offColour = this.mcScope[_loc4_].btnTxt.textColor;
               _loc2_ = this.mcScope[_loc4_].btnTxt;
               this.dataTextScope[_loc3_] = _loc2_;
               _loc3_ = _loc3_ + 1;
            }
         }
      }
      this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
   }
   function goToAnchor(AnchorLink)
   {
      var _loc2_ = new Array();
      _loc2_ = AnchorLink.split("_");
      var _loc0_;
      if((_loc0_ = _loc2_[0]) === "q")
      {
         this.updateQuestion(_loc2_[1],_loc2_[2]);
      }
   }
   function POPULATE_TEXT(pageName)
   {
      this.mcScope = this.CONTENT[pageName];
      switch(pageName)
      {
         case "PAGE1":
            this.mcScope = this.CONTENT.PAGE1;
            this.setupButtons();
            this.showDrivingTip();
            this.answers = null;
            break;
         case "TEST1":
            this.mcScope = this.CONTENT.TEST1;
            this.setupButtons();
            this.doQuestionnaireSetup(this.mcScope.TEST2,20,5);
            break;
         case "TEST2":
            this.mcScope = this.CONTENT.TEST2;
            this.setupButtons();
            this.doQuestionnaireSetup(this.mcScope.RESULT,21,this.answers.length);
            break;
         case "RESULT":
            this.mcScope = this.CONTENT.RESULT;
            this.setupButtons();
            this.checkAnswers();
         default:
            return;
      }
   }
}

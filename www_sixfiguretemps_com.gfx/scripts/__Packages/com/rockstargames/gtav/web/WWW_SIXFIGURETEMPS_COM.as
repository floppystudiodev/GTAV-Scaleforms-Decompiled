class com.rockstargames.gtav.web.WWW_SIXFIGURETEMPS_COM extends com.rockstargames.ui.core.BaseWebsite
{
   var PAGE_NAMES;
   var CAN_STORE_PAGE;
   var browser;
   var quizAnswers;
   var quizCorrectAnswers;
   var quizResultsButtonIndex;
   var gameTotalBalloons;
   var mcScope;
   var quizResultsButtonReady;
   var gameBalloonsEaten;
   var gameBalloonsMax;
   var gameFailTimeout;
   var CONTENT;
   var dataTextScope;
   function WWW_SIXFIGURETEMPS_COM()
   {
      super();
      this.IS_SITE_DYNAMIC = 0;
      _level0.TIMELINE.DebugTextContent = true;
      this.PAGE_NAMES = new Array();
      this.PAGE_NAMES[1] = "PAGE1";
      this.PAGE_NAMES[2] = "PAGE2";
      this.PAGE_NAMES[3] = "PAGE3";
      this.PAGE_NAMES[4] = "PAGE4";
      this.PAGE_NAMES[5] = "PAGE5";
      this.CAN_STORE_PAGE = new Array();
      this.CAN_STORE_PAGE[1] = true;
      this.CAN_STORE_PAGE[2] = true;
      this.CAN_STORE_PAGE[3] = false;
      this.CAN_STORE_PAGE[4] = true;
      this.CAN_STORE_PAGE[5] = false;
      this.browser = _level0.TIMELINE;
      this.quizAnswers = new Array(-1,-1,-1,-1,-1,-1,-1);
      this.quizCorrectAnswers = new Array(1,0,0,1,0,1,1);
      this.quizResultsButtonIndex = 2;
      this.gameTotalBalloons = 10;
   }
   function READY()
   {
   }
   function UPDATE_QUIZ(questionNumber, answer)
   {
      if(answer == "yes")
      {
         this.mcScope["quiz_" + questionNumber + "_yes"].box_fill.gotoAndStop("on");
         this.mcScope["quiz_" + questionNumber + "_no"].box_fill.gotoAndStop("off");
         this.quizAnswers[questionNumber] = 1;
      }
      else
      {
         this.mcScope["quiz_" + questionNumber + "_yes"].box_fill.gotoAndStop("off");
         this.mcScope["quiz_" + questionNumber + "_no"].box_fill.gotoAndStop("on");
         this.quizAnswers[questionNumber] = 0;
      }
      this.checkQuizAnswerStatus();
   }
   function initQuizAnswers()
   {
      this.quizAnswers = new Array(-1,-1,-1,-1,-1,-1,-1);
      this.quizResultsButtonReady = false;
   }
   function checkQuizAnswerStatus()
   {
      var _loc3_ = true;
      var _loc2_ = 0;
      while(_loc2_ < this.quizAnswers.length)
      {
         if(parseInt(this.quizAnswers[_loc2_]) < 0)
         {
            _loc3_ = false;
         }
         _loc2_ = _loc2_ + 1;
      }
      if(_loc3_ && !this.quizResultsButtonReady)
      {
         this.browser.DISABLE_BUTTON(this.quizResultsButtonIndex,false);
         MovieClip(this.mcScope.quiz_getresults).gotoAndPlay("show");
         this.quizResultsButtonReady = true;
      }
   }
   function getQuizResponse()
   {
      var _loc3_ = 0;
      var _loc4_ = "PAGE4";
      var _loc2_ = 0;
      while(_loc2_ < this.quizAnswers.length)
      {
         if(parseInt(this.quizAnswers[_loc2_]) == parseInt(this.quizCorrectAnswers[_loc2_]))
         {
            _loc3_ = _loc3_ + 1;
         }
         _loc2_ = _loc2_ + 1;
      }
      if(_loc3_ < 5)
      {
         _loc4_ = "PAGE3";
      }
      return _loc4_;
   }
   function initGame()
   {
      MovieClip(this.mcScope.game_addballoon)._visible = true;
      MovieClip(this.mcScope.drugmule).gotoAndStop(1);
      this.gameBalloonsEaten = 0;
      this.gameBalloonsMax = Math.floor(Math.random() * 4) + 5;
      var _loc2_ = 0;
      while(_loc2_ < this.gameTotalBalloons)
      {
         MovieClip(this.mcScope["balloon_tick_" + _loc2_]).gotoAnStop("hide");
         MovieClip(this.mcScope["condom_" + _loc2_])._visible = true;
         _loc2_ = _loc2_ + 1;
      }
   }
   function doGameFail(b)
   {
      b.GO_TO_WEBPAGE("WWW_SIXFIGURETEMPS_COM_S_PAGE5");
   }
   function UPDATE_GAME()
   {
      MovieClip(this.mcScope.game_addballoon).gotoAndPlay(2);
      if(this.gameBalloonsEaten <= this.gameBalloonsMax)
      {
         MovieClip(this.mcScope["balloon_tick_" + this.gameBalloonsEaten]).gotoAndPlay("show");
         MovieClip(this.mcScope["condom_" + this.gameBalloonsEaten])._visible = false;
         var _loc2_ = MovieClip(this.mcScope.drugmule);
         _loc2_.gotoAndPlay("eat_" + this.gameBalloonsEaten);
         _loc2_.heart.gotoAndPlay("beat_" + this.gameBalloonsEaten);
         this.gameBalloonsEaten = this.gameBalloonsEaten + 1;
      }
      else
      {
         MovieClip(this.mcScope.drugmule).gotoAndPlay("pop");
         MovieClip(this.mcScope.game_addballoon)._visible = false;
         this.gameFailTimeout = setTimeout(this.doGameFail,2000,this.browser);
      }
   }
   function goToAnchor(AnchorLink)
   {
      var _loc2_ = new Array();
      _loc2_ = AnchorLink.split("_");
      switch(_loc2_[0])
      {
         case "quiz":
            if(_loc2_[1] == "getresults")
            {
               this.browser.GO_TO_WEBPAGE("WWW_SIXFIGURETEMPS_COM_S_" + this.getQuizResponse());
            }
            else
            {
               this.UPDATE_QUIZ(_loc2_[1],_loc2_[2]);
            }
            break;
         case "game":
            this.UPDATE_GAME();
      }
   }
   function POPULATE_TEXT(pageName)
   {
      switch(pageName)
      {
         case "PAGE1":
            this.mcScope = this.CONTENT.PAGE1;
            this.CONTENT.BOUNDING_BOX._height = 1290;
            break;
         case "PAGE2":
            this.mcScope = this.CONTENT.PAGE2;
            this.CONTENT.BOUNDING_BOX._height = 1670;
            this.initQuizAnswers();
            MovieClip(this.mcScope.quiz_getresults).gotoAndStop("hide");
            break;
         case "PAGE3":
            this.mcScope = this.CONTENT.PAGE3;
            this.CONTENT.BOUNDING_BOX._height = 627;
            break;
         case "PAGE4":
            this.mcScope = this.CONTENT.PAGE4;
            this.CONTENT.BOUNDING_BOX._height = 1419;
            this.initGame();
            break;
         case "PAGE5":
            this.mcScope = this.CONTENT.PAGE5;
            this.mcScope.PAGE4._alpha = 1;
            this.CONTENT.BOUNDING_BOX._height = 922;
      }
      if(this.mcScope.PAGE1)
      {
         this.mcScope.PAGE1._alpha = 1;
      }
      this.dataTextScope = new Array();
      var _loc3_ = 0;
      for(var _loc4_ in this.mcScope)
      {
         if(typeof this.mcScope[_loc4_] == "movieclip")
         {
            if(this.mcScope[_loc4_].btnTxt != undefined)
            {
               this.mcScope[_loc4_].offColour = this.mcScope[_loc4_].btnTxt.textColor;
               var _loc2_ = this.mcScope[_loc4_].btnTxt;
               this.dataTextScope[_loc3_] = _loc2_;
               _loc3_ = _loc3_ + 1;
            }
         }
      }
      this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
      if(pageName == "PAGE2")
      {
         this.browser.DISABLE_BUTTON(this.quizResultsButtonIndex,true);
      }
   }
}

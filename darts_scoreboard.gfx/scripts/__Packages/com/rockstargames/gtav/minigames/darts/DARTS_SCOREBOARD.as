class com.rockstargames.gtav.minigames.darts.DARTS_SCOREBOARD extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
   var CONTENT;
   var colPositions;
   var playerOneName;
   var playerTwoName;
   var plyrOneScores;
   var plyrScores;
   var plyrTwoScores;
   var MAX_ROWS = 7;
   var ROW_SPACER = 7;
   var FIRST_ROW_YPOS = 85;
   var numberOfRowsPlyrOne = 0;
   var numberOfRowsPlyrTwo = 0;
   function DARTS_SCOREBOARD()
   {
      super();
      this.colPositions = [15,138];
      this.plyrOneScores = [];
      this.plyrTwoScores = [];
      this.plyrScores = [this.plyrOneScores,this.plyrTwoScores];
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.playerOneName = this.CONTENT.playerOneName;
      this.playerTwoName = this.CONTENT.playerTwoName;
      this.CONTENT.p1CrewTag._visible = false;
      this.CONTENT.p2CrewTag._visible = false;
   }
   function debug()
   {
      this.SET_DARTS_PLAYER_NAMES("MICHAEL","TREVOR");
      this.ADD_DARTS_SCORE(0,301);
      this.ADD_DARTS_SCORE(0,251);
      this.ADD_DARTS_SCORE(0,201);
      this.ADD_DARTS_SCORE(1,301);
      this.ADD_DARTS_SCORE(1,251);
      this.ADD_DARTS_SCORE(1,201);
      this.ADD_DARTS_SCORE(1,200);
      this.ADD_DARTS_SCORE(1,300);
      this.ADD_DARTS_SCORE(1,400);
      this.ADD_DARTS_SCORE(1,500);
      this.ADD_DARTS_SCORE(1,600);
      this.ADD_DARTS_SCORE(1,700);
      this.ADD_DARTS_SCORE(1,800);
      this.ADD_DARTS_SCORE(1,900);
      this.ADD_DARTS_SCORE(1,1100);
      this.ADD_DARTS_SCORE(1,1200);
      this.ADD_DARTS_SCORE(1,1300);
      this.ADD_DARTS_SCORE(1,1400);
      this.ADD_DARTS_SCORE(1,1500);
      this.SET_PLAYER_HIGHLIGHT(2);
      this.SET_PLAYER_SETS_AND_LEGS(1,1,2,0);
      this.SET_CREW_TAG(2,"WWW",false);
   }
   function SET_PLAYER_HIGHLIGHT(who)
   {
      this.CONTENT.whosTurn._alpha = 0;
      if(who == 1)
      {
         this.CONTENT.whosTurn._alpha = 100;
         this.CONTENT.whosTurn._x = 14;
      }
      if(who == 2)
      {
         this.CONTENT.whosTurn._alpha = 100;
         this.CONTENT.whosTurn._x = 142;
      }
   }
   function SET_CREW_TAG(player, tag, isPrivate)
   {
      if(player == 1)
      {
         this.CONTENT.p1CrewTag.gotoAndStop(Number(isPrivate) + 2);
         this.CONTENT.p1CrewTag.crewTag.text = tag;
         this.CONTENT.p1CrewTag._visible = true;
      }
      if(player == 2)
      {
         this.CONTENT.p2CrewTag.gotoAndStop(Number(isPrivate) + 2);
         this.CONTENT.p2CrewTag.crewTag.text = tag;
         this.CONTENT.p2CrewTag._visible = true;
      }
   }
   function SET_PLAYER_SETS_AND_LEGS(p1Sets, p2Sets, p1Legs, p2Legs)
   {
      com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.CONTENT.headerSets,"MG_DARTS_SETS");
      com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.CONTENT.headerLegs,"MG_DARTS_LEGS");
      this.CONTENT.playerOneSets.text = p1Sets;
      this.CONTENT.playerTwoSets.text = p2Sets;
      this.CONTENT.playerOneLegs.text = p1Legs;
      this.CONTENT.playerTwoLegs.text = p2Legs;
   }
   function SET_DARTS_PLAYER_NAMES(playerOne, playerTwo)
   {
      com.rockstargames.ui.utils.FitToTextfield.scaleText(this.playerOneName,playerOne,124,"center",false);
      this.playerOneName._x = 62.8 - this.playerOneName._width / 2;
      com.rockstargames.ui.utils.FitToTextfield.scaleText(this.playerTwoName,playerTwo,124,"center",false);
      this.playerTwoName._x = 194.05 - this.playerTwoName._width / 2;
   }
   function ADD_DARTS_SCORE(playerID, score)
   {
      var _loc3_;
      if(playerID == 0)
      {
         if(this.numberOfRowsPlyrOne > this.MAX_ROWS)
         {
            this.CLEAR_SCORES(playerID);
            this.numberOfRowsPlyrOne = 0;
         }
         _loc3_ = this.numberOfRowsPlyrOne;
         this.numberOfRowsPlyrOne = this.numberOfRowsPlyrOne + 1;
      }
      else
      {
         if(this.numberOfRowsPlyrTwo > this.MAX_ROWS)
         {
            this.CLEAR_SCORES(playerID);
            this.numberOfRowsPlyrTwo = 0;
         }
         _loc3_ = this.numberOfRowsPlyrTwo;
         this.numberOfRowsPlyrTwo = this.numberOfRowsPlyrTwo + 1;
      }
      var _loc5_ = this.plyrScores[playerID];
      var _loc7_ = _loc5_.length;
      var _loc6_ = _loc7_ - 1;
      if(_loc6_ < 1)
      {
         _loc6_ = 0;
      }
      var _loc2_ = new MovieClip();
      var _loc10_ = "score" + playerID + _loc3_;
      _loc2_ = this.CONTENT.attachMovie("playerScore",_loc10_,this.CONTENT.getNextHighestDepth());
      _loc2_.score.text = score;
      var _loc9_ = _loc3_ * (_loc2_._height + this.ROW_SPACER) + this.FIRST_ROW_YPOS;
      _loc2_._x = this.colPositions[playerID];
      _loc2_._y = _loc9_;
      _loc5_.push(_loc2_);
      var _loc8_;
      if(_loc3_ > 0)
      {
         _loc8_ = _loc5_[_loc6_];
         _loc8_.strikethrough._alpha = 100;
      }
   }
   function CLEAR_DARTBOARD()
   {
      this.CLEAR_SCORES(0);
      this.CLEAR_SCORES(1);
      this.SET_DARTS_PLAYER_NAMES("","");
      this.numberOfRowsPlyrOne = 0;
      this.numberOfRowsPlyrTwo = 0;
   }
   function CLEAR_SCORES(playerID)
   {
      var _loc4_ = this.plyrScores[playerID];
      var _loc5_ = _loc4_.length;
      var _loc3_;
      var _loc2_ = 0;
      while(_loc2_ < _loc5_)
      {
         _loc3_ = _loc4_[_loc2_];
         _loc3_.removeMovieClip();
         _loc2_ = _loc2_ + 1;
      }
      this.resetRow(playerID);
   }
   function resetRow(playerID)
   {
      if(playerID == 0)
      {
         this.numberOfRowsPlyrOne = 0;
      }
      if(playerID == 1)
      {
         this.numberOfRowsPlyrTwo = 0;
      }
   }
}

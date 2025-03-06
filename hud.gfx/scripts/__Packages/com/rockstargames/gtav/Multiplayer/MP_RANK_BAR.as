class com.rockstargames.gtav.Multiplayer.MP_RANK_BAR extends com.rockstargames.ui.hud.HUD_COMPONENT
{
   var _queue;
   var myColour;
   var myColourDark;
   var TIMELINE;
   var CONTENT;
   var BOUNDING_BOX;
   var _enumID;
   var leftText;
   var rightText;
   var rankText;
   var rankTextWhite;
   var bar;
   var barChangedAmount;
   var globeBgCol;
   var rankColour;
   var _nextRankLimit;
   var _difBetweenRanks;
   var _howFarIntoThisRankCurrently;
   var _howFarIntoThisRankNow;
   var _previousXPPercentage;
   var _newXPPercentage;
   var _playersPreviousXP;
   var _playersCurrentXP;
   var _playersTickingXP;
   var _HUD;
   var initialRank = undefined;
   var _increment = 5;
   var _animationDuration = 1;
   var _onScreenDuration = 500;
   var _isIncreasingRank = true;
   var _isAnimatingRank = false;
   var _showRankXP = true;
   var _showRankUp = false;
   var myAlpha = 100;
   function MP_RANK_BAR()
   {
      super();
      this._queue = [];
      this.ON_SCREEN_DURATION = 4000;
      this.myColour = new com.rockstargames.ui.utils.HudColour();
      this.myColourDark = new com.rockstargames.ui.utils.HudColour();
   }
   function INITIALISE()
   {
      this.TIMELINE = this;
      this.CONTENT = this.TIMELINE.CONTENT;
      this.BOUNDING_BOX = this.TIMELINE.BOUNDING_BOX;
      this.BOUNDING_BOX._visible = false;
   }
   function READY(id)
   {
      this._enumID = id;
      this.leftText = this.CONTENT.rankIconLeft.rankTF_MC.rankTF;
      this.rightText = this.CONTENT.rankIconRight.rankTF_MC.rankTF;
      this.leftText.textAutoSize = "shrink";
      this.rightText.textAutoSize = "shrink";
      this.rankText = this.CONTENT.rankTextLeftOutline;
      this.rankTextWhite = this.CONTENT.rankTextLeft;
      this.bar = this.CONTENT.barScaler;
      this.barChangedAmount = this.CONTENT.barScalerChange;
      this.bar._xscale = 0;
      this.barChangedAmount._xscale = 0;
      this.CONTENT._alpha = 0;
   }
   function RESET_MOVIE()
   {
   }
   function SET_COLOUR(params)
   {
      var _loc4_ = params[0];
      var _loc3_ = new com.rockstargames.ui.utils.HudColour();
      var _loc2_ = new com.rockstargames.ui.utils.HudColour();
      this.globeBgCol = _loc2_;
      com.rockstargames.ui.utils.Colour.setHudColour(_loc4_,this.myColour);
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG,_loc2_);
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG,_loc3_);
      com.rockstargames.ui.utils.Colour.Colourise(this.bar,this.myColour.r,this.myColour.g,this.myColour.b);
      com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.rankIconLeft.bg,_loc2_.r,_loc2_.g,_loc2_.b,100);
      com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.rankIconRight.bg,_loc2_.r,_loc2_.g,_loc2_.b,100);
      com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.barTrough,this.myColour.r,this.myColour.g,this.myColour.b,30);
      com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.background,_loc2_.r,_loc2_.g,_loc2_.b,_loc2_.a);
   }
   function OVERRIDE_ANIMATION_SPEED(params)
   {
      var _loc2_ = params[0];
      this._animationDuration = _loc2_ / 1000;
   }
   function OVERRIDE_ONSCREEN_DURATION(params)
   {
      var _loc2_ = params[0];
      this.ON_SCREEN_DURATION = _loc2_;
   }
   function SET_BAR_TEXT(params)
   {
      var _loc2_ = params[0];
      var _loc3_ = params[1];
      this.myAlpha = _loc3_ != undefined ? _loc3_ : 100;
      this.SHOW();
      this._showRankXP = false;
      this.rankText.text = _loc2_;
      this.rankTextWhite.text = _loc2_;
   }
   function RESET_BAR_TEXT()
   {
      this._showRankXP = true;
   }
   function SET_RANK_SCORES(params)
   {
      var _loc8_ = params[0];
      var _loc3_ = params[1];
      var _loc7_ = params[2];
      var _loc4_ = params[3];
      var _loc5_ = params[4];
      var _loc9_ = params[5];
      this.myAlpha = _loc9_ != undefined ? _loc9_ : 100;
      var _loc6_ = params[6];
      this.rankColour = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE,this.rankColour);
      com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.rankIconLeft.rankIcon,this.rankColour.r,this.rankColour.g,this.rankColour.b,70);
      com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.rankIconRight.rankIcon,this.rankColour.r,this.rankColour.g,this.rankColour.b,70);
      if(this._isAnimatingRank)
      {
         this._queue.push([_loc8_,_loc3_,_loc7_,_loc4_,_loc5_,_loc6_]);
      }
      else
      {
         this._isAnimatingRank = true;
         this.animatateScores(_loc8_,_loc3_,_loc7_,_loc4_,_loc5_,_loc6_);
      }
      return true;
   }
   function animatateScores(currentRankLimit, nextRankLimit, playersPreviousXP, playersCurrentXP, rank, rankNext)
   {
      if(this.initialRank == undefined)
      {
         this.initialRank = rank;
      }
      this.SHOW();
      if(rankNext == undefined)
      {
         if(rank > 7999)
         {
            rank = 7999;
         }
         rankNext = rank + 1;
      }
      this.CONTENT.rankIconLeft.rankTF_MC.gotoAndStop(this.getRankFrame(rank));
      this.CONTENT.rankIconRight.rankTF_MC.gotoAndStop(this.getRankFrame(rankNext));
      this.leftText.textAutoSize = "shrink";
      this.rightText.textAutoSize = "shrink";
      this._showRankUp = playersCurrentXP == nextRankLimit;
      this._isIncreasingRank = playersPreviousXP < playersCurrentXP;
      this._nextRankLimit = nextRankLimit;
      this._difBetweenRanks = this._nextRankLimit - currentRankLimit;
      this._howFarIntoThisRankCurrently = playersPreviousXP - currentRankLimit;
      this._howFarIntoThisRankNow = playersCurrentXP - currentRankLimit;
      this._previousXPPercentage = this._howFarIntoThisRankCurrently / this._difBetweenRanks * 100;
      this._newXPPercentage = this._howFarIntoThisRankNow / this._difBetweenRanks * 100;
      this._playersPreviousXP = playersPreviousXP;
      this._playersCurrentXP = playersCurrentXP;
      this._playersTickingXP = this._playersPreviousXP;
      this.bar._xscale = this._previousXPPercentage;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.bar,this._animationDuration,{_xscale:this._newXPPercentage});
      this.barChangedAmount._xscale = this._newXPPercentage;
      if(this._showRankXP)
      {
         this.CONTENT.rankTextLeft.text = playersPreviousXP;
         this.CONTENT.rankTextLeftOutline.text = playersPreviousXP;
         this.CONTENT.rankTextRight.text = nextRankLimit;
         this.CONTENT.rankTextRightOutline.text = nextRankLimit;
      }
      this._increment = this.calcIncrement(this._howFarIntoThisRankNow - this._howFarIntoThisRankCurrently);
      if(this._queue.length > 0 && rank > this.initialRank)
      {
         this.animateRankUp(rank);
      }
      else
      {
         this.leftText.text = String(rank);
         this.rightText.text = String(rankNext);
      }
      this.TIMELINE.onEnterFrame = function()
      {
         this.TIMELINE.tickUnderRank();
      };
   }
   function animateRankUp(rank)
   {
      this.CONTENT.rankIconRight._xscale = 130;
      this.CONTENT.rankIconRight._yscale = 130;
      com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.rankIconRight.bg,255,255,255,30);
      com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.rankIconRight.rankIcon,255,255,255,100);
      var _loc2_ = com.rockstargames.ui.utils.Colour.RGBToHex(this.rankColour.r,this.rankColour.g,this.rankColour.b);
      this.rightText.textColor = _loc2_;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT.rankIconRight,0.33,{_xscale:100,_yscale:100,onComplete:this.animateRankNumbersIn,onCompleteScope:this,onCompleteArgs:[rank]});
   }
   function animateRankNumbersIn(rank)
   {
      com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.rankIconLeft.bg,255,255,255,30);
      com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.rankIconLeft.rankIcon,255,255,255,100);
      var _loc2_ = com.rockstargames.ui.utils.Colour.RGBToHex(this.rankColour.r,this.rankColour.g,this.rankColour.b);
      this.leftText.textColor = _loc2_;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT.rankIconLeft.bg,0.165,{_alpha:0});
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT.rankIconRight.bg,0.165,{_alpha:0});
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT.rankIconLeft.rankIcon,0.165,{_alpha:0});
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT.rankIconRight.rankIcon,0.165,{_alpha:0});
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT.rankIconLeft.rankTF_MC,0.165,{_alpha:0,_xscale:0});
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT.rankIconRight.rankTF_MC,0.165,{_alpha:0,_xscale:0,onComplete:this.animateRankNumbersOut,onCompleteScope:this,onCompleteArgs:[rank]});
   }
   function animateRankNumbersOut(rank)
   {
      var _loc2_ = rank + 1;
      this.CONTENT.rankIconLeft.rankTF_MC.gotoAndStop(this.getRankFrame(rank));
      this.CONTENT.rankIconRight.rankTF_MC.gotoAndStop(this.getRankFrame(_loc2_));
      this.leftText.text = String(rank);
      this.rightText.text = String(_loc2_);
      this.leftText.textAutoSize = "shrink";
      this.rightText.textAutoSize = "shrink";
      this.leftText.textColor = 16777215;
      this.rightText.textColor = 16777215;
      com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.rankIconLeft.bg,this.globeBgCol.r,this.globeBgCol.g,this.globeBgCol.b,0);
      com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.rankIconRight.bg,this.globeBgCol.r,this.globeBgCol.g,this.globeBgCol.b,0);
      com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.rankIconLeft.rankIcon,this.rankColour.r,this.rankColour.g,this.rankColour.b,0);
      com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.rankIconRight.rankIcon,this.rankColour.r,this.rankColour.g,this.rankColour.b,0);
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT.rankIconLeft.bg,0.165,{_alpha:this.globeBgCol.a});
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT.rankIconRight.bg,0.165,{_alpha:this.globeBgCol.a});
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT.rankIconLeft.rankIcon,0.165,{_alpha:50});
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT.rankIconRight.rankIcon,0.165,{_alpha:50});
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT.rankIconLeft.rankTF_MC,0.165,{_alpha:100,_xscale:100});
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT.rankIconRight.rankTF_MC,0.165,{_alpha:100,_xscale:100});
   }
   function getRankFrame(_rankValue)
   {
      var _loc1_ = 1;
      if(_rankValue < 100)
      {
         _loc1_ = 1;
      }
      else if(_rankValue > 99 && _rankValue < 1000)
      {
         _loc1_ = 2;
      }
      else
      {
         _loc1_ = 3;
      }
      return _loc1_;
   }
   function tickUnderRank()
   {
      if(this._isIncreasingRank)
      {
         this._playersTickingXP += this._increment;
         if(this._playersTickingXP >= this._playersCurrentXP)
         {
            this.TIMELINE.onEnterFrame = null;
            this._playersTickingXP = this._playersCurrentXP;
            this._isAnimatingRank = false;
            this.checkQueuedItems();
         }
      }
      else
      {
         this._playersTickingXP += this._increment;
         if(this._playersTickingXP <= this._playersCurrentXP)
         {
            this.TIMELINE.onEnterFrame = null;
            this._playersTickingXP = this._playersCurrentXP;
            this._isAnimatingRank = false;
            this.checkQueuedItems();
         }
      }
      if(this._showRankXP)
      {
         this.CONTENT.rankTextLeft.text = Math.round(this._playersTickingXP);
         this.CONTENT.rankTextLeftOutline.text = Math.round(this._playersTickingXP);
         this.CONTENT.rankTextRight.text = this._nextRankLimit;
         this.CONTENT.rankTextRightOutline.text = this._nextRankLimit;
      }
   }
   function calcIncrement(difBetweenRanks)
   {
      return difBetweenRanks / 30 / this._animationDuration;
   }
   function checkQueuedItems()
   {
      if(this._showRankUp)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.CONTENT.rankIconLeft,0.1,{onComplete:this.checkQueuedItems,onCompleteScope:this});
         this._showRankUp = false;
         return undefined;
      }
      if(this._queue.length > 0)
      {
         this.SET_RANK_SCORES([this._queue[0][0],this._queue[0][1],this._queue[0][2],this._queue[0][3],this._queue[0][4],this._queue[0][5]]);
         this._queue.shift();
      }
      else
      {
         this.SHOW();
      }
   }
   function SHOW()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT,0.1,{_alpha:this.myAlpha,onComplete:this.STAY_ON_SCREEN,onCompleteScope:this});
   }
   function STAY_ON_SCREEN()
   {
      if(!this._isAnimatingRank)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.CONTENT,this.ON_SCREEN_DURATION / 1000,{onComplete:this.HIDE,onCompleteScope:this});
      }
   }
   function FADE_BAR_OUT(params)
   {
      if(params[0])
      {
         this.REMOVE();
      }
      else
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT,this._animationDuration,{_alpha:0,onComplete:this.REMOVE,onCompleteScope:this});
      }
   }
   function HIDE()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT,this.FADE_DURATION / 1000,{_alpha:0,onComplete:this.REMOVE,onCompleteScope:this});
   }
   function REMOVE()
   {
      this._queue = [];
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.CONTENT);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.CONTENT.rankIconLeft);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.bar);
      this.TIMELINE.onEnterFrame = null;
      this._HUD.REMOVE_HUD_ITEM(this._enumID);
   }
   function debug()
   {
      com.rockstargames.ui.utils.Colour.Colourise(this.bar,144,111,178);
      com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.rankIconLeft,144,111,178);
      com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.rankIconRight,144,111,178);
      com.rockstargames.ui.utils.Colour.Colourise(this.barChangedAmount,72,55,89);
      this.OVERRIDE_ANIMATION_SPEED([1000]);
   }
}

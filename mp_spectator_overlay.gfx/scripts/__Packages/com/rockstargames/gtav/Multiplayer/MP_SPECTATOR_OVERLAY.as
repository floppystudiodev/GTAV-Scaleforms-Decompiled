class com.rockstargames.gtav.Multiplayer.MP_SPECTATOR_OVERLAY extends com.rockstargames.ui.core.BaseScreenLayout
{
   var CONTENT;
   var feedTicker;
   var jobTicker;
   var lowerThirdMC;
   var playerPostionMC;
   var ref;
   var titleIndex = 0;
   var titleAr = new Array();
   function MP_SPECTATOR_OVERLAY()
   {
      super();
      _global.gfxExtensions = true;
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.playerPostionMC = this.INIT_SCORE();
      this.lowerThirdMC = this.CONTENT.attachMovie("LowerThird","lowerThirdMC",this.CONTENT.getNextHighestDepth());
      this.feedTicker = com.rockstargames.gtav.Multiplayer.gtavonlinetv.OnlineTVTicker(this.lowerThirdMC.attachMovie("TickerFeed","TickerFeedMC",this.lowerThirdMC.getNextHighestDepth(),{_y:50}));
      this.feedTicker.SET_TICKER_SPEED(4);
      this.jobTicker = com.rockstargames.gtav.Multiplayer.gtavonlinetv.OnlineTVTicker(this.lowerThirdMC.attachMovie("TickerJob","TickerJobMC",this.lowerThirdMC.getNextHighestDepth(),{_y:this.feedTicker._y + this.feedTicker._height}));
      this.lowerThirdMC.liveMC.swapDepths(8);
      this.lowerThirdMC.logoMC.swapDepths(9);
      this.SHOW_TICKER(false);
      var _loc3_ = 0.05;
      this.safeTop = 720 * _loc3_;
      this.safeBottom = 720 - 720 * _loc3_;
      this.safeLeft = 1280 * _loc3_;
      this.safeRight = 1280 - 1280 * _loc3_;
      this.initScreenLayout();
   }
   function debug()
   {
      this.SET_TITLE(undefined,"start","WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW.");
      this.SHOW_TICKER(true);
      this.SHOW_POSITIONS(true);
      this.ADD_FEED_TEXT(com.rockstargames.gtav.Multiplayer.gtavonlinetv.OnlineTVTick.TYPE_FEED,"WWWWWgypqWWWWWgypq",com.rockstargames.gtav.Multiplayer.gtavonlinetv.OnlineTVTick.TYPE_TWITTER,"WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW",com.rockstargames.gtav.Multiplayer.gtavonlinetv.OnlineTVTick.TYPE_SOCIAL,"kgypqled",com.rockstargames.gtav.Multiplayer.gtavonlinetv.OnlineTVTick.TYPE_FEED,"igypqii",com.rockstargames.gtav.Multiplayer.gtavonlinetv.OnlineTVTick.TYPE_TWITTER,"{*%111");
      this.ADD_FEED_TEXT(com.rockstargames.gtav.Multiplayer.gtavonlinetv.OnlineTVTick.TYPE_FEED,"111111111",com.rockstargames.gtav.Multiplayer.gtavonlinetv.OnlineTVTick.TYPE_TWITTER,"WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW",com.rockstargames.gtav.Multiplayer.gtavonlinetv.OnlineTVTick.TYPE_SOCIAL,"kgypqled",com.rockstargames.gtav.Multiplayer.gtavonlinetv.OnlineTVTick.TYPE_FEED,"igypqii",com.rockstargames.gtav.Multiplayer.gtavonlinetv.OnlineTVTick.TYPE_TWITTER,"{*%111");
      this.ADD_FEED_TEXT(com.rockstargames.gtav.Multiplayer.gtavonlinetv.OnlineTVTick.TYPE_FEED,"222222",com.rockstargames.gtav.Multiplayer.gtavonlinetv.OnlineTVTick.TYPE_TWITTER,"WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW",com.rockstargames.gtav.Multiplayer.gtavonlinetv.OnlineTVTick.TYPE_SOCIAL,"kgypqled",com.rockstargames.gtav.Multiplayer.gtavonlinetv.OnlineTVTick.TYPE_FEED,"igypqii",com.rockstargames.gtav.Multiplayer.gtavonlinetv.OnlineTVTick.TYPE_TWITTER,"{*%111");
      this.ADD_FEED_TEXT(com.rockstargames.gtav.Multiplayer.gtavonlinetv.OnlineTVTick.TYPE_FEED,"3333333333",com.rockstargames.gtav.Multiplayer.gtavonlinetv.OnlineTVTick.TYPE_TWITTER,"WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW",com.rockstargames.gtav.Multiplayer.gtavonlinetv.OnlineTVTick.TYPE_SOCIAL,"kgypqled",com.rockstargames.gtav.Multiplayer.gtavonlinetv.OnlineTVTick.TYPE_FEED,"igypqii",com.rockstargames.gtav.Multiplayer.gtavonlinetv.OnlineTVTick.TYPE_TWITTER,"{*%111");
      this.ADD_FEED_TEXT(com.rockstargames.gtav.Multiplayer.gtavonlinetv.OnlineTVTick.TYPE_FEED,"444444444",com.rockstargames.gtav.Multiplayer.gtavonlinetv.OnlineTVTick.TYPE_TWITTER,"WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW",com.rockstargames.gtav.Multiplayer.gtavonlinetv.OnlineTVTick.TYPE_SOCIAL,"kgypqled",com.rockstargames.gtav.Multiplayer.gtavonlinetv.OnlineTVTick.TYPE_FEED,"igypqii",com.rockstargames.gtav.Multiplayer.gtavonlinetv.OnlineTVTick.TYPE_TWITTER,"{*%111");
      this.ADD_JOB_TEXT(com.rockstargames.gtav.Multiplayer.gtavonlinetv.OnlineTVTick.TYPE_JOB,"<font color=\'#000000\'>W99999gypq</font>");
      this.ADD_JOB_TEXT(com.rockstargames.gtav.Multiplayer.gtavonlinetv.OnlineTVTick.TYPE_JOB,"<font color=\'#ff0000\'>NEW RED COLOR</font>");
      this.ADD_JOB_TEXT(com.rockstargames.gtav.Multiplayer.gtavonlinetv.OnlineTVTick.TYPE_JOB,"<font color=\'#ff0000\'>NEW RED COLOR2</font>");
      this.ADD_JOB_TEXT(com.rockstargames.gtav.Multiplayer.gtavonlinetv.OnlineTVTick.TYPE_JOB,"<font color=\'#ff0000\'>NEW RED COLOR3</font>");
      this.ADD_JOB_TEXT(com.rockstargames.gtav.Multiplayer.gtavonlinetv.OnlineTVTick.TYPE_JOB,"<font color=\'#ff0000\'>NEW RED COLOR4</font>");
      this.SET_PLAYER_SCORE(1,true,"1","WWWWWWWWWWWWWWWWWWWW","23:23:00:000");
      this.SET_PLAYER_SCORE(2,true,"2","WWWWWWWWWWWWWWWWWWWW","23:23:00:000");
      this.CONTENT.ref = this;
      this.CONTENT.onEnterFrame = function()
      {
         this.ref.update();
      };
   }
   function update()
   {
      if(Key.isDown(32))
      {
         this.ADD_FEED_TEXT(com.rockstargames.gtav.Multiplayer.gtavonlinetv.OnlineTVTick.TYPE_FEED,"K" + Math.round(Math.random() * 99),com.rockstargames.gtav.Multiplayer.gtavonlinetv.OnlineTVTick.TYPE_TWITTER,"(_+" + Math.round(Math.random() * 9999),com.rockstargames.gtav.Multiplayer.gtavonlinetv.OnlineTVTick.TYPE_SOCIAL,"F\'d",com.rockstargames.gtav.Multiplayer.gtavonlinetv.OnlineTVTick.TYPE_FEED,"D" + Math.round(Math.random() * 99),com.rockstargames.gtav.Multiplayer.gtavonlinetv.OnlineTVTick.TYPE_TWITTER,"{*" + Math.round(Math.random() * 9999));
      }
      if(!Key.isDown(37))
      {
      }
      if(!Key.isDown(39))
      {
      }
      if(!Key.isDown(38))
      {
      }
      if(!Key.isDown(40))
      {
      }
      if(Key.isDown(33))
      {
         this.safeTop = this.safeTop + 1;
         this.safeLeft = this.safeLeft + 1;
         this.safeRight = this.safeRight - 1;
         this.safeBottom = this.safeBottom - 1;
         this.initScreenLayout();
      }
      if(Key.isDown(34))
      {
         this.safeTop = this.safeTop - 1;
         this.safeLeft = this.safeLeft - 1;
         this.safeRight = this.safeRight + 1;
         this.safeBottom = this.safeBottom + 1;
         this.initScreenLayout();
      }
   }
   function initScreenLayout()
   {
      super.initScreenLayout();
      this._positionPositionsPanel();
      this._positionLowerThird();
   }
   function SET_DISPLAY_CONFIG(_screenWidthPixels, _screenHeightPixels, _safeTopPercent, _safeBottomPercent, _safeLeftPercent, _safeRightPercent, _isWideScreen, _isHiDef, _isAsian)
   {
      this.isWideScreen = _isWideScreen;
      this.isHiDef = _isHiDef;
      var _loc4_;
      var _loc3_;
      if(!this.isWideScreen)
      {
         Stage.scaleMode = "noBorder";
         _loc4_ = 1.7777777777777777;
         _loc3_ = 1.3333333333333333;
         this.FOUR_THREE_PADDING = (this.FILE_WIDTH - Math.round(this.FILE_WIDTH / _loc4_ * _loc3_)) / 2;
         _screenWidthPixels = this.FILE_WIDTH - this.FOUR_THREE_PADDING * 2;
      }
      this.safeLeft = this.FOUR_THREE_PADDING + Math.round(_screenWidthPixels * _safeLeftPercent);
      this.safeRight = this.FOUR_THREE_PADDING + Math.round(_screenWidthPixels * _safeRightPercent);
      this.safeTop = Math.round(_screenHeightPixels * _safeTopPercent);
      this.safeBottom = Math.round(_screenHeightPixels * _safeBottomPercent);
      this.initScreenLayout();
   }
   function SHOW_TICKER(value)
   {
      this.lowerThirdMC._visible = false;
      this.playerPostionMC._visible = value;
   }
   function SHOW_POSITIONS(value)
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.endTweenOf(this.playerPostionMC,false);
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.playerPostionMC,0.7,{_alpha:(!value ? 0 : 100),ease:com.rockstargames.ui.tweenStar.Ease.CUBIC_OUT});
   }
   function SET_TITLE(missionType, missionName, missionDesc)
   {
      var _loc5_ = this.lowerThirdMC.titleMC;
      if(missionType != undefined)
      {
         _loc5_.typeTF.htmlText = missionType;
      }
      if(missionName != undefined)
      {
         _loc5_.nameTF.htmlText = missionName;
      }
      if(missionDesc != undefined)
      {
         _loc5_.descTF.htmlText = missionDesc;
      }
      var _loc3_ = [_loc5_.typeTF,_loc5_.nameTF,_loc5_.descTF];
      var _loc4_ = [missionType,missionName,missionDesc];
      this.titleAr = [];
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         if(_loc4_[_loc2_] != "" && _loc4_[_loc2_] != undefined)
         {
            this.titleAr.push(_loc3_[_loc2_]);
         }
         _loc2_ = _loc2_ + 1;
      }
      this.titleIndex = 0;
      _loc5_._y = _loc5_.titleBG._height;
      this.ANIM_NEXT_TITLE_IN();
   }
   function SET_NEXT_TITLE(missionType, missionName, missionDesc)
   {
      var _loc5_ = this.lowerThirdMC.titleMC;
      var _loc4_ = 5;
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < this.titleAr.length)
      {
         _loc3_ = this.titleAr[_loc2_];
         _loc4_ = _loc3_._x * 2 + 5;
         _loc3_._visible = _loc2_ == this.titleIndex;
         if(_loc2_ == this.titleIndex)
         {
            _loc5_.titleBG._width = _loc3_.textWidth + _loc4_;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.titleIndex = this.titleIndex + 1;
      if(this.titleIndex > this.titleAr.length - 1)
      {
         this.titleIndex = 0;
      }
   }
   function ANIM_NEXT_TITLE_IN()
   {
      this.SET_NEXT_TITLE();
      com.rockstargames.ui.tweenStar.TweenStarLite.endTweenOf(this.lowerThirdMC.titleMC,false);
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.lowerThirdMC.titleMC,0.7,{_y:0,delay:0.5,ease:com.rockstargames.ui.tweenStar.Ease.CUBIC_OUT,onCompleteScope:this,onComplete:this.ANIM_NEXT_TITLE});
   }
   function ANIM_NEXT_TITLE_OUT()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.endTweenOf(this.lowerThirdMC.titleMC,false);
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.lowerThirdMC.titleMC,0.7,{_y:this.lowerThirdMC.titleMC.titleBG._height,ease:com.rockstargames.ui.tweenStar.Ease.CUBIC_IN,onCompleteScope:this,onComplete:this.ANIM_NEXT_TITLE_IN});
   }
   function ANIM_NEXT_TITLE()
   {
      var _loc2_ = 7;
      com.rockstargames.ui.tweenStar.TweenStarLite.endTweenOf(this.lowerThirdMC.titleMC,false);
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.lowerThirdMC.titleMC,_loc2_,{onCompleteScope:this,onComplete:this.ANIM_NEXT_TITLE_OUT});
   }
   function ADD_FEED_TEXT()
   {
      this.feedTicker.ADD_TICKER_TEXT.apply(this.feedTicker,arguments);
   }
   function ADD_JOB_TEXT()
   {
      this.jobTicker.ADD_TICKER_TEXT.apply(this.jobTicker,arguments);
   }
   function INIT_SCORE()
   {
      var _loc4_ = this.CONTENT.attachMovie("PlayerPostion","PlayerPostionMC",this.CONTENT.getNextHighestDepth());
      var _loc2_ = 1;
      var _loc3_;
      while(_loc2_ <= 2)
      {
         _loc3_ = _loc4_["rank" + _loc2_ + "MC"];
         com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc3_.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
         _loc2_ = _loc2_ + 1;
      }
      _loc4_._alpha = 0;
      return _loc4_;
   }
   function SET_PLAYER_SCORE(index, show, position, gamertag, score)
   {
      var _loc2_ = this.playerPostionMC["rank" + index + "MC"];
      if(_loc2_)
      {
         _loc2_._visible = show;
         _loc2_.posnumTF.textAutoSize = "shrink";
         _loc2_.posnumTF.text = position;
         _loc2_.gamertagTF.textAutoSize = "shrink";
         _loc2_.gamertagTF.text = gamertag;
         _loc2_.scoreTF.textAutoSize = "shrink";
         _loc2_.scoreTF.text = score;
         this._positionPositionsPanel();
      }
   }
   function _positionPositionsPanel()
   {
      this.playerPostionMC._y = this.safeTop;
      var _loc4_ = 0;
      var _loc3_ = 1;
      var _loc2_;
      while(_loc3_ <= 2)
      {
         _loc2_ = this.playerPostionMC["rank" + _loc3_ + "MC"];
         if(_loc2_._visible)
         {
            _loc4_ = _loc2_._x + _loc2_.bgMC._width;
         }
         _loc3_ = _loc3_ + 1;
      }
      this.playerPostionMC._x = this.safeRight - _loc4_;
   }
   function _positionLowerThird()
   {
      this.lowerThirdMC._x = this.safeLeft;
      this.lowerThirdMC._y = this.safeBottom - (this.lowerThirdMC.titleMC._height + this.lowerThirdMC.liveMC._height);
      this.lowerThirdMC.logoMC._x = this.safeRight - this.safeLeft - this.lowerThirdMC.logoMC._width / 2;
      this.feedTicker.updateWidth(this.lowerThirdMC.logoMC._x);
      this.jobTicker.updateWidth(this.lowerThirdMC.logoMC._x);
   }
   function _howWide(target)
   {
      return target._x + target._width;
   }
}

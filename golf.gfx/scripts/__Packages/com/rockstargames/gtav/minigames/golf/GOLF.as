class com.rockstargames.gtav.minigames.golf.GOLF extends com.rockstargames.ui.core.BaseScreenLayout
{
   var CONTENT;
   var coursePar;
   var displayBM;
   var holeDisplay;
   var playerCard;
   var playerCardSlots;
   var ref;
   var scoreboard;
   var scoreboardSlots;
   var swingDisplay;
   var swingMeter;
   var SHOW_HOLE_DISPLAY = 0;
   var SHOW_SWING_DISPLAY = 1;
   var SHOW_SWING_METER = 2;
   var SHOW_PLAYERCARD = 3;
   var SHOW_SCOREBOARD = 4;
   var SD_LIE = 0;
   var SD_WIND = 1;
   var SD_CLUB = 2;
   var SD_SWING = 3;
   var SD_SPIN = 4;
   var SD_SHOT = 5;
   var SBBM_HIGHLIGHT = 0;
   var SBBM_MP = 1;
   var SBBM_CREWTAG = 2;
   var SBBM_READY = 3;
   var SBBM_HIDE_BALL = 4;
   var SBBM_HOLE1 = 6;
   var SBBM_HOLE2 = 8;
   var SBBM_HOLE3 = 10;
   var SBBM_HOLE4 = 12;
   var SBBM_HOLE5 = 14;
   var SBBM_HOLE6 = 16;
   var SBBM_HOLE7 = 18;
   var SBBM_HOLE8 = 20;
   var SBBM_HOLE9 = 22;
   var SBBM_HEADSET = 24;
   var maxPlayerCardNameWidth = 0;
   var defaultPlayerCardNameWidth = 288;
   var _spinning = true;
   var _spinDirection = 0;
   var _spinPower = 0;
   var _spinScaleTarget = 0;
   function GOLF()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      _global.gfxExtensions = true;
      this.CONTENT.ref = this;
      this.holeDisplay = this.CONTENT.attachMovie("HoleDisplay","holeDisplay",this.CONTENT.getNextHighestDepth());
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.holeDisplay.frameMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG);
      this.swingDisplay = this.CONTENT.attachMovie("SwingDisplay","swingDisplay",this.CONTENT.getNextHighestDepth());
      this.swingDisplay.lieMC._visible = false;
      this.swingDisplay.spinMC._visible = false;
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.swingDisplay.clubBGMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.swingDisplay.windBGMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.swingDisplay.ballBGMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.swingDisplay.shotBGMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.swingDisplay.swingBGMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG);
      this.swingMeter = com.rockstargames.gtav.minigames.components.SwingMeter(this.CONTENT.attachMovie("SwingMeter","swingMeter",this.CONTENT.getNextHighestDepth()));
      this.positionToScreenLayout(this.swingMeter,"CC");
      this.playerCardSlots = [];
      this.playerCard = this.CONTENT.attachMovie("PlayerCard","playerCard",this.CONTENT.getNextHighestDepth());
      this.coursePar = [];
      this.scoreboardSlots = [];
      this.scoreboard = this.CONTENT.attachMovie("Scoreboard","scoreboard",this.CONTENT.getNextHighestDepth());
      this.scoreboard.keyMC.holeInOneMC.gotoAndStop("holeInOneOutline");
      this.scoreboard.keyMC.holeInOneMC._width = this.scoreboard.keyMC.holeInOneMC._height = 16;
      this.scoreboard.keyMC.underParMC.gotoAndStop("underParOutline");
      this.scoreboard.keyMC.underParMC._width = this.scoreboard.keyMC.underParMC._height = 14;
      this.scoreboard.keyMC.overParMC.gotoAndStop("overParOutline");
      this.scoreboard.keyMC.overParMC._width = this.scoreboard.keyMC.overParMC._height = 14;
      this.scoreboard.keyMC.holeInOneTF.autoSize = "left";
      this.scoreboard.keyMC.underParTF.autoSize = "left";
      this.scoreboard.keyMC.overParTF.autoSize = "left";
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.scoreboard.keyMC.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.scoreboard.headerBGMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.scoreboard.holeAndParBGMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG);
      this.SET_DISPLAY(com.rockstargames.ui.utils.BitMonger.BIT(this.SHOW_SWING_METER));
      this.initScreenLayout();
   }
   function initScreenLayout()
   {
      this.swingMeter.screenWidth = this.safeRight - this.safeLeft;
      this.swingMeter.screenHeight = this.safeBottom - this.safeLeft;
      this.positionToScreenLayout(this.holeDisplay,"LB",true);
      this.swingDisplay._x = this.safeRight - 179;
      this.swingDisplay._y = this.safeTop;
      this.positionToScreenLayout(this.playerCard,"LT",true);
      var _loc2_ = this.safeRight - this.safeLeft;
      this.scoreboard._xscale = 100;
      if(_loc2_ <= this.scoreboard._width)
      {
         this.scoreboard._width = _loc2_;
      }
      this.scoreboard._x = Math.round((this.FILE_WIDTH - this.scoreboard._width) / 2);
      this.scoreboard._y = 190;
   }
   function SET_DISPLAY_CONFIG(_screenWidthPixels, _screenHeightPixels, _safeTopPercent, _safeBottomPercent, _safeLeftPercent, _safeRightPercent, _isWideScreen, _isHiDef, _isAsian)
   {
      this.isWideScreen = _isWideScreen;
      this.isHiDef = _isHiDef;
      var _loc3_ = 0;
      var _loc2_ = 0;
      var _loc10_;
      var _loc9_;
      var _loc4_;
      var _loc7_;
      if(!_isWideScreen)
      {
         Stage.scaleMode = "noBorder";
         _loc10_ = 1.7777777777777777;
         _loc9_ = 1.3333333333333333;
         _loc4_ = 1280;
         _loc7_ = 720;
         _loc2_ = 0;
         _screenWidthPixels = _loc4_ - _loc3_ * 2;
         _screenHeightPixels = _loc7_ - _loc2_ * 2;
      }
      this.safeTop = _loc2_ + Math.round(_safeTopPercent * 100 * (_screenHeightPixels / 100));
      this.safeBottom = _loc2_ + Math.round(_safeBottomPercent * 100 * (_screenHeightPixels / 100));
      this.safeLeft = _loc3_ + Math.round(_safeLeftPercent * 100 * (_screenWidthPixels / 100));
      this.safeRight = _loc3_ + Math.round(_safeRightPercent * 100 * (_screenWidthPixels / 100));
      this.initScreenLayout();
   }
   function SET_DISPLAY(state)
   {
      this.displayBM = new com.rockstargames.ui.utils.BitMonger(state);
      this.holeDisplay._visible = this.displayBM.isBitSet(this.SHOW_HOLE_DISPLAY);
      this.swingDisplay._visible = this.displayBM.isBitSet(this.SHOW_SWING_DISPLAY);
      this.playerCard._visible = this.displayBM.isBitSet(this.SHOW_PLAYERCARD);
      this.scoreboard._visible = this.displayBM.isBitSet(this.SHOW_SCOREBOARD);
   }
   function SET_HOLE_DISPLAY(hole, par, dist)
   {
      this.holeDisplay.holeTF.text = hole;
      this.holeDisplay.parTF.text = par;
      this.holeDisplay.distTF.text = dist;
      this.initScreenLayout();
   }
   function SET_SWING_DISPLAY(state, lie, lieEnum, wind, windDirection, club, clubEnum, swing, swingChangable, spin, spinPower, spinDirection, shotStr)
   {
      var _loc2_ = new com.rockstargames.ui.utils.BitMonger(state);
      if(_loc2_.isBitSet(this.SD_LIE) || _loc2_.isBitSet(this.SD_SPIN))
      {
         this.swingDisplay.ballTitleTF._visible = true;
         this.swingDisplay.ballTitleBGMC._visible = true;
         this.swingDisplay.ballMC._visible = true;
         this.swingDisplay.ballBGMC._visible = true;
      }
      else
      {
         this.swingDisplay.ballTitleTF._visible = false;
         this.swingDisplay.ballTitleBGMC._visible = false;
         this.swingDisplay.ballMC._visible = false;
         this.swingDisplay.ballBGMC._visible = false;
      }
      if(_loc2_.isBitSet(this.SD_LIE))
      {
         this.swingDisplay.ballTitleTF.textAutoSize = "shrink";
         this.swingDisplay.ballTitleTF.text = lie;
         this.swingDisplay.lieMC.gotoAndStop(lieEnum);
         this.swingDisplay.lieMC._visible = true;
      }
      else
      {
         this.swingDisplay.lieMC._visible = false;
      }
      if(_loc2_.isBitSet(this.SD_WIND))
      {
         this.swingDisplay.windTF.textAutoSize = "shrink";
         this.swingDisplay.windTF.text = wind;
         this.swingDisplay.windMC._xscale = 110;
         this.swingDisplay.windMC._yscale = 80;
         this.swingDisplay.windMC.windArrow._rotation = windDirection;
         this.swingDisplay.windTF._visible = true;
         this.swingDisplay.windMC._visible = true;
         this.swingDisplay.windBGMC._visible = true;
      }
      else
      {
         this.swingDisplay.windTF._visible = false;
         this.swingDisplay.windMC._visible = false;
         this.swingDisplay.windBGMC._visible = false;
      }
      if(_loc2_.isBitSet(this.SD_CLUB))
      {
         this.swingDisplay.clubTF.textAutoSize = "shrink";
         this.swingDisplay.clubTF.text = club;
         this.swingDisplay.clubMC.gotoAndStop(clubEnum + 1);
         this.swingDisplay.clubTF._visible = true;
         this.swingDisplay.clubMC._visible = true;
         this.swingDisplay.clubBGMC._visible = true;
      }
      else
      {
         this.swingDisplay.clubTF._visible = false;
         this.swingDisplay.clubMC._visible = false;
         this.swingDisplay.clubBGMC._visible = false;
      }
      if(_loc2_.isBitSet(this.SD_SWING))
      {
         this.swingDisplay.swingTF.textAutoSize = "shrink";
         this.swingDisplay.swingTF.text = swing;
         this.swingDisplay.swingTF._visible = true;
         this.swingDisplay.swingArrowsMC._visible = swingChangable;
         this.swingDisplay.swingBGMC._visible = true;
      }
      else
      {
         this.swingDisplay.swingTF._visible = false;
         this.swingDisplay.swingArrowsMC._visible = false;
         this.swingDisplay.swingBGMC._visible = false;
      }
      if(_loc2_.isBitSet(this.SD_SPIN))
      {
         this._spinDirection = Math.round(spinDirection);
         this._spinPower = Math.round(spinPower);
         this._spinScaleTarget = this._spinPower / 2 + 50;
         this.swingDisplay.ballTitleTF.textAutoSize = "shrink";
         this.swingDisplay.ballTitleTF.text = spin;
         this.swingDisplay.ballMC._alpha = 50;
         this.swingDisplay.spinMC._visible = true;
         this.swingDisplay.spinGradMC._visible = true;
         if(this.CONTENT.onEnterFrame == undefined)
         {
            this.CONTENT.onEnterFrame = this._contentEnterFrame;
         }
      }
      else
      {
         this._spinning = false;
         this.swingDisplay.ballMC._alpha = 100;
         this.swingDisplay.spinMC._visible = false;
         this.swingDisplay.spinGradMC._visible = false;
         this.CONTENT.onEnterFrame = undefined;
      }
      if(_loc2_.isBitSet(this.SD_SHOT))
      {
         this.swingDisplay.shotBGMC._visible = true;
         this.swingDisplay.shotTF._visible = true;
         this.swingDisplay.shotTF.textAutoSize = "shrink";
         this.swingDisplay.shotTF.text = shotStr;
      }
      else
      {
         this.swingDisplay.shotBGMC._visible = false;
         this.swingDisplay.shotTF._visible = false;
      }
      this.initScreenLayout();
   }
   function _contentEnterFrame()
   {
      this.ref._spinDisplay();
   }
   function _spinDisplay()
   {
      var _loc2_ = this.swingDisplay.spinMC;
      var _loc4_ = this.swingDisplay.spinGradMC;
      var _loc3_;
      if(this._spinning)
      {
         _loc3_ = this._spinDirection + 180 - _loc2_._rotation;
         _loc3_ += (_loc3_ >= 0 ? (_loc3_ <= 360 ? 0 : -360) : 360) - 180;
         _loc2_._rotation += _loc3_ / 10;
         if(_loc2_._rotation < this._spinDirection + 1 && _loc2_._rotation > this._spinDirection - 1)
         {
            _loc2_._rotation = this._spinDirection;
         }
         _loc2_._xscale -= (_loc2_._xscale - this._spinScaleTarget) / 10;
         if(_loc2_._xscale < this._spinScaleTarget + 1 && _loc2_._xscale > this._spinScaleTarget - 1)
         {
            _loc2_._xscale = this._spinScaleTarget;
         }
         _loc2_._yscale = _loc2_._xscale;
      }
      else
      {
         _loc2_._rotation = this._spinDirection;
         _loc2_._xscale = _loc2_._yscale = this._spinScaleTarget;
         this._spinning = true;
      }
      var _loc5_;
      if(this._spinPower > 0)
      {
         _loc5_ = Math.round(this._spinPower / 250 * _loc2_._totalframes);
         _loc2_.gotoAndStop((_loc2_._currentframe + _loc5_) % _loc2_._totalframes + 1);
         _loc4_._alpha = _loc2_._xscale;
      }
      else
      {
         _loc2_.stop();
         if(_loc4_._alpha > 0)
         {
            _loc4_._alpha -= _loc4_._alpha / 10;
         }
      }
   }
   function SET_PLAYERCARD_SLOT(id, state, name, crewTag, txd, txn, ballColor, score, scoreColor)
   {
      var _loc2_ = this.playerCard["p" + id];
      var _loc4_ = new com.rockstargames.ui.utils.BitMonger(state);
      if(_loc2_ == undefined)
      {
         _loc2_ = this.playerCard.attachMovie("PlayerCardSlot","p" + id,this.playerCard.getNextHighestDepth(),{_y:id * 27});
         _loc2_.nameMC.MPNameTF.autoSize = true;
         _loc2_.nameMC.nameTF.autoSize = true;
         this.playerCardSlots[id] = _loc2_;
      }
      _loc2_.bm = _loc4_;
      _loc2_.nameMC.nameTF._width = _loc2_.nameMC.MPNameTF._width = 10;
      if(_loc4_.isBitSet(this.SBBM_MP))
      {
         _loc2_.nameMC.MPNameTF.text = name;
         _loc2_.nameMC.MPNameTF._visible = true;
         _loc2_.nameMC.nameTF._visible = false;
      }
      else
      {
         _loc2_.nameMC.nameTF.text = name;
         _loc2_.nameMC.MPNameTF._visible = false;
         _loc2_.nameMC.nameTF._visible = true;
      }
      var _loc5_ = _loc2_.crewTagMC;
      if(_loc4_.isBitSet(this.SBBM_CREWTAG) && crewTag != "" && crewTag != undefined)
      {
         if(!_loc5_)
         {
            _loc5_ = com.rockstargames.gtav.Multiplayer.CREW_TAG_MOVIECLIP(_loc2_.attachMovie("CREW_TAG_MOVIECLIP","crewTagMC",_loc2_.getNextHighestDepth(),{_y:3,_xscale:80,_yscale:80}));
         }
         else
         {
            _loc5_._visible = true;
         }
         _loc5_._x = _loc2_.nameMC._x + _loc2_.nameMC._width + 7;
         _loc5_.UNPACK_CREW_TAG(crewTag);
      }
      else
      {
         _loc5_._visible = false;
      }
      this.SET_PLAYERCARD_HEADSET(id,_loc4_.unpackInt(this.SBBM_HEADSET,2));
      if(_loc4_.isBitSet(this.SBBM_HIDE_BALL))
      {
         _loc2_.ballMC._visible = false;
      }
      else
      {
         _loc2_.ballMC._visible = true;
      }
      var _loc3_ = _loc2_.imgLdr;
      if(_loc3_ == undefined)
      {
         _loc3_ = com.rockstargames.ui.media.ImageLoaderMC(_loc2_.attachMovie("GenericImageLoader","imgLdr",_loc2_.getNextHighestDepth(),{}));
      }
      if(_loc3_.textureDict != txd && _loc3_.textureFilename != txn)
      {
         if(_loc3_.isLoaded)
         {
            _loc3_.removeTxdRef();
         }
         _loc3_.init("GOLF",txd,txn,25,25);
         _loc3_.addTxdRef(String(_loc3_));
      }
      var _loc7_ = _loc2_.cellMC;
      _loc7_.labelMC.labelTF.text = score;
      if(_loc4_.isBitSet(this.SBBM_HIGHLIGHT))
      {
         _loc2_.currentPlayerMC._visible = true;
         com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc2_.nameMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
         com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc2_.headsetMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
         com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc2_.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      }
      else
      {
         _loc2_.currentPlayerMC._visible = false;
         com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc2_.nameMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
         com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc2_.headsetMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
         com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc2_.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG);
      }
      com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc2_.ballMC,ballColor);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc2_.currentPlayerMC,scoreColor);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc7_.bgMC,scoreColor);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc7_.labelMC,scoreColor != com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK ? com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK : com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      this.updatePlayerCardDisplay();
   }
   function SET_PLAYERCARD_HEADSET(id, headsetEnum)
   {
      var _loc2_ = this.playerCard["p" + id];
      _loc2_.headsetMC.gotoAndStop(headsetEnum + 1);
      var _loc3_ = this.scoreboard["s" + id];
      _loc3_.headsetMC.gotoAndStop(headsetEnum + 1);
   }
   function CLEAR_PLAYERCARD_SLOT(id)
   {
      var _loc2_ = this.playerCardSlots[id];
      this.playerCardSlots[id] = undefined;
      _loc2_.removeMovieClip();
      this.updatePlayerCardDisplay();
   }
   function updatePlayerCardDisplay()
   {
      var _loc2_ = this.playerCardSlots[0];
      var _loc4_;
      var _loc3_ = 0;
      this.maxPlayerCardNameWidth = 179 - _loc2_.cellMC._width;
      _loc3_;
      while(_loc3_ < this.playerCardSlots.length)
      {
         _loc2_ = this.playerCardSlots[_loc3_];
         if(_loc2_ != undefined && !_loc2_.bm.isBitSet(this.SBBM_MP) && _loc2_.nameMC._width > this.maxPlayerCardNameWidth)
         {
            this.maxPlayerCardNameWidth = Math.ceil(_loc2_.nameMC._width);
         }
         _loc3_ = _loc3_ + 1;
      }
      _loc3_ = 0;
      _loc3_;
      while(_loc3_ < this.playerCardSlots.length)
      {
         _loc2_ = this.playerCardSlots[_loc3_];
         if(_loc2_ != undefined)
         {
            _loc4_ = !_loc2_.bm.isBitSet(this.SBBM_MP) ? this.maxPlayerCardNameWidth : this.defaultPlayerCardNameWidth;
            _loc2_.bgMC._width = _loc4_;
            _loc2_.cellMC._x = _loc4_;
            _loc2_.ballMC._x = _loc4_ - 11;
            _loc2_.currentPlayerMC._x = _loc4_ + _loc2_.cellMC._width;
         }
         _loc3_ = _loc3_ + 1;
      }
      this.initScreenLayout();
   }
   function SET_SCOREBOARD_TITLE(title, holeLabel, parLabel, scoreLabel, holeInOne, underPar, overPar)
   {
      this.scoreboard.titleTF.text = title;
      if(holeLabel != undefined)
      {
         this.scoreboard.titleBarMC.holeTF.text = holeLabel;
      }
      if(parLabel != undefined)
      {
         this.scoreboard.titleBarMC.parTF.text = parLabel;
      }
      if(scoreLabel != undefined)
      {
         this.scoreboard.titleBarMC.scoreTF.text = scoreLabel;
      }
      if(holeInOne != undefined)
      {
         this.scoreboard.keyMC.holeInOneTF.text = holeInOne;
      }
      if(underPar != undefined)
      {
         this.scoreboard.keyMC.underParTF.text = underPar;
      }
      if(overPar != undefined)
      {
         this.scoreboard.keyMC.overParTF.text = overPar;
      }
      this.scoreboard.keyMC.overParTF._x = this.scoreboard.keyMC.overParMC._x - this.scoreboard.keyMC.overParTF._width - this.scoreboard.keyMC.overParMC._width / 2 - 6;
      this.scoreboard.keyMC.underParMC._x = this.scoreboard.keyMC.overParTF._x - this.scoreboard.keyMC.underParMC._width / 2 - 12;
      this.scoreboard.keyMC.underParTF._x = this.scoreboard.keyMC.underParMC._x - this.scoreboard.keyMC.underParTF._width - this.scoreboard.keyMC.underParMC._width / 2 - 6;
      this.scoreboard.keyMC.holeInOneMC._x = this.scoreboard.keyMC.underParTF._x - this.scoreboard.keyMC.holeInOneMC._width / 2 - 12;
      this.scoreboard.keyMC.holeInOneTF._x = this.scoreboard.keyMC.holeInOneMC._x - this.scoreboard.keyMC.holeInOneTF._width - this.scoreboard.keyMC.holeInOneMC._width / 2 - 6;
      var _loc3_ = 0;
      while(_loc3_ < 9)
      {
         if(arguments[_loc3_ + 7] != undefined)
         {
            this.scoreboard.titleBarMC["h" + _loc3_].text = arguments[_loc3_ + 7];
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function COURSE_PAR()
   {
      var _loc3_ = 0;
      while(_loc3_ < arguments.length)
      {
         this.coursePar[_loc3_] = arguments[_loc3_];
         this.scoreboard.titleBarMC["p" + _loc3_].text = arguments[_loc3_];
         _loc3_ = _loc3_ + 1;
      }
   }
   function SET_SCOREBOARD_SLOT(id, state, name, crewTag, readyStr, ballColor, score, scoreColor, c0, c1, c2, c3, c4, c5, c6, c7, c8)
   {
      var _loc3_ = this.scoreboard["s" + id];
      var _loc5_ = new com.rockstargames.ui.utils.BitMonger(state);
      if(_loc3_ == undefined)
      {
         _loc3_ = this.scoreboard.attachMovie("ScoreboardSlot","s" + id,this.scoreboard.getNextHighestDepth());
         _loc3_.nameMC.MPNameTF.autoSize = true;
         _loc3_.nameMC.nameTF.autoSize = true;
      }
      this.scoreboardSlots[id] = _loc3_;
      _loc3_.nameMC.nameTF._width = _loc3_.nameMC.MPNameTF._width = 10;
      if(_loc5_.isBitSet(this.SBBM_MP))
      {
         _loc3_.nameMC.MPNameTF.text = name;
         _loc3_.nameMC.MPNameTF._visible = true;
         _loc3_.nameMC.nameTF._visible = false;
      }
      else
      {
         _loc3_.nameMC.nameTF.text = name;
         _loc3_.nameMC.MPNameTF._visible = false;
         _loc3_.nameMC.nameTF._visible = true;
      }
      var _loc7_ = _loc3_.crewTagMC;
      if(_loc5_.isBitSet(this.SBBM_CREWTAG) && crewTag != "" && crewTag != undefined)
      {
         if(!_loc7_)
         {
            _loc7_ = com.rockstargames.gtav.Multiplayer.CREW_TAG_MOVIECLIP(_loc3_.attachMovie("CREW_TAG_MOVIECLIP","crewTagMC",_loc3_.getNextHighestDepth(),{_y:3,_xscale:80,_yscale:80}));
         }
         else
         {
            _loc7_._visible = true;
         }
         _loc7_._x = _loc3_.nameMC._x + _loc3_.nameMC._width + 8;
         _loc7_.UNPACK_CREW_TAG(crewTag);
      }
      else
      {
         _loc7_._visible = false;
      }
      if(_loc5_.isBitSet(this.SBBM_READY))
      {
         _loc3_.statusMC.labelMC.labelTF.autoSize = true;
         _loc3_.statusMC.labelMC.labelTF.text = readyStr;
         _loc3_.statusMC.bgMC._width = Math.round(_loc3_.statusMC.labelMC._width + 4);
         _loc3_.statusMC._x = 266 - _loc3_.statusMC._width;
         _loc3_.statusMC._visible = true;
      }
      else
      {
         _loc3_.statusMC._visible = false;
      }
      if(_loc5_.isBitSet(this.SBBM_HIDE_BALL))
      {
         _loc3_.ballMC._visible = false;
      }
      else
      {
         _loc3_.ballMC._visible = true;
      }
      var _loc8_ = arguments.slice(8);
      var _loc6_;
      var _loc4_ = 0;
      while(_loc4_ < 9)
      {
         _loc3_.cellsMC["c" + _loc4_].text = _loc8_[_loc4_];
         _loc6_ = _loc5_.unpackInt(this["SBBM_HOLE" + (_loc4_ + 1)],2);
         _loc3_.cellsMC["o" + _loc4_].gotoAndStop(_loc6_ + 1);
         _loc3_.cellsMC["o" + _loc4_]._alpha = 15;
         _loc4_ = _loc4_ + 1;
      }
      var _loc9_ = _loc3_.scoreMC.labelTF;
      _loc9_.text = score;
      var _loc10_ = _loc9_.getTextFormat();
      _loc10_.size = 12;
      _loc9_.setTextFormat(_loc9_.text.indexOf(" "),_loc9_.text.length,_loc10_);
      var _loc21_;
      var _loc24_;
      var _loc15_ = new com.rockstargames.ui.utils.HudColour();
      var _loc14_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(ballColor,_loc15_);
      com.rockstargames.ui.utils.Colour.setHudColour(scoreColor,_loc14_);
      if(_loc5_.isBitSet(this.SBBM_HIGHLIGHT))
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc3_.statusMC.labelMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
         com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc3_.statusMC.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
         _loc3_.statusMC._alpha = 90;
         com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc3_.nameMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
         com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc3_.cellsMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
         com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc3_.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      }
      else
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc3_.statusMC.labelMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
         com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc3_.statusMC.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
         _loc3_.statusMC._alpha = 50;
         com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc3_.nameMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
         com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc3_.cellsMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
         com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc3_.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG);
         _loc3_.bgMC._alpha -= 20;
      }
      com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc3_.ballMC,ballColor);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc3_.scoreBG,scoreColor);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc3_.gridMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc3_.scoreMC,scoreColor != com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK ? com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK : com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      this.updateScoreboardDisplay();
   }
   function CLEAR_SCOREBOARD_SLOT(id)
   {
      var _loc2_ = this.scoreboard["s" + id];
      _loc2_.removeMovieClip();
      this.scoreboardSlots.splice(id,1);
      this.updateScoreboardDisplay();
   }
   function updateScoreboardDisplay()
   {
      var _loc3_;
      var _loc2_ = 0;
      while(_loc2_ < this.scoreboardSlots.length)
      {
         _loc3_ = this.scoreboard["s" + _loc2_];
         _loc3_._y = 125 + 25 * _loc2_;
         _loc2_ = _loc2_ + 1;
      }
      this.scoreboard.keyMC._y = 125 + 25 * this.scoreboardSlots.length;
      this.initScreenLayout();
   }
   function ADD_TXD_REF_RESPONSE(txd, strRef, success)
   {
      var il = com.rockstargames.ui.media.ImageLoaderMC(eval(strRef));
      il.displayTxdResponse(txd);
   }
   function SWING_METER_SET_MARKER(hVisible, hPosition, vVisibile, vPosition)
   {
      this.swingMeter.setMarker(hVisible,hPosition,vVisibile,vPosition);
   }
   function SWING_METER_SET_APEX_MARKER(hVisible, hPosition, vVisibile, vPosition)
   {
      this.swingMeter.setApexMarker(hVisible,hPosition,vVisibile,vPosition);
   }
   function SWING_METER_SET_TARGET(span, position)
   {
      this.swingMeter.setTarget(span,position);
   }
   function SWING_METER_SET_TARGET_COLOR(r, g, b, a)
   {
      this.swingMeter.setTargetColor(r,g,b,a);
   }
   function SWING_METER_SET_FILL(span, state, fromTop)
   {
      this.swingMeter.setFill(span,state,fromTop);
   }
   function SWING_METER_POSITION(x, y, center)
   {
      this.swingMeter.setPosition(x,y,center);
   }
   function SWING_METER_SCALE(w, h)
   {
      this.swingMeter.setScale(w,h);
   }
   function SWING_METER_IS_TRANSITIOING()
   {
      return this.swingMeter.isTransitioing();
   }
   function SWING_METER_TRANSITION_IN()
   {
      this.swingMeter.transitionIn();
   }
   function SWING_METER_TRANSITION_OUT(duration)
   {
      this.swingMeter.transitionOut(duration);
   }
}

class com.rockstargames.gtav.minigames.tennis.PlayerCard extends MovieClip
{
   var blackBGColor;
   var blackColor;
   var p0;
   var p1;
   var tennisColor;
   var titleCellsMC;
   var whiteColor;
   var maxCellCount = 0;
   var maxPlayerCardNameWidth = 0;
   function PlayerCard()
   {
      super();
      this.tennisColor = new com.rockstargames.ui.utils.HudColour();
      this.whiteColor = new com.rockstargames.ui.utils.HudColour();
      this.blackColor = new com.rockstargames.ui.utils.HudColour();
      this.blackBGColor = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_TENNIS,this.tennisColor);
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,this.whiteColor);
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK,this.blackColor);
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG,this.blackBGColor);
      var _loc4_;
      var _loc3_ = 0;
      while(_loc3_ < 2)
      {
         _loc4_ = this["p" + _loc3_];
         com.rockstargames.ui.utils.Colour.Colourise(_loc4_.nameMC,this.whiteColor.r,this.whiteColor.g,this.whiteColor.b,this.whiteColor.a);
         com.rockstargames.ui.utils.Colour.Colourise(_loc4_.currentPlayerMC,this.whiteColor.r,this.whiteColor.g,this.whiteColor.b,this.whiteColor.a);
         com.rockstargames.ui.utils.Colour.Colourise(_loc4_.bgMC,this.blackBGColor.r,this.blackBGColor.g,this.blackBGColor.b,this.blackBGColor.a);
         _loc3_ = _loc3_ + 1;
      }
   }
   function SET_PLAYERCARD_TITLE(column0)
   {
      if(this.maxCellCount < arguments.length)
      {
         this.maxCellCount = arguments.length - 1;
      }
      if(this.titleCellsMC == undefined)
      {
         this.titleCellsMC = this.createEmptyMovieClip("titleCellsMC",this.getNextHighestDepth());
      }
      this.titleCellsMC._y = 54;
      var _loc3_;
      var _loc6_ = arguments.length;
      var _loc5_;
      var _loc4_ = this.maxCellCount <= _loc6_ ? _loc6_ : this.maxCellCount;
      while(_loc4_ >= 0)
      {
         _loc3_ = this.titleCellsMC["c" + _loc4_];
         if(_loc4_ < _loc6_)
         {
            if(_loc3_ == undefined)
            {
               _loc3_ = this.titleCellsMC.attachMovie("PlayerCardTitleCell","c" + _loc4_,this.titleCellsMC.getNextHighestDepth(),{_x:_loc4_ * 37});
               com.rockstargames.ui.utils.Colour.Colourise(_loc3_.bgMC,this.blackColor.r,this.blackColor.g,this.blackColor.b,this.blackColor.a);
               com.rockstargames.ui.utils.Colour.Colourise(_loc3_.labelMC,this.whiteColor.r,this.whiteColor.g,this.whiteColor.b,this.whiteColor.a);
            }
            _loc5_ = arguments[_loc4_];
            if(_loc5_ != undefined || _loc5_ != "")
            {
               _loc3_._visible = true;
               _loc3_.labelMC.labelTF.text = _loc5_;
            }
            else
            {
               _loc3_._visible = false;
            }
         }
         else if(_loc3_ != undefined)
         {
            _loc3_.removeMovieClip();
         }
         _loc4_ = _loc4_ - 1;
      }
      this.maxCellCount = _loc6_;
      this.updatePlayerCardDisplay();
   }
   function SET_PLAYERCARD_SLOT(id, isMP, name, crewTag, isSelected, txd, txn, column0)
   {
      var _loc5_ = this["p" + id];
      var _loc11_ = _loc5_.nameMC;
      var _loc14_ = !isMP ? _loc11_.nameTF : _loc11_.MPNameTF;
      _loc11_.nameTF._visible = !isMP;
      _loc11_.MPNameTF._visible = isMP;
      _loc11_.MPNameTF._width = 5;
      _loc11_.nameTF._width = 5;
      _loc14_.autoSize = "left";
      _loc14_.text = name;
      var _loc12_ = _loc5_.crewTagMC;
      if(crewTag != "" && crewTag != undefined)
      {
         if(_loc12_ == undefined)
         {
            _loc12_ = com.rockstargames.gtav.Multiplayer.CREW_TAG_MOVIECLIP(_loc5_.attachMovie("CREW_TAG_MOVIECLIP","crewTagMC",_loc5_.getNextHighestDepth(),{_x:_loc5_.nameMC._x + _loc5_.nameMC._width + 6,_y:3.5,_xscale:80,_yscale:80}));
         }
         _loc12_.UNPACK_CREW_TAG(crewTag);
      }
      else
      {
         _loc12_.removeMovieClip();
         false;
      }
      if(isSelected)
      {
         _loc5_.currentPlayerMC._visible = true;
         _loc5_.ballMC._visible = true;
         com.rockstargames.ui.utils.Colour.Colourise(_loc5_.ballMC,248,242,24,100);
         com.rockstargames.ui.utils.Colour.Colourise(_loc5_.nameMC,this.blackColor.r,this.blackColor.g,this.blackColor.b,this.blackColor.a);
         com.rockstargames.ui.utils.Colour.Colourise(_loc5_.headsetMC,this.blackColor.r,this.blackColor.g,this.blackColor.b,this.blackColor.a);
         com.rockstargames.ui.utils.Colour.Colourise(_loc5_.bgMC,this.whiteColor.r,this.whiteColor.g,this.whiteColor.b,this.whiteColor.a);
         com.rockstargames.ui.utils.Colour.Colourise(_loc5_.currentPlayerMC,this.tennisColor.r,this.tennisColor.g,this.tennisColor.b,this.tennisColor.a);
      }
      else
      {
         _loc5_.currentPlayerMC._visible = false;
         _loc5_.ballMC._visible = false;
         com.rockstargames.ui.utils.Colour.Colourise(_loc5_.nameMC,this.whiteColor.r,this.whiteColor.g,this.whiteColor.b,this.whiteColor.a);
         com.rockstargames.ui.utils.Colour.Colourise(_loc5_.headsetMC,this.whiteColor.r,this.whiteColor.g,this.whiteColor.b,this.whiteColor.a);
         com.rockstargames.ui.utils.Colour.Colourise(_loc5_.bgMC,this.blackBGColor.r,this.blackBGColor.g,this.blackBGColor.b,this.blackBGColor.a);
      }
      var _loc10_ = _loc5_.imgLdr;
      if(_loc10_ == undefined)
      {
         _loc10_ = com.rockstargames.ui.media.ImageLoaderMC(_loc5_.attachMovie("GenericImageLoader","imgLdr",_loc5_.getNextHighestDepth(),{}));
         _loc5_.outlineMC.swapDepth(_loc5_.getNextHighestDepth());
      }
      if(_loc10_.textureDict != txd && _loc10_.textureFilename != txn)
      {
         if(_loc10_.isLoaded)
         {
            _loc10_.removeTxdRef();
         }
         _loc10_.init("TENNIS",txd,txn,25,25);
         _loc10_.addTxdRef(String(_loc10_));
      }
      var _loc7_ = _loc5_.cellContainer;
      if(_loc7_ == undefined)
      {
         _loc7_ = _loc5_.createEmptyMovieClip("cellContainer",_loc5_.getNextHighestDepth());
      }
      _loc7_._x = 288;
      var _loc3_;
      var _loc8_ = arguments.length - 7;
      var _loc4_ = this.maxCellCount <= _loc8_ ? _loc8_ : this.maxCellCount;
      var _loc6_;
      while(_loc4_ >= 0)
      {
         _loc3_ = _loc7_["c" + _loc4_];
         if(_loc4_ < this.maxCellCount)
         {
            if(_loc3_ == undefined)
            {
               _loc3_ = _loc7_.attachMovie("PlayerCardCell","c" + _loc4_,_loc7_.getNextHighestDepth(),{_x:_loc4_ * 37});
               com.rockstargames.ui.utils.Colour.Colourise(_loc3_.bgMC,this.tennisColor.r,this.tennisColor.g,this.tennisColor.b,this.tennisColor.a);
               com.rockstargames.ui.utils.Colour.Colourise(_loc3_.blackBGMC,this.blackColor.r,this.blackColor.g,this.blackColor.b,this.blackColor.a);
               com.rockstargames.ui.utils.Colour.Colourise(_loc3_.labelMC,this.whiteColor.r,this.whiteColor.g,this.whiteColor.b,this.whiteColor.a);
            }
            if(isSelected)
            {
               _loc3_.bgMC._alpha = 100;
               _loc3_.blackBGMC._visible = false;
            }
            else
            {
               _loc3_.bgMC._alpha = 50;
               _loc3_.blackBGMC._visible = true;
            }
            _loc6_ = arguments[_loc4_ + 7];
            _loc3_.labelMC.labelTF.text = _loc6_ == undefined ? "" : _loc6_;
         }
         else if(_loc3_ != undefined)
         {
            _loc3_.removeMovieClip();
         }
         _loc4_ = _loc4_ - 1;
      }
      this.updatePlayerCardDisplay();
   }
   function SET_PLAYERCARD_HEADSET(id, headsetEnum)
   {
      var _loc2_ = this["p" + id];
      _loc2_.headsetMC.gotoAndStop(headsetEnum + 1);
   }
   function updatePlayerCardDisplay()
   {
      var _loc2_;
      if(this.p0.nameMC.nameTF._visible || this.p0.nameMC.nameTF._visible)
      {
         this.maxPlayerCardNameWidth = Math.ceil(this.p0.nameMC._width <= this.p1.nameMC._width ? this.p1.nameMC._width : this.p0.nameMC._width);
         this.p0.bgMC._width = this.p1.bgMC._width = this.maxPlayerCardNameWidth + 25 + 45;
      }
      else
      {
         this.p0.bgMC._width = this.p1.bgMC._width = 288;
      }
      this.p0.ballMC._x = this.p1.ballMC._x = this.p0.bgMC._width - 11;
      this.p0.cellContainer._x = this.p1.cellContainer._x = this.p0.bgMC._width;
      this.p0.currentPlayerMC._x = this.p1.currentPlayerMC._x = this.p0.cellContainer._x + this.p0.cellContainer._width;
      this.titleCellsMC._x = this.p0.bgMC._width;
   }
   function ADD_TXD_REF_RESPONSE(txd, strRef, success)
   {
      var il = com.rockstargames.ui.media.ImageLoaderMC(eval(strRef));
      il.displayTxdResponse(txd);
   }
}

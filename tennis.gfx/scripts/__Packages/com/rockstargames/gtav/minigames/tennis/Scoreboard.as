class com.rockstargames.gtav.minigames.tennis.Scoreboard extends MovieClip
{
   var tennisColor;
   var whiteColor;
   var blackColor;
   var bgColor;
   var logoMC;
   var titleCellsMC;
   var titleTF;
   var highlightedCells;
   var bgMC;
   var p0;
   var p1;
   var curCellCount = 0;
   var maxCellCount = 0;
   function Scoreboard()
   {
      super();
      _global.gfxExtensions = true;
      this.tennisColor = new com.rockstargames.ui.utils.HudColour();
      this.whiteColor = new com.rockstargames.ui.utils.HudColour();
      this.blackColor = new com.rockstargames.ui.utils.HudColour();
      this.bgColor = new com.rockstargames.ui.utils.HudColour();
      var _loc6_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_TENNIS,this.tennisColor);
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,this.whiteColor);
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK,this.blackColor);
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG,this.bgColor);
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_YELLOW,_loc6_);
      com.rockstargames.ui.utils.Colour.Colourise(this.logoMC,this.tennisColor.r,this.tennisColor.g,this.tennisColor.b,this.tennisColor.a);
      com.rockstargames.ui.utils.Colour.Colourise(this.titleCellsMC.ruleMC,this.whiteColor.r,this.whiteColor.g,this.whiteColor.b,this.whiteColor.a);
      var _loc5_ = undefined;
      var _loc4_ = 0;
      while(_loc4_ < 2)
      {
         _loc5_ = this["p" + _loc4_];
         com.rockstargames.ui.utils.Colour.Colourise(_loc5_.nameMC,this.whiteColor.r,this.whiteColor.g,this.whiteColor.b,this.whiteColor.a);
         com.rockstargames.ui.utils.Colour.Colourise(_loc5_.bgMC,this.blackColor.r,this.blackColor.g,this.blackColor.b,this.blackColor.a);
         _loc4_ = _loc4_ + 1;
      }
   }
   function SET_SCOREBOARD_TITLE(title, column0)
   {
      this.titleTF.text = title;
      this.highlightedCells = [];
      this.curCellCount = arguments.length - 1;
      if(this.maxCellCount < this.curCellCount)
      {
         this.maxCellCount = this.curCellCount;
      }
      var _loc3_ = undefined;
      var _loc5_ = undefined;
      var _loc4_ = 0;
      while(_loc4_ < this.maxCellCount)
      {
         _loc3_ = this.titleCellsMC["c" + _loc4_];
         if(_loc4_ < this.curCellCount)
         {
            if(_loc3_ == undefined)
            {
               _loc3_ = this.titleCellsMC.attachMovie("ScoreboardCell","c" + _loc4_,this.titleCellsMC.getNextHighestDepth(),{_x:_loc4_ * 55});
               com.rockstargames.ui.utils.Colour.Colourise(_loc3_.bgMC,this.tennisColor.r,this.tennisColor.g,this.tennisColor.b,this.tennisColor.a);
               com.rockstargames.ui.utils.Colour.Colourise(_loc3_.labelMC,this.blackColor.r,this.blackColor.g,this.blackColor.b,this.blackColor.a);
               this.titleCellsMC.ruleMC.swapDepths(_loc3_);
            }
            _loc5_ = arguments[_loc4_ + 1];
            if(_loc5_ != undefined && _loc5_ != "")
            {
               if(isNaN(Number(_loc5_)))
               {
                  var _loc6_ = new TextFormat();
                  _loc6_.size = 12;
                  _loc3_.labelMC.labelTF.setNewTextFormat(_loc6_);
                  _loc3_.labelMC.labelTF._y = 5;
                  this.highlightedCells.push(_loc4_);
               }
               _loc3_._visible = true;
               _loc3_.labelMC.labelTF.textAutoSize = "shrink";
               _loc3_.labelMC.labelTF.text = _loc5_;
            }
            else
            {
               _loc3_._visible = false;
            }
         }
         else
         {
            _loc3_.removeMovieClip();
         }
         _loc4_ = _loc4_ + 1;
      }
      this.titleCellsMC.ruleMC._width = this.curCellCount * 55;
      this.bgMC._width = this.titleCellsMC._x + this.titleCellsMC._width;
      this.logoMC._x = this.bgMC._width - this.logoMC._width - 8;
      this.p0.bgMC._width = this.p1.bgMC._width = this.bgMC._width;
   }
   function SET_SCOREBOARD_SLOT(id, isMP, name, crewTag, isSelected, column0)
   {
      var _loc8_ = this["p" + id];
      var _loc9_ = _loc8_.nameMC;
      var _loc12_ = !isMP ? _loc9_.nameTF : _loc9_.MPnameTF;
      _loc9_.nameTF._visible = !isMP;
      _loc9_.MPnameTF._visible = isMP;
      _loc12_._width = 20;
      _loc12_.autoSize = true;
      _loc12_.text = name;
      var _loc10_ = _loc8_.crewTagMC;
      if(crewTag != "" && crewTag != undefined)
      {
         if(_loc10_ == undefined)
         {
            _loc10_ = com.rockstargames.gtav.Multiplayer.CREW_TAG_MOVIECLIP(_loc8_.attachMovie("CREW_TAG_MOVIECLIP","crewTagMC",this.getNextHighestDepth(),{_x:_loc9_._x + _loc12_._width + 5,_y:4,_xscale:80,_yscale:80}));
         }
         _loc10_.UNPACK_CREW_TAG(crewTag);
      }
      else
      {
         _loc10_.removeMovieClip();
         false;
      }
      if(isSelected)
      {
         com.rockstargames.ui.utils.Colour.Colourise(_loc8_.nameMC,this.blackColor.r,this.blackColor.g,this.blackColor.b,this.blackColor.a);
         com.rockstargames.ui.utils.Colour.Colourise(_loc8_.bgMC,this.whiteColor.r,this.whiteColor.g,this.whiteColor.b,this.whiteColor.a);
      }
      else
      {
         com.rockstargames.ui.utils.Colour.Colourise(_loc8_.nameMC,this.whiteColor.r,this.whiteColor.g,this.whiteColor.b,this.whiteColor.a);
         com.rockstargames.ui.utils.Colour.Colourise(_loc8_.bgMC,this.bgColor.r,this.bgColor.g,this.bgColor.b,50);
      }
      var _loc6_ = _loc8_.cellsMC;
      _loc6_.ruleMC._visible = false;
      var _loc3_ = undefined;
      var _loc4_ = 0;
      while(_loc4_ < this.maxCellCount)
      {
         _loc3_ = _loc6_["c" + _loc4_];
         if(_loc4_ < this.curCellCount)
         {
            if(_loc3_ == undefined)
            {
               _loc3_ = _loc6_.attachMovie("ScoreboardCell","c" + _loc4_,_loc6_.getNextHighestDepth(),{_x:_loc4_ * 55});
            }
            _loc3_.bgMC._visible = false;
            com.rockstargames.ui.utils.Colour.Colourise(_loc3_.borderMC,this.blackColor.r,this.blackColor.g,this.blackColor.b,this.blackColor.a);
            if(isSelected)
            {
               com.rockstargames.ui.utils.Colour.Colourise(_loc3_.labelMC,this.blackColor.r,this.blackColor.g,this.blackColor.b,this.blackColor.a);
            }
            else
            {
               com.rockstargames.ui.utils.Colour.Colourise(_loc3_.labelMC,this.whiteColor.r,this.whiteColor.g,this.whiteColor.b,this.whiteColor.a);
               if(this.highlightedCells.toString().indexOf(_loc4_ + "") != -1)
               {
                  _loc3_.bgMC._visible = true;
                  com.rockstargames.ui.utils.Colour.Colourise(_loc3_.bgMC,this.tennisColor.r,this.tennisColor.g,this.tennisColor.b,50);
               }
            }
            var _loc5_ = arguments[_loc4_ + 5];
            _loc3_.labelMC.labelTF.text = _loc5_ == undefined ? "" : _loc5_;
         }
         else if(_loc3_ != undefined)
         {
            _loc3_.removeMovieClip();
         }
         _loc4_ = _loc4_ + 1;
      }
   }
}

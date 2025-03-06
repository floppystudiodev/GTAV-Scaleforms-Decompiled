class com.rockstargames.gtav.minigames.scleaderboard.SC_LEADERBOARD extends com.rockstargames.ui.core.BaseScreenLayout
{
   var slots;
   var scColor;
   var whiteColor;
   var blackColor;
   var blackAlphaColor;
   var leaderboard;
   var CONTENT;
   var columnCount;
   var cellXSpacing;
   static var SLOT_STATE_PLAIN = 0;
   static var SLOT_STATE_IS_PLAYER = 1;
   static var SLOT_STATE_OUTLINE = 2;
   static var SLOT_STATE_SELECTED = 3;
   static var SLOT_STATE_WORLD = 4;
   static var SLOT_STATE_FRIENDS = 5;
   static var SLOT_STATE_CREW = 6;
   static var SLOT_STATE_DESCRIPTION = 7;
   static var DISPLAY_TYPE_MINIGAME = 0;
   static var DISPLAY_TYPE_MULTIPLAYER = 1;
   var rowStartY = 40;
   var rowYSpacing = 27;
   var cellsStartX = 290;
   var cellWidth = 94;
   var widestPosition = 0;
   var requiredCells = 3;
   var columnsMax = 0;
   function SC_LEADERBOARD()
   {
      super();
   }
   function SCLeaderboard()
   {
      _global.gfxExtensions = true;
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.slots = [];
      this.scColor = new com.rockstargames.ui.utils.HudColour();
      this.whiteColor = new com.rockstargames.ui.utils.HudColour();
      this.blackColor = new com.rockstargames.ui.utils.HudColour();
      this.blackAlphaColor = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_SOCIAL_CLUB,this.scColor);
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,this.whiteColor);
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK,this.blackColor);
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG,this.blackAlphaColor);
      this.initScreenLayout();
      _global.gfxExtensions = true;
   }
   function initScreenLayout()
   {
      var _loc2_ = this.safeRight - this.safeLeft;
      if(_loc2_ <= this.leaderboard._width)
      {
         this.leaderboard._width = _loc2_;
      }
      else
      {
         this.leaderboard._xscale = 100;
      }
      this.leaderboard._x = Math.round((_loc2_ - this.leaderboard._width) / 2 + this.safeLeft);
      this.leaderboard._y = 114;
   }
   function SET_DISPLAY_CONFIG(_screenWidthPixels, _screenHeightPixels, _safeTopPercent, _safeBottomPercent, _safeLeftPercent, _safeRightPercent, _isWideScreen, _isHiDef, _isAsian)
   {
      this.isWideScreen = _isWideScreen;
      this.isHiDef = _isHiDef;
      if(!this.isWideScreen)
      {
         Stage.scaleMode = "noBorder";
         var _loc4_ = 1.7777777777777777;
         var _loc3_ = 1.3333333333333333;
         this.FOUR_THREE_PADDING = (this.FILE_WIDTH - Math.round(this.FILE_WIDTH / _loc4_ * _loc3_)) / 2;
         _screenWidthPixels = this.FILE_WIDTH - this.FOUR_THREE_PADDING * 2;
      }
      this.safeLeft = this.FOUR_THREE_PADDING + Math.round(_screenWidthPixels * _safeLeftPercent);
      this.safeRight = this.FOUR_THREE_PADDING + Math.round(_screenWidthPixels * _safeRightPercent);
      this.safeTop = Math.round(_screenHeightPixels * _safeTopPercent);
      this.safeBottom = Math.round(_screenHeightPixels * _safeBottomPercent);
      this.initScreenLayout();
   }
   function debugMP()
   {
      this.SET_DISPLAY_TYPE(com.rockstargames.gtav.minigames.scleaderboard.SC_LEADERBOARD.DISPLAY_TYPE_MULTIPLAYER);
      this.SET_TITLE("POSITION","VEHICLE","XP","KILLS","DEATHS","CASH","TIME");
      this.SET_MULTIPLAYER_TITLE("MP Mission Title Here");
      this.SET_SLOT(0,com.rockstargames.ui.utils.BitMonger.BIT(com.rockstargames.gtav.minigames.scleaderboard.SC_LEADERBOARD.SLOT_STATE_WORLD),"GLOBAL");
      this.SET_SLOT(1,com.rockstargames.ui.utils.BitMonger.BIT(com.rockstargames.gtav.minigames.scleaderboard.SC_LEADERBOARD.SLOT_STATE_OUTLINE),"1","WWWWWWWWWWWWWWW","{*%NYC","","","","8888888","$8888888","88:88.888");
      this.SET_SLOT(2,com.rockstargames.ui.utils.BitMonger.BIT(com.rockstargames.gtav.minigames.scleaderboard.SC_LEADERBOARD.SLOT_STATE_PLAIN),"2","MMMMMMMMMMMMMMM","{*%EDI","","","","8888888","$8888888","88:88.888");
      this.SET_SLOT(3,com.rockstargames.ui.utils.BitMonger.BIT(com.rockstargames.gtav.minigames.scleaderboard.SC_LEADERBOARD.SLOT_STATE_IS_PLAYER),"3","YourGamerTag","{*%SAN","","","","8888888","$8888888","88:88.888");
      this.SET_SLOT(4,com.rockstargames.ui.utils.BitMonger.BIT(com.rockstargames.gtav.minigames.scleaderboard.SC_LEADERBOARD.SLOT_STATE_PLAIN),"4","iii","{*%NE","","","","8888888","$8888888","88:88.888");
      this.SET_SLOT(6,com.rockstargames.ui.utils.BitMonger.BIT(com.rockstargames.gtav.minigames.scleaderboard.SC_LEADERBOARD.SLOT_STATE_FRIENDS),"FRIENDS");
      this.SET_SLOT(7,com.rockstargames.ui.utils.BitMonger.BIT(com.rockstargames.gtav.minigames.scleaderboard.SC_LEADERBOARD.SLOT_STATE_OUTLINE),"1","Player 1","{*%NYC","Carbonizza","8888888","8888888","8888888","$8888888","88:88.888");
      this.SET_SLOT(8,com.rockstargames.ui.utils.BitMonger.BIT(com.rockstargames.gtav.minigames.scleaderboard.SC_LEADERBOARD.SLOT_STATE_PLAIN),"22","Player 2","{*%EDI","Carbonizza","1111111","1111111","1111111","$1111111","11:11.111");
      this.SET_SLOT(9,com.rockstargames.ui.utils.BitMonger.BIT(com.rockstargames.gtav.minigames.scleaderboard.SC_LEADERBOARD.SLOT_STATE_PLAIN),"33","Player 3","{*%NE","Carbonizza Suppa Sizza","888888888","888888888","888888888","$8888888","88:88.888");
      this.SET_SLOT(10,com.rockstargames.ui.utils.BitMonger.BIT(com.rockstargames.gtav.minigames.scleaderboard.SC_LEADERBOARD.SLOT_STATE_PLAIN),"444","Player 4","{*%NE","Carbonizza Suppa Sizza","111111111","111111111","111111111","$1111111","11:11.111");
      this.SET_SLOT(11,com.rockstargames.ui.utils.BitMonger.BIT(com.rockstargames.gtav.minigames.scleaderboard.SC_LEADERBOARD.SLOT_STATE_PLAIN),"555","Player 5","{*%NE","Carbonizza Suppa Sizza","123123123","123,123,123","123123123","$1,231,231","12:31.231");
      this.SET_SLOT(12,com.rockstargames.ui.utils.BitMonger.BIT(com.rockstargames.gtav.minigames.scleaderboard.SC_LEADERBOARD.SLOT_STATE_CREW),"PAYNE KILLERS");
      this.SET_SLOT(13,com.rockstargames.ui.utils.BitMonger.BIT(com.rockstargames.gtav.minigames.scleaderboard.SC_LEADERBOARD.SLOT_STATE_DESCRIPTION),"<FONT COLOR=\'#ff00ff\'>The quick brown fox <FONT COLOR=\'#ffffff\'>jumped over the lazy dog.");
      this.SET_SLOT(14,com.rockstargames.ui.utils.BitMonger.BIT(com.rockstargames.gtav.minigames.scleaderboard.SC_LEADERBOARD.SLOT_STATE_IS_PLAYER,com.rockstargames.gtav.minigames.scleaderboard.SC_LEADERBOARD.SLOT_STATE_OUTLINE),"31","YourGamerTag","","Carbonizza","8888888","8888888","8888888","$8888888","88:88.888");
      this.SET_SLOT(15,com.rockstargames.ui.utils.BitMonger.BIT(com.rockstargames.gtav.minigames.scleaderboard.SC_LEADERBOARD.SLOT_STATE_OUTLINE),"30","Player 2","","Carbonizza","8888888","8888888","8888888","$8888888","88:88.888");
      this.SET_SLOT(16,com.rockstargames.ui.utils.BitMonger.BIT(com.rockstargames.gtav.minigames.scleaderboard.SC_LEADERBOARD.SLOT_STATE_IS_PLAYER),"32","Player 4","{*%WWW","Carbonizza","8888888","8888888","8888888","$8888888","88:88.888");
      this.SET_SLOT(17,com.rockstargames.ui.utils.BitMonger.BIT(),"32","Player 4","{*%WWW","Carbonizza","8888888","8888888","8888888","$8888888","88:88.888");
   }
   function SET_DISPLAY_TYPE()
   {
      if(this.leaderboard != undefined)
      {
         this.leaderboard.removeMovieClip();
      }
      this.leaderboard = this.CONTENT.attachMovie("Leaderboard","leaderboard",this.CONTENT.getNextHighestDepth());
      if(this.leaderboard.titleColorMC)
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.leaderboard.titleColorMC,this.scColor.r,this.scColor.g,this.scColor.b,this.scColor.a);
      }
      if(this.leaderboard.titleSlotMC.bgMC)
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.leaderboard.titleSlotMC.bgMC,this.whiteColor.r,this.whiteColor.g,this.whiteColor.b,this.whiteColor.a);
      }
      this.cellsStartX = 259;
   }
   function SET_MULTIPLAYER_TITLE(title)
   {
      this.leaderboard.mpTitleMC.labelTF.textAutoSize = "shrink";
      this.leaderboard.mpTitleMC.labelTF.verticalAlign = "center";
      this.leaderboard.mpTitleMC.labelTF.htmlText = title;
   }
   function SET_TITLE(title)
   {
      this.requiredCells = 1;
      var _loc5_ = this.leaderboard.titleSlotMC;
      _loc5_.outlineMC._visible = false;
      _loc5_.iconsMC._visible = false;
      if(_loc5_.labelsMC)
      {
         com.rockstargames.ui.utils.Colour.Colourise(_loc5_.labelsMC,this.blackColor.r,this.blackColor.g,this.blackColor.b,this.blackColor.a);
      }
      if(_loc5_.bgMC)
      {
         com.rockstargames.ui.utils.Colour.Colourise(_loc5_.bgMC,this.whiteColor.r,this.whiteColor.g,this.whiteColor.b,this.whiteColor.a);
      }
      this.columnCount = arguments.length - 1;
      if(this.columnsMax < this.columnCount)
      {
         this.columnsMax = this.columnCount;
      }
      this.cellXSpacing = Math.round((_loc5_.bgMC._width - this.cellsStartX) / this.columnCount);
      var _loc3_ = undefined;
      var _loc6_ = undefined;
      var _loc4_ = 0;
      while(_loc4_ < this.columnsMax + this.requiredCells)
      {
         _loc3_ = _loc5_.labelsMC["c" + _loc4_];
         if(_loc4_ == 0)
         {
            if(_loc3_ == undefined)
            {
               _loc3_ = _loc5_.labelsMC.attachMovie("CellStat","c" + _loc4_,_loc5_.labelsMC.getNextHighestDepth(),{_x:-3});
            }
            _loc6_ = new TextFormat();
            _loc6_.align = "left";
            _loc3_.labelTF.setTextFormat(_loc6_);
            _loc3_.labelTF.autoSize = true;
         }
         else if(_loc4_ > this.columnCount)
         {
            if(_loc3_ != undefined)
            {
               _loc3_.removeMovieClip();
            }
         }
         else
         {
            if(_loc3_ == undefined)
            {
               _loc3_ = _loc5_.labelsMC.attachMovie("CellStat","c" + _loc4_,_loc5_.labelsMC.getNextHighestDepth());
            }
            _loc3_._x = this.cellsStartX + this.cellXSpacing * (_loc4_ - this.requiredCells) + (this.cellXSpacing - this.cellWidth);
            _loc3_.labelTF.autoSize = "right";
         }
         _loc3_.labelTF.htmlText = arguments[_loc4_];
         _loc4_ = _loc4_ + 1;
      }
      this.initScreenLayout();
   }
   function SET_SLOT(id, state)
   {
      this.requiredCells = 3;
      var _loc5_ = this.slots[id];
      if(_loc5_ != undefined)
      {
         _loc5_.removeMovieClip();
      }
      _loc5_ = this.leaderboard.attachMovie("Slot","s" + id,this.leaderboard.getNextHighestDepth(),{_y:this.rowStartY + this.rowYSpacing * id});
      this.slots[id] = _loc5_;
      _loc5_.iconsMC._visible = false;
      this.SET_SLOT_STATE(id,state);
      var _loc6_ = arguments.slice(2);
      var _loc4_ = undefined;
      var _loc7_ = undefined;
      if(_loc5_.isDesc)
      {
         _loc4_ = _loc5_.labelsMC.attachMovie("CellDescription","desc",_loc5_.labelsMC.getNextHighestDepth());
         _loc4_._x = 16;
         var _loc14_ = new com.rockstargames.ui.utils.Text();
         _loc14_.setTextWithIcons(_loc6_[0],_loc4_,_loc4_.labelTF,0,14,0,false);
         _loc4_.labelTF.autoSize = true;
         if(_loc4_._width > 837)
         {
            _loc4_._width = 837;
            _loc4_._yscale = _loc4_._xscale;
            _loc4_._y = Math.floor((23 - _loc4_._height) / 2);
         }
         _loc5_.iconsMC._visible = true;
      }
      else if(_loc5_.isHeader)
      {
         _loc4_ = _loc5_.labelsMC.attachMovie("CellPosition","header",_loc5_.labelsMC.getNextHighestDepth());
         _loc4_._x = -2;
         _loc4_.labelTF.autoSize = true;
         _loc4_.labelTF.htmlText = _loc6_[0];
      }
      else
      {
         var _loc3_ = 0;
         while(_loc3_ < this.columnsMax + this.requiredCells)
         {
            if(_loc3_ == 0)
            {
               _loc4_ = _loc5_.labelsMC.attachMovie("CellPosition","c" + _loc3_,_loc5_.labelsMC.getNextHighestDepth());
               _loc4_.labelTF.autoSize = true;
               _loc4_.labelTF.htmlText = _loc6_[_loc3_];
               if(this.canUseFixedWidthNumbers(_loc6_[_loc3_]))
               {
                  _loc7_ = _loc4_.labelTF.getTextFormat();
                  _loc7_.font = "$FixedWidthNumbers";
                  _loc4_.labelTF.setTextFormat(_loc7_);
               }
            }
            else if(_loc3_ == 1)
            {
               _loc4_ = _loc5_.labelsMC.attachMovie("CellPlayer","c" + _loc3_,_loc5_.labelsMC.getNextHighestDepth());
               _loc4_.labelTF.autoSize = true;
               _loc4_.labelTF.htmlText = _loc6_[_loc3_];
            }
            else if(_loc3_ == 2 && _loc6_[_loc3_] != undefined && _loc6_[_loc3_] != "")
            {
               var _loc8_ = _loc5_.tag;
               var _loc9_ = _loc5_.labelsMC["c" + (_loc3_ - 1)];
               if(_loc8_ == undefined)
               {
                  _loc8_ = com.rockstargames.gtav.Multiplayer.CREW_TAG_MOVIECLIP(_loc5_.attachMovie("CREW_TAG_MOVIECLIP","tag",_loc5_.getNextHighestDepth(),{_y:4.5,_xscale:70,_yscale:70}));
               }
               _loc8_.UNPACK_CREW_TAG(_loc6_[_loc3_]);
            }
            else if(_loc3_ > this.columnCount + this.requiredCells)
            {
               if(_loc4_ != undefined)
               {
                  _loc4_.removeMovieClip();
               }
            }
            else
            {
               _loc4_ = _loc5_.labelsMC.attachMovie("CellStat","c" + _loc3_,_loc5_.labelsMC.getNextHighestDepth());
               _loc4_._x = this.cellsStartX + this.cellXSpacing * (_loc3_ - this.requiredCells) + (this.cellXSpacing - this.cellWidth);
               _loc4_.labelTF.autoSize = "right";
               _loc4_.labelTF.htmlText = _loc6_[_loc3_];
               if(this.canUseFixedWidthNumbers(_loc6_[_loc3_]))
               {
                  _loc7_ = _loc4_.labelTF.getTextFormat();
                  _loc7_.font = "$FixedWidthNumbers";
                  _loc4_.labelTF.setTextFormat(_loc7_);
               }
            }
            _loc3_ = _loc3_ + 1;
         }
         _loc5_.attachMovie("mouseCatcher","mouseCatcher",_loc5_.getNextHighestDepth(),{_width:_loc5_._width,_height:_loc5_._height});
         com.rockstargames.ui.mouse.MouseBtn(_loc5_.mouseCatcher).setupGenericMouseInterface(id,undefined,this.onSlotMouseEvent,[_loc5_]);
      }
      _loc5_.hover._visible = false;
      this.updateDisplay();
   }
   function onSlotMouseEvent(evtType, targetMC, args)
   {
      var _loc1_ = args[0];
      switch(evtType)
      {
         case com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_ROLL_OUT:
            _loc1_.hover._visible = false;
            break;
         case com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_ROLL_OVER:
            _loc1_.hover._visible = true;
      }
   }
   function SET_SLOT_STATE(id, state)
   {
      var _loc4_ = new com.rockstargames.ui.utils.BitMonger(state);
      var _loc2_ = this.slots[id];
      _loc2_.outlineMC._visible = _loc4_.isBitSet(com.rockstargames.gtav.minigames.scleaderboard.SC_LEADERBOARD.SLOT_STATE_OUTLINE);
      _loc2_.isHeader = _loc4_.isBitSet(com.rockstargames.gtav.minigames.scleaderboard.SC_LEADERBOARD.SLOT_STATE_WORLD) || _loc4_.isBitSet(com.rockstargames.gtav.minigames.scleaderboard.SC_LEADERBOARD.SLOT_STATE_FRIENDS) || _loc4_.isBitSet(com.rockstargames.gtav.minigames.scleaderboard.SC_LEADERBOARD.SLOT_STATE_CREW);
      _loc2_.isDesc = _loc4_.isBitSet(com.rockstargames.gtav.minigames.scleaderboard.SC_LEADERBOARD.SLOT_STATE_DESCRIPTION);
      var _loc5_ = undefined;
      var _loc6_ = undefined;
      var _loc3_ = undefined;
      var _loc7_ = this.whiteColor;
      if(_loc4_.isBitSet(com.rockstargames.gtav.minigames.scleaderboard.SC_LEADERBOARD.SLOT_STATE_SELECTED))
      {
         if(_loc4_.isBitSet(com.rockstargames.gtav.minigames.scleaderboard.SC_LEADERBOARD.SLOT_STATE_IS_PLAYER))
         {
            _loc5_ = this.scColor;
            _loc6_ = this.blackColor;
            _loc3_ = this.blackColor;
         }
         else
         {
            _loc5_ = this.whiteColor;
            _loc6_ = this.blackColor;
            _loc3_ = this.blackColor;
         }
      }
      else
      {
         _loc6_ = this.whiteColor;
         _loc3_ = this.whiteColor;
         _loc5_ = this.blackAlphaColor;
         if(_loc4_.isBitSet(com.rockstargames.gtav.minigames.scleaderboard.SC_LEADERBOARD.SLOT_STATE_IS_PLAYER))
         {
            _loc3_ = this.scColor;
         }
         else if(_loc2_.isHeader)
         {
            _loc3_ = this.blackColor;
            _loc5_ = this.scColor;
         }
      }
      if(_loc2_.bgMC)
      {
         com.rockstargames.ui.utils.Colour.Colourise(_loc2_.bgMC,_loc5_.r,_loc5_.g,_loc5_.b,_loc5_.a);
      }
      if(_loc2_.outlineMC)
      {
         com.rockstargames.ui.utils.Colour.Colourise(_loc2_.outlineMC,_loc6_.r,_loc6_.g,_loc6_.b,_loc6_.a);
      }
      if(_loc2_.labelsMC)
      {
         com.rockstargames.ui.utils.Colour.Colourise(_loc2_.labelsMC,_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
      }
      if(_loc2_.tag)
      {
         com.rockstargames.ui.utils.Colour.Colourise(_loc2_.tag,_loc7_.r,_loc7_.g,_loc7_.b,_loc7_.a);
      }
   }
   function SET_SLOT_HOVER(id, isVisible)
   {
      var _loc2_ = this.slots[id];
      _loc2_.hover._visible = isVisible;
   }
   function CLEAR_SLOT(id)
   {
      var _loc2_ = this.slots[id];
      if(_loc2_ != undefined)
      {
         this.slots[id] = undefined;
         com.rockstargames.ui.mouse.MouseBtn(_loc2_.mouseCatcher).dispose();
         delete _loc2_.onRollOver;
         delete _loc2_.onRollOut;
         _loc2_.removeMovieClip();
      }
      this.widestPosition = 0;
      this.updateDisplay();
   }
   function CLEAR_ALL_SLOTS()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.slots.length)
      {
         this.CLEAR_SLOT(_loc2_);
         _loc2_ = _loc2_ + 1;
      }
   }
   function canUseFixedWidthNumbers(str, validChars)
   {
      validChars = validChars == undefined ? ":.$/\\" : validChars;
      var _loc2_ = validChars.split("");
      var _loc1_ = 0;
      while(_loc1_ < _loc2_.length)
      {
         str = str.split(_loc2_[_loc1_]).join("");
         _loc1_ = _loc1_ + 1;
      }
      if(isNaN(Number(str)))
      {
         return false;
      }
      return true;
   }
   function updateDisplay()
   {
      var _loc2_ = undefined;
      var _loc3_ = undefined;
      _loc3_ = 0;
      while(_loc3_ < this.slots.length)
      {
         _loc2_ = this.slots[_loc3_];
         if(!_loc2_.isHeader && _loc2_.labelsMC.c0._width > this.widestPosition)
         {
            this.widestPosition = _loc2_.labelsMC.c0._width;
         }
         _loc3_ = _loc3_ + 1;
      }
      _loc3_ = 0;
      while(_loc3_ < this.slots.length)
      {
         _loc2_ = this.slots[_loc3_];
         if(!_loc2_.isHeader)
         {
            _loc2_.labelsMC.c0._x = (this.widestPosition - this.slots[_loc3_].labelsMC.c0._width) / 2 - 4;
            _loc2_.labelsMC.c1._x = this.widestPosition - 1;
            _loc2_.tag._x = _loc2_.labelsMC.c1._x + _loc2_.labelsMC.c1._width + 16;
         }
         else
         {
            _loc2_.labelsMC.c0._x = 16;
         }
         _loc3_ = _loc3_ + 1;
      }
   }
}

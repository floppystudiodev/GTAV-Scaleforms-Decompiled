class com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_HAIR_COLOUR_LIST extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
   var CONTENT;
   var titleMC;
   var paletteMC;
   var barMC;
   var colourData = new Array();
   var colourMCs = new Array();
   var highlightIndex = 0;
   var highlightPosIndex = 0;
   var topEdge = 0;
   var visibleItems = 9;
   function PAUSE_MENU_HAIR_COLOUR_LIST()
   {
      super();
      this.dbgID = "PAUSE_MENU_HAIR_COLOUR_LIST";
   }
   function INITIALISE(mc)
   {
      if(mc != undefined)
      {
         super.INITIALISE(mc);
      }
      else
      {
         this.CONTENT = this;
      }
      this.titleMC = this.CONTENT.titleMC;
      this.paletteMC = this.CONTENT.paletteMC;
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.titleMC.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.paletteMC.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
      var _loc3_ = this.titleMC.attachMovie("GenericColourBar","barMC",this.titleMC.getNextHighestDepth());
      this.barMC = com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar(_loc3_);
      this.barMC._x = 7;
      this.barMC._y = 30;
      this.barMC.init(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,274);
      this.titleMC._visible = false;
      this.paletteMC._visible = false;
      this.colourMCs = [];
      this.colourData = [];
   }
   function debug()
   {
      this.SET_TITLE("OPACITY","COLOUR",34);
      this.SET_DATA_SLOT_EMPTY();
      var _loc6_ = 4;
      var _loc2_ = 0;
      while(_loc2_ < _loc6_)
      {
         var _loc4_ = Math.floor(Math.random() * 255);
         var _loc5_ = Math.floor(Math.random() * 255);
         var _loc3_ = Math.floor(Math.random() * 255);
         this.SET_DATA_SLOT(_loc2_,_loc4_,_loc5_,_loc3_);
         _loc2_ = _loc2_ + 1;
      }
      this.DISPLAY_VIEW();
      this.SET_HIGHLIGHT(0);
      var _loc7_ = new Object();
      _loc7_.onKeyUp = gfx.utils.Delegate.create(this,this.debugkeys);
      Key.addListener(_loc7_);
   }
   function debugkeys()
   {
      var _loc2_ = Key.getCode();
      if(_loc2_ == 39)
      {
         this.SET_HIGHLIGHT(this.highlightIndex + 1);
      }
      else if(_loc2_ == 37)
      {
         this.SET_HIGHLIGHT(this.highlightIndex - 1);
      }
      else if(_loc2_ == 40)
      {
         this.SET_HIGHLIGHT(Math.floor(Math.random() * this.colourData.length - 1));
      }
   }
   function SET_TITLE(str)
   {
      var _loc4_ = arguments[1];
      var _loc3_ = arguments[2];
      if(_loc4_ != undefined)
      {
         com.rockstargames.ui.utils.UIText.setSizedText(this.paletteMC.opacityTF,_loc4_,true);
      }
      if(_loc3_ != undefined)
      {
         com.rockstargames.ui.utils.UIText.setSizedText(this.titleMC.opacityTF,str,true);
         com.rockstargames.ui.utils.UIText.setSizedText(this.titleMC.minTF,"0%",true);
         com.rockstargames.ui.utils.UIText.setSizedText(this.titleMC.maxTF,"100%",true);
         if(_loc3_ != NaN)
         {
            this.barMC.percent(_loc3_);
         }
         this.titleMC._visible = true;
         this.paletteMC._y = this.titleMC._y + this.titleMC._height;
      }
      else
      {
         this.titleMC._visible = false;
         this.paletteMC._y = 0;
      }
   }
   function SET_INPUT_EVENT(direction)
   {
   }
   function SET_DATA_SLOT(_viewIndex, _slotIndex)
   {
      this.colourData[_viewIndex] = arguments;
   }
   function SET_DATA_SLOT_EMPTY(viewIndex, itemIndex)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.colourMCs.length)
      {
         var _loc3_ = this.colourMCs[_loc2_];
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(_loc3_);
         _loc3_.removeMovieClip();
         _loc2_ = _loc2_ + 1;
      }
      this.colourData = [];
      this.colourMCs = [];
      this.paletteMC._visible = false;
   }
   function DISPLAY_VIEW(viewIndex, itemIndex)
   {
      var _loc5_ = this.colourData.length <= this.visibleItems ? this.colourData.length : this.visibleItems;
      var _loc2_ = 0;
      while(_loc2_ < _loc5_)
      {
         var _loc4_ = this.colourData[_loc2_];
         var _loc3_ = this.paletteMC.containerMC.attachMovie("swatch","swatch" + _loc2_ + "MC",_loc2_);
         _loc3_._x = _loc3_._width * _loc2_;
         this.itemSetData(_loc2_,_loc3_,_loc4_);
         this.colourMCs[_loc2_] = _loc3_;
         _loc2_ = _loc2_ + 1;
      }
      this.repositionPallattes();
      this.paletteMC._visible = true;
   }
   function itemSetData(i, cMC, cData)
   {
      var _loc1_ = cData[1];
      var _loc4_ = cData[2];
      var _loc2_ = cData[3];
      cMC.numTF.text = String(i);
      if(_loc1_ != undefined)
      {
         com.rockstargames.ui.utils.Colour.Colourise(cMC.innerMC,_loc1_,_loc4_,_loc2_,100);
      }
   }
   function repositionPallattes()
   {
      var _loc5_ = this.colourMCs.length;
      var _loc4_ = 30;
      var _loc8_ = 10;
      var _loc6_ = this.visibleItems * 30;
      var _loc7_ = _loc5_ * _loc4_;
      if(_loc5_ <= this.visibleItems)
      {
         _loc4_ = _loc6_ / _loc5_;
      }
      else
      {
         _loc4_ = 30;
      }
      var _loc3_ = 0;
      while(_loc3_ < this.colourMCs.length)
      {
         var _loc2_ = this.colourMCs[_loc3_];
         _loc2_.highlightMC.vMC._width = _loc4_;
         _loc2_.highlightMC.maskMC._x = _loc4_ / 2;
         _loc2_.innerMC._width = _loc4_;
         _loc2_._x = _loc3_ * _loc4_;
         _loc3_ = _loc3_ + 1;
      }
   }
   function UPDATE_SLOT(_viewIndex, _slotIndex)
   {
      this.SET_DATA_SLOT.apply(this,arguments);
      var _loc3_ = this.colourMCs[_viewIndex];
      var _loc4_ = this.colourData[_viewIndex];
      this.itemSetData(_viewIndex,_loc3_,_loc4_);
   }
   function SET_HIGHLIGHT(index)
   {
      var _loc10_ = this.colourData.length;
      var _loc4_ = Math.max(0,Math.min(index,this.colourData.length - 1));
      index = _loc4_;
      if(_loc10_ > this.visibleItems)
      {
         var _loc5_ = 0;
         if(_loc4_ > this.topEdge + this.visibleItems - 1)
         {
            _loc5_ += _loc4_ - (this.visibleItems - 1);
            this.topEdge = _loc5_;
            _loc4_ = this.visibleItems - 1;
         }
         else if(_loc4_ < this.topEdge)
         {
            _loc5_ = _loc4_;
            this.topEdge = _loc5_;
            _loc4_ = 0;
         }
         else
         {
            _loc5_ = this.topEdge;
            _loc4_ -= this.topEdge;
         }
         i = 0;
         while(i < this.colourMCs.length)
         {
            var _loc2_ = this.colourMCs[i];
            var _loc6_ = this.colourData[_loc5_ + i];
            this.itemSetData(_loc5_ + i,_loc2_,_loc6_);
            i++;
         }
      }
      var i = 0;
      while(i < this.colourMCs.length)
      {
         _loc2_ = this.colourMCs[i];
         var _loc3_ = i != _loc4_ ? false : true;
         _loc2_.highlightMC._visible = _loc3_;
         if(this.highlightPosIndex != _loc4_)
         {
            if(_loc3_)
            {
               _loc2_.highlightMC._y = 10;
               com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2_.highlightMC,0.3,{_y:0,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT});
            }
         }
         i++;
      }
      this.highlightIndex = index;
      this.highlightPosIndex = _loc4_;
   }
}

class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuVerticalListItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
   var itemTextRight;
   var labelMC;
   var crewTagMC;
   var itemTextLeft;
   var storeFunc;
   var storeScope;
   var selectedValue;
   var bgMC;
   var multiListIndex = 0;
   var multiListItems = new Array();
   function PauseMenuVerticalListItem()
   {
      super();
      this.itemTextRight = this.labelMC.valueTF;
   }
   function set data(_d)
   {
      super.data = _d;
      if(this.crewTagMC)
      {
         this.crewTagMC._visible = false;
      }
      switch(this.type)
      {
         case 1:
            this.multiListItems = this.data.slice(1);
            com.rockstargames.ui.utils.UIText.setSizedText(this.itemTextLeft,this._data[0]);
            this.textIndex = this.initialIndex;
            break;
         case 2:
            if(!this.crewTagMC)
            {
               this.crewTagMC = this.attachMovie("CREW_TAG_MOVIECLIP","CREW_TAG",this.getNextHighestDepth(),{_y:4,_xscale:70,_yscale:70});
            }
            this.crewTagMC._visible = true;
            this.crewTagMC.UNPACK_CREW_TAG(this.data[1]);
            this.crewTagMC._x = this.itemTextLeft._x + this.itemTextLeft.textWidth + 10;
      }
   }
   function initStoreMethod(func, scope)
   {
      this.storeFunc = func;
      this.storeScope = scope;
   }
   function set textIndex(ti)
   {
      this.multiListIndex = ti;
      this.selectedIndex = this.multiListIndex;
      this.selectedValue = this.multiListItems[this.multiListIndex];
      com.rockstargames.ui.utils.UIText.setSizedText(this.itemTextRight,this.selectedValue);
   }
   function set highlighted(_h)
   {
      if(this.bgMC)
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.bgMC,!_h ? com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG : com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      }
      var _loc2_ = new com.rockstargames.ui.utils.HudColour();
      var _loc3_ = 100;
      if(this.isSelectable == 0)
      {
         _loc3_ = !_h ? 30 : 60;
      }
      com.rockstargames.ui.utils.Colour.setHudColour(!_h ? com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE : com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK,_loc2_);
      com.rockstargames.ui.utils.Colour.Colourise(this.labelMC,_loc2_.r,_loc2_.g,_loc2_.b,_loc3_);
      this._highlighted = _h;
   }
   function stepVal(dir)
   {
      var _loc0_ = null;
      if((_loc0_ = this.type) === 1)
      {
         this.multiListIndex += dir;
         if(this.multiListIndex < 0)
         {
            this.multiListIndex = this.multiListItems.length - 1;
         }
         if(this.multiListIndex > this.multiListItems.length - 1)
         {
            this.multiListIndex = 0;
         }
         this.textIndex = this.multiListIndex;
         this.storeFunc.apply(this.storeScope,[this.index,this.multiListIndex]);
      }
      this.highlighted = this._highlighted;
   }
}

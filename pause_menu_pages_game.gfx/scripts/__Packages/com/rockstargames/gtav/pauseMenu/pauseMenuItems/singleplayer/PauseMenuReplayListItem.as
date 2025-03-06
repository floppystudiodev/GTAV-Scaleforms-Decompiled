class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuReplayListItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuVerticalListItem
{
   var iconMC;
   var type;
   var __get__data;
   var itemTextLeft;
   var _data;
   var initialIndex;
   function PauseMenuReplayListItem()
   {
      super();
      this.iconMC._visible = false;
   }
   function set data(_d)
   {
      super.data = _d;
      switch(this.type)
      {
         case 1:
            this.multiListItems = this.data.slice(1);
            com.rockstargames.ui.utils.UIText.setSizedText(this.itemTextLeft,this._data[0]);
            this.textIndex = this.initialIndex;
            this.iconMC._visible = false;
            break;
         case 3:
            var _loc3_ = new com.rockstargames.ui.utils.HudColour();
            com.rockstargames.ui.utils.Colour.setHudColour(this.data[1],_loc3_);
            if(this.iconMC != undefined)
            {
               com.rockstargames.ui.utils.Colour.Colourise(this.iconMC,_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
               this.iconMC._visible = true;
            }
            break;
         default:
            this.iconMC._visible = false;
      }
   }
}

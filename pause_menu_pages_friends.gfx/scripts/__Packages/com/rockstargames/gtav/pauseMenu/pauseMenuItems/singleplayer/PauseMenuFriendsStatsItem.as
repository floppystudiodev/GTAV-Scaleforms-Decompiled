class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFriendsStatsItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
   var __get__data;
   var _highlighted;
   var bgMC;
   var initialIndex;
   var itemTextRight;
   var labelMC;
   var medalMC;
   var snapBGGrid;
   function PauseMenuFriendsStatsItem()
   {
      super();
      this.medalMC._visible = false;
      this.itemTextRight = this.labelMC.valueTF;
   }
   function set data(_d)
   {
      super.data = _d;
      if(this.data[1] != undefined && this.data[1] != "")
      {
         com.rockstargames.ui.utils.UIText.setSizedText(this.itemTextRight,this.data[1],true);
      }
      if(this.initialIndex == 0)
      {
         this.bgMC._visible = false;
      }
      this.snapBGGrid(this.bgMC);
      var _loc3_ = com.rockstargames.gtav.constants.PauseMenuColoursLUT.BLACK_ALPHA_30;
      com.rockstargames.ui.utils.Colour.Colourise(this.bgMC,_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4]);
   }
   function set highlighted(_h)
   {
      var _loc2_ = com.rockstargames.gtav.constants.PauseMenuColoursLUT.WHITE;
      var _loc3_;
      var _loc4_;
      if(_h)
      {
         _loc3_ = com.rockstargames.gtav.constants.PauseMenuColoursLUT.BLACK;
         com.rockstargames.ui.utils.Colour.Colourise(this.labelMC,_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4]);
         com.rockstargames.ui.utils.Colour.Colourise(this.bgMC,_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4]);
      }
      else
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.labelMC,_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4]);
         _loc4_ = com.rockstargames.gtav.constants.PauseMenuColoursLUT.BLACK_ALPHA_30;
         com.rockstargames.ui.utils.Colour.Colourise(this.bgMC,_loc4_[1],_loc4_[2],_loc4_[3],_loc4_[4]);
      }
      this._highlighted = _h;
   }
}

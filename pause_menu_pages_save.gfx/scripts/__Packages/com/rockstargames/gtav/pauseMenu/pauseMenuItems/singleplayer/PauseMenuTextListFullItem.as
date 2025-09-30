class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuTextListFullItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
   var __get__data;
   var _highlighted;
   var bgMC;
   var gradMC;
   var isSelectable;
   var itemTextLeft;
   var itemTextRight;
   var labelMC;
   var mInit;
   var solidMC;
   var type;
   function PauseMenuTextListFullItem()
   {
      super();
      this.mInit();
      this.itemTextLeft = this.labelMC.titleTF;
      this.itemTextRight = this.labelMC.valueTF;
      this.solidMC = this.bgMC.solidMC;
      this.gradMC = this.bgMC.gradMC;
      this.gradMC._visible = false;
   }
   function set data(_d)
   {
      super.data = _d;
      if(this.data[1] != undefined && this.data[1] != "")
      {
         com.rockstargames.ui.utils.UIText.setSizedText(this.itemTextRight,this.data[1]);
      }
      switch(this.type)
      {
         case 1:
            this.gradMC._visible = true;
            this.solidMC._visible = false;
            this.itemTextLeft._x = (this.bgMC._width - this.itemTextLeft._width) / 2 - this.labelMC._x;
            break;
         case 0:
         default:
            this.gradMC._visible = false;
            this.solidMC._visible = true;
            this.itemTextLeft._x = 10;
      }
   }
   function set highlighted(_h)
   {
      var _loc3_;
      var _loc2_;
      if(_h)
      {
         _loc3_ = com.rockstargames.gtav.constants.PauseMenuColoursLUT.WHITE;
         _loc2_ = com.rockstargames.gtav.constants.PauseMenuColoursLUT.BLACK;
      }
      else
      {
         _loc3_ = com.rockstargames.gtav.constants.PauseMenuColoursLUT.BLACK_ALPHA_50;
         if(this.isSelectable == 1)
         {
            _loc2_ = com.rockstargames.gtav.constants.PauseMenuColoursLUT.WHITE;
         }
         else
         {
            _loc2_ = com.rockstargames.gtav.constants.PauseMenuColoursLUT.GREYED;
         }
      }
      com.rockstargames.ui.utils.Colour.Colourise(this.bgMC,_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4]);
      com.rockstargames.ui.utils.Colour.Colourise(this.labelMC,_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4]);
      this._highlighted = _h;
   }
   function snapBGGrid(bgMC)
   {
      var _loc2_ = Math.ceil(this.itemTextLeft.textHeight / 27);
      bgMC._height = _loc2_ * 27 - 2;
   }
}

class com.rockstargames.gtav.levelDesign.COLOUR_SWITCHER extends com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_HAIR_COLOUR_LIST
{
   var barMC;
   var dbgID;
   var paletteMC;
   var titleMC;
   var pcActiveOn = false;
   function COLOUR_SWITCHER()
   {
      super();
      this.dbgID = "COLOUR_SWITCHER";
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.paletteMC.attachMovie("hairColourArrow","leftArMC",this.paletteMC.getNextHighestDepth(),{_x:7.35,_y:14.6});
      this.paletteMC.attachMovie("hairColourArrow","rightArMC",this.paletteMC.getNextHighestDepth(),{_x:282,_y:14.6,_xscale:-100});
      this.paletteMC.leftArMC._visible = false;
      this.paletteMC.rightArMC._visible = false;
      com.rockstargames.ui.mouse.MouseBtn(this.paletteMC.leftArMC).setupGenericMouseInterface(-1,1);
      com.rockstargames.ui.mouse.MouseBtn(this.paletteMC.rightArMC).setupGenericMouseInterface(-2,1);
   }
   function debug()
   {
      this.SET_TITLE("OPACITY","COLOUR",34,true);
      this.SET_DATA_SLOT_EMPTY();
      var _loc6_ = 16;
      var _loc2_ = 0;
      var _loc4_;
      var _loc5_;
      var _loc3_;
      while(_loc2_ < _loc6_)
      {
         _loc4_ = Math.floor(Math.random() * 255);
         _loc5_ = Math.floor(Math.random() * 255);
         _loc3_ = Math.floor(Math.random() * 255);
         this.SET_DATA_SLOT(_loc2_,_loc4_,_loc5_,_loc3_);
         _loc2_ = _loc2_ + 1;
      }
      this.DISPLAY_VIEW();
      this.SET_HIGHLIGHT(10);
      this.SHOW_OPACITY(true,false);
   }
   function DISPLAY_VIEW(viewIndex, itemIndex)
   {
      var _loc7_ = this.colourData.length <= this.visibleItems ? this.colourData.length : this.visibleItems;
      var _loc2_ = 0;
      var _loc5_;
      var _loc3_;
      var _loc4_;
      while(_loc2_ < _loc7_)
      {
         _loc5_ = this.colourData[_loc2_];
         _loc3_ = this.paletteMC.containerMC.attachMovie("swatch","swatch" + _loc2_ + "MC",_loc2_);
         _loc4_ = _loc3_.attachMovie("hairColourSwatch","innerMC",_loc3_.getNextHighestDepth(),{_y:5});
         com.rockstargames.ui.mouse.MouseBtn(_loc4_).setupGenericMouseInterface(_loc2_,_loc2_);
         _loc3_._x = _loc3_._width * _loc2_;
         this.itemSetData(_loc2_,_loc3_,_loc5_);
         this.colourMCs[_loc2_] = _loc3_;
         _loc2_ = _loc2_ + 1;
      }
      this.repositionPallattes();
      this.paletteMC._visible = true;
   }
   function SET_IS_PC(_pcActiveOn)
   {
      this.pcActiveOn = _pcActiveOn;
   }
   function SET_TITLE(str)
   {
      var _loc4_ = arguments[1];
      var _loc3_ = arguments[2];
      if(_loc4_ != undefined)
      {
         com.rockstargames.ui.utils.UIText.setSizedText(this.paletteMC.opacityTF,_loc4_,true);
      }
      if(_loc3_ == undefined || _loc3_ == -1)
      {
         this.titleMC._visible = false;
         this.paletteMC._y = 0;
      }
      else
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
      if(this.pcActiveOn)
      {
         this.paletteMC.leftArMC._visible = true;
         this.paletteMC.rightArMC._visible = true;
      }
   }
   function itemSetData(i, cMC, cData)
   {
      var _loc2_ = cData[1];
      var _loc7_ = cData[2];
      var _loc3_ = cData[3];
      cMC.numTF.text = String(i);
      if(_loc2_ != undefined)
      {
         com.rockstargames.ui.utils.Colour.Colourise(cMC.innerMC,_loc2_,_loc7_,_loc3_,100);
      }
      if(this.pcActiveOn)
      {
         com.rockstargames.ui.mouse.MouseBtn(cMC.innerMC).setupGenericMouseInterface(i,i);
      }
   }
}

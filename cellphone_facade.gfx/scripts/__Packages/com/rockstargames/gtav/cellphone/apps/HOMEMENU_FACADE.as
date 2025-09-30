class com.rockstargames.gtav.cellphone.apps.HOMEMENU_FACADE extends MovieClip
{
   var CONTENT;
   var cameraItem;
   var container;
   var currentID;
   var currentKey;
   var currentStyle;
   var dataProviderUI;
   var previousKey;
   var whiteRGB;
   var numberOfRows = 3;
   var numberOfColumns = 3;
   var currentSelection = -1;
   function HOMEMENU_FACADE()
   {
      super();
      this.CONTENT = this;
   }
   function construct()
   {
      this.populateContent();
   }
   function populateContent()
   {
      this.container = this;
      this.dataProviderUI = _level0.TIMELINE.homemenuDataProviderUI;
      _level0.TIMELINE.infoBar.timeBar._visible = true;
      _level0.TIMELINE.toggleCellphoneButtonsVisible(true);
      this.currentStyle = _level0.TIMELINE.currentStyle;
      this.whiteRGB = _level0.TIMELINE.whiteRGB;
      if(this.currentID == undefined)
      {
         this.currentID = 4;
      }
      var _loc6_;
      var _loc10_;
      var _loc9_ = 0;
      var _loc5_;
      var _loc4_ = 1;
      var _loc8_ = 1;
      var _loc3_ = 0;
      var _loc2_;
      var _loc7_;
      while(_loc3_ < 9)
      {
         _loc2_ = _loc4_ + "_" + _loc8_;
         _loc7_ = "c" + _loc4_ + "_" + _loc8_;
         if(this.container[_loc7_])
         {
            this.container[_loc7_]._name = _loc2_;
         }
         _loc6_ = this.dataProviderUI[_loc3_][0];
         _loc9_ = this.dataProviderUI[_loc3_][1];
         _loc10_ = this.dataProviderUI[_loc3_][2];
         _loc5_ = this.dataProviderUI[_loc3_][3];
         if(_loc5_ == undefined)
         {
            _loc5_ = 100;
         }
         if(_loc10_ != undefined)
         {
            this.container[_loc2_].menuIconTitle = _loc10_;
         }
         if(_loc6_ != undefined && typeof _loc6_ == "number")
         {
            this.setIcon(this.container[_loc2_],_loc6_,_loc5_);
            if(_loc9_ > 0)
            {
               this.container[_loc2_].homeMenuIcons.menuIconInfo.text = String(_loc9_);
               this.container[_loc2_].homeMenuIcons._x = 28;
               this.container[_loc2_].homeMenuIcons._y = 39;
            }
            else
            {
               this.container[_loc2_].homeMenuIcons.menuIconInfo.text = "";
               this.container[_loc2_].homeMenuIcons._x = 32;
               this.container[_loc2_].homeMenuIcons._y = 32;
            }
            this.container[_loc2_]._visible = true;
         }
         else
         {
            this.container[_loc2_]._visible = false;
         }
         this.container[_loc2_]._id = _loc3_;
         if(_loc3_ != this.currentID)
         {
            this.setState(this.container[_loc2_],false);
         }
         else
         {
            this.currentKey = this.container[_loc2_];
            this.setState(this.currentKey,true);
            this.currentSelection = this.currentKey._id;
            com.rockstargames.ui.game.GameInterface.call("SET_GLOBAL_ACTIONSCRIPT_FLAG",com.rockstargames.ui.game.GameInterface.SCRIPT_TYPE,9,this.currentSelection);
            this.previousKey = this.container[_loc2_];
         }
         _loc4_ = _loc4_ + 1;
         if(_loc4_ > this.numberOfColumns)
         {
            _loc8_ = _loc8_ + 1;
            _loc4_ = 1;
         }
         _loc3_ = _loc3_ + 1;
      }
      this.numberOfRows = _loc8_ - 1;
      _level0.TIMELINE.SET_HEADER(this.currentKey.menuIconTitle);
   }
   function navigate(direction)
   {
      this.setState(this.currentKey,false);
      this.previousKey = this.currentKey;
      var _loc4_ = this.currentKey._name.split("_");
      var _loc3_ = Number(_loc4_[0]);
      var _loc2_ = Number(_loc4_[1]);
      switch(direction)
      {
         case "LEFT":
            this.currentKey = this.container[_loc3_ - 1 + "_" + _loc2_];
            if(!this.currentKey)
            {
               this.currentKey = this.container[this.numberOfColumns + "_" + _loc2_];
            }
            break;
         case "RIGHT":
            this.currentKey = this.container[_loc3_ + 1 + "_" + _loc2_];
            if(!this.currentKey)
            {
               this.currentKey = this.container["1_" + _loc2_];
            }
            break;
         case "UP":
            this.currentKey = this.container[_loc3_ + "_" + (_loc2_ - 1)];
            if(!this.currentKey)
            {
               this.currentKey = this.container[_loc3_ + "_" + this.numberOfRows];
            }
            break;
         case "DOWN":
            this.currentKey = this.container[_loc3_ + "_" + (_loc2_ + 1)];
            if(!this.currentKey)
            {
               this.currentKey = this.container[_loc3_ + "_1"];
            }
      }
      if(this.currentKey._visible == false)
      {
         this.currentKey = this.previousKey;
      }
      this.currentSelection = this.currentKey._id;
      com.rockstargames.ui.game.GameInterface.call("SET_GLOBAL_ACTIONSCRIPT_FLAG",com.rockstargames.ui.game.GameInterface.SCRIPT_TYPE,9,this.currentSelection);
      this.setState(this.currentKey,true);
      _level0.TIMELINE.SET_HEADER(this.currentKey.menuIconTitle);
   }
   function GET_CURRENT_SELECTION()
   {
      return this.currentSelection;
   }
   function setIcon(target, menuIconFrameEnum, iconAlpha)
   {
      var _loc4_;
      if(target != undefined)
      {
         if(iconAlpha == undefined)
         {
            iconAlpha = 100;
         }
         _loc4_ = com.rockstargames.gtav.cellphone.IconLabels.lookUp(menuIconFrameEnum);
         target.homeMenuIcons.gotoAndStop(_loc4_[1]);
         target.homeMenuIcons._alpha = iconAlpha;
         if(menuIconFrameEnum == 1)
         {
            this.cameraItem = target;
         }
      }
   }
   function setState(item, isActive)
   {
      var _loc3_;
      if(item != undefined)
      {
         _loc3_ = item.homeMenuIcons._alpha;
         if(isActive)
         {
            com.rockstargames.ui.utils.Colour.Colourise(item.background,this.whiteRGB[0],this.whiteRGB[1],this.whiteRGB[1],100);
            if(item != this.cameraItem)
            {
               com.rockstargames.ui.utils.Colour.Colourise(item.homeMenuIcons,this.currentStyle[1][0],this.currentStyle[1][1],this.currentStyle[1][2],_loc3_);
            }
            else
            {
               com.rockstargames.ui.utils.Colour.Colourise(item.homeMenuIcons,this.whiteRGB[0],this.whiteRGB[1],this.whiteRGB[1],_loc3_);
            }
         }
         else
         {
            com.rockstargames.ui.utils.Colour.Colourise(item.background,this.currentStyle[1][0],this.currentStyle[1][1],this.currentStyle[1][2],100);
            com.rockstargames.ui.utils.Colour.Colourise(item.homeMenuIcons,this.whiteRGB[0],this.whiteRGB[1],this.whiteRGB[1],_loc3_);
         }
      }
   }
}

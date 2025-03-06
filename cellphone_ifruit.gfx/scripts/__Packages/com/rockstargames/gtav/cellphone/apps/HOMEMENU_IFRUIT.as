class com.rockstargames.gtav.cellphone.apps.HOMEMENU_IFRUIT extends MovieClip
{
   var CONTENT;
   var container;
   var currentID;
   var currentKey;
   var previousKey;
   var numberOfRows = 3;
   var numberOfColumns = 3;
   var dataProviderUI = new Array();
   var currentSelection = -1;
   function HOMEMENU_IFRUIT()
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
      if(this.currentID == undefined)
      {
         this.currentID = 4;
      }
      var _loc9_ = undefined;
      var _loc10_ = undefined;
      var _loc8_ = 0;
      var _loc6_ = undefined;
      var _loc4_ = 1;
      var _loc5_ = 1;
      var _loc3_ = 0;
      while(_loc3_ < 9)
      {
         var _loc2_ = _loc4_ + "_" + _loc5_;
         var _loc7_ = "c" + _loc4_ + "_" + _loc5_;
         if(this.container[_loc7_])
         {
            this.container[_loc7_]._name = _loc2_;
         }
         _loc9_ = this.dataProviderUI[_loc3_][0];
         _loc8_ = this.dataProviderUI[_loc3_][1];
         _loc10_ = this.dataProviderUI[_loc3_][2];
         _loc6_ = this.dataProviderUI[_loc3_][3];
         if(_loc6_ == undefined)
         {
            _loc6_ = 100;
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
         if(_loc10_ != undefined)
         {
            this.container[_loc2_].menuIconTitle = _loc10_;
         }
         this.container[_loc2_].homeMenuIcons.iconIndicator.gotoAndStop(1);
         if(_loc9_ != undefined)
         {
            this.setIcon(this.container[_loc2_],_loc9_,_loc6_);
            if(_loc8_ > 0)
            {
               this.container[_loc2_].homeMenuIcons.iconIndicator.gotoAndStop(2);
               this.container[_loc2_].homeMenuIcons.menuIconInfo.text = String(_loc8_);
            }
            else
            {
               this.container[_loc2_].homeMenuIcons.iconIndicator.gotoAndStop(1);
               this.container[_loc2_].homeMenuIcons.menuIconInfo.text = "";
            }
            this.container[_loc2_]._visible = true;
         }
         else
         {
            this.container[_loc2_]._visible = false;
            if(_loc5_ == 3)
            {
               this.container.reflectionBar["refIcon" + _loc4_]._visible = false;
            }
         }
         _loc4_ = _loc4_ + 1;
         if(_loc4_ > this.numberOfColumns)
         {
            _loc5_ = _loc5_ + 1;
            _loc4_ = 1;
         }
         _loc3_ = _loc3_ + 1;
      }
      this.numberOfRows = _loc5_ - 1;
      if(this.currentKey.menuIconTitle)
      {
         _level0.TIMELINE.SET_HEADER(this.currentKey.menuIconTitle);
      }
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
      if(target != undefined)
      {
         var _loc2_ = com.rockstargames.gtav.cellphone.IconLabels.lookUp(menuIconFrameEnum);
         target.homeMenuIcons.gotoAndStop(_loc2_[1]);
         target.homeMenuIcons._alpha = iconAlpha;
      }
   }
   function setState(item, isActive)
   {
      if(item != undefined)
      {
         if(isActive)
         {
            item.background._visible = true;
            item.homeMenuIcons._xscale = 120;
            item.homeMenuIcons._yscale = 120;
         }
         else
         {
            item.background._visible = false;
            item.homeMenuIcons._xscale = 100;
            item.homeMenuIcons._yscale = 100;
         }
      }
   }
}

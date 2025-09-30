class com.rockstargames.gtav.cellphone.apps.APP_NUMBERPAD extends MovieClip
{
   var CONTENT;
   var TIMELINE;
   var TextGreyHex;
   var TextWhiteHex;
   var col;
   var container;
   var currentKey;
   var currentStyle;
   var darkGreyRGB;
   var dataProviderUI;
   var gfxFileName;
   var greyRGB;
   var linkageID;
   var numberOfRows;
   var previousKey;
   var row;
   var whiteRGB;
   var numberOfColumns = 3;
   var columnSpace = 1;
   var rowSpace = 1;
   var offsetX = 0;
   var offsetY = 64;
   var currentSelection = 0;
   function APP_NUMBERPAD()
   {
      super();
   }
   function INITIALISE(mc)
   {
      this.TIMELINE = mc;
      this.CONTENT = this.TIMELINE;
   }
   function construct(_dataProviderUI)
   {
      if(_dataProviderUI != undefined || _dataProviderUI.length > 0)
      {
         this.dataProviderUI = _dataProviderUI;
      }
      var _loc2_ = this.TIMELINE.bg;
      com.rockstargames.ui.utils.Colour.Colourise(_loc2_,0,0,0,100);
      this.container.removeMovieClip();
      this.container = this.CONTENT.createEmptyMovieClip("container",this.CONTENT.getNextHighestDepth());
      this.col = 1;
      this.row = 1;
      this.linkageID = "numberPad-" + this.gfxFileName.substr(10);
      this.renderContainers();
      com.rockstargames.ui.game.GameInterface.call("SET_GLOBAL_ACTIONSCRIPT_FLAG",com.rockstargames.ui.game.GameInterface.SCRIPT_TYPE,9,this.currentSelection);
   }
   function renderContainers()
   {
      var _loc3_ = 0;
      var _loc2_;
      var _loc4_;
      var _loc5_;
      while(_loc3_ < 12)
      {
         _loc2_ = this.col + "_" + this.row;
         if(this.container[_loc2_] != undefined)
         {
            this.container[_loc2_].removeMovieClip();
         }
         this.container[_loc2_] = this.container.attachMovie(this.linkageID,_loc2_,this.container.getNextHighestDepth());
         this.container[_loc2_]._name = _loc2_;
         this.container[_loc2_]._id = _loc3_;
         this.container[_loc2_].asterisk._visible = false;
         this.setState(this.container[_loc2_],false);
         _loc4_ = (this.container[_loc2_]._width + this.columnSpace) * (this.col - 1) + this.offsetX;
         this.container[_loc2_]._x = _loc4_;
         _loc5_ = (this.container[_loc2_]._height + this.rowSpace) * (this.row - 1) + this.offsetY;
         this.container[_loc2_]._y = _loc5_;
         this.col = this.col + 1;
         if(this.col > this.numberOfColumns)
         {
            this.row = this.row + 1;
            this.col = 1;
         }
         _loc3_ = _loc3_ + 1;
      }
      this.numberOfRows = this.row - 1;
      this.currentKey = this.container["1_1"];
      this.setState(this.currentKey,true);
      this.currentSelection = this.currentKey._id;
      this.previousKey = this.container["1_1"];
      this.populateContent();
   }
   function populateContent(_dataProviderUI)
   {
      var _loc6_ = new Array("","ABC","DEF","GHI","JKL","MNO","PQRS","TUV","WXYZ","","","");
      this.col = 1;
      this.row = 1;
      var _loc2_ = 0;
      var _loc4_;
      var _loc5_;
      var _loc3_;
      while(_loc2_ < 12)
      {
         _loc4_ = this.col + "_" + this.row;
         _loc5_ = this.dataProviderUI[_loc2_];
         if(_loc5_ == "*")
         {
            this.container[_loc4_].asterisk._visible = true;
         }
         else
         {
            this.container[_loc4_].char.text = _loc5_;
         }
         _loc3_ = this.dataProviderUI[_loc2_ + 12];
         if(_loc3_ == undefined)
         {
            _loc3_ = _loc6_[_loc2_];
         }
         this.container[_loc4_].letters.text = _loc3_;
         this.col = this.col + 1;
         if(this.col > this.numberOfColumns)
         {
            this.row = this.row + 1;
            this.col = 1;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function navigate(direction)
   {
      this.setState(this.currentKey,false);
      this.previousKey = this.currentKey;
      var _loc4_ = this.currentKey._name.split("_");
      var _loc3_ = Number(_loc4_[0]);
      var _loc2_ = Number(_loc4_[1]);
      var _loc6_ = _loc3_;
      var _loc5_ = _loc2_;
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
      this.currentSelection = this.currentKey._id;
      com.rockstargames.ui.game.GameInterface.call("SET_GLOBAL_ACTIONSCRIPT_FLAG",com.rockstargames.ui.game.GameInterface.SCRIPT_TYPE,9,this.currentSelection);
      this.setState(this.currentKey,true);
   }
   function GET_CURRENT_SELECTION()
   {
      return this.currentSelection;
   }
   function setState(item, isActive)
   {
      if(isActive)
      {
         com.rockstargames.ui.utils.Colour.Colourise(item.background,this.currentStyle[1][0],this.currentStyle[1][1],this.currentStyle[1][2],100);
         com.rockstargames.ui.utils.Colour.Colourise(item.asterisk,this.whiteRGB[0],this.whiteRGB[1],this.whiteRGB[2],100);
         item.char.textColor = this.TextWhiteHex;
         item.letters.textColor = this.TextWhiteHex;
      }
      else
      {
         com.rockstargames.ui.utils.Colour.Colourise(item.background,this.darkGreyRGB[0],this.darkGreyRGB[1],this.darkGreyRGB[2],100);
         com.rockstargames.ui.utils.Colour.Colourise(item.asterisk,this.greyRGB[0],this.greyRGB[1],this.greyRGB[2],100);
         item.char.textColor = this.TextGreyHex;
         item.letters.textColor = this.TextGreyHex;
      }
   }
}

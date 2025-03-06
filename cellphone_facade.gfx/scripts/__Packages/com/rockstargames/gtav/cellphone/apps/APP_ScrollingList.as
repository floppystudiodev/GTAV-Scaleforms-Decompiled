class com.rockstargames.gtav.cellphone.apps.APP_ScrollingList extends MovieClip
{
   var dataProviderUI;
   var CONTENT;
   var currentID;
   var linkageID;
   var container;
   var row;
   var scrollBarTimeout;
   var scrollBar;
   var gfxFileName;
   var whiteRGB;
   var offWhiteRGB;
   var currentStyle;
   var currentItem;
   var previousItem;
   var defaultRowHeight = 48;
   var numberOfVisibleRows = 5;
   var rowSpace = 0;
   var offsetY = 64;
   var offsetX = 0;
   var gutterHeight = 240;
   var scrollerX = 250;
   var scrollamount = 20;
   var needsScrollbars = false;
   var arrayStartPoint = 0;
   var currentSelection = 0;
   function APP_ScrollingList()
   {
      super();
      this.dataProviderUI = new Array();
      this.CONTENT = this;
      if(this.currentID == undefined)
      {
         this.currentID = 0;
      }
      this.currentSelection = this.currentID;
   }
   function construct(parentContainer, linkage, params)
   {
      this.dataProviderUI = params;
      this.linkageID = linkage;
      this.container.removeMovieClip();
      this.container = parentContainer.createEmptyMovieClip("container",parentContainer.getNextHighestDepth());
      this.row = 1;
      this.arrayStartPoint = 0;
      if(this.dataProviderUI.length > 0)
      {
         if(this.numberOfVisibleRows >= this.dataProviderUI.length)
         {
            this.numberOfVisibleRows = this.dataProviderUI.length;
            this.needsScrollbars = false;
         }
         else
         {
            this.needsScrollbars = true;
         }
      }
      else
      {
         this.numberOfVisibleRows = 0;
         this.currentSelection = 0;
      }
      com.rockstargames.ui.game.GameInterface.call("SET_GLOBAL_ACTIONSCRIPT_FLAG",com.rockstargames.ui.game.GameInterface.SCRIPT_TYPE,9,this.currentSelection);
      clearInterval(this.scrollBarTimeout);
      this.scrollBar = new com.rockstargames.ui.controls.ScrollBar();
      this.scrollBar.construct(this.container,"scrubber","gutter",this.scrollerX,this.offsetY,this.gutterHeight);
      if(this.gfxFileName == "CELLPHONE_FACADE")
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.scrollBar.scrubber,this.whiteRGB[0],this.whiteRGB[1],this.whiteRGB[2],75);
         if(this._name == "SETTINGS" || this._name == "MISSION_REPEAT_LIST")
         {
            com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.bg,0,0,0,100);
         }
         else
         {
            com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.bg,this.offWhiteRGB[0],this.offWhiteRGB[1],this.offWhiteRGB[2],100);
         }
      }
      else
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.scrollBar.scrubber,0,0,0,50);
         com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.bg,this.currentStyle[4][0],this.currentStyle[4][1],this.currentStyle[4][2],100);
      }
      this.scrollBar.scrollBarContainer._alpha = 0;
      this.renderContainers();
      this.scrollBar.scrollBarContainer.swapDepths(this.scrollBar.scrollBarContainer.getDepth() + 100);
   }
   function populateContent()
   {
   }
   function renderContainers()
   {
      if(this.currentID == undefined)
      {
         this.currentID = 0;
      }
      if(this.currentID >= this.dataProviderUI.length)
      {
         this.currentID = this.dataProviderUI.length - 1;
      }
      var _loc5_ = undefined;
      var _loc6_ = undefined;
      _loc5_ = this.offsetY;
      if(this.arrayStartPoint == undefined)
      {
         this.arrayStartPoint = 0;
      }
      var _loc9_ = this.arrayStartPoint;
      var _loc8_ = this.numberOfVisibleRows - 1 + this.arrayStartPoint;
      if(this.currentID > _loc8_ || this.currentID < _loc9_)
      {
         var _loc7_ = this.currentID - (this.numberOfVisibleRows - 1);
         if(_loc7_ < 0)
         {
            _loc7_ = 0;
         }
         this.arrayStartPoint = _loc7_;
      }
      var _loc3_ = 0;
      while(_loc3_ < this.numberOfVisibleRows)
      {
         var _loc2_ = "listItem" + this.row;
         if(this.container[_loc2_] != undefined)
         {
            this.container[_loc2_].removeMovieClip();
         }
         this.container[_loc2_] = this.container.attachMovie(this.linkageID,_loc2_,this.container.getNextHighestDepth());
         this.container[_loc2_]._name = _loc2_;
         this.container[_loc2_]._x = this.container._x + this.offsetX;
         this.container[_loc2_]._y = _loc5_;
         _loc5_ += this.defaultRowHeight + this.rowSpace;
         var _loc4_ = _loc3_ + this.arrayStartPoint;
         if(_loc4_ == this.currentID)
         {
            this.currentItem = this.container[_loc2_];
            this.setState(this.currentItem,true);
            this.currentSelection = this.currentID;
            _loc6_ = this.container[_loc2_];
         }
         else
         {
            this.setState(this.container[_loc2_],false);
         }
         _loc6_ = this.container[_loc2_];
         this.row = this.row + 1;
         _loc3_ = _loc3_ + 1;
      }
      this.populateContent();
   }
   function navigate(direction)
   {
      this.setState(this.currentItem,false);
      this.previousItem = this.currentItem;
      var _loc3_ = this.currentItem._name.split("listItem");
      var _loc2_ = Number(_loc3_[1]);
      var _loc4_ = _loc2_;
      switch(direction)
      {
         case "UP":
            _loc2_ = _loc4_ - 1;
            this.setScrollBarVisibility(true);
            if(_loc2_ < 1)
            {
               if(this.arrayStartPoint < 1)
               {
                  _loc2_ = this.numberOfVisibleRows;
                  this.arrayStartPoint = this.dataProviderUI.length - this.numberOfVisibleRows;
                  this.populateContent();
               }
               else
               {
                  this.arrayStartPoint = this.arrayStartPoint - 1;
                  _loc2_ = _loc2_ + 1;
                  this.populateContent();
               }
            }
            break;
         case "DOWN":
            _loc2_ = _loc4_ + 1;
            this.setScrollBarVisibility(true);
            if(_loc2_ > this.numberOfVisibleRows)
            {
               if(this.arrayStartPoint >= this.dataProviderUI.length - this.numberOfVisibleRows)
               {
                  _loc2_ = 1;
                  this.arrayStartPoint = 0;
                  this.populateContent();
               }
               else
               {
                  this.arrayStartPoint = this.arrayStartPoint + 1;
                  _loc2_ = _loc2_ - 1;
                  this.populateContent();
               }
            }
      }
      this.currentItem = this.container["listItem" + _loc2_];
      _loc3_ = this.currentItem._name.split("listItem");
      var _loc6_ = Number(_loc3_[1]) + this.arrayStartPoint;
      this.currentSelection = _loc6_ - 1;
      var _loc5_ = this.getRowAsPercentage(this.currentSelection);
      this.scrollBar.scrollToPercentage(_loc5_);
      this.setState(this.currentItem,true);
      com.rockstargames.ui.game.GameInterface.call("SET_GLOBAL_ACTIONSCRIPT_FLAG",com.rockstargames.ui.game.GameInterface.SCRIPT_TYPE,9,this.currentSelection);
   }
   function getRowAsPercentage(rowNumber)
   {
      var _loc2_ = undefined;
      _loc2_ = rowNumber / (this.dataProviderUI.length - 1) * 100;
      return _loc2_;
   }
   function setState(item, isActive)
   {
   }
   function setScrollBarVisibility(isVisible)
   {
      if(this.needsScrollbars == true)
      {
         if(isVisible)
         {
            this.scrollBar.SHOW();
            clearInterval(this.scrollBarTimeout);
            this.scrollBarTimeout = setInterval(this,"setScrollBarVisibility",300,false);
         }
         else
         {
            this.scrollBar.HIDE();
            clearInterval(this.scrollBarTimeout);
         }
      }
   }
   function GET_CURRENT_SELECTION()
   {
      return this.currentSelection;
   }
   function CLEAN_UP_DATA()
   {
      this.dataProviderUI = [];
   }
   function CLOSE_APP()
   {
      clearInterval(this.scrollBarTimeout);
      this.container.removeMovieClip();
   }
}

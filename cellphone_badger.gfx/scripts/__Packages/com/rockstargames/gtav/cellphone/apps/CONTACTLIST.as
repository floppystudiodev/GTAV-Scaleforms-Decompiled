class com.rockstargames.gtav.cellphone.apps.CONTACTLIST extends MovieClip
{
   var CONTENT;
   var TextBlackHex;
   var TextWhiteHex;
   var blackRGB;
   var container;
   var currentID;
   var currentItem;
   var currentStyle;
   var dataProviderUI;
   var gfxFileName;
   var linkageID;
   var numberOfVisibleRows;
   var offWhiteRGB;
   var scrollBar;
   var scrollBarTimeout;
   var whiteRGB;
   var defaultRowHeight = 48;
   var rowSpace = 0;
   var columnSpace = 0;
   var isLandscape = false;
   var offsetY = 64;
   var offsetX = 0;
   var gutterHeight = 240;
   var scrollerX = 250;
   var scrollamount = 20;
   var needsScrollbars = false;
   var arrayStartPoint = 0;
   var offStateAlpha = 60;
   var currentSelection = -1;
   function CONTACTLIST()
   {
      super();
      _global.gfxExtensions = true;
      this.scrollBar = new com.rockstargames.ui.controls.ScrollBar();
      this.numberOfVisibleRows = 5;
      this.CONTENT = this;
   }
   function construct()
   {
      this.dataProviderUI = _level0.TIMELINE.contactsDataProviderUI;
      clearInterval(this.scrollBarTimeout);
      this.linkageID = "listItemMC";
      this.numberOfVisibleRows = 5;
      this.removeAllContacts();
      if(this.container != undefined)
      {
         this.container.removeMovieClip();
      }
      this.container = this.createEmptyMovieClip("container",this.getNextHighestDepth());
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
         this.currentSelection = 0;
      }
      else
      {
         this.numberOfVisibleRows = 0;
         this.currentSelection = -1;
      }
      this.scrollBar.construct(this,"scrubber","gutter",this.scrollerX,this.offsetY,this.gutterHeight);
      if(this.gfxFileName == "CELLPHONE_FACADE")
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.scrollBar.scrubber,this.whiteRGB[0],this.whiteRGB[1],this.whiteRGB[2],75);
      }
      else
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.scrollBar.scrubber,0,0,0,50);
      }
      this.scrollBar.scrollBarContainer._alpha = 0;
      this.renderContainers();
      this.scrollBar.scrollBarContainer.swapDepths(this.scrollBar.scrollBarContainer.getDepth() + 100);
      com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.bg,this.currentStyle[4][0],this.currentStyle[4][1],this.currentStyle[4][2],100);
      this.populateContent();
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
      var _loc4_ = this.arrayStartPoint;
      var _loc3_ = this.arrayStartPoint + (this.numberOfVisibleRows - 1);
      var _loc2_;
      if(this.currentID > _loc3_ || this.currentID < _loc4_)
      {
         _loc2_ = this.currentID - (this.numberOfVisibleRows - 1);
         if(_loc2_ < 0)
         {
            _loc2_ = 0;
         }
         this.arrayStartPoint = _loc2_;
      }
      this.currentSelection = this.currentID;
      this.currentItem = this.container["listItem" + this.currentID];
   }
   function populateContent()
   {
      this.dataProviderUI = _level0.TIMELINE.contactsDataProviderUI;
      this.CONTENT.messageTF.autoSize = "center";
      this.CONTENT.messageTF.text = "";
      var _loc3_;
      var _loc2_;
      var _loc4_;
      var _loc6_;
      var _loc5_;
      if(this.numberOfVisibleRows > 0)
      {
         if(this.arrayStartPoint - 1 >= 0)
         {
            this.createContact(this.arrayStartPoint - 1);
         }
         _loc3_ = 0;
         while(_loc3_ < this.numberOfVisibleRows)
         {
            _loc2_ = _loc3_ + this.arrayStartPoint;
            _loc4_ = "listItem" + _loc2_;
            if(this.container[_loc4_] == undefined)
            {
               this.createContact(_loc2_);
            }
            _loc6_ = Boolean(this.dataProviderUI[_loc2_][0]);
            this.container[_loc4_].missed_call_icon._visible = _loc6_;
            if(this.dataProviderUI[_loc2_][1] != undefined)
            {
               if(this.dataProviderUI[_loc2_][3] == undefined || this.dataProviderUI[_loc2_][3] == "")
               {
                  this.container[_loc4_].contactNameMCcond._x = 2;
                  this.container[_loc4_].contactNameMCcond._width = 251;
               }
               _loc5_ = this.dataProviderUI[_loc2_][1].split("<FONT COLOR=\'#F0F0F0\'>").join("");
               this.container[_loc4_].contactNameMC.multiline = true;
               this.container[_loc4_].contactNameMC.autoSize = "left";
               this.container[_loc4_].contactNameMC._height = 27;
               if(this.dataProviderUI[_loc2_][3].substr(0,5) != "CHAR_" || this.dataProviderUI[_loc2_][3] == "CHAR_HUMANDEFAULT")
               {
                  this.container[_loc4_].contactNameMCcond.textAutoSize = "shrink";
                  this.container[_loc4_].contactNameMCcond.text = _loc5_;
               }
               else
               {
                  this.container[_loc4_].contactNameMC.text = _loc5_;
                  if(this.container[_loc4_].contactNameMC._height > 27)
                  {
                     this.container[_loc4_].contactNameMC._y = 1;
                  }
                  else
                  {
                     this.container[_loc4_].contactNameMC._y = 10;
                  }
               }
            }
            if(_loc2_ == this.currentSelection)
            {
               this.currentItem = this.container[_loc4_];
               this.setState(this.currentItem,true);
            }
            else
            {
               this.setState(this.container[_loc4_],false);
            }
            _loc3_ = _loc3_ + 1;
         }
         if(_loc2_ + 1 < this.dataProviderUI.length)
         {
            this.createContact(_loc2_ + 1);
         }
         _loc3_ = 0;
         while(_loc3_ < this.dataProviderUI.length)
         {
            if(_loc3_ < this.arrayStartPoint - 1 || _loc3_ > _loc2_ + 1)
            {
               _loc4_ = "listItem" + _loc3_;
               if(this.container[_loc4_].txd != undefined)
               {
                  this.container[_loc4_].REMOVE_CONTACT();
                  delete this.container[_loc4_];
                  this.container[_loc4_].removeMovieClip();
               }
            }
            _loc3_ = _loc3_ + 1;
         }
      }
      else
      {
         com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"CELL_232",this.CONTENT.messageTF);
      }
   }
   function createContact(index)
   {
      var _loc2_ = "listItem" + index;
      var _loc3_;
      if(this.container[_loc2_].txd == undefined)
      {
         this.container[_loc2_] = this.container.attachMovie(this.linkageID,_loc2_,index + 1);
         this.container[_loc2_].missed_call_icon._visible = false;
         this.container[_loc2_].gfxFileName = this.gfxFileName;
         this.container[_loc2_]._y = this.offsetY + index * (this.defaultRowHeight + this.rowSpace);
         _loc3_ = this.dataProviderUI[index][3];
         if(_loc3_ != "" && _loc3_ != undefined)
         {
            this.container[_loc2_].DISPLAY_CONTACT(_loc3_,_loc2_);
         }
      }
   }
   function removeAllContacts()
   {
      var _loc3_ = 0;
      var _loc2_;
      while(_loc3_ < this.dataProviderUI.length)
      {
         _loc2_ = "listItem" + _loc3_;
         if(this.container[_loc2_] != undefined)
         {
            this.container[_loc2_].REMOVE_CONTACT();
            delete this.container[_loc2_];
            this.container[_loc2_].removeMovieClip();
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function TXD_HAS_LOADED(textureDict, success, uniqueID)
   {
      if(success)
      {
         this.container[uniqueID].gfxFileName = this.gfxFileName;
         this.container[uniqueID].TXD_HAS_LOADED(textureDict,success,uniqueID);
      }
   }
   function ADD_TXD_REF_RESPONSE(textureDict, uniqueID, success)
   {
      if(success)
      {
         this.container[uniqueID].gfxFileName = this.gfxFileName;
         this.container[uniqueID].ADD_TXD_REF_RESPONSE(textureDict,uniqueID,success);
      }
   }
   function setState(item, isActive)
   {
      if(item.background != undefined)
      {
         if(this.numberOfVisibleRows > 0)
         {
            if(this.gfxFileName == "CELLPHONE_FACADE")
            {
               if(isActive)
               {
                  com.rockstargames.ui.utils.Colour.Colourise(item.background,this.currentStyle[1][0],this.currentStyle[1][1],this.currentStyle[1][2],100);
                  item.contactNameMC.textColor = this.TextWhiteHex;
                  item.contactNameMCcond.textColor = this.TextWhiteHex;
               }
               else
               {
                  com.rockstargames.ui.utils.Colour.Colourise(item.background,this.blackRGB[0],this.blackRGB[1],this.blackRGB[2],100);
                  item.contactNameMC.textColor = this.TextWhiteHex;
                  item.contactNameMCcond.textColor = this.TextWhiteHex;
               }
            }
            else if(isActive)
            {
               com.rockstargames.ui.utils.Colour.Colourise(item.background,this.currentStyle[1][0],this.currentStyle[1][1],this.currentStyle[1][2],100);
               item.contactNameMC.textColor = this.TextWhiteHex;
               item.contactNameMCcond.textColor = this.TextWhiteHex;
            }
            else
            {
               com.rockstargames.ui.utils.Colour.Colourise(item.background,this.offWhiteRGB[0],this.offWhiteRGB[1],this.offWhiteRGB[2],100);
               item.contactNameMC.textColor = this.TextBlackHex;
               item.contactNameMCcond.textColor = this.TextBlackHex;
            }
         }
      }
   }
   function navigate(direction)
   {
      this.setState(this.currentItem,false);
      var _loc5_ = this.currentItem._name.split("listItem");
      var _loc2_ = Number(_loc5_[1]);
      var _loc3_ = _loc2_;
      switch(direction)
      {
         case "UP":
            _loc2_ = _loc3_ - 1;
            this.setScrollBarVisibility(true);
            if(_loc2_ < this.arrayStartPoint)
            {
               if(this.arrayStartPoint <= 0)
               {
                  this.arrayStartPoint = this.dataProviderUI.length - this.numberOfVisibleRows;
                  _loc2_ = this.arrayStartPoint + (this.numberOfVisibleRows - 1);
                  this.container._y = - this.arrayStartPoint * (this.defaultRowHeight + this.rowSpace);
                  if(this.numberOfVisibleRows > 7)
                  {
                     this.removeAllContacts();
                  }
               }
               else
               {
                  this.arrayStartPoint = this.arrayStartPoint - 1;
                  this.container._y += this.defaultRowHeight + this.rowSpace;
               }
               this.currentSelection = _loc2_;
               this.populateContent();
            }
            break;
         case "DOWN":
            _loc2_ = _loc3_ + 1;
            this.setScrollBarVisibility(true);
            if(_loc2_ > this.arrayStartPoint + (this.numberOfVisibleRows - 1))
            {
               if(this.arrayStartPoint >= this.dataProviderUI.length - this.numberOfVisibleRows)
               {
                  _loc2_ = 0;
                  this.arrayStartPoint = 0;
                  this.container._y = 0;
                  if(this.numberOfVisibleRows > 7)
                  {
                     this.removeAllContacts();
                  }
               }
               else
               {
                  this.arrayStartPoint = this.arrayStartPoint + 1;
                  this.container._y -= this.defaultRowHeight + this.rowSpace;
               }
               this.currentSelection = _loc2_;
               this.populateContent();
            }
      }
      this.currentItem = this.container["listItem" + _loc2_];
      this.currentSelection = _loc2_;
      this.currentID = this.currentSelection;
      var _loc4_ = this.getRowAsPercentage(this.currentSelection);
      this.scrollBar.scrollToPercentage(_loc4_);
      this.setState(this.currentItem,true);
      com.rockstargames.ui.game.GameInterface.call("SET_GLOBAL_ACTIONSCRIPT_FLAG",com.rockstargames.ui.game.GameInterface.SCRIPT_TYPE,9,this.currentSelection);
      flash.external.ExternalInterface.call("FORCE_GARBAGE_COLLECTION",0,this.gfxFileName);
   }
   function getRowAsPercentage(rowNumber)
   {
      var _loc2_;
      _loc2_ = rowNumber / (this.dataProviderUI.length - 1) * 100;
      return _loc2_;
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
   function SHOW()
   {
      this.container._visible = true;
   }
   function HIDE()
   {
      this.container._visible = false;
   }
   function REMOVE()
   {
      this.dataProviderUI = [];
      this.removeAllContacts();
      this.container.removeMovieClip();
   }
   function CLOSE_APP()
   {
      clearInterval(this.scrollBarTimeout);
      this.container.removeMovieClip();
      this.REMOVE();
   }
}

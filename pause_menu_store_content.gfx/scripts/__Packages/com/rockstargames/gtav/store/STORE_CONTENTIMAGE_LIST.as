class com.rockstargames.gtav.store.STORE_CONTENTIMAGE_LIST extends com.rockstargames.gtav.store.EcommerceStoreBaseClass
{
   var COLUMN;
   var blackCol;
   var data;
   var imageHeight;
   var menuBgCol;
   var offset;
   var scrollIndicator;
   var scrollIndicatorbgMC;
   var whiteCol;
   var scrollPos = 0;
   var currentIndex = 0;
   var maxitems = 0;
   var maxVisItems = 4;
   var visItems = 4;
   var hasFocus = false;
   var arrayStartPoint = 0;
   var currentSelection = 0;
   var startIndex = 0;
   var endIndex = 0;
   var canScroll = false;
   var gfxFileName = "PAUSE_MENU_STORE_CONTENT";
   var inputDelay = 0;
   function STORE_CONTENTIMAGE_LIST()
   {
      super();
      this.data = new Array();
   }
   function SETUP_COLUMN(mc, _menuBgCol, _blackCol, _whiteCol)
   {
      this.COLUMN = mc;
      this.menuBgCol = _menuBgCol;
      this.blackCol = _blackCol;
      this.whiteCol = _whiteCol;
      this.scrollIndicator = this.COLUMN.scrollIndicatorMC;
      this.scrollIndicator._visible = false;
      this.scrollIndicatorbgMC = this.scrollIndicator.bgMC;
      if(this.scrollIndicatorbgMC != undefined)
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.scrollIndicatorbgMC,this.menuBgCol[0],this.menuBgCol[1],this.menuBgCol[2],this.menuBgCol[3]);
      }
   }
   function SET_DATA(_slot, _data)
   {
      this.data[_slot] = _data;
      this.maxitems = this.data.length;
      if(this.maxitems <= this.maxVisItems)
      {
         this.visItems = this.maxitems;
         this.canScroll = false;
      }
      else
      {
         this.visItems = this.maxVisItems;
         this.canScroll = true;
      }
      this.setImageHeight();
   }
   function SET_DATA_EMPTY(_slot)
   {
      var _loc2_;
      if(_slot == undefined)
      {
         this.removeAllSlots();
         this.data = new Array();
         this.maxitems = 0;
         this.visItems = 0;
         this.arrayStartPoint = -1;
         this.startIndex = -1;
         this.endIndex = -1;
         this.currentSelection = -1;
         this.currentIndex = 0;
         this.canScroll = false;
      }
      else
      {
         _loc2_ = "listItem" + _slot;
         if(typeof this.COLUMN[_loc2_].picMC == "movieclip")
         {
            this.COLUMN[_loc2_].REMOVE_PIC();
            this.COLUMN[_loc2_].removeMovieClip();
            this.data[_slot] = new Array();
            this.maxitems = this.data.length;
         }
      }
      if(this.maxitems <= this.maxVisItems)
      {
         this.visItems = this.maxitems;
         this.canScroll = false;
      }
      else
      {
         this.visItems = this.maxVisItems;
         this.canScroll = true;
      }
      this.REDRAW();
   }
   function setImageHeight()
   {
      switch(this.maxVisItems)
      {
         case 4:
            this.offset = 108;
            this.imageHeight = 106;
            break;
         case 2:
            this.offset = 216;
            this.imageHeight = 214;
            break;
         case 1:
            this.offset = 432;
            this.imageHeight = 430;
         default:
            return;
      }
   }
   function UPDATE_CONTENTIMAGE_SIZE(_maxVisItems)
   {
      var _loc2_ = this.maxVisItems;
      if(_maxVisItems != undefined)
      {
         this.maxVisItems = _maxVisItems;
      }
      this.removeAllSlots();
      this.setImageHeight();
   }
   function removeAllSlots()
   {
      var _loc3_ = 0;
      var _loc2_;
      while(_loc3_ < this.data.length)
      {
         _loc2_ = "listItem" + _loc3_;
         if(typeof this.COLUMN[_loc2_].picMC == "movieclip")
         {
            this.COLUMN[_loc2_].REMOVE_PIC();
            this.COLUMN[_loc2_].removeMovieClip();
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function highlightItem(_slot)
   {
      if(_slot == undefined)
      {
         _slot = this.currentSelection;
      }
      if(_slot >= this.maxitems)
      {
         _slot = this.maxitems - 1;
      }
      else if(_slot < 0)
      {
         _slot = 0;
      }
      if(_slot < this.arrayStartPoint)
      {
         this.arrayStartPoint = _slot;
      }
      if(_slot > this.endIndex)
      {
         this.arrayStartPoint = _slot - this.endIndex;
         if(this.arrayStartPoint < 0)
         {
            this.arrayStartPoint = 0;
         }
      }
      this.currentSelection = _slot;
      this.currentIndex = _slot;
      this.REDRAW();
   }
   function REDRAW()
   {
      if(this.arrayStartPoint == -1 && this.data.length > 0)
      {
         this.arrayStartPoint = 0;
      }
      var _loc3_;
      _loc3_ = this.arrayStartPoint;
      if(_loc3_ == -1)
      {
         _loc3_ = 0;
      }
      if(this.currentSelection == -1 && this.data.length > 0)
      {
         this.currentSelection = 0;
      }
      var _loc14_ = _loc3_;
      var _loc4_ = 0;
      var _loc7_ = 0;
      var _loc2_;
      var _loc5_;
      var _loc8_;
      var _loc6_;
      while(_loc7_ < this.data.length)
      {
         _loc2_ = "listItem" + _loc3_;
         if(_loc4_ < this.visItems)
         {
            if(this.data[_loc3_] != undefined)
            {
               if(this.COLUMN[_loc2_].picMC == undefined)
               {
                  _loc5_ = this.data[_loc3_][0];
                  if(_loc5_ == "")
                  {
                     _loc5_;
                  }
                  _loc8_ = _loc3_;
                  this.COLUMN[_loc2_] = this.COLUMN.attachMovie("contentImageListItem" + this.maxVisItems,_loc2_,_loc8_,{_name:_loc2_,_x:0,_y:_loc4_ * this.offset,txd:_loc5_,slot:_loc3_});
                  this.COLUMN[_loc2_].itemHilite._visible = false;
                  this.COLUMN[_loc2_].newItemIndicator._visible = false;
                  this.COLUMN[_loc2_].textBgMC._visible = false;
                  if(this.COLUMN[_loc2_].textBgMC != undefined)
                  {
                     com.rockstargames.ui.utils.Colour.Colourise(this.COLUMN[_loc2_].textBgMC,this.menuBgCol[0],this.menuBgCol[1],this.menuBgCol[2],this.menuBgCol[3]);
                  }
               }
               else
               {
                  this.COLUMN[_loc2_]._y = _loc4_ * this.offset;
               }
               if(this.data[_loc3_][0] != "")
               {
                  if(this.COLUMN[_loc2_].txd == undefined)
                  {
                     this.COLUMN[_loc2_].txd = this.data[_loc3_][0];
                     com.rockstargames.ui.game.GameInterface.call("ADD_TXD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.gfxFileName,this.data[_loc3_][0],_loc3_.toString());
                  }
               }
               this.COLUMN[_loc2_].newItemIndicator._visible = Boolean(this.data[_loc3_][1]);
               if(this.data[_loc3_][2] == undefined)
               {
                  this.COLUMN[_loc2_].labelMC.titleTF.text = "";
                  this.COLUMN[_loc2_].labelMC._visible = false;
                  this.COLUMN[_loc2_].textBgMC._visible = false;
               }
               else
               {
                  this.COLUMN[_loc2_].labelMC.titleTF.htmlText = this.data[_loc3_][2];
                  this.COLUMN[_loc2_].labelMC._visible = true;
                  this.COLUMN[_loc2_].textBgMC._visible = true;
               }
               _loc6_ = false;
               if(_loc4_ == this.currentIndex && this.currentColumn == 1)
               {
                  _loc6_ = true;
                  this.currentSelection = _loc3_;
               }
               this.highlight(_loc3_,_loc6_);
            }
         }
         else if(typeof this.COLUMN[_loc2_].picMC == "movieclip")
         {
            this.COLUMN[_loc2_].REMOVE_PIC();
            this.COLUMN[_loc2_].removeMovieClip();
         }
         _loc4_ = _loc4_ + 1;
         if(this.data.length > 0)
         {
            if(this.canScroll)
            {
               _loc3_ = _loc3_ + 1;
               if(_loc3_ >= this.data.length)
               {
                  _loc3_ = 0;
               }
            }
            else if(_loc3_ <= this.data.length)
            {
               _loc3_ = _loc3_ + 1;
            }
         }
         _loc7_ = _loc7_ + 1;
      }
      if(this.data.length > 0)
      {
         this.startIndex = this.arrayStartPoint;
         this.endIndex = _loc3_ - 1;
         if(this.endIndex == -1)
         {
            this.endIndex = this.data.length - 1;
         }
      }
      this.updateScrollIndicator();
      if(this.maxitems == 0)
      {
         this.COLUMN._visible = false;
         _level0.TIMELINE.HIDE_COLUMN2(false);
      }
      else
      {
         this.COLUMN._visible = true;
         _level0.TIMELINE.HIDE_COLUMN2(true);
      }
   }
   function ADD_TXD_REF_RESPONSE(textureDict, uniqueID, success)
   {
      var _loc3_ = parseInt(uniqueID);
      var _loc2_ = this.COLUMN["listItem" + _loc3_];
      if(_loc2_ != undefined)
      {
         _loc2_.ADD_TXD_REF_RESPONSE(textureDict,uniqueID,success,this.imageHeight);
      }
      else
      {
         com.rockstargames.ui.game.GameInterface.call("REMOVE_TXD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.gfxFileName,textureDict);
      }
   }
   function updateScrollIndicator()
   {
      if(this.maxitems <= this.visItems)
      {
         this.scrollIndicator._visible = false;
      }
      else
      {
         this.scrollIndicator._visible = true;
      }
      if(this.maxitems == 0)
      {
         this.scrollIndicator.textTF.text = "";
      }
      else
      {
         this.scrollIndicator.textTF.text = this.currentSelection + 1 + " / " + this.maxitems;
      }
   }
   function SET_INPUT_EVENT(direction)
   {
      var _loc2_ = true;
      switch(direction)
      {
         case com.rockstargames.ui.game.GamePadConstants.DPADUP:
            this.currentIndex = this.currentIndex - 1;
            if(this.currentIndex < 0)
            {
               this.currentIndex = 0;
               _loc2_ = false;
               if(this.canScroll)
               {
                  _loc2_ = true;
                  if(this.arrayStartPoint < 1)
                  {
                     this.arrayStartPoint = this.data.length - 1;
                     break;
                  }
                  this.arrayStartPoint = this.arrayStartPoint - 1;
               }
            }
            break;
         case com.rockstargames.ui.game.GamePadConstants.DPADDOWN:
            this.currentIndex = this.currentIndex + 1;
            if(this.currentIndex >= this.visItems)
            {
               this.currentIndex = this.visItems - 1;
               _loc2_ = false;
               if(this.canScroll)
               {
                  _loc2_ = true;
                  if(this.arrayStartPoint >= this.data.length - 1)
                  {
                     this.arrayStartPoint = 0;
                     break;
                  }
                  this.arrayStartPoint = this.arrayStartPoint + 1;
               }
            }
      }
      if(_loc2_ == true)
      {
         com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"NAV_UP_DOWN","HUD_FRONTEND_DEFAULT_SOUNDSET");
      }
      this.updateScrollIndicator();
      this.REDRAW();
   }
   function GET_CURRENT_SELECTION()
   {
      return this.currentSelection;
   }
   function highlight(_slot, _h)
   {
      var _loc2_ = "listItem" + _slot;
      if(this.COLUMN[_loc2_] != undefined)
      {
         if(_h)
         {
            if(this.hasFocus == true)
            {
               this.COLUMN[_loc2_].itemHilite._visible = true;
               com.rockstargames.ui.utils.Colour.Colourise(this.COLUMN[_loc2_].picMC,255,255,255,100);
            }
         }
         else
         {
            this.COLUMN[_loc2_].itemHilite._visible = false;
            com.rockstargames.ui.utils.Colour.Colourise(this.COLUMN[_loc2_].picMC,220,220,220,100);
         }
         this.updateScrollIndicator();
      }
   }
   function SET_FOCUS(isFocused)
   {
      this.hasFocus = isFocused;
      var _loc2_;
      if(isFocused)
      {
         this.highlight(this.currentSelection,true);
         _loc2_ = 1;
      }
      else
      {
         this.highlight(this.currentSelection,false);
         _loc2_ = 0.3;
      }
      var _loc3_;
      var _loc4_;
      if(this.COLUMN.bgMC != undefined)
      {
         _loc3_ = new flash.geom.Transform(this.COLUMN.bgMC);
         _loc4_ = new flash.geom.ColorTransform(_loc2_,_loc2_,_loc2_,1,1,1,1,0);
         _loc3_.colorTransform = _loc4_;
      }
      if(this.COLUMN.scrollIndicatorMC != undefined)
      {
         _loc3_ = new flash.geom.Transform(this.COLUMN.scrollIndicatorMC);
         _loc4_ = new flash.geom.ColorTransform(_loc2_,_loc2_,_loc2_,1,1,1,1,0);
         _loc3_.colorTransform = _loc4_;
      }
      this.REDRAW();
   }
   function CURRENT_COLUMN(_column)
   {
      this.currentColumn = _column;
   }
}

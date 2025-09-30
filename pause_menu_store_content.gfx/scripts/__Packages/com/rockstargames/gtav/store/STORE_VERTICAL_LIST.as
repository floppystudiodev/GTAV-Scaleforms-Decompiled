class com.rockstargames.gtav.store.STORE_VERTICAL_LIST extends com.rockstargames.gtav.store.EcommerceStoreBaseClass
{
   var COLUMN;
   var blackCol;
   var data;
   var menuBgCol;
   var scrollIndicator;
   var scrollIndicatorbgMC;
   var whiteCol;
   var scrollPos = 0;
   var currentIndex = 0;
   var maxitems = 0;
   var maxVisItems = 16;
   var visItems = 16;
   var arrayStartPoint = 0;
   var currentSelection = 0;
   var itemOffset = 26.875;
   function STORE_VERTICAL_LIST()
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
   function REDRAW()
   {
      var _loc4_;
      var _loc3_ = 0;
      var _loc2_;
      var _loc5_;
      while(_loc3_ < this.maxVisItems)
      {
         _loc4_ = _loc3_ + this.arrayStartPoint;
         _loc2_ = "listItem" + _loc3_;
         if(this.data[_loc4_][0] != undefined)
         {
            if(this.COLUMN[_loc2_] == undefined)
            {
               this.COLUMN[_loc2_] = this.COLUMN.attachMovie("verticalMenuListItem",_loc2_,this.COLUMN.getNextHighestDepth(),{_name:_loc2_,_x:0,_y:_loc3_ * this.itemOffset});
            }
            this.COLUMN[_loc2_].labelMC.labelTF.text = this.data[_loc4_][0];
            this.COLUMN[_loc2_].newItemIndicator._visible = Boolean(this.data[_loc4_][1]);
            _loc5_ = false;
            if(_loc3_ == this.currentIndex)
            {
               _loc5_ = true;
            }
            this.highlight(_loc3_,_loc5_);
         }
         else if(this.COLUMN[_loc2_] != undefined)
         {
            this.COLUMN[_loc2_].removeMovieClip();
         }
         _loc3_ = _loc3_ + 1;
      }
      this.updateScrollIndicator();
      if(this.data.length == 0)
      {
         this.COLUMN._visible = false;
      }
      else
      {
         this.COLUMN._visible = true;
      }
   }
   function SET_DATA(_slot, _data)
   {
      this.data[_slot] = _data;
      var _loc3_ = 0;
      var _loc2_ = 0;
      while(_loc2_ < this.data.length)
      {
         if(this.data[_loc2_] != undefined)
         {
            _loc3_ = _loc3_ + 1;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.maxitems = _loc3_;
      this.visItems = this.maxVisItems;
      if(this.maxitems < this.maxVisItems)
      {
         this.visItems = this.maxitems;
      }
   }
   function SET_DATA_EMPTY(_slot)
   {
      if(_slot == undefined)
      {
         this.data = new Array();
      }
      else
      {
         this.data[_slot] = undefined;
      }
      var _loc3_ = 0;
      var _loc2_ = 0;
      while(_loc2_ < this.data.length)
      {
         if(this.data[_loc2_] != undefined)
         {
            _loc3_ = _loc3_ + 1;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.maxitems = _loc3_;
      this.REDRAW();
   }
   function highlightItem(_slot)
   {
      if(_slot == undefined)
      {
         _slot = this.currentSelection;
      }
      if(_slot > this.maxitems)
      {
         _slot = this.maxitems - 1;
      }
      else if(_slot < 0)
      {
         _slot = 0;
      }
      this.arrayStartPoint = 0;
      this.currentSelection = _slot;
      this.currentIndex = _slot;
      if(this.currentIndex >= this.visItems)
      {
         this.currentIndex = this.visItems - 1;
         this.arrayStartPoint = this.currentIndex + (this.maxitems - this.visItems);
      }
      if(this.arrayStartPoint > this.maxitems - this.visItems)
      {
         this.arrayStartPoint = this.maxitems - this.visItems;
      }
      this.REDRAW();
   }
   function updateScrollIndicator()
   {
      if(this.maxitems <= this.visItems)
      {
         this.scrollIndicator._visible = false;
      }
      else
      {
         if(this.arrayStartPoint >= this.maxitems - this.visItems)
         {
            this.scrollIndicator.scrollArrowDown._alpha = 50;
         }
         else
         {
            this.scrollIndicator.scrollArrowDown._alpha = 100;
         }
         if(this.arrayStartPoint > 0)
         {
            this.scrollIndicator.scrollArrowUp._alpha = 100;
         }
         else
         {
            this.scrollIndicator.scrollArrowUp._alpha = 50;
         }
         this.scrollIndicator._visible = true;
      }
      this.currentSelection = this.currentIndex + this.arrayStartPoint;
      this.scrollIndicator.textTF.text = this.currentSelection + 1 + " / " + this.maxitems;
   }
   function SET_INPUT_EVENT(direction)
   {
      switch(direction)
      {
         case com.rockstargames.ui.game.GamePadConstants.DPADUP:
            this.currentIndex = this.currentIndex - 1;
            com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"NAV_UP_DOWN","HUD_FRONTEND_DEFAULT_SOUNDSET");
            if(this.currentIndex < 0)
            {
               if(this.arrayStartPoint < 1)
               {
                  this.currentIndex = this.visItems - 1;
                  this.arrayStartPoint = this.maxitems - this.visItems;
               }
               else
               {
                  this.currentIndex = 0;
                  this.arrayStartPoint = this.arrayStartPoint - 1;
               }
            }
            this.REDRAW();
            break;
         case com.rockstargames.ui.game.GamePadConstants.DPADDOWN:
            this.currentIndex = this.currentIndex + 1;
            com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"NAV_UP_DOWN","HUD_FRONTEND_DEFAULT_SOUNDSET");
            if(this.currentIndex >= this.visItems)
            {
               if(this.arrayStartPoint >= this.maxitems - this.visItems)
               {
                  this.currentIndex = 0;
                  this.arrayStartPoint = 0;
               }
               else
               {
                  this.currentIndex = this.visItems - 1;
                  this.arrayStartPoint = this.arrayStartPoint + 1;
               }
            }
            this.REDRAW();
      }
      this.currentSelection = this.currentIndex + this.arrayStartPoint;
      this.updateScrollIndicator();
   }
   function GET_CURRENT_SELECTION()
   {
      return this.currentSelection;
   }
   function highlight(_slot, _h)
   {
      var _loc4_ = "listItem" + _slot;
      var _loc3_ = this.COLUMN[_loc4_].bgMC;
      var _loc2_ = this.COLUMN[_loc4_].labelMC;
      if(_h == true)
      {
         if(_loc3_ != undefined)
         {
            com.rockstargames.ui.utils.Colour.Colourise(_loc3_,this.whiteCol[0],this.whiteCol[1],this.whiteCol[2],100);
         }
         if(_loc2_ != undefined)
         {
            com.rockstargames.ui.utils.Colour.Colourise(_loc2_,this.blackCol[0],this.blackCol[1],this.blackCol[2],100);
         }
         this.updateScrollIndicator();
      }
      else
      {
         if(_loc3_ != undefined)
         {
            com.rockstargames.ui.utils.Colour.Colourise(_loc3_,this.menuBgCol[0],this.menuBgCol[1],this.menuBgCol[2],this.menuBgCol[3]);
         }
         if(_loc2_ != undefined)
         {
            com.rockstargames.ui.utils.Colour.Colourise(_loc2_,this.whiteCol[0],this.whiteCol[1],this.whiteCol[2],100);
         }
         this.scrollIndicator._visible = false;
      }
   }
   function SET_FOCUS(isFocused)
   {
      if(isFocused)
      {
         this.highlight(this.currentIndex,true);
      }
      else
      {
         this.highlight(this.currentIndex,false);
      }
      this.updateScrollIndicator();
   }
   function CURRENT_COLUMN(_column)
   {
      this.currentColumn = _column;
   }
}

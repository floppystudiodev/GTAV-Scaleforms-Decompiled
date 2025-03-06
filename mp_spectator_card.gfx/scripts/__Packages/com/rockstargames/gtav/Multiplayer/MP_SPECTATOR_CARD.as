class com.rockstargames.gtav.Multiplayer.MP_SPECTATOR_CARD extends com.rockstargames.gtav.Multiplayer.MP_FREEMODE_PLAYER_LIST
{
   var scrollerMC;
   var CONTENT;
   var scrollContentMC;
   var model;
   var title;
   var scrollBase;
   static var MAX_TITLE_WIDTH = 189;
   static var VERIFIED_CHAR_SHORT = 247;
   static var VERIFIED_CHAR_LONG = 166;
   var rowOffset = 25;
   var titleHeight = 25;
   var activeList = new Array();
   var orderList = new Array();
   var playerNameIndex = 6;
   var txdIndex = 11;
   var topEdge = 0;
   var highlightIndex = 0;
   function MP_SPECTATOR_CARD()
   {
      super();
      this.dbgID = "MP_SPECTATOR_CARD";
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.scrollerMC = this.CONTENT.scrollerMC;
      this.scrollContentMC = this.CONTENT.scrollerMC.containerMC;
      this.model = new com.rockstargames.gtav.Multiplayer.MPFreemodePlayerListModel();
      this.model.createView(0,{id:0,x:0,y:0,rowSpacing:0,columnSpacing:0,container:this.scrollContentMC,linkage:["playerListItem"],visibleItems:16,selectstyle:com.rockstargames.ui.components.GUIView.SCROLL_SELECTSTYLE});
      this.createPool(32);
   }
   function createPool(num)
   {
      this.activeList = [];
      var _loc7_ = com.rockstargames.gtav.Multiplayer.MPFreemodePlayerListView(this.model.getCurrentView());
      var _loc4_ = _loc7_.itemList;
      var _loc5_ = "Ñ“Ñ“Ñ“Ñ“Ñ“";
      var _loc2_ = 0;
      while(_loc2_ < num)
      {
         this.SET_DATA_SLOT(_loc2_,0,0,2,"",0,_loc5_,false,0);
         var _loc3_ = com.rockstargames.gtav.Multiplayer.items.MPFreemodePlayerListItem(_loc4_[_loc2_]);
         this.setPoolItemActive(_loc3_,false);
         _loc3_.setAltTxdCallback();
         _loc2_ = _loc2_ + 1;
      }
   }
   function START_NEW_ORDER()
   {
      this.orderList = [];
   }
   function ADD_NEW_ORDER_ITEM(index)
   {
      this.orderList[index] = arguments;
   }
   function END_NEW_ORDER()
   {
      var _loc2_ = this.activeList.length;
      this.removefromList();
      this.addToList();
      this.setTopEdge(_loc2_);
      this.SET_HIGHLIGHT(this.highlightIndex);
      this.orderList = [];
   }
   function removefromList()
   {
      var _loc8_ = 0;
      var _loc6_ = undefined;
      var _loc7_ = "";
      while(_loc8_ < this.activeList.length)
      {
         _loc6_ = com.rockstargames.gtav.Multiplayer.items.MPFreemodePlayerListItem(this.activeList[_loc8_]);
         if(_loc6_ != undefined)
         {
            _loc7_ = _loc6_.playerName;
            var _loc5_ = false;
            var _loc3_ = 0;
            while(_loc3_ < this.orderList.length)
            {
               var _loc2_ = this.orderList[_loc3_];
               if(_loc2_ != undefined)
               {
                  var _loc4_ = _loc2_[this.playerNameIndex];
                  if(_loc7_ == _loc4_)
                  {
                     _loc5_ = true;
                     break;
                  }
               }
               _loc3_ = _loc3_ + 1;
            }
            if(!_loc5_)
            {
               this.setPoolItemActive(_loc6_,false);
            }
         }
         _loc8_ = _loc8_ + 1;
      }
   }
   function addToList()
   {
      var _loc5_ = undefined;
      var _loc12_ = com.rockstargames.gtav.Multiplayer.MPFreemodePlayerListView(this.model.getCurrentView());
      var _loc11_ = [];
      var _loc8_ = 0;
      while(_loc8_ < this.orderList.length)
      {
         var _loc2_ = this.orderList[_loc8_];
         if(_loc2_ != undefined)
         {
            var _loc9_ = _loc2_[this.playerNameIndex];
            var _loc7_ = true;
            var _loc4_ = 0;
            var _loc3_ = undefined;
            while(_loc4_ < this.activeList.length)
            {
               _loc3_ = com.rockstargames.gtav.Multiplayer.items.MPFreemodePlayerListItem(this.activeList[_loc4_]);
               if(_loc3_ != undefined)
               {
                  var _loc6_ = _loc3_.playerName;
                  if(_loc6_ == _loc9_)
                  {
                     _loc7_ = false;
                     break;
                  }
               }
               _loc4_ = _loc4_ + 1;
            }
            if(_loc7_)
            {
               _loc5_ = this.getItemFromPool();
               _loc5_.data = _loc2_;
               this.setPoolItemActive(_loc5_,true);
            }
            else
            {
               _loc5_ = _loc3_;
               _loc2_[this.txdIndex] = "";
               _loc2_[this.txdIndex + 1] = "";
               _loc5_.data = _loc2_;
            }
            var _loc10_ = _loc8_ * 25;
            _loc5_._y = _loc10_;
            _loc11_.push(_loc5_);
         }
         _loc8_ = _loc8_ + 1;
      }
      this.activeList = _loc11_;
   }
   function setTopEdge(oldLen)
   {
      var _loc2_ = this.orderList.length;
      if(oldLen > 16 && _loc2_ <= 16)
      {
         this.topEdge = 0;
         this.scrollContentMC._y = 0;
      }
      if(oldLen > 16 && _loc2_ > 16)
      {
         if(this.highlightIndex > 16)
         {
            this.topEdge = _loc2_ - 16;
            this.scrollContentMC._y = (- this.topEdge) * 25;
         }
      }
   }
   function scrollFeild()
   {
      var _loc6_ = 0;
      var _loc5_ = this.activeList.length - 1;
      var _loc2_ = this.activeList.length;
      if(_loc2_ > 16)
      {
         _loc2_ = 16;
      }
      _loc2_ -= 1;
      if(this.highlightIndex < this.topEdge)
      {
         var _loc3_ = this.highlightIndex * 25;
         this.scrollContentMC._y = - _loc3_;
         this.topEdge = this.highlightIndex;
      }
      var _loc4_ = this.topEdge + _loc2_;
      if(this.highlightIndex > _loc4_)
      {
         _loc3_ = (this.highlightIndex + 1) * 25;
         _loc3_ = 400 - _loc3_;
         this.scrollContentMC._y = _loc3_;
         this.topEdge = this.highlightIndex - _loc2_;
      }
   }
   function setPoolItemActive(poolItem, bool)
   {
      poolItem.isActive = bool;
      poolItem._visible = bool;
      poolItem._x = !bool ? -500 : 0;
   }
   function getItemFromPool()
   {
      var _loc5_ = com.rockstargames.gtav.Multiplayer.MPFreemodePlayerListView(this.model.getCurrentView());
      var _loc4_ = _loc5_.itemList;
      var _loc2_ = undefined;
      var _loc3_ = _loc4_.length;
      while(_loc3_--)
      {
         _loc2_ = com.rockstargames.gtav.Multiplayer.items.MPFreemodePlayerListItem(_loc4_[_loc3_]);
         if(!_loc2_.isActive)
         {
            return _loc2_;
         }
      }
   }
   function SET_ICON(index, iconEnum, rank)
   {
      var _loc3_ = this.model.getCurrentView().itemList;
      var _loc4_ = _loc3_[index];
      var _loc2_ = com.rockstargames.gtav.Multiplayer.items.MPFreemodePlayerListItem(_loc4_);
      if(iconEnum != undefined)
      {
         if(_loc2_)
         {
            _loc2_.setIcon(iconEnum,_loc2_.icon2MC);
            _loc2_.rankNumTF.text = rank == undefined ? "" : String(rank);
         }
      }
   }
   function DISPLAY_MIC()
   {
      var _loc8_ = arguments;
      var _loc9_ = this.model.getCurrentView().itemList;
      var _loc4_ = 0;
      while(_loc4_ < 16)
      {
         var _loc6_ = _loc8_[0] * 16 + _loc4_;
         var _loc7_ = _loc9_[_loc6_];
         var _loc3_ = com.rockstargames.gtav.Multiplayer.items.MPFreemodePlayerListItem(_loc7_);
         var _loc5_ = _loc8_[_loc6_ + 1];
         if(_loc5_ != undefined)
         {
            if(_loc3_)
            {
               _loc3_.setIcon(_loc5_,_loc3_.icon2MC);
               _loc3_.rankNumTF.text = "";
            }
         }
         _loc4_ = _loc4_ + 1;
      }
   }
   function SET_ITEM_TEXT_RIGHT(id, str)
   {
      var _loc3_ = this.model.getCurrentView().itemList;
      var _loc2_ = com.rockstargames.gtav.Multiplayer.items.MPFreemodePlayerListItem(_loc3_[id]);
      if(_loc2_)
      {
         _loc2_.setRightText(str,false);
      }
   }
   function SET_TITLE(str)
   {
      var _loc4_ = arguments[1];
      var _loc8_ = arguments[2];
      var _loc9_ = arguments[3];
      var _loc7_ = this.title.iconMC;
      var _loc11_ = this.title.labelMC;
      var _loc3_ = _loc11_.titleTF;
      var _loc5_ = this.title.diffTF;
      if(str == undefined || str == "")
      {
         _loc3_.htmlText = "";
         _loc5_.htmlText = "";
         this.title._visible = false;
         this.scrollerMC._y = 0;
      }
      else
      {
         var _loc6_ = 0;
         var _loc12_ = 4;
         if(_loc4_ == undefined || _loc4_ == "" || _loc4_ == false)
         {
            _loc5_.htmlText = "";
         }
         else
         {
            _loc5_.htmlText = _loc4_;
            _loc6_ = _loc5_.textWidth + _loc12_;
         }
         if(_loc8_ != undefined)
         {
            _loc7_.gotoAndStop(_loc8_);
            if(_loc9_ != undefined)
            {
               com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc7_,_loc9_);
            }
         }
         this.title.data = [0,0,0,0,0,0,str];
         _loc3_._width = 254 - _loc6_;
         _loc3_.textAutoSize = "shrink";
         _loc3_.autoSize = false;
         _loc3_.multiline = false;
         _loc3_.wordWrap = false;
         this.title._visible = true;
         this.scrollerMC._y = this.titleHeight;
      }
   }
   function SET_DATA_SLOT(_viewIndex, _slotIndex)
   {
      this.model.addDataToView(0,_viewIndex,arguments);
      if(this.scrollBase != undefined)
      {
         this.scrollBase.updateScroll();
      }
      var _loc4_ = com.rockstargames.gtav.Multiplayer.MPFreemodePlayerListView(this.model.getCurrentView());
      var _loc3_ = _loc4_.dataList[_viewIndex];
      this.model.getCurrentView().addDisplayItem(_viewIndex,_loc3_);
   }
   function COLLAPSE(collapse)
   {
      this.CONTENT._x = !collapse ? 0 : -25;
   }
   function SET_DESCRIPTION(cashStr, totalBetsStr, betsOnYouStr, helpStr)
   {
      if(cashStr == "" || cashStr == undefined)
      {
         this.CONTENT.descriptionMC._visible = false;
      }
      else
      {
         this.CONTENT.descriptionMC._visible = true;
         var _loc2_ = new com.rockstargames.ui.utils.HudColour();
         com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLUE,_loc2_);
         var _loc3_ = new com.rockstargames.ui.utils.HudColour();
         com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_RED,_loc3_);
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.CONTENT.descriptionMC.yourCashTF,"YOUR_CASH");
         this.CONTENT.descriptionMC.cashMC.itemTF.text = cashStr;
         this.CONTENT.descriptionMC.cashMC.bgMC._width = this.CONTENT.descriptionMC.cashMC.itemTF.textWidth + 10;
         this.CONTENT.descriptionMC.cashMC.bgMC._x = 145 - this.CONTENT.descriptionMC.cashMC.bgMC._width;
         com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.descriptionMC.cashMC.bgMC,_loc2_.r,_loc2_.g,_loc2_.b,30);
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.CONTENT.descriptionMC.yourTotalTF,"TOTAL_PLACED");
         this.CONTENT.descriptionMC.totalBetsMC.itemTF.text = totalBetsStr;
         this.CONTENT.descriptionMC.totalBetsMC.bgMC._width = this.CONTENT.descriptionMC.totalBetsMC.itemTF.textWidth + 10;
         this.CONTENT.descriptionMC.totalBetsMC.bgMC._x = 145 - this.CONTENT.descriptionMC.totalBetsMC.bgMC._width;
         com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.descriptionMC.totalBetsMC.bgMC,_loc2_.r,_loc2_.g,_loc2_.b,_loc2_.a);
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.CONTENT.descriptionMC.betsOnYouTF,"BETS_ON_YOU");
         this.CONTENT.descriptionMC.betsOnYouMC.itemTF.text = betsOnYouStr;
         this.CONTENT.descriptionMC.betsOnYouMC.bgMC._width = this.CONTENT.descriptionMC.betsOnYouMC.itemTF.textWidth + 10;
         this.CONTENT.descriptionMC.betsOnYouMC.bgMC._x = 145 - this.CONTENT.descriptionMC.betsOnYouMC.bgMC._width;
         com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.descriptionMC.betsOnYouMC.bgMC,_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
      }
      if(helpStr == "" || helpStr == undefined)
      {
         this.CONTENT.helpMC._visible = false;
      }
      else
      {
         this.CONTENT.helpMC.helpTF.text = helpStr;
         this.CONTENT.helpMC.helpTF.autoSize = "left";
         var _loc5_ = this.scrollerMC._y;
         var _loc7_ = _loc5_ + this.activeList.length * this.rowOffset;
         this.CONTENT.helpMC._y = _loc7_;
         this.CONTENT.helpMC.bgMC._height = this.CONTENT.helpMC.helpTF.textHeight + 12;
         this.CONTENT.helpMC._visible = true;
      }
      currView.params = {};
      var currView = com.rockstargames.gtav.Multiplayer.MPFreemodePlayerListView(this.model.getCurrentView());
      this.CONTENT.descriptionMC._y = this.scrollerMC._y + currView.dataList.length * this.rowOffset;
   }
   function DISPLAY_VIEW(viewIndex, itemIndex)
   {
      if(viewIndex == undefined)
      {
         viewIndex = 0;
      }
      super.DISPLAY_VIEW(viewIndex,itemIndex);
   }
   function SET_DATA_SLOT_EMPTY(viewIndex, itemIndex)
   {
      this.ON_DESTROY();
      super.SET_DATA_SLOT_EMPTY(viewIndex,itemIndex);
      this.model.getCurrentView().topEdge = 0;
   }
   function SET_HIGHLIGHT(_highlightIndex)
   {
      var _loc6_ = 0;
      var _loc4_ = this.activeList.length - 1;
      if(_loc4_ < 0)
      {
         _loc4_ = 0;
      }
      if(_highlightIndex < _loc6_)
      {
         _highlightIndex = _loc6_;
      }
      if(_highlightIndex > _loc4_)
      {
         _highlightIndex = _loc4_;
      }
      this.highlightIndex = _highlightIndex;
      var _loc2_ = 0;
      while(_loc2_ <= _loc4_)
      {
         var _loc3_ = com.rockstargames.gtav.Multiplayer.items.MPFreemodePlayerListItem(this.activeList[_loc2_]);
         _loc3_.highlighted = _loc2_ == this.highlightIndex;
         _loc2_ = _loc2_ + 1;
      }
      this.scrollFeild();
   }
   function REORDER()
   {
   }
   function REMOVE_FROM_SESSION_BY_ID(id)
   {
   }
   function SET_TIME_BY_ID(id, time)
   {
   }
}

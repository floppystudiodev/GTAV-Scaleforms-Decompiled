class com.rockstargames.gtav.Multiplayer.MP_FREEMODE_PLAYER_LIST extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
   var CONTENT;
   var title;
   var model;
   var scrollBase;
   static var MAX_TITLE_WIDTH = 189;
   static var VERIFIED_CHAR_SHORT = 247;
   static var VERIFIED_CHAR_LONG = 166;
   var rowOffset = 25;
   var titleHeight = 25;
   var racePositionList = new Array();
   function MP_FREEMODE_PLAYER_LIST()
   {
      super();
      this.dbgID = "MP_FREEMODE_PLAYER_LIST";
   }
   function INITIALISE(mc)
   {
      if(mc != undefined)
      {
         super.INITIALISE(mc);
      }
      else
      {
         this.CONTENT = this;
      }
      var _loc3_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG,_loc3_);
      this.title = com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuTitleItem(this.CONTENT.attachMovie("mpMMCardTitle","mpMMCardTitleMC",0,{_x:25,_y:0,_visible:false}));
      com.rockstargames.ui.utils.Colour.Colourise(this.title.bgMC,_loc3_.r,_loc3_.g,_loc3_.b,64);
      com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.descriptionMC.bgMC,_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
      com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.helpMC.bgMC,_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
      this.CONTENT.descriptionMC._visible = false;
      this.CONTENT.helpMC._visible = false;
      var _loc4_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_NORTH_BLUE,_loc4_);
      com.rockstargames.ui.utils.Colour.Colourise(this.title.verifiedMC,_loc4_.r,_loc4_.g,_loc4_.b,_loc4_.a);
      this.title.verifiedMC._visible = false;
      this.title.verifiedBGMC._visible = false;
      this.model = new com.rockstargames.gtav.Multiplayer.MPFreemodePlayerListModel();
      this.model.createView(0,{id:0,x:0,y:this.titleHeight,rowSpacing:0,columnSpacing:0,container:this.CONTENT,linkage:["playerListItem"],visibleItems:16,selectstyle:com.rockstargames.ui.components.GUIView.SCROLL_SELECTSTYLE});
   }
   function REORDER()
   {
      var _loc5_ = com.rockstargames.gtav.Multiplayer.MPFreemodePlayerListView(this.model.getCurrentView());
      var _loc4_ = _loc5_.itemList;
      var _loc3_ = _loc4_.length;
      if(_loc3_ > 0)
      {
         if(arguments.length <= 0)
         {
            return undefined;
         }
         this.racePositionList = arguments;
         this.repositionInOrder();
      }
   }
   function repositionInOrder()
   {
      if(this.racePositionList.length > 0)
      {
         var _loc8_ = com.rockstargames.gtav.Multiplayer.MPFreemodePlayerListView(this.model.getCurrentView());
         var _loc5_ = _loc8_.itemList;
         var _loc6_ = 0;
         var _loc7_ = _loc8_.params.rowSpacing;
         var _loc2_ = 0;
         var _loc4_ = 0;
         _loc2_ = 0;
         while(_loc2_ < this.racePositionList.length)
         {
            _loc4_ = this.racePositionList[_loc2_];
            if(typeof _loc4_ == "number")
            {
               var _loc3_ = com.rockstargames.gtav.Multiplayer.items.MPFreemodePlayerListItem(_loc5_[_loc4_]);
               _loc3_.hasMoved = false;
            }
            _loc2_ = _loc2_ + 1;
         }
         _loc2_ = 0;
         while(_loc2_ < this.racePositionList.length)
         {
            _loc4_ = this.racePositionList[_loc2_];
            if(typeof _loc4_ == "number")
            {
               _loc3_ = com.rockstargames.gtav.Multiplayer.items.MPFreemodePlayerListItem(_loc5_[_loc4_]);
               if(_loc3_.isActive != false && _loc3_.hasMoved == false)
               {
                  _loc3_._y = _loc6_;
                  _loc3_.hasMoved = true;
                  _loc6_ += _loc3_.bgMC._height + _loc7_;
               }
            }
            _loc2_ = _loc2_ + 1;
         }
      }
   }
   function REMOVE_FROM_SESSION_BY_ID(id)
   {
      var _loc4_ = com.rockstargames.gtav.Multiplayer.MPFreemodePlayerListView(this.model.getCurrentView());
      var _loc3_ = _loc4_.itemList;
      var _loc2_ = com.rockstargames.gtav.Multiplayer.items.MPFreemodePlayerListItem(_loc3_[id]);
      if(_loc2_)
      {
         _loc2_._visible = false;
         _loc2_.isActive = false;
         this.repositionInOrder();
      }
   }
   function SET_TIME_BY_ID(id, time)
   {
      var _loc3_ = this.model.getCurrentView().itemList;
      var _loc2_ = com.rockstargames.gtav.Multiplayer.items.MPFreemodePlayerListItem(_loc3_[id]);
      if(_loc2_)
      {
         _loc2_.setRank(time);
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
   function SET_ITEM_TEXT_RIGHT(id, str)
   {
      var _loc3_ = this.model.getCurrentView().itemList;
      var _loc2_ = com.rockstargames.gtav.Multiplayer.items.MPFreemodePlayerListItem(_loc3_[id]);
      if(_loc2_)
      {
         _loc2_.setRightText(str,false);
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
         this.model.getCurrentView().viewContainer._y = 0;
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
         this.model.getCurrentView().viewContainer._y = this.titleHeight;
      }
   }
   function SET_DATA_SLOT(_viewIndex, _slotIndex)
   {
      this.model.addDataToView(0,_viewIndex,arguments);
      if(this.scrollBase != undefined)
      {
         this.scrollBase.updateScroll();
      }
   }
   function COLLAPSE(collapse)
   {
      this.CONTENT._x = !collapse ? 0 : -25;
   }
   function SET_ROW_SPACING(_rowSpacing)
   {
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
         var _loc4_ = com.rockstargames.gtav.Multiplayer.MPFreemodePlayerListView(this.model.getCurrentView());
         var _loc6_ = _loc4_.viewContainer._y;
         this.CONTENT.helpMC._y = _loc6_ + _loc4_.dataList.length * this.rowOffset;
         this.CONTENT.helpMC.bgMC._height = this.CONTENT.helpMC.helpTF.textHeight + 12;
         this.CONTENT.helpMC._visible = true;
      }
      currView.params = {};
      var currView = com.rockstargames.gtav.Multiplayer.MPFreemodePlayerListView(this.model.getCurrentView());
      this.CONTENT.descriptionMC._y = currView.viewContainer._y + currView.dataList.length * this.rowOffset;
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
   function SET_HIGHLIGHT(i)
   {
      this.model.getCurrentView().index = i;
   }
   function SET_INPUT_EVENT(direction)
   {
      if(direction == com.rockstargames.ui.game.GamePadConstants.DPADUP)
      {
         this.model.prevItem();
      }
      if(direction == com.rockstargames.ui.game.GamePadConstants.DPADDOWN)
      {
         this.model.nextItem();
      }
   }
   function TXD_HAS_LOADED(textureDict, success, uniqueID)
   {
      if(success == true)
      {
         var il = com.rockstargames.ui.media.ImageLoaderMC(eval(this.CONTENT + "." + uniqueID));
         il.displayTxdResponse(textureDict);
      }
   }
   function TXD_ALREADY_LOADED(textureDict, uniqueID)
   {
      var il = com.rockstargames.ui.media.ImageLoaderMC(eval(this.CONTENT + "." + uniqueID));
      il.displayTxdResponse(textureDict);
   }
   function ADD_TXD_REF_RESPONSE(textureDict, uniqueID, success)
   {
      if(success == true)
      {
         var il = com.rockstargames.ui.media.ImageLoaderMC(eval(this.CONTENT + "." + uniqueID));
         il.displayTxdResponse(textureDict);
      }
   }
   function ON_DESTROY()
   {
      var _loc3_ = this.model.getCurrentView().itemList;
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         com.rockstargames.gtav.Multiplayer.items.MPFreemodePlayerListItem(_loc3_[_loc2_]).ON_DESTROY();
         _loc2_ = _loc2_ + 1;
      }
   }
}

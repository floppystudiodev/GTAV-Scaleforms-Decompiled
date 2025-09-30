class com.rockstargames.gtav.Multiplayer.MP_NEXT_JOB_SELECTION extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
   var CONTENT;
   var _hoverMC;
   var SELECTION_ITEM_WIDTH = 290;
   var GRID_ITEM_PADDING = 2;
   var HEADER_HEIGHT = 64;
   var NUM_DETAILS_ITEMS = 5;
   function MP_NEXT_JOB_SELECTION()
   {
      super();
      _global.gfxExtensions = true;
   }
   function INITIALISE(mc)
   {
      if(mc != undefined)
      {
         super.INITIALISE(mc);
         this.CONTENT._x = 206;
         this.CONTENT._y = 54;
      }
      var _loc3_ = 0;
      var _loc5_;
      var _loc4_;
      while(_loc3_ < this.NUM_DETAILS_ITEMS)
      {
         _loc5_ = _loc3_ * 27 + this.CONTENT.bgMC.descBGMC._y;
         _loc4_ = this.CONTENT.attachMovie("missiondetailsItem","detailsItemMC" + _loc3_,this.CONTENT.getNextHighestDepth(),{_x:580,_y:_loc5_});
         _loc4_._visible = false;
         _loc3_ = _loc3_ + 1;
      }
      this.CONTENT.titleTF.textAutoSize = "shrink";
      this.CONTENT.votesTF.textAutoSize = "shrink";
      this.CONTENT.attachMovie("selectionHighlight","highlightMC",this.CONTENT.getNextHighestDepth());
      this.CONTENT.highlightMC._visible = false;
      this._hoverMC = this.CONTENT.attachMovie("selectionHover","hoverMC",this.CONTENT.getNextHighestDepth());
      this._hoverMC._visible = false;
      this.CONTENT.attachMovie("mpFriendsList","lobbyListMC",this.CONTENT.getNextHighestDepth(),{_x:580,_y:this.HEADER_HEIGHT + this.GRID_ITEM_PADDING});
      this.CONTENT.lobbyListMC.INITIALISE();
      this.CONTENT.verifiedbgMC._visible = false;
      this.CONTENT.verifiedMC._visible = false;
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
   }
   function SET_TITLE(sTitle, sVotes)
   {
      this.CONTENT.titleTF.text = sTitle;
      this.CONTENT.titleTF.textAutoSize = "shrink";
      this.CONTENT.votesTF.text = !sVotes ? "" : sVotes;
      this.CONTENT.votesTF.textAutoSize = "shrink";
   }
   function SHOW_PLAYER_VOTE(i, sGamerName, r, g, b)
   {
      var _loc3_ = this.CONTENT["itemMC" + i];
      var _loc2_ = 0;
      while(this.CONTENT["itemMC" + _loc2_])
      {
         _loc3_ = this.CONTENT["itemMC" + _loc2_];
         _loc3_.findAndRemoveGamerName(sGamerName);
         _loc2_ = _loc2_ + 1;
      }
      com.rockstargames.gtav.Multiplayer.items.MPNextJobSelectionItem(this.CONTENT["itemMC" + i]).queueGamerNameFlash(sGamerName,com.rockstargames.ui.utils.Colour.RGBToHex(r,g,b));
   }
   function SET_GRID_ITEM(i, sTitle, sTXD, sTXN, textureLoadType, verifiedType, eIcon, bCheck, rpMult, cashMult, bDisabled, iconCol, apMult, cmMult)
   {
      var _loc2_ = this.CONTENT["itemMC" + i];
      var _loc4_;
      var _loc6_;
      var _loc5_;
      if(!_loc2_)
      {
         _loc4_ = this.CONTENT["itemMC" + (i - 3)];
         _loc6_ = i % 3 * this.SELECTION_ITEM_WIDTH;
         _loc5_ = (!_loc4_ ? this.HEADER_HEIGHT : _loc4_._y + _loc4_.getHeight()) + this.GRID_ITEM_PADDING;
         _loc2_ = com.rockstargames.gtav.Multiplayer.items.MPNextJobSelectionItem(this.CONTENT.attachMovie("selectionPanelItem","itemMC" + i,this.CONTENT.getNextHighestDepth(),{_x:_loc6_,_y:_loc5_}));
         _loc2_.swapDepths(this.CONTENT.highlightMC);
         this._hoverMC.swapDepths(this.CONTENT.getNextHighestDepth());
         _loc2_.attachMovie("mouseCatcher","mouseCatcher",_loc2_.getNextHighestDepth());
         com.rockstargames.ui.mouse.MouseBtn(_loc2_.mouseCatcher).setupGenericMouseInterface(i);
      }
      _loc2_.setData(sTitle,sTXD,sTXN,textureLoadType,verifiedType,eIcon,bCheck,rpMult,cashMult,bDisabled,iconCol,apMult,cmMult);
   }
   function SET_GRID_ITEM_VOTE(i, iNumVotes, voteBGColour, bShowCheckMark, bFlashBG)
   {
      com.rockstargames.gtav.Multiplayer.items.MPNextJobSelectionItem(this.CONTENT["itemMC" + i]).setVotes(iNumVotes,voteBGColour,bShowCheckMark,bFlashBG);
   }
   function SET_SELECTION(i, sTitle, sDetails, bHideHighlight)
   {
      var _loc4_ = this.CONTENT["itemMC" + i];
      this.CONTENT.highlightMC._visible = !bHideHighlight;
      this.CONTENT.highlightMC._x = _loc4_._x;
      this.CONTENT.highlightMC._y = _loc4_._y;
      this.CONTENT.highlightMC._height = _loc4_.getHeight();
      this.CONTENT.missionNameTF.text = sTitle;
      sDetails = com.rockstargames.gtav.utils.GTAVUIUtils.trimTextToFit(sDetails,this.CONTENT.missionDetailsTF);
      this.CONTENT.missionDetailsTF.text = sDetails;
      var _loc6_ = sTitle != "" || sDetails != "";
      this.CONTENT.bgMC.descBGMC._visible = _loc6_;
      i = 0;
      var _loc3_;
      while(i < this.NUM_DETAILS_ITEMS)
      {
         _loc3_ = com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeDetailsItem(this.CONTENT["detailsItemMC" + i]);
         _loc3_._visible = _loc3_._wasVisible = false;
         i = i + 1;
      }
   }
   function SET_HOVER(itemIndex, hideHover)
   {
      var _loc2_ = this.CONTENT["itemMC" + itemIndex];
      this._hoverMC._visible = !hideHover;
      this._hoverMC._x = _loc2_._x;
      this._hoverMC._y = _loc2_._y;
      this._hoverMC._height = _loc2_.getHeight();
   }
   function SET_DETAILS_ITEM(detailIndex)
   {
      var _loc3_ = com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeDetailsItem(this.CONTENT["detailsItemMC" + detailIndex]);
      _loc3_._visible = _loc3_._wasVisible = true;
      _loc3_.data = arguments;
      _loc3_.bgMC._y = 0;
      _loc3_.bgMC._height = 28;
   }
   function TXD_HAS_LOADED(sTXD, success, uID)
   {
      if(success)
      {
         com.rockstargames.ui.media.ImageLoaderMC(eval(uID)).displayTxdResponse(sTXD);
      }
   }
   function TXD_ALREADY_LOADED(sTXD, uID)
   {
      com.rockstargames.ui.media.ImageLoaderMC(eval(uID)).displayTxdResponse(sTXD);
   }
   function ADD_TXD_REF_RESPONSE(sTXD, uID, success)
   {
      if(success)
      {
         com.rockstargames.ui.media.ImageLoaderMC(eval(uID)).displayTxdResponse(sTXD);
      }
   }
   function SET_LOBBY_LIST_VISIBILITY(bShowList)
   {
      this.CONTENT.lobbyListMC._visible = bShowList;
      this.CONTENT.itemMC2._visible = !bShowList;
      this.CONTENT.itemMC5._visible = !bShowList;
      this.CONTENT.itemMC8._visible = !bShowList;
      this.CONTENT.bgMC.bg8MC._visible = !bShowList;
      this.CONTENT.bgMC.detailsMC._visible = !bShowList;
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < this.NUM_DETAILS_ITEMS)
      {
         _loc3_ = com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeDetailsItem(this.CONTENT["detailsItemMC" + _loc2_]);
         _loc3_._visible = !bShowList && _loc3_._wasVisible;
         _loc2_ = _loc2_ + 1;
      }
   }
   function SET_LOBBY_LIST_DATA_SLOT()
   {
      this.CONTENT.lobbyListMC.SET_DATA_SLOT.apply(this.CONTENT.lobbyListMC,arguments);
   }
   function UPDATE_LOBBY_LIST_DATA_SLOT()
   {
      this.CONTENT.lobbyListMC.UPDATE_SLOT.apply(this.CONTENT.lobbyListMC,arguments);
   }
   function DISPLAY_LOBBY_LIST_VIEW()
   {
      this.CONTENT.lobbyListMC.DISPLAY_VIEW.apply(this.CONTENT.lobbyListMC,arguments);
   }
   function SET_LOBBY_LIST_HIGHLIGHT()
   {
      this.CONTENT.lobbyListMC.SET_HIGHLIGHT.apply(this.CONTENT.lobbyListMC,arguments);
   }
   function SET_LOBBY_LIST_DATA_SLOT_EMPTY()
   {
      this.CONTENT.lobbyListMC.SET_DATA_SLOT_EMPTY.apply(this.CONTENT.lobbyListMC,arguments);
   }
   function INIT_LOBBY_LIST_SCROLL()
   {
      this.CONTENT.lobbyListMC.INIT_SCROLL_BAR.apply(this.CONTENT.lobbyListMC,arguments);
   }
   function SET_LOBBY_LIST_SCROLL()
   {
      this.CONTENT.lobbyListMC.SET_SCROLL_BAR.apply(this.CONTENT.lobbyListMC,arguments);
   }
   function CLEANUP_MOVIE()
   {
      var _loc3_ = 0;
      var _loc2_ = this.CONTENT["itemMC" + _loc3_];
      while(_loc2_)
      {
         com.rockstargames.ui.mouse.MouseBtn(_loc2_.mouseCatcher).dispose();
         _loc2_.onCleanup();
         _loc2_ = this.CONTENT["itemMC" + _loc3_];
         _loc3_ = _loc3_ + 1;
      }
   }
   function SET_ITEMS_GREYED_OUT(value)
   {
      var _loc4_ = !value ? 100 : 40;
      var _loc3_ = 0;
      var _loc2_ = this.CONTENT["itemMC" + _loc3_];
      while(_loc2_)
      {
         _loc2_.setGreyedOutAlpha(_loc4_);
         _loc2_ = this.CONTENT["itemMC" + _loc3_];
         _loc3_ = _loc3_ + 1;
      }
      this.CONTENT.bgMC.descBGMC._alpha = _loc4_;
      this.CONTENT.bgMC.bg6MC._alpha = _loc4_;
      this.CONTENT.bgMC.bg7MC._alpha = _loc4_;
      this.CONTENT.missionNameTF._alpha = _loc4_;
      this.CONTENT.missionDetailsTF._alpha = _loc4_;
      this.CONTENT.highlightMC._alpha = _loc4_;
   }
}

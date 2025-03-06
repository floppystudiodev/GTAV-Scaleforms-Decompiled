class com.rockstargames.gtav.ng.Replay.NEW_EDITOR extends com.rockstargames.ui.components.GUIController
{
   var columnXPositions;
   var headerPosition;
   var config;
   var isWideScreen;
   var safeLeft;
   var safeRight;
   var safeTop;
   var safeBottom;
   var isHiDef;
   var PLAYBACK_PANEL;
   var TIMELINE;
   var model_editor;
   var model_playback;
   var columnY;
   var mc_panel_1;
   var mc_panel_2;
   var mc_panel_3;
   var mc_panel_playback_menu;
   var model;
   var _projectSizeDisplayItem;
   var stateArray;
   var header;
   var clip_edit_header;
   var _bigBackground;
   var curView;
   var _forceClipEditMenuInvisible;
   var _colHasHelpText;
   var _colHasProjectSizeDisplay;
   var _helpTextItem;
   var _receivedColours;
   var _helpTextItemData;
   var _scrollBarItem;
   var _scrollBarLabel;
   var _scrollBarItemAudio;
   var _scrollBarLabelAudio;
   var _loadProjectInfo;
   var _scrollBarColId;
   var _currentHighlightedIndex;
   var _currentSelectedIndex;
   var _isDebug = false;
   var debug_state = 0;
   static var ID_COL_TYPE_LIST = 0;
   static var COL_TYPE_BASIC_PAGE = 1;
   static var ID_COL_TYPE_LOAD_PROJ_INFO = 2;
   static var COL_TYPE_IMG_PROJ_INFO = 3;
   static var COL_TYPE_IMG_ONE = 4;
   static var COL_TYPE_IMG_FOUR = 5;
   static var COL_TYPE_IMG_TWELVE = 6;
   static var COL_TYPE_TEXT_PLACEMENT = 7;
   static var ID_COL_TYPE_LIST_LONG_AUDIO = 8;
   var curViewIndex = 0;
   var addingDataViewIndex = 0;
   var curColId = -1;
   var curColTpye = -1;
   var _visibleItems = 16;
   var _colHasScrollBar = false;
   var _colHasScrollBarAudio = false;
   var MOVIE_MODE = 0;
   var MOVIE_STATE_EDITOR = 0;
   var MOVIE_STATE_CLIP_PLAYBACK = 1;
   var MOVIE_STATE_EDITOR_MENU = 2;
   var MOVIE_STATE_LOGO = 3;
   var gfxFileName = "NEW_EDITOR";
   var APPDATA_OPTIONS_ID = 0;
   var APPDATA_COL_INDEX_ID = 1;
   function NEW_EDITOR()
   {
      super();
      _global.gfxExtensions = true;
      this.columnXPositions = [207,497,787];
      this.headerPosition = new flash.geom.Point(207,56);
      this.config = new com.rockstargames.ui.utils.DisplayConfig();
      com.rockstargames.ui.game.GameInterface.call("SET_DISPLAY_CONFIG",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.config);
      this.SET_DISPLAY_CONFIG(this.config.screenWidth,this.config.screenHeight,this.config.safeTop,this.config.safeBottom,this.config.safeLeft,this.config.safeRight,this.config.isWideScreen,this.config.isCircleAccept,this.config.isAsian);
   }
   function SET_DISPLAY_CONFIG(_screenWidthPixels, _screenHeightPixels, _safeTopPercent, _safeBottomPercent, _safeLeftPercent, _safeRightPercent, _isWideScreen, _isHiDef, _isAsian)
   {
      this.isWideScreen = _isWideScreen;
      var _loc2_ = undefined;
      var _loc3_ = undefined;
      _loc2_ = 1280;
      _loc3_ = 720;
      this.safeLeft = Math.round(_loc2_ * _safeLeftPercent);
      this.safeRight = Math.round(_loc2_ * _safeRightPercent);
      this.safeTop = Math.round(_loc3_ * _safeTopPercent);
      this.safeBottom = Math.round(_loc3_ * _safeBottomPercent);
      this.isHiDef = _isHiDef;
      if(this.PLAYBACK_PANEL != null)
      {
         this.PLAYBACK_PANEL.initLayout();
      }
   }
   function INITIALISE(mc)
   {
      this.TIMELINE = mc;
      this.model_editor = new com.rockstargames.gtav.ng.Replay.ReplayModel();
      this.model_playback = new com.rockstargames.gtav.ng.Replay.ReplayModel();
      this.columnY = Math.floor(this.TIMELINE.bgMC._y + this.TIMELINE.bgMC._height + 5);
      this.setup();
      this.SET_MOVIE_MODE(2);
      this.initColourGrabbing();
   }
   function SET_MOVIE_MODE(movieMode)
   {
      this.showProjectSizeWidget(false);
      this.MOVIE_MODE = movieMode;
      switch(this.MOVIE_MODE)
      {
         case this.MOVIE_STATE_EDITOR:
            this.mc_panel_1._visible = false;
            this.mc_panel_2._visible = false;
            this.mc_panel_3._visible = false;
            this.mc_panel_playback_menu._visible = false;
            this.model = this.model_editor;
            this.SET_HEADER_VISIBLE(true);
            this.SET_CLIP_EDIT_HEADER_VISIBLE(false);
            break;
         case this.MOVIE_STATE_EDITOR_MENU:
            this.mc_panel_1._visible = true;
            this.mc_panel_2._visible = true;
            this.mc_panel_3._visible = true;
            this.mc_panel_playback_menu._visible = false;
            this.model = this.model_editor;
            this.SET_HEADER_VISIBLE(true);
            this.SET_CLIP_EDIT_HEADER_VISIBLE(false);
            this.showProjectSizeWidget(true);
            break;
         case this.MOVIE_STATE_CLIP_PLAYBACK:
            this.mc_panel_1._visible = false;
            this.mc_panel_2._visible = false;
            this.mc_panel_3._visible = false;
            this.mc_panel_playback_menu._visible = true;
            this.mc_panel_playback_menu._x = this.safeLeft;
            this.model = this.model_playback;
            this.SET_HEADER_VISIBLE(false);
            this.SET_CLIP_EDIT_HEADER_VISIBLE(true);
            break;
         case this.MOVIE_STATE_LOGO:
            this.mc_panel_1._visible = false;
            this.mc_panel_2._visible = false;
            this.mc_panel_3._visible = false;
            this.mc_panel_playback_menu._visible = false;
            this.SET_HEADER_VISIBLE(false);
            this.SET_CLIP_EDIT_HEADER_VISIBLE(false);
      }
      flash.external.ExternalInterface.call("FORCE_GARBAGE_COLLECTION",0,this.gfxFileName);
   }
   function showProjectSizeWidget(showWidget)
   {
      if(this._projectSizeDisplayItem != undefined)
      {
         this._projectSizeDisplayItem._visible = showWidget;
      }
   }
   function setup()
   {
      if(this.MOVIE_MODE == this.MOVIE_STATE_CLIP_PLAYBACK)
      {
         this.headerPosition = new flash.geom.Point(this.columnXPositions[0],27);
      }
      this.stateArray = [0,0,0];
      this.model_editor.columnMovieClips = [[],[]];
      this.model_playback.columnMovieClips = [[],[]];
      this.mc_panel_1 = this.TIMELINE.createEmptyMovieClip("mc_panel_1",this.TIMELINE.getNextHighestDepth());
      this.mc_panel_2 = this.TIMELINE.createEmptyMovieClip("mc_panel_2",this.TIMELINE.getNextHighestDepth());
      this.mc_panel_3 = this.TIMELINE.createEmptyMovieClip("mc_panel_3",this.TIMELINE.getNextHighestDepth());
      this.mc_panel_playback_menu = this.TIMELINE.createEmptyMovieClip("mc_panel_playback_menu",this.TIMELINE.getNextHighestDepth());
      this.header = this.TIMELINE.attachMovie("HEADER","HEADER",this.TIMELINE.getNextHighestDepth(),{_x:this.headerPosition.x,_y:this.headerPosition.y,_visible:true});
      this.clip_edit_header = this.TIMELINE.attachMovie("clip_edit_header","clip_edit_header",this.TIMELINE.getNextHighestDepth(),{_x:this.safeLeft,_y:Math.floor(this.safeTop),_visible:false});
      this.model_editor.columnMovieClips[0] = [this.mc_panel_1,this.mc_panel_2,this.mc_panel_3];
      this.model_playback.columnMovieClips[0] = [this.mc_panel_playback_menu];
      if(this._isDebug)
      {
         this.debug();
      }
   }
   function SET_HEADER_VISIBLE(isVisible)
   {
      this.header._visible = isVisible;
   }
   function SET_CLIP_EDIT_HEADER_VISIBLE(isVisible)
   {
      this.clip_edit_header._visible = isVisible;
      this._bigBackground._visible = isVisible;
   }
   function debug()
   {
   }
   function SET_CLIP_EDIT_HEADER(strL, strR)
   {
      this.clip_edit_header.titleTF.htmlText = strL;
      this.clip_edit_header.optionTF.htmlText = strR;
   }
   function SET_PAGE_HEADING(pageHeading)
   {
      this.header.headingTF.htmlText = pageHeading;
      this.header.titleMC.headingTF.htmlText = pageHeading;
   }
   function SET_PAGE_HEADING_RIGHT(pageHeading)
   {
      this.header.titleMC.headingRightTF.htmlText = pageHeading;
   }
   function BEGIN_ADDING_COLUMN_DATA(columnId, columnTpye, colTitle)
   {
      this.curColId = columnId;
      this.curColTpye = columnTpye;
      this.createColumn(this.curColId,this.curColTpye);
      this.curView = this.model.viewList[this.curColId];
      if(this.MOVIE_MODE == this.MOVIE_STATE_CLIP_PLAYBACK)
      {
         this.SET_HEADER_VISIBLE(false);
      }
      else if(!this._forceClipEditMenuInvisible)
      {
         this.SET_HEADER_VISIBLE(true);
      }
   }
   function END_ADDING_COLUMN_DATA(shouldRender, beActive)
   {
      if(shouldRender)
      {
         this.DISPLAY_VIEW(this.curColId);
      }
      if(beActive)
      {
         this.curViewIndex = this.curColId;
         this.curView = this.model.viewList[this.curViewIndex];
         this.model.setView(this.curViewIndex);
         if(this.MOVIE_MODE == this.MOVIE_STATE_CLIP_PLAYBACK)
         {
            if(!this._forceClipEditMenuInvisible)
            {
               this.SET_CLIP_EDIT_HEADER_VISIBLE(true);
            }
         }
      }
      if(this._colHasHelpText || this._colHasProjectSizeDisplay || this._colHasScrollBar || this._colHasScrollBarAudio)
      {
         var _loc6_ = this.curView.itemList.length - 1;
         if(_loc6_ > this.curView.visibleItems - 1)
         {
            _loc6_ = this.curView.visibleItems;
         }
         var _loc3_ = com.rockstargames.gtav.ng.Replay.ReplayBaseItem(this.curView.itemList[_loc6_]);
         var _loc5_ = _loc3_._y + _loc3_._height + 2;
         if(this._colHasHelpText && this._helpTextItem == undefined)
         {
            this._helpTextItem = com.rockstargames.gtav.ng.Replay.COL_TYPE_LIST_HELP(_loc3_._parent.attachMovie("COL_TYPE_LIST_HELP","helpTextItem",_loc3_._parent.getNextHighestDepth(),{_x:_loc3_._x,_y:_loc5_}));
            this._helpTextItem.initColours(this._receivedColours);
            if(this._helpTextItemData[0] != undefined && this._helpTextItemData[0] != "")
            {
               this._helpTextItem.data = this._helpTextItemData[0];
            }
         }
         if(this._colHasProjectSizeDisplay && this._projectSizeDisplayItem == undefined)
         {
            this._projectSizeDisplayItem = com.rockstargames.gtav.ng.Replay.COL_TYPE_LIST_PROJECT_SIZE(this.TIMELINE.attachMovie("COL_TYPE_LIST_PROJECT_SIZE","COL_TYPE_LIST_PROJECT_SIZE",this.TIMELINE.getNextHighestDepth(),{_x:(!this.isWideScreen ? _loc3_._parent._x - 40 : this.safeLeft),_y:this.safeBottom - 25}));
            this._projectSizeDisplayItem.initColors(this._receivedColours);
            if(this.MOVIE_MODE != this.MOVIE_STATE_EDITOR_MENU)
            {
               this._projectSizeDisplayItem._visible = false;
            }
         }
         if(this._colHasScrollBar && this._scrollBarItem == undefined)
         {
            var _loc8_ = _loc5_ - 2;
            this._scrollBarItem = com.rockstargames.gtav.ng.Replay.COL_TYPE_LIST_SCROLL(_loc3_._parent.attachMovie("COL_TYPE_LIST_SCROLL","scrollbarItem",_loc3_._parent.getNextHighestDepth(),{_x:_loc3_._x,_y:_loc8_}));
            this._scrollBarItem.initColors(this._receivedColours);
            this._scrollBarItem.label = this._scrollBarLabel;
         }
         if(this._colHasScrollBarAudio && this._scrollBarItemAudio == undefined)
         {
            _loc8_ = _loc5_ - 2;
            this._scrollBarItemAudio = com.rockstargames.gtav.ng.Replay.COL_TYPE_LIST_SCROLL(_loc3_._parent.attachMovie("COL_TYPE_LIST_SCROLL_AUDIO","scrollbarItemAudio",_loc3_._parent.getNextHighestDepth(),{_x:_loc3_._x,_y:_loc8_}));
            this._scrollBarItemAudio.initColors(this._receivedColours);
            this._scrollBarItemAudio.label = this._scrollBarLabelAudio;
         }
      }
      if(this.curColTpye == com.rockstargames.gtav.ng.Replay.NEW_EDITOR.ID_COL_TYPE_LOAD_PROJ_INFO)
      {
         var _loc0_ = null;
         var _loc10_ = this._loadProjectInfo = com.rockstargames.gtav.ng.Replay.ReplayView(this.model.viewList[this.curColId]).itemList[0];
         _loc10_.initColors(this._receivedColours);
      }
      if(this.curColTpye == com.rockstargames.gtav.ng.Replay.NEW_EDITOR.ID_COL_TYPE_LIST || this.curColTpye == com.rockstargames.gtav.ng.Replay.NEW_EDITOR.ID_COL_TYPE_LIST_LONG_AUDIO)
      {
         var _loc2_ = undefined;
         var _loc4_ = com.rockstargames.gtav.ng.Replay.ReplayView(this.model.viewList[this.curColId]).itemList;
         var _loc7_ = _loc4_.length;
         _loc2_ = _loc7_;
         while(_loc2_--)
         {
            com.rockstargames.gtav.ng.Replay.COL_TYPE_LIST(_loc4_[_loc2_]).initColours(this._receivedColours);
            if(this.MOVIE_MODE == this.MOVIE_STATE_CLIP_PLAYBACK)
            {
               com.rockstargames.gtav.ng.Replay.COL_TYPE_LIST(_loc4_[_loc2_]).HideBackground();
            }
         }
      }
      if(this.MOVIE_MODE == this.MOVIE_STATE_CLIP_PLAYBACK)
      {
         _loc4_ = com.rockstargames.gtav.ng.Replay.ReplayView(this.model.viewList[this.curColId]).itemList;
         _loc7_ = _loc4_.length;
         if(!this._bigBackground)
         {
            var _loc11_ = MovieClip(_loc4_[0]._parent);
            this._bigBackground = _loc11_.attachMovie("bigBackground","bigBackground",com.rockstargames.gtav.ng.Replay.COL_TYPE_LIST(_loc4_[0]).getDepth() - 1,{_width:288});
         }
         var _loc9_ = com.rockstargames.gtav.ng.Replay.COL_TYPE_LIST(_loc4_[_loc7_ - 1])._y + 25;
         this._bigBackground._height = _loc9_;
         com.rockstargames.ui.utils.Colour.Colourise(this._bigBackground,this._receivedColours[0][0],this._receivedColours[0][1],this._receivedColours[0][2],70);
      }
   }
   function ADD_COLUMN_ITEM_INACTIVE()
   {
      var _loc3_ = new Object();
      _loc3_.hasIcon = false;
      var _loc5_ = this.curView.dataList.length;
      var _loc4_ = arguments;
      _loc3_.columnID = this.curColId;
      _loc3_.itemID = _loc5_;
      _loc4_.unshift(this.curColId,_loc5_,_loc3_);
      this.SET_DATA_SLOT.apply(this,_loc4_);
   }
   function ADD_COLUMN_ITEM()
   {
      var _loc3_ = new Object();
      _loc3_.hasIcon = false;
      var _loc5_ = this.curView.dataList.length;
      var _loc4_ = arguments;
      _loc3_.columnID = this.curColId;
      _loc3_.itemID = _loc5_;
      _loc4_.unshift(this.curColId,_loc5_,_loc3_);
      this.SET_DATA_SLOT.apply(this,_loc4_);
   }
   function ADD_COLUMN_ITEM_WITH_OPTIONS()
   {
      var _loc3_ = new Object();
      _loc3_.hasIcon = false;
      _loc3_.hasOptions = true;
      var _loc5_ = this.curView.dataList.length;
      var _loc4_ = arguments;
      _loc3_.columnID = this.curColId;
      _loc3_.itemID = _loc5_;
      _loc4_.unshift(this.curColId,_loc5_,_loc3_);
      this.SET_DATA_SLOT.apply(this,_loc4_);
   }
   function ADD_COLUMN_ITEM_WITH_TWO_STRINGS()
   {
      var _loc3_ = new Object();
      _loc3_.hasIcon = false;
      _loc3_.hasOptions = false;
      var _loc5_ = this.curView.dataList.length;
      var _loc4_ = arguments;
      _loc3_.columnID = this.curColId;
      _loc3_.itemID = _loc5_;
      _loc4_.unshift(this.curColId,_loc5_,_loc3_);
      this.SET_DATA_SLOT.apply(this,_loc4_);
   }
   function ADD_COLUMN_ITEM_WITH_ICON()
   {
      var _loc3_ = new Object();
      _loc3_.hasIcon = true;
      var _loc5_ = this.curView.dataList.length;
      var _loc4_ = arguments;
      _loc3_.columnID = this.curColId;
      _loc3_.itemID = _loc5_;
      _loc4_.unshift(this.curColId,_loc5_,_loc3_);
      this.SET_DATA_SLOT.apply(this,_loc4_);
   }
   function ADD_COLUMN_HELP_TEXT()
   {
      this._colHasHelpText = true;
      this._helpTextItemData = arguments;
   }
   function ADD_COLUMN_HEADER()
   {
      var _loc3_ = new Object();
      _loc3_.isHeader = true;
      _loc3_.hasOptions = false;
      var _loc5_ = this.curView.dataList.length;
      var _loc4_ = arguments;
      _loc3_.columnID = this.curColId;
      _loc3_.itemID = _loc5_;
      _loc4_.unshift(this.curColId,_loc5_,_loc3_);
      this.SET_DATA_SLOT.apply(this,_loc4_);
   }
   function ADD_COLUMN_HEADER_WITH_TWO_STRINGS()
   {
      var _loc3_ = new Object();
      _loc3_.isHeader = true;
      _loc3_.hasOptions = false;
      var _loc5_ = this.curView.dataList.length;
      var _loc4_ = arguments;
      _loc3_.columnID = this.curColId;
      _loc3_.itemID = _loc5_;
      _loc4_.unshift(this.curColId,_loc5_,_loc3_);
      this.SET_DATA_SLOT.apply(this,_loc4_);
   }
   function ADD_PROJECT_SIZE_DISPLAY()
   {
      this._colHasProjectSizeDisplay = true;
   }
   function ADD_LIST_SCROLL_ITEM(label)
   {
      if(this.curColTpye == com.rockstargames.gtav.ng.Replay.NEW_EDITOR.ID_COL_TYPE_LIST_LONG_AUDIO && this.curColId == 1)
      {
         this._scrollBarLabelAudio = label;
         this._colHasScrollBarAudio = true;
      }
      else
      {
         this._scrollBarColId = this.curColId;
         this._scrollBarLabel = label;
         this._colHasScrollBar = true;
      }
   }
   function UPDATE_SCROLL_LIST_LABEL(label)
   {
      if(this.curColId == this._scrollBarColId)
      {
         if(this._colHasScrollBar && this._scrollBarItem)
         {
            this._scrollBarLabel = label;
            this._scrollBarItem.label = label;
         }
      }
      else if(this.curColTpye == com.rockstargames.gtav.ng.Replay.NEW_EDITOR.ID_COL_TYPE_LIST_LONG_AUDIO)
      {
         if(this._colHasScrollBarAudio && this._scrollBarItemAudio)
         {
            this._scrollBarLabelAudio = label;
            this._scrollBarItemAudio.label = label;
         }
      }
   }
   function UPDATE_LIST_ITEM(colID, itemID)
   {
      var _loc3_ = new Object();
      _loc3_.hasIcon = false;
      var _loc5_ = this.curView.dataList.length;
      var _loc4_ = arguments;
      _loc4_.shift();
      _loc4_.shift();
      _loc3_.columnID = this.curColId;
      _loc3_.itemID = _loc5_;
      _loc4_.unshift(_loc3_);
      this.model.updateSlot(colID,itemID,_loc4_);
   }
   function SET_ICON_VISIBILITY_FROM_LIST_ITEM(colID, itemID, isVisible)
   {
      var _loc2_ = this.model.viewList[colID].itemList;
      var _loc3_ = _loc2_[itemID];
      _loc3_.setIconVisible(isVisible);
   }
   function UPDATE_LIST_ITEM_ELEMENT(colID, itemID, elementID, elementData)
   {
      this.model.updateSlotElement(colID,itemID,elementID + 1,elementData);
   }
   function UPDATE_COLUMN_HELP_TEXT(helpTextData)
   {
      this._helpTextItem.data = helpTextData;
   }
   function UPDATE_COLUMN_PROJECT_SIZE(value)
   {
      this._projectSizeDisplayItem.setBar(value);
   }
   function UPDATE_COLUMN_PROJECT_SIZE_TITLE(titleTextData)
   {
      this._projectSizeDisplayItem.data = titleTextData;
   }
   function UPDATE_COLUMN_PROJECT_SIZE_X_POSITION(xPos)
   {
      this._projectSizeDisplayItem._x = xPos;
   }
   function UPDATE_UPLOAD_PROCESS(label)
   {
      this._loadProjectInfo.updateUploadProgress(label);
   }
   function UPDATE_UPLOAD_BACKGROUND(stateId)
   {
      this._loadProjectInfo.setUploadStatusState(stateId);
   }
   function SET_ANIMATED_AUDIO_ICON(itemId, isPlaying)
   {
      if(itemId != undefined && this.curColTpye == com.rockstargames.gtav.ng.Replay.NEW_EDITOR.ID_COL_TYPE_LIST_LONG_AUDIO)
      {
         var _loc3_ = this.model.getCurrentView().itemList;
         var _loc2_ = undefined;
         _loc2_ = _loc3_[itemId];
         _loc2_.SetAnimatedAudioPlaying(isPlaying);
         if(isPlaying)
         {
            _loc2_.SetAnimatedAudioVisibility(true);
         }
      }
   }
   function BUILD_MENU()
   {
      this.DISPLAY_VIEW(this.curViewIndex,1);
   }
   function GO_TO_NEXT_ITEM()
   {
      this.model.nextItem();
      var _loc2_ = com.rockstargames.gtav.ng.Replay.ReplayView(this.model.getCurrentView());
      return this.model.getCurrentSelection();
   }
   function GO_TO_PREVIOUS_ITEM()
   {
      this.model.prevItem();
      return this.model.getCurrentSelection();
   }
   function SET_ITEM_ACTIVE(colID, itemID)
   {
      var _loc2_ = this.model.viewList[colID].itemList;
      var _loc3_ = _loc2_[itemID];
      _loc3_.highlighted = true;
      this._currentHighlightedIndex = itemID;
   }
   function UNSET_ITEM_ACTIVE()
   {
      var _loc4_ = this.model.viewList.length;
      var _loc3_ = 0;
      while(_loc3_ < _loc4_)
      {
         var _loc2_ = this.model.viewList[_loc3_];
         _loc2_.highlighted = false;
         if(com.rockstargames.gtav.ng.Replay.COL_TYPE_LIST_LONG_AUDIO(_loc2_.highlightedItem).SetAnimatedAudioVisibility)
         {
            com.rockstargames.gtav.ng.Replay.COL_TYPE_LIST_LONG_AUDIO(_loc2_.highlightedItem).SetAnimatedAudioPlaying(false);
            com.rockstargames.gtav.ng.Replay.COL_TYPE_LIST_LONG_AUDIO(_loc2_.highlightedItem).SetAnimatedAudioVisibility(false);
         }
         this._currentHighlightedIndex = undefined;
         _loc3_ = _loc3_ + 1;
      }
   }
   function SET_ITEM_SELECTED(itemId, onlyOneOption)
   {
      var _loc3_ = this.model.getCurrentView().itemList;
      var _loc2_ = undefined;
      var _loc5_ = onlyOneOption == undefined ? false : onlyOneOption;
      if(this._currentSelectedIndex != undefined)
      {
         _loc2_ = _loc3_[this._currentSelectedIndex];
         _loc2_.SetAsSelected(false,_loc5_);
      }
      _loc2_ = _loc3_[itemId];
      _loc2_.SetAsSelected(true,_loc5_);
      if(this.curColTpye == com.rockstargames.gtav.ng.Replay.NEW_EDITOR.ID_COL_TYPE_LIST_LONG_AUDIO && itemId != undefined)
      {
         if(this._currentSelectedIndex != undefined)
         {
            com.rockstargames.gtav.ng.Replay.COL_TYPE_LIST_LONG_AUDIO(_loc3_[this._currentSelectedIndex]).SetAnimatedAudioVisibility(false);
         }
         _loc2_ = _loc3_[itemId];
         com.rockstargames.gtav.ng.Replay.COL_TYPE_LIST_LONG_AUDIO(_loc2_).SetAnimatedAudioVisibility(true);
      }
      this._currentSelectedIndex = itemId;
   }
   function SET_COL_TYPE_LIST_COLOUR(itemId, stateId)
   {
      var _loc2_ = this.model.getCurrentView().itemList;
      var _loc3_ = undefined;
      _loc3_ = _loc2_[itemId];
      _loc3_.SetColourState(stateId);
   }
   function SET_COL_TYPE_LIST_COLOUR_IN_COLUMN(colId, itemId, stateId)
   {
      var _loc2_ = this.model.viewList[colId].itemList;
      var _loc3_ = _loc2_[itemId];
      _loc3_.SetColourState(stateId);
   }
   function SET_COLUMN_ACTIVE(colID)
   {
      this.model.setView(colID);
      this.curColId = colID;
   }
   function GET_ACTIVE_ITEM()
   {
      return this.model.getCurrentSelection();
   }
   function GO_TO_NEXT_COLUMN()
   {
      if(this.model.viewIndex + 1 <= this.model.viewList.length)
      {
         this.curViewIndex = this.curViewIndex + 1;
         this.curView = this.model.viewList[this.curViewIndex];
         this.model.setView(this.curViewIndex);
      }
      return this.curViewIndex;
   }
   function GO_TO_PREVIOUS_COLUMN()
   {
      if(this.curViewIndex - 1 >= 0)
      {
         this.curViewIndex = this.curViewIndex - 1;
         this.curView = this.model.viewList[this.curViewIndex];
         this.model.setView(this.curViewIndex);
      }
      return this.curViewIndex;
   }
   function REMOVE_COLUMN(columnId)
   {
      if(this._helpTextItem && columnId == 0)
      {
         this._helpTextItem.removeMovieClip();
         this._helpTextItem = undefined;
         this._colHasHelpText = false;
      }
      if(this._projectSizeDisplayItem && columnId == 0)
      {
         this._projectSizeDisplayItem.removeMovieClip();
         this._projectSizeDisplayItem = undefined;
         this._colHasProjectSizeDisplay = false;
      }
      if(this._colHasScrollBar && columnId == this._scrollBarColId)
      {
         this._scrollBarItem.dispose();
         this._scrollBarItem.removeMovieClip();
         this._scrollBarItem = undefined;
         this._colHasScrollBar = false;
      }
      if(this._colHasScrollBarAudio && columnId == 1)
      {
         this._scrollBarItemAudio.dispose();
         this._scrollBarItemAudio.removeMovieClip();
         this._scrollBarItemAudio = undefined;
         this._colHasScrollBarAudio = false;
      }
      if(this.MOVIE_MODE == this.MOVIE_STATE_CLIP_PLAYBACK)
      {
         this.SET_CLIP_EDIT_HEADER_VISIBLE(false);
         if(this._bigBackground)
         {
            this._bigBackground.removeMovieClip();
         }
      }
      var _loc3_ = this.model.viewList[columnId];
      if(_loc3_ != undefined)
      {
         _loc3_.destroy();
      }
   }
   function UNHIGHLIGHT()
   {
      var _loc4_ = this.model.getCurrentView().itemList;
      var _loc2_ = 0;
      while(_loc2_ < _loc4_.length)
      {
         var _loc3_ = _loc4_[_loc2_];
         _loc3_.highlighted = false;
         _loc2_ = _loc2_ + 1;
      }
   }
   function SET_ITEMS_GREYED_OUT(itemID)
   {
      var _loc3_ = this.model.getCurrentView().itemList;
      var _loc4_ = undefined;
      if(itemID != undefined)
      {
         _loc4_ = _loc3_[itemID];
         _loc4_.setGreyedOut();
      }
      else
      {
         var _loc2_ = 0;
         while(_loc2_ < _loc3_.length)
         {
            _loc4_ = _loc3_[_loc2_];
            _loc4_.setGreyedOut();
            _loc2_ = _loc2_ + 1;
         }
      }
   }
   function SET_ITEMS_UNGREYED_OUT(itemID)
   {
      var _loc4_ = this.model.getCurrentView().itemList;
      var _loc3_ = undefined;
      if(itemID != undefined)
      {
         _loc3_ = _loc4_[itemID];
         _loc3_.highlighted = false;
         _loc3_.removeGreyOut();
      }
      else
      {
         var _loc2_ = 0;
         while(_loc2_ < _loc4_.length)
         {
            _loc3_ = _loc4_[_loc2_];
            _loc3_.highlighted = false;
            _loc3_.removeGreyOut();
            _loc2_ = _loc2_ + 1;
         }
      }
   }
   function HIGHLIGHT_ITEM(itemID)
   {
      var _loc2_ = this.model.getCurrentView().itemList;
      var _loc3_ = undefined;
      if(itemID != undefined)
      {
         _loc3_ = _loc2_[itemID];
         _loc3_.highlighted = true;
      }
   }
   function createColumn(columnId, colTpye)
   {
      var _loc4_ = this.model.columnMovieClips[0][columnId];
      var _loc5_ = this.columnXPositions[columnId];
      this.REMOVE_COLUMN(columnId);
      var _loc3_ = ["COL_TYPE_LIST","COL_TYPE_BASIC_PAGE","COL_TYPE_LOAD_PROJ_INFO","COL_TYPE_IMG_PROJ_INFO","","","COL_TYPE_IMG_TWELVE","COL_TYPE_TEXT_PLACEMENT","COL_TYPE_LIST_LONG_AUDIO"];
      if(this.MOVIE_MODE == this.MOVIE_STATE_CLIP_PLAYBACK)
      {
         var _loc6_ = Math.floor(this.safeTop + this.clip_edit_header._height);
         this.model.createView(columnId,{id:columnId,x:0,y:_loc6_,rowSpacing:0,columnSpacing:0,container:_loc4_,visibleItems:this._visibleItems,selectstyle:2,linkage:[_loc3_[colTpye]]});
      }
      else
      {
         this.model.createView(columnId,{id:columnId,x:_loc5_,y:this.columnY,rowSpacing:2,columnSpacing:0,container:_loc4_,visibleItems:this._visibleItems,selectstyle:2,linkage:[_loc3_[colTpye]]});
      }
      flash.external.ExternalInterface.call("FORCE_GARBAGE_COLLECTION",0,this.gfxFileName);
      return true;
   }
   function tabFrameFromColType(colType)
   {
      var _loc1_ = -1;
      switch(colType)
      {
         case com.rockstargames.gtav.ng.Replay.NEW_EDITOR.ID_COL_TYPE_LIST:
            _loc1_ = 1;
            break;
         case com.rockstargames.gtav.ng.Replay.NEW_EDITOR.COL_TYPE_BASIC_PAGE:
            _loc1_ = 2;
            break;
         case com.rockstargames.gtav.ng.Replay.NEW_EDITOR.ID_COL_TYPE_LOAD_PROJ_INFO:
            _loc1_ = 1;
            break;
         case com.rockstargames.gtav.ng.Replay.NEW_EDITOR.COL_TYPE_IMG_PROJ_INFO:
            _loc1_ = 2;
            break;
         case com.rockstargames.gtav.ng.Replay.NEW_EDITOR.COL_TYPE_IMG_ONE:
            _loc1_ = 1;
            break;
         case com.rockstargames.gtav.ng.Replay.NEW_EDITOR.COL_TYPE_IMG_FOUR:
            _loc1_ = 2;
            break;
         case com.rockstargames.gtav.ng.Replay.NEW_EDITOR.COL_TYPE_IMG_TWELVE:
            _loc1_ = 2;
      }
      return _loc1_;
   }
   function registerMovie(mc)
   {
      if(mc._mcID == "PLAYBACK_PANEL")
      {
         this.PLAYBACK_PANEL = mc;
         this.PLAYBACK_PANEL.initLayout();
      }
      return this.config;
   }
   function unRegister(mc)
   {
      if(mc._mcID == "PLAYBACK_PANEL")
      {
         this.PLAYBACK_PANEL = null;
      }
   }
   function SET_PLAYBACK_MENU_VISIBLE(isVisible)
   {
      this.SET_CLIP_EDIT_HEADER_VISIBLE(isVisible);
      this.mc_panel_playback_menu._visible = isVisible;
      this._forceClipEditMenuInvisible = !isVisible;
   }
   function initColourGrabbing()
   {
      this._receivedColours = [];
      var _loc5_ = [com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREEN,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_ORANGE,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_RED,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLUE];
      var _loc3_ = undefined;
      var _loc6_ = _loc5_.length;
      _loc3_ = _loc6_;
      while(_loc3_--)
      {
         var _loc2_ = new com.rockstargames.ui.utils.HudColour();
         com.rockstargames.ui.utils.Colour.setHudColour(_loc5_[_loc3_],_loc2_);
         var _loc4_ = [_loc2_.r,_loc2_.g,_loc2_.b,_loc2_.a];
         this._receivedColours[_loc3_] = _loc4_;
      }
   }
}

class com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_CONFIGURATION_LIST extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
   var CONTENT;
   var SEND_COLUMN_PARAMS;
   var canMouseNav;
   var columnIsFocused;
   var dbgID;
   var model;
   var scrollBase;
   function PAUSE_MENU_CONFIGURATION_LIST()
   {
      super();
      this.dbgID = "PAUSE_MENU_CONFIGURATION_LIST";
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
      var _loc3_ = this.CONTENT.createEmptyMovieClip("menuMC",this.CONTENT.getNextHighestDepth());
      this.model = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuConfigurationModel();
      this.model.createView(0,{id:0,x:0,y:27,rowSpacing:0,columnSpacing:0,container:_loc3_,linkage:["configurationListItem"],visibleItems:15,selectstyle:com.rockstargames.ui.components.GUIView.SCROLL_SELECTSTYLE});
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.title.bg,com.rockstargames.ui.utils.HudColourLite.HUD_COLOUR_PAUSE_BG);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.value1.bg,com.rockstargames.ui.utils.HudColourLite.HUD_COLOUR_PAUSE_BG);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.value2.bg,com.rockstargames.ui.utils.HudColourLite.HUD_COLOUR_PAUSE_BG);
      this.CONTENT.value1.highlight._visible = false;
      this.CONTENT.value2.highlight._visible = false;
   }
   function SET_HIGHLIGHT(i)
   {
      var _loc2_ = com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuConfigurationView(this.model.getCurrentView());
      _loc2_.index = i;
   }
   function SET_DATA_SLOT(_viewIndex, _slotIndex)
   {
      this.model.addDataToView(0,_viewIndex,arguments);
   }
   function SET_DATA_SLOT_EMPTY(viewIndex, itemIndex)
   {
      super.SET_DATA_SLOT_EMPTY(viewIndex,itemIndex);
      com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuConfigurationView(this.model.getCurrentView()).index = 0;
   }
   function SET_TITLE(str1, str2, str3)
   {
      this.CONTENT.title.valueTF.text = str1;
      this.CONTENT.value1.valueTF.text = str2;
      this.CONTENT.value2.valueTF.text = str3;
   }
   function DISPLAY_VIEW(viewIndex, itemIndex)
   {
      super.DISPLAY_VIEW(viewIndex,itemIndex);
      if(this.canMouseNav)
      {
         this.SEND_COLUMN_PARAMS();
      }
      var _loc5_ = com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuConfigurationView(this.model.getCurrentView());
      var _loc3_ = 0;
      var _loc4_;
      while(_loc3_ < _loc5_.itemList.length)
      {
         _loc4_ = com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuConfigurationItem(_loc5_.itemList[_loc3_]);
         _loc4_.configListRef = this;
         _loc3_ = _loc3_ + 1;
      }
   }
   function SET_FOCUS(isFocused)
   {
      super.SET_FOCUS;
      this.columnIsFocused = isFocused;
      this.SEND_COLUMN_PARAMS();
      if(isFocused)
      {
         com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuConfigurationModel(this.model).highlightNext();
      }
      else
      {
         com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuConfigurationModel(this.model).clearHighlight();
      }
      if(this.scrollBase != undefined)
      {
         this.scrollBase.updateScroll();
         this.scrollBase._visible = isFocused && this.scrollBase.displayEnabled();
      }
   }
   function SET_KEY_CONFIG_COLUMN(colIndex)
   {
      var _loc4_ = com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuConfigurationView(this.model.getCurrentView());
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < _loc4_.itemList.length)
      {
         _loc3_ = com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuConfigurationItem(_loc4_.itemList[_loc2_]);
         _loc3_.focusColumn(colIndex);
         _loc2_ = _loc2_ + 1;
      }
      var _loc5_ = com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem(_loc4_.itemList[_loc4_.highlightedItem]);
      if(_loc5_ != undefined)
      {
         com.rockstargames.ui.game.GameInterface.call("LAYOUT_CHANGED",com.rockstargames.ui.game.GameInterface.PAUSE_TYPE,_loc5_.menuID,_loc5_.menuID,_loc5_.uniqueID,0);
      }
   }
   function SET_INPUT_EVENT(direction)
   {
      var _loc4_ = 0;
      if(direction == com.rockstargames.ui.game.GamePadConstants.DPADUP)
      {
         this.model.prevItem();
      }
      if(direction == com.rockstargames.ui.game.GamePadConstants.DPADDOWN)
      {
         this.model.nextItem();
      }
      var _loc2_ = com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuConfigurationView(this.model.getCurrentView());
      if(direction == com.rockstargames.ui.game.GamePadConstants.DPADLEFT)
      {
         this.SET_KEY_CONFIG_COLUMN(1);
         _loc2_.index = _loc2_.index;
      }
      if(direction == com.rockstargames.ui.game.GamePadConstants.DPADRIGHT)
      {
         this.SET_KEY_CONFIG_COLUMN(2);
         _loc2_.index = _loc2_.index;
      }
   }
}

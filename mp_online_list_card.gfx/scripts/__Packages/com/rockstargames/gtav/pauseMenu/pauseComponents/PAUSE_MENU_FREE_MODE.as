class com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_FREE_MODE extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
   var CONTENT;
   var TextWithBlips;
   var blipLayer;
   var dbgID;
   var model;
   var scrollBase;
   var titleMC;
   var hasTitle = false;
   var rowOffset = 27;
   function PAUSE_MENU_FREE_MODE()
   {
      super();
      this.dbgID = "PAUSE_MENU_FREE_MODE";
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
      this.TextWithBlips = new com.rockstargames.ui.utils.Text();
      this.model = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeModel();
      this.model.createView(0,{id:0,x:0,y:0,rowSpacing:2,columnSpacing:0,container:this.CONTENT,linkage:["freemodeListItem"],visibleItems:16,selectstyle:com.rockstargames.ui.components.GUIView.SCROLL_SELECTSTYLE});
      var _loc3_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG,_loc3_);
      com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.helpMC.bgMC,_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
      this.CONTENT.helpMC.helpTF.wordWrap = true;
      this.CONTENT.helpMC.helpTF.autoSize = true;
      this.CONTENT.helpMC._visible = false;
      this.titleMC = com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem(this.CONTENT.attachMovie("freemodeListItem","tMC",this.CONTENT.getNextHighestDepth()));
      this.titleMC._visible = this.hasTitle = false;
   }
   function SET_HIGHLIGHT(i)
   {
      var _loc2_ = com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeView(this.model.getCurrentView());
      _loc2_.index = i;
   }
   function SET_DATA_SLOT_EMPTY(viewIndex, itemIndex)
   {
      super.SET_DATA_SLOT_EMPTY(viewIndex,itemIndex);
      this.titleMC._visible = this.hasTitle = false;
      this.model.getCurrentView().visibleItems = 16;
      this.model.getCurrentView().viewContainer._y = 0;
   }
   function SET_TITLE(titleStr)
   {
      this.titleMC.data = [0,999,999,0,0,1,titleStr];
      this.titleMC.setTitle();
      this.titleMC._visible = this.hasTitle = true;
      this.model.getCurrentView().visibleItems = 15;
      this.model.getCurrentView().viewContainer._y = this.rowOffset;
   }
   function SET_DESCRIPTION(helpStr)
   {
      if(this.blipLayer)
      {
         this.blipLayer.removeMovieClip();
      }
      this.blipLayer = this.CONTENT.helpMC.createEmptyMovieClip("blipLayer",1000);
      this.TextWithBlips.setTextWithIcons(helpStr,this.blipLayer,this.CONTENT.helpMC.helpTF,0,13,2,false);
      this.CONTENT.helpMC._visible = helpStr != "";
      var _loc2_ = 0;
      if(this.hasTitle)
      {
         _loc2_ = this.rowOffset;
      }
      var _loc3_ = com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeView(this.model.getCurrentView());
      this.CONTENT.helpMC._y = _loc2_ + _loc3_.dataList.length * this.rowOffset;
      this.CONTENT.helpMC.bgMC._height = this.CONTENT.helpMC.helpTF.textHeight + 12;
   }
   function SET_FOCUS(isFocused)
   {
      if(isFocused)
      {
         com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeModel(this.model).highlightNext();
      }
      else
      {
         com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeModel(this.model).clearHighlight();
      }
      if(this.scrollBase != undefined)
      {
         this.scrollBase.updateScroll();
         this.scrollBase._visible = isFocused && this.scrollBase.displayEnabled();
      }
   }
   function SET_INPUT_EVENT(direction)
   {
      var _loc2_ = 0;
      if(direction == com.rockstargames.ui.game.GamePadConstants.DPADUP)
      {
         this.model.prevItem();
      }
      if(direction == com.rockstargames.ui.game.GamePadConstants.DPADDOWN)
      {
         this.model.nextItem();
      }
   }
}

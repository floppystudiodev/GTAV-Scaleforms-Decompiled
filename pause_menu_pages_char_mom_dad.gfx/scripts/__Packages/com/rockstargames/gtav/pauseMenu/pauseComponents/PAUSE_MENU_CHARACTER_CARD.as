class com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_CHARACTER_CARD extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
   var dbgID;
   var CONTENT;
   var TextWithBlips;
   var charTitleMC;
   var model;
   var scrollBase;
   var columnIsFocused;
   var SEND_COLUMN_PARAMS;
   var blipLayer;
   var hasTitle = true;
   function PAUSE_MENU_CHARACTER_CARD()
   {
      super();
      this.dbgID = "PAUSE_MENU_CHARACTER_CARD";
      _global.gfxExtensions = true;
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
      this.SET_FOCUS(false);
      this.TextWithBlips = new com.rockstargames.ui.utils.Text();
      this.charTitleMC = this.CONTENT.titleMC;
      this.charTitleMC._visible = false;
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.charTitleMC.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.charTitleMC.bgsubMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.charTitleMC.headingMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.charTitleMC.subMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE);
      this.model = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCharacterStatsModel();
      this.model.createView(0,{id:0,x:0,y:this.charTitleMC._height,rowSpacing:0,columnSpacing:0,container:this.CONTENT,linkage:["characterStatsCardItem"],visibleItems:16,selectstyle:com.rockstargames.ui.components.GUIView.SCROLL_SELECTSTYLE});
      var _loc3_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG,_loc3_);
      com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.helpMC.bgMC,_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
      this.CONTENT.helpMC.helpTF.wordWrap = true;
      this.CONTENT.helpMC.helpTF.autoSize = true;
      this.CONTENT.helpMC._visible = false;
   }
   function SET_INPUT_EVENT(direction)
   {
      switch(direction)
      {
         case com.rockstargames.ui.game.GamePadConstants.DPADUP:
            this.model.prevItem();
            break;
         case com.rockstargames.ui.game.GamePadConstants.DPADDOWN:
            this.model.nextItem();
      }
      if(this.scrollBase != undefined)
      {
         this.scrollBase.updateScroll();
      }
   }
   function SET_HIGHLIGHT(i)
   {
      var _loc2_ = com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCharacterStatsView(this.model.getCurrentView());
      _loc2_.index = i;
   }
   function SET_FOCUS(isFocused)
   {
      this.columnIsFocused = isFocused;
      this.SEND_COLUMN_PARAMS();
      var _loc4_ = this.model.getCurrentView().itemList;
      var _loc2_ = 0;
      while(_loc2_ < _loc4_.length)
      {
         var _loc3_ = _loc4_[_loc2_];
         _loc3_.highlighted = !isFocused ? false : this.model.getCurrentView().highlightedItem == _loc2_;
         _loc2_ = _loc2_ + 1;
      }
      if(this.scrollBase != undefined)
      {
         this.scrollBase.updateScroll();
         this.scrollBase._visible = isFocused && this.scrollBase.displayEnabled();
      }
   }
   function DISPLAY_VIEW(viewIndex, itemIndex)
   {
      super.DISPLAY_VIEW(viewIndex,itemIndex);
      var _loc6_ = 2;
      var _loc3_ = com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCharacterStatsView(this.model.getCurrentView(0));
      var _loc4_ = com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCharacterStatsItem(_loc3_.itemList[_loc3_.itemList.length - 2]);
      var _loc5_ = com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCharacterStatsItem(_loc3_.itemList[_loc3_.itemList.length - 1]);
      _loc5_._y = _loc4_._y + _loc4_._height + _loc6_;
   }
   function RESIZE_BG(i)
   {
      var _loc1_ = 2;
      var _loc2_ = 430 - i - _loc1_;
   }
   function SET_TITLE(titleStr, desc)
   {
      this.charTitleMC.headingMC.titleTF.text = titleStr;
      this.charTitleMC.headingMC.titleTF.textAutoSize = "shrink";
      com.rockstargames.ui.utils.UIText.setSizedText(this.charTitleMC.subMC.subtitleTF,desc,true,false);
      this.charTitleMC._visible = true;
   }
   function SET_DESCRIPTION(helpStr, flashHelp)
   {
      if(this.blipLayer)
      {
         this.blipLayer.removeMovieClip();
      }
      this.blipLayer = this.CONTENT.helpMC.createEmptyMovieClip("blipLayer",1000);
      this.TextWithBlips.setTextWithIcons(helpStr,this.blipLayer,this.CONTENT.helpMC.helpTF,0,13,2,false);
      com.rockstargames.ui.utils.Debug.log("PAUSE_MENU_CHARACTER_CARD helpStr: " + helpStr);
      com.rockstargames.ui.utils.Debug.log("blipLayer: " + this.blipLayer);
      com.rockstargames.ui.utils.Debug.log("CONTENT.helpMC.helpTF: " + this.CONTENT.helpMC.helpTF);
      this.CONTENT.helpMC._visible = helpStr != "";
      if(!this.CONTENT.helpMC._visible)
      {
         this.CONTENT.helpMC.iMC.gotoAndStop(1);
      }
      else if(flashHelp)
      {
         if(this.CONTENT.helpMC.iMC._currentframe == 1)
         {
            this.CONTENT.helpMC.iMC.gotoAndPlay(2);
         }
      }
      else
      {
         this.CONTENT.helpMC.iMC.gotoAndStop(1);
      }
      var _loc3_ = 0;
      if(this.hasTitle)
      {
         _loc3_ = this.charTitleMC._height;
      }
      var _loc2_ = com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCharacterStatsView(this.model.getCurrentView(0));
      var _loc4_ = com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCharacterStatsItem(_loc2_.itemList[_loc2_.itemList.length - 1]);
      this.CONTENT.helpMC._y = _loc3_ + _loc4_._y + _loc4_._height + 2;
      this.CONTENT.helpMC.bgMC._height = this.CONTENT.helpMC.helpTF.textHeight + 12;
   }
}

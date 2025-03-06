class com.rockstargames.gtav.cellphone.apps.APP_TODO_VIEW extends com.rockstargames.gtav.cellphone.apps.APP_ScrollingView
{
   var scrollBar;
   var gutterHeight;
   var scrollerX;
   var TIMELINE;
   var CONTENT;
   var dataProviderUI;
   var scrollBarTimeout;
   var gfxFileName;
   var currentStyle;
   var linkageID;
   var content;
   var greyRGB;
   var container;
   var offsetY = 64;
   var offsetX = 0;
   var contentOriginY = 64;
   function APP_TODO_VIEW()
   {
      super();
      this.scrollBar = new com.rockstargames.ui.controls.ScrollBar();
      this.gutterHeight = 240;
      this.isLandscape = false;
      this.scrollerX = 250;
      this.contentOriginX = 0;
      this.contentOriginY = 64;
   }
   function INITIALISE(mc)
   {
      this.TIMELINE = mc;
      this.CONTENT = this.TIMELINE;
   }
   function construct()
   {
      this.dataProviderUI = _level0.TIMELINE.contactsDataProviderUI;
      clearInterval(this.scrollBarTimeout);
      var _loc3_ = this.TIMELINE.bg;
      switch(this.gfxFileName)
      {
         case "CELLPHONE_FACADE":
            com.rockstargames.ui.utils.Colour.Colourise(_loc3_,210,210,210,100);
            break;
         case "CELLPHONE_IFRUIT":
            com.rockstargames.ui.utils.Colour.Colourise(_loc3_,238,233,176,100);
            com.rockstargames.ui.utils.Colour.Colourise(_level0.TIMELINE.infoBar.headerBackground,136,118,104,100);
            break;
         default:
            com.rockstargames.ui.utils.Colour.Colourise(_loc3_,this.currentStyle[4][0],this.currentStyle[4][1],this.currentStyle[4][2],100);
      }
      this.linkageID = "toDoViewMC";
      super.construct(this.CONTENT,this.linkageID,this.dataProviderUI);
   }
   function populateContent()
   {
      this.dataProviderUI = _level0.TIMELINE.contactsDataProviderUI;
      var _loc0_ = null;
      if((_loc0_ = this.gfxFileName) !== "CELLPHONE_IFRUIT")
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.content.icon,this.greyRGB[0],this.greyRGB[1],this.greyRGB[1],100);
      }
      else
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.content.icon,94,80,73,100);
      }
      var _loc4_ = this.dataProviderUI[0][0];
      var _loc7_ = this.dataProviderUI[0][1];
      var _loc6_ = this.dataProviderUI[0][2];
      var _loc5_ = this.dataProviderUI[0][3];
      this.content.missionNameTF.text = com.rockstargames.ui.utils.FitToTextfield.capText(this.content.missionNameTF,_loc4_);
      this.content.descriptionTF.wordWrap = true;
      this.content.descriptionTF.multiline = true;
      this.content.descriptionTF.autoSize = "left";
      this.content.descriptionTF.text = _loc7_;
      this.content.info1TF.text = com.rockstargames.ui.utils.FitToTextfield.capText(this.content.info1TF,_loc6_);
      this.content.info2TF.text = com.rockstargames.ui.utils.FitToTextfield.capText(this.content.info2TF,_loc5_);
      if(this.content.descriptionTF._y + this.content.descriptionTF._height > this.gutterHeight)
      {
         this.content.background._height = this.content.descriptionTF._y + this.content.descriptionTF._height;
         this.needsScrollbars = true;
      }
      var _loc2_ = this.content._height;
      var _loc8_ = _loc2_ - this.gutterHeight;
      var _loc3_ = _loc8_ / _loc2_;
      this.scrollBar.scrollBarContainer.scrubber._height = Math.round((1 - _loc3_) * this.gutterHeight);
   }
   function CLEAN_UP_DATA()
   {
      this.dataProviderUI = [];
      this.container.removeMovieClip();
   }
}

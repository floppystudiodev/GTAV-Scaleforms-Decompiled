class com.rockstargames.gtav.cellphone.apps.APP_MISSION_STATS_VIEW extends com.rockstargames.gtav.cellphone.apps.APP_ScrollingView
{
   var scrollBar;
   var gutterHeight;
   var scrollerX;
   var TIMELINE;
   var CONTENT;
   var dataProviderUI;
   var scrollBarTimeout;
   var currentStyle;
   var linkageID;
   var content;
   var container;
   var offsetY = 64;
   var offsetX = 0;
   var contentOriginY = 64;
   function APP_MISSION_STATS_VIEW()
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
      this.dataProviderUI = _level0.TIMELINE.missionStatsDataProviderUI;
      clearInterval(this.scrollBarTimeout);
      var _loc3_ = this.TIMELINE.bg;
      com.rockstargames.ui.utils.Colour.Colourise(_loc3_,this.currentStyle[4][0],this.currentStyle[4][1],this.currentStyle[4][2],100);
      this.linkageID = "missionstatsView";
      super.construct(this.CONTENT,this.linkageID,this.dataProviderUI);
   }
   function populateContent()
   {
      this.dataProviderUI = _level0.TIMELINE.missionStatsDataProviderUI;
      var _loc20_ = this.dataProviderUI[0][0];
      var _loc19_ = this.dataProviderUI[0][1];
      if(_loc20_ != undefined)
      {
         this.content.missionTitle.text = com.rockstargames.ui.utils.FitToTextfield.capText(this.content.missionTitle,_loc20_);
      }
      if(_loc19_ != undefined)
      {
         this.content.areYouSure.text = _loc19_;
      }
      var _loc11_ = 1;
      var _loc13_ = this.dataProviderUI.length - 2;
      var _loc5_ = 0;
      while(_loc5_ < _loc13_)
      {
         var _loc4_ = _loc5_ + 1;
         var _loc10_ = this.dataProviderUI[_loc4_][0];
         var _loc7_ = this.dataProviderUI[_loc4_][1];
         var _loc6_ = this.dataProviderUI[_loc4_][2];
         var _loc3_ = this.dataProviderUI[_loc4_][3];
         var _loc2_ = "listItem" + _loc11_;
         if(this.content[_loc2_] != undefined)
         {
            this.content[_loc2_].removeMovieClip();
         }
         this.content[_loc2_] = this.content.attachMovie("missionStatsListItemMC",_loc2_,this.content.getNextHighestDepth());
         this.content[_loc2_]._name = _loc2_;
         this.content[_loc2_]._x = 0;
         this.content[_loc2_]._y = 50 + _loc5_ * 26;
         if(_loc10_ == 1)
         {
            this.content[_loc2_].tickMC._alpha = 100;
         }
         else
         {
            this.content[_loc2_].tickMC._alpha = 0;
         }
         if(_loc7_ != undefined)
         {
            this.content[_loc2_].missionTask.text = com.rockstargames.ui.utils.FitToTextfield.capText(this.content[_loc2_].missionTask,_loc7_);
         }
         if(_loc6_ != undefined && _loc3_ != undefined)
         {
            var _loc9_ = _loc6_.toString();
            var _loc8_ = _loc3_.toString();
            if(_loc6_ < 10)
            {
               _loc9_ = "0" + _loc6_.toString();
            }
            if(_loc3_ < 10)
            {
               _loc8_ = "0" + _loc3_.toString();
            }
            this.content[_loc2_].missionTime.text = _loc9_ + ":" + _loc8_;
         }
         _loc11_ = _loc11_ + 1;
         _loc5_ = _loc5_ + 1;
      }
      var _loc15_ = 215;
      if(_loc11_ > 7)
      {
         _loc15_ = 24 + 26 * _loc11_;
         this.content.background._height = _loc15_ + 25;
      }
      if(this.content.missionStatsFooterMC != undefined)
      {
         this.content.missionStatsFooterMC.removeMovieClip();
      }
      var _loc12_ = this.content.attachMovie("missionStatsFooterMC","missionStatsFooterMC",this.content.getNextHighestDepth());
      _loc12_._x = 0;
      _loc12_._y = _loc15_;
      var _loc14_ = _loc11_;
      var _loc17_ = this.dataProviderUI[_loc14_][0];
      var _loc16_ = this.dataProviderUI[_loc14_][1];
      if(_loc17_ != undefined)
      {
         _loc12_.completion.text = _loc17_;
      }
      if(_loc16_ != undefined)
      {
         _loc12_.percentComplete.text = _loc16_.toString() + "%";
         var _loc22_ = this.dataProviderUI[_loc14_][2];
         var _loc25_ = this.dataProviderUI[_loc14_][3];
         var _loc23_ = this.dataProviderUI[_loc14_][4];
         com.rockstargames.ui.utils.Colour.Colourise(_loc12_.missionStatusMC,_loc22_,_loc25_,_loc23_);
      }
      if(_loc12_._y + _loc12_._height > this.gutterHeight)
      {
         this.content.background._height = _loc12_._y + _loc12_._height;
      }
      var _loc18_ = this.content._height;
      var _loc24_ = _loc18_ - this.gutterHeight;
      var _loc21_ = _loc24_ / _loc18_;
      this.scrollBar.scrollBarContainer.scrubber._height = Math.round((1 - _loc21_) * this.gutterHeight);
   }
   function CLEAN_UP_DATA()
   {
      this.dataProviderUI = [];
      this.container.removeMovieClip();
   }
}

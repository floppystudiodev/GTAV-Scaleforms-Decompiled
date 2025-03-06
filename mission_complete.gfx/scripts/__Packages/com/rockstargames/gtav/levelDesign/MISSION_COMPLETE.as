class com.rockstargames.gtav.levelDesign.MISSION_COMPLETE extends com.rockstargames.ui.components.GUIController
{
   var CONTENT;
   var model;
   var yOffset = 23;
   var headingHeight = 20;
   var totalHeight = 200;
   var itemsPadding = 10;
   var displayableItems = 0;
   var twoPxGap = 2;
   var showDebug = true;
   function MISSION_COMPLETE()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.headingHeight = this.CONTENT.headingMC._height;
      this.yOffset = this.CONTENT.headingMC._y;
      this.model = new com.rockstargames.gtav.levelDesign.MissionCompleteModel();
      this.model.createView(0,{id:0,x:0,y:0,rowSpacing:1,columnSpacing:0,selectstyle:2,container:this.CONTENT.viewContainerMC,visibleItems:5,linkage:["missionMenuItem"]});
      this.CONTENT.popupMC.groupMC._alpha = 0;
      this.displayableItems = 0;
      this.CONTENT.background._height = this.CONTENT.popupMC._y = this.yOffset + this.headingHeight - 1;
      this.CONTENT.popupMC._visible = false;
      this.SET_MISSION_TITLE_COLOUR(220,220,220);
      this.CONTENT.logoMC._visible = false;
   }
   function SET_DATA_SLOT(_slotIndex)
   {
      var _loc3_ = arguments.slice(1);
      this.model.addDataToView(0,_slotIndex,_loc3_);
   }
   function UPDATE_DATA_SLOT(_slotIndex)
   {
      var _loc3_ = arguments.slice(1);
      this.model.updateSlot(0,_slotIndex,_loc3_);
   }
   function DRAW_MENU_LIST()
   {
      var _loc2_ = this.model.getCurrentView(0).maxitems;
      this.model.getCurrentView(0).visibleItems = this.displayableItems = _loc2_;
      this.DISPLAY_VIEW(0);
      this.resizeBackground();
      this.FOCUS_VIEW(0);
      this.animateIn();
   }
   function HIGHLIGHT_ITEM(i, highlight)
   {
      highlight = highlight != undefined ? highlight : true;
      var _loc3_ = this.model.getCurrentView(0).itemList[i];
      _loc3_.highlighted = highlight;
   }
   function SET_MISSION_TITLE_COLOUR(r, g, b)
   {
      r != undefined;
      g != undefined;
      if(b != undefined)
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.logoMC.passedTF,r,g,b);
      }
      else
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.logoMC.passedTF,220,220,220);
      }
   }
   function SET_MISSION_SUBTITLE_COLOUR(r, g, b)
   {
      r != undefined;
      g != undefined;
      if(b != undefined)
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.headingMC.colMC,r,g,b);
      }
      else
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.headingMC.colMC,220,220,220);
      }
   }
   function SET_MISSION_BG_COLOUR(r, g, b)
   {
      r != undefined;
      g != undefined;
      if(b != undefined)
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.headingMC.bgMC,r,g,b);
         this.CONTENT.headingMC.bgMC._alpha = 100;
      }
   }
   function clampText(textF, labelS, maxVal)
   {
      textF.text = labelS;
      textF.wordWrap = false;
      if(textF._width > maxVal)
      {
         textF._xscale = maxVal / textF._width * 100;
      }
   }
   function SET_MISSION_TITLE(title, desc)
   {
      this.CONTENT.logoMC.passedTF.text = title;
      var _loc2_ = this.CONTENT.headingMC.colMC.headingTF;
      _loc2_.text = desc.toUpperCase();
      _loc2_.wordWrap = true;
      _loc2_.multiline = true;
      _loc2_.autoSize = "left";
      _loc2_._width = 268;
      var _loc3_ = 4;
      _loc2_._y = _loc3_;
      this.CONTENT.headingMC.bgMC._height = this.headingHeight;
      this.model.getCurrentView(0).viewContainerY = this.model.getCurrentView(0).viewContainer._y = this.headingHeight + this.twoPxGap;
   }
   function SET_TOTAL(medalID, totalValue, totalLabel)
   {
      var _loc2_ = this.CONTENT.popupMC.groupMC;
      this.SET_MEDAL(medalID);
      _loc2_.totalTF.html = true;
      _loc2_.totalTF.htmlText = "";
      _loc2_.totalTF.autoSize = "left";
      _loc2_.totalTF.multiline = false;
      _loc2_.totalTF.htmlText = totalLabel;
      if(_loc2_.totalTF._width > 252)
      {
         _loc2_.totalTF._width = 252;
         _loc2_.totalTF.multiline = true;
         _loc2_.totalTF.wordWrap = true;
      }
      if(totalValue == -99)
      {
         _loc2_.valueTF.text = "";
      }
      else
      {
         _loc2_.valueTF.text = totalValue + "%";
      }
      _loc2_.valueTF.autoSize = "right";
   }
   function SET_MEDAL(medalID)
   {
      if(medalID == -99)
      {
         this.CONTENT.background.gotoAndStop(1);
         this.CONTENT.popupMC._visible = true;
         this.CONTENT.popupMC.groupMC.medalMC._visible = false;
      }
      else if(medalID == 0)
      {
         this.CONTENT.background.gotoAndStop(2);
         this.CONTENT.popupMC._visible = false;
         this.CONTENT.popupMC.groupMC.medalMC._visible = true;
      }
      else
      {
         this.CONTENT.background.gotoAndStop(1);
         this.CONTENT.popupMC._visible = true;
         this.CONTENT.popupMC.groupMC.medalMC.gotoAndStop(medalID);
         this.CONTENT.popupMC.groupMC.medalMC._visible = true;
      }
   }
   function animateIn()
   {
      var _loc2_ = this.model.getCurrentView(0).itemList;
      for(var _loc6_ in _loc2_)
      {
         _loc2_[_loc6_]._alpha = 0;
      }
      var _loc7_ = _loc2_.length;
      var _loc4_ = 0.15;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT.background,_loc4_ * _loc7_,{_height:this.totalHeight,ease:com.rockstargames.ui.tweenStar.Ease.LINEAR,onComplete:this.animateInComplete,onCompleteScope:this});
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT.popupMC,_loc4_ * _loc7_,{_y:this.CONTENT.background._y + this.totalHeight,ease:com.rockstargames.ui.tweenStar.Ease.LINEAR});
      for(_loc6_ in _loc2_)
      {
         if(typeof _loc2_[_loc6_] == "movieclip")
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2_[_loc6_],0.2,{_alpha:100,delay:_loc6_ * _loc4_,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_IN});
         }
      }
   }
   function animateInComplete()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.CONTENT.popupMC.groupMC);
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT.popupMC.groupMC,0.2,{delay:0.3,_alpha:100});
   }
   function resizeBackground()
   {
      var _loc2_ = this.model.getCurrentView(0).itemList;
      this.totalHeight = _loc2_.length * 25;
      this.CONTENT.background._height = this.headingHeight;
      this.CONTENT.popupMC._y = this.CONTENT.background._y;
      this.CONTENT.popupMC.groupMC._alpha = 0;
   }
}

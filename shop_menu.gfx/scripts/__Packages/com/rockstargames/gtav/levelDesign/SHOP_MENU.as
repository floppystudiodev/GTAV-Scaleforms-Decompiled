class com.rockstargames.gtav.levelDesign.SHOP_MENU extends com.rockstargames.ui.components.GUIController
{
   var model;
   var CONTENT;
   var scrollBar;
   var timerDelay = 0;
   var yOffset = 82;
   var totalHeight = 200;
   var displayableItems = 10;
   function SHOP_MENU()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.model = new com.rockstargames.gtav.levelDesign.ShopModel();
      this.model.createView(0,{id:0,x:0,y:this.yOffset,rowSpacing:1,columnSpacing:0,selectstyle:2,container:this.CONTENT.viewContainerMC,visibleItems:5,linkage:["shopMenuItem"]});
      this.FADE_POPUP_OUT();
      this.SHOW_SCROLL_HINTS(false);
      com.rockstargames.gtav.levelDesign.ShopModel(this.model).arrows = [this.CONTENT.headingMC.arrowMC,this.CONTENT.popupMC.arrowMC];
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
   function DRAW_MENU_LIST(visItems)
   {
      var _loc2_ = this.model.getCurrentView(0).maxitems;
      if(_loc2_ > 10)
      {
         _loc2_ = 10;
      }
      this.model.getCurrentView(0).visibleItems = this.displayableItems = _loc2_;
      this.DISPLAY_VIEW(0);
      this.RESIZE_BACKGROUND(0);
      this.FOCUS_VIEW(0);
   }
   function SET_LOGO(brandID)
   {
      var _loc2_ = com.rockstargames.gtav.constants.ShopBrandLUT.lookUp(brandID);
      this.CONTENT.logo.gotoAndStop(_loc2_[2]);
   }
   function SET_HEADER(newHeader)
   {
      this.CONTENT.headingMC.headingTF.text = newHeader.toUpperCase();
      this.CONTENT.headingMC.headingTF.autoSize = "left";
   }
   function SET_POPUP(dialogStr, delay)
   {
      this.CONTENT.popupMC.headingTF.text = dialogStr;
      this.CONTENT.popupMC.headingTF.autoSize = "left";
      this.CONTENT.popupMC.infoMC._visible = true;
      if(delay == undefined || delay == null)
      {
         delay = 5;
      }
      if(delay < 0)
      {
         delay = 0;
      }
      if(delay > 45)
      {
         delay = 45;
      }
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.CONTENT.popupMC);
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.CONTENT.popupMC,delay,{onCompleteScope:this,onComplete:this.FADE_POPUP_OUT});
   }
   function FADE_POPUP_OUT()
   {
      this.CONTENT.popupMC.headingTF.text = "";
      this.CONTENT.popupMC.infoMC._visible = false;
   }
   function RESIZE_BACKGROUND(_viewIndex)
   {
      this.totalHeight = this.displayableItems * 23 + this.yOffset;
      this.CONTENT.background._height = this.totalHeight;
      this.CONTENT.popupMC._y = this.totalHeight - 1;
      if(this.model.getCurrentView().maxitems > this.displayableItems)
      {
         if(this.scrollBar == undefined)
         {
            this.scrollBar = com.rockstargames.ui.components.GUIScroll(this.CONTENT.scrollbarsMC.attachMovie("scrollBarMC","scrollBarMC",this.CONTENT.scrollbarsMC.getNextHighestDepth()));
         }
         this.scrollBar.init(255,this.yOffset,this.totalHeight - this.yOffset);
         this.scrollBar.setGutterHeight(this.model.getCurrentView(0).visibleItems,this.model.getCurrentView().maxitems);
         this.model.scrollBar = this.scrollBar;
         this.scrollBar.scrollpercent = 0;
         this.SHOW_SCROLL_HINTS(true);
      }
      else if(this.scrollBar != undefined)
      {
         this.scrollBar.removeMovieClip();
         this.scrollBar = undefined;
         this.model.scrollBar = undefined;
         this.SHOW_SCROLL_HINTS(false);
      }
   }
   function SHOW_SCROLL_HINTS(show)
   {
      this.CONTENT.headingMC.arrowMC._visible = this.CONTENT.popupMC.arrowMC._visible = show;
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
   }
}

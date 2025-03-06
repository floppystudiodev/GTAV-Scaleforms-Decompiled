class com.rockstargames.gtav.levelDesign.SHOP_MENU_DLC extends com.rockstargames.ui.components.GUIController
{
   var model;
   var CONTENT;
   var scrollBar;
   var timerDelay = 0;
   var yOffset = 42;
   var totalHeight = 200;
   var displayableItems = 10;
   function SHOP_MENU_DLC()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.model = new com.rockstargames.gtav.levelDesign.ShopModelDLC();
      this.model.createView(0,{id:0,x:0,y:this.yOffset,rowSpacing:1,columnSpacing:0,selectstyle:3,container:this.CONTENT.viewContainerMC,visibleItems:10,linkage:["shopMenuItem"]});
      this.CONTENT.contentImageMC._visible = false;
      this.CONTENT.footerMC._visible = false;
      this.CONTENT.descriptionMC._visible = false;
   }
   function GET_CURRENT_SELECTION()
   {
      var _loc2_ = this.model.getCurrentSelection(0);
      return _loc2_;
   }
   function SET_DATA_SLOT_EMPTY(clearEverything)
   {
      this.model.removeDataFromSlot(0);
      if(clearEverything == true)
      {
         this.SET_TITLE();
         this.SET_IMAGE();
         this.SET_DESCRIPTION();
      }
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
      this.DISPLAY_DATA_SLOT();
   }
   function DISPLAY_DATA_SLOT()
   {
      var _loc2_ = this.model.getCurrentView(0).maxitems;
      if(_loc2_ > 10)
      {
         _loc2_ = 10;
      }
      this.model.getCurrentView(0).visibleItems = this.displayableItems = _loc2_;
      if(this.model.getCurrentView(0).maxitems > this.model.getCurrentView(0).visibleItems)
      {
         this.CONTENT.footerMC._visible = true;
      }
      else
      {
         this.CONTENT.footerMC._visible = false;
      }
      this.DISPLAY_VIEW(0);
      this.RESIZE_BACKGROUND(0);
      this.FOCUS_VIEW(0);
   }
   function SET_TITLE(newHeader)
   {
      if(newHeader == undefined)
      {
         newHeader = "";
      }
      this.CONTENT.headingMC.headingTF.text = newHeader.toUpperCase();
      this.CONTENT.headingMC.headingTF.autoSize = "left";
   }
   function SET_IMAGE(textureDict, textureFilename)
   {
      if(textureDict != undefined && textureFilename != undefined)
      {
         if(textureFilename == "debug")
         {
            this.CONTENT.contentImageMC.picMC.titleTF.htmlText = "<img src=\'" + textureDict + "\' vspace=\'0\' hspace=\'0\' width=\'260\' height=\'95\' />";
         }
         else
         {
            this.CONTENT.contentImageMC.picMC.titleTF.htmlText = "<img src=\'img://" + textureDict + "/" + textureFilename + "\' vspace=\'0\' hspace=\'0\' width=\'260\' height=\'95\'/>";
         }
         this.CONTENT.contentImageMC.picMC.blankImage._visible = false;
      }
      else
      {
         this.CONTENT.contentImageMC.picMC.blankImage._visible = true;
         this.CONTENT.contentImageMC.picMC.titleTF.htmlText = "";
      }
      this.CONTENT.contentImageMC._visible = true;
   }
   function SET_DESCRIPTION(description, priceTitle, priceValue)
   {
      if(description == undefined)
      {
         description = "";
      }
      if(priceTitle == undefined)
      {
         priceTitle = "";
      }
      if(priceValue == undefined)
      {
         priceValue = "";
      }
      this.CONTENT.descriptionMC.descriptionTF.htmlText = description;
      this.CONTENT.descriptionMC.descriptionTF.autoSize = "left";
      this.CONTENT.descriptionMC.footerText.itemTextLeft.text = priceTitle;
      this.CONTENT.descriptionMC.footerText.itemTextRight.text = priceValue;
      this.CONTENT.descriptionMC._visible = true;
      this.RESIZE_BACKGROUND(0);
   }
   function RESIZE_BACKGROUND(_viewIndex)
   {
      if(this.model.getCurrentView().maxitems > this.displayableItems)
      {
         if(this.scrollBar == undefined)
         {
            this.scrollBar = com.rockstargames.ui.components.GUIScroll(this.CONTENT.scrollbarsMC.attachMovie("scrollBarMC","scrollBarMC",this.CONTENT.scrollbarsMC.getNextHighestDepth()));
         }
         this.scrollBar.init(255,this.yOffset,this.totalHeight);
         this.scrollBar.setGutterHeight(this.model.getCurrentView(0).visibleItems,this.model.getCurrentView().maxitems);
         this.model.scrollBar = this.scrollBar;
         this.scrollBar.scrollpercent = 0;
      }
      else if(this.scrollBar != undefined)
      {
         this.scrollBar.removeMovieClip();
         this.scrollBar = undefined;
         this.model.scrollBar = undefined;
      }
      this.totalHeight = this.displayableItems * 23;
      this.CONTENT.background._height = this.totalHeight + 10;
      var _loc2_ = this.yOffset + this.totalHeight + 7;
      this.CONTENT.footerMC._y = _loc2_;
      if(this.CONTENT.footerMC._visible == true)
      {
         _loc2_ = this.CONTENT.footerMC._y + this.CONTENT.footerMC._height + 2;
      }
      else
      {
         _loc2_ = this.CONTENT.footerMC._y;
      }
      this.CONTENT.contentImageMC._y = _loc2_;
      _loc2_ = this.CONTENT.contentImageMC._y + this.CONTENT.contentImageMC._height - 2;
      this.CONTENT.descriptionMC._y = _loc2_;
      this.CONTENT.descriptionMC.footerText._y = this.CONTENT.descriptionMC.descriptionTF._y + this.CONTENT.descriptionMC.descriptionTF.textHeight + 5;
      this.CONTENT.descriptionMC.background._height = this.CONTENT.descriptionMC.footerText._y + 25;
      this.SHOW_SCROLL_HINTS();
   }
   function SHOW_SCROLL_HINTS()
   {
      var _loc2_ = this.model.getCurrentView(0).maxitems;
      var _loc3_ = this.model.getCurrentView(0).visibleItems;
      var _loc6_ = this.model.getCurrentSelection(0);
      var _loc5_ = false;
      var _loc4_ = false;
      if(_loc2_ > _loc3_)
      {
         var _loc7_ = _loc2_ - _loc3_ - this.model.getCurrentView(0).topEdge;
         if(_loc6_ > 0)
         {
            _loc5_ = true;
         }
         else
         {
            _loc5_ = false;
         }
         if(_loc6_ < _loc2_ - 1)
         {
            _loc4_ = true;
         }
         else
         {
            _loc4_ = false;
         }
      }
      this.CONTENT.footerMC.scrollArrowUp._visible = _loc5_;
      this.CONTENT.footerMC.scrollArrowDown._visible = _loc4_;
      this.CONTENT.footerMC.numItemsTF.text = _loc3_ + "/" + _loc2_;
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
      this.SHOW_SCROLL_HINTS();
   }
}

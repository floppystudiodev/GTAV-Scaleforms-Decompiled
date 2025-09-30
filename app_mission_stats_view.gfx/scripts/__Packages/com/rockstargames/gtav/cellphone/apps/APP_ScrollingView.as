class com.rockstargames.gtav.cellphone.apps.APP_ScrollingView extends MovieClip
{
   var CONTENT;
   var container;
   var content;
   var currentStyle;
   var dataProviderUI;
   var gfxFileName;
   var gutterHeight;
   var linkageID;
   var offWhiteRGB;
   var offsetY;
   var scrollBar;
   var scrollBarTimeout;
   var scrollerX;
   var whiteRGB;
   var isLandscape = false;
   var contentOriginX = 0;
   var contentOriginY = 0;
   var scrollamount = 20;
   var needsScrollbars = false;
   var arrayStartPoint = 0;
   var inputDelay = 0;
   var offStateAlpha = 60;
   var currentSelection = -1;
   function APP_ScrollingView()
   {
      super();
      this.dataProviderUI = new Array();
      this.CONTENT = this;
   }
   function construct(parentContainer, linkage, params)
   {
      this.dataProviderUI = params;
      this.linkageID = linkage;
      this.container.removeMovieClip();
      this.container = parentContainer.createEmptyMovieClip("container",parentContainer.getNextHighestDepth());
      clearInterval(this.scrollBarTimeout);
      this.scrollBar = new com.rockstargames.ui.controls.ScrollBar();
      this.scrollBar.construct(this.container,"scrubber","gutter",this.scrollerX,this.offsetY,this.gutterHeight);
      if(this.gfxFileName == "CELLPHONE_FACADE")
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.scrollBar.scrubber,this.whiteRGB[0],this.whiteRGB[1],this.whiteRGB[2],75);
         com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.bg,this.offWhiteRGB[0],this.offWhiteRGB[1],this.offWhiteRGB[2],100);
      }
      else
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.scrollBar.scrubber,0,0,0,50);
         com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.bg,this.currentStyle[4][0],this.currentStyle[4][1],this.currentStyle[4][2],100);
      }
      this.scrollBar.scrollBarContainer._alpha = 0;
      this.renderContainers();
      this.scrollBar.scrollBarContainer.swapDepths(this.scrollBar.scrollBarContainer.getDepth() + 20);
   }
   function renderContainers()
   {
      if(this.container.content == undefined)
      {
         this.content = this.container.attachMovie(this.linkageID,"content",this.container.getNextHighestDepth(),{_x:this.contentOriginX,_y:this.contentOriginY});
      }
      this.populateContent();
   }
   function populateContent()
   {
   }
   function navigate(direction)
   {
      var _loc2_ = Math.round(this.content._y);
      switch(direction)
      {
         case "UP":
            if(_loc2_ < this.contentOriginY)
            {
               _loc2_ += this.scrollamount;
            }
            if(_loc2_ > this.contentOriginY)
            {
               _loc2_ = this.contentOriginY;
            }
            break;
         case "DOWN":
            if(_loc2_ + this.content._height > this.contentOriginY + this.gutterHeight)
            {
               _loc2_ -= this.scrollamount;
            }
            if(_loc2_ + this.content._height < this.contentOriginY + this.gutterHeight)
            {
               _loc2_ = this.contentOriginY - (this.content._height - this.gutterHeight);
            }
      }
      var _loc4_;
      var _loc3_;
      if(Math.round(_loc2_) != Math.round(this.content._y))
      {
         this.scrollBar.scrollBarContainer._visible = true;
         this.setScrollBarVisibility(true);
         this.content._y = Math.round(_loc2_);
         _loc3_ = this.contentOriginY - this.content._y;
         _loc4_ = _loc3_ / (this.content._height - this.gutterHeight) * 100;
         this.scrollBar.scrollToPercentage(_loc4_);
      }
   }
   function setScrollBarVisibility(isVisible)
   {
      if(isVisible)
      {
         this.scrollBar.SHOW();
         clearInterval(this.scrollBarTimeout);
         this.scrollBarTimeout = setInterval(this,"setScrollBarVisibility",300,false);
      }
      else
      {
         this.scrollBar.HIDE();
         clearInterval(this.scrollBarTimeout);
      }
   }
   function GET_CURRENT_SELECTION()
   {
      return this.currentSelection;
   }
   function SHOW()
   {
      this.container._visible = true;
   }
   function HIDE()
   {
      this.container._visible = false;
   }
   function REMOVE()
   {
      this.dataProviderUI = [];
      for(var _loc2_ in this.container)
      {
         if(typeof this.container[_loc2_] == "movieclip")
         {
            this.container[_loc2_].removeMovieClip();
         }
         else
         {
            delete this.container[_loc2_];
         }
      }
      this.container.removeMovieClip();
   }
   function CLEAN_UP_DATA()
   {
      this.dataProviderUI = [];
   }
   function CLOSE_APP()
   {
      clearInterval(this.scrollBarTimeout);
      this.container.removeMovieClip();
      this.REMOVE();
   }
}

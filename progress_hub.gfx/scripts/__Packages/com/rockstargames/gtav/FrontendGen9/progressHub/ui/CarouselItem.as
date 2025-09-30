class com.rockstargames.gtav.FrontendGen9.progressHub.ui.CarouselItem extends com.rockstargames.gtav.FrontendGen9.components.GridItem
{
   var MOUSE_EVT;
   var _gradient;
   var _highlight;
   var _image;
   var _initialTitlePosition;
   var _isLit;
   var _sticker;
   var _textScale;
   var attachMovie;
   var buttonImage;
   var getNextHighestDepth;
   var itemHeight;
   var itemWidth;
   var rearrangeContent;
   var titleText;
   var myBtnType = 1;
   var SF_BASE_CLASS_MOUSE = 10;
   var _textAnimationDistance = 0;
   var index = -1;
   var _isRichText = false;
   var _itemType = 0;
   var TYPE_PRICE = 0;
   var TYPE_TEXT = 1;
   var TYPE_BONUS = 2;
   var _isMouseActive = false;
   function CarouselItem()
   {
      super();
      this.itemWidth = 218;
      this.itemHeight = 126;
      this._textScale = 100;
      this.rearrangeContent();
      this.MOUSE_EVT = new com.rockstargames.ui.mouse.MOUSE_EVENTS();
      this.MOUSE_EVT.UI_MOVIE = 5;
      this.MOUSE_EVT.INTERFACE_TYPE = this.SF_BASE_CLASS_MOUSE;
      this.buttonImage = this.attachMovie("buttonImage","buttonImage",82,{_x:0,_y:0});
   }
   function SET_CAROUSEL_ITEM_DETAILS(title, itemImage, status, TXD, meterValue, app)
   {
      this.attachMovie("titleText","titleText",105,{_x:8,_y:92});
      com.rockstargames.gtav.FrontendGen9.PROGRESS_HUB.truncate(this.titleText.textTF,title.toUpperCase(),"left",1);
      this._sticker = com.rockstargames.gtav.FrontendGen9.progressHub.ui.Sticker(this.attachMovie("sticker","sticker",110,{_x:10,_y:10}));
      if(status)
      {
         this._sticker._visible = true;
         this._sticker.setStatus(status);
         this._sticker._x = 5;
         this._sticker._y = 5;
      }
      else
      {
         this._sticker._visible = false;
         this._sticker._x = 10;
         this._sticker._y = 10;
      }
      this.attachMovie("itemGradient","itemGradient",86,{_x:0,_y:0,_width:this.itemWidth,_height:this.itemHeight});
      app.imageManager.addImage(TXD,itemImage,this.buttonImage);
      this._gradient._visible = false;
      var _loc2_ = this.attachMovie("carouselItemMeter","meter",this.getNextHighestDepth());
      _loc2_._y = this.itemHeight - _loc2_._height;
      _loc2_._visible = meterValue >= 0 && meterValue != undefined;
      _loc2_.bar._xscale = Math.min(100,meterValue * 100);
   }
   function SET_MOUSE_ACTIVE(active)
   {
      this._isMouseActive = active;
   }
   function sendMouseEvent(evt)
   {
      if(this._isMouseActive)
      {
         this.MOUSE_EVT.triggerEvent([this.myBtnType,evt,this.index]);
      }
   }
   function setHighlight(isLit)
   {
      var _loc3_ = this._initialTitlePosition.y;
      this._isLit = isLit;
      this._highlight._visible = isLit;
      this._image.setHighlight(isLit);
   }
}

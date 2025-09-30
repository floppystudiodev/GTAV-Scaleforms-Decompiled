class com.rockstargames.gtav.FrontendGen9.components.CarouselItem extends com.rockstargames.gtav.FrontendGen9.components.GridItem
{
   var MOUSE_EVT;
   var _gradient;
   var _highlight;
   var _image;
   var _initialTitlePosition;
   var _isLit;
   var _textScale;
   var _titleText;
   var attachMovie;
   var currentText;
   var itemHeight;
   var itemWidth;
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
   var _isMousePendingActive = false;
   function CarouselItem()
   {
      super();
      this.itemWidth = 218.6666;
      this.itemHeight = 123.3333;
      this._textScale = 100;
      this.rearrangeContent();
      this.MOUSE_EVT = new com.rockstargames.ui.mouse.MOUSE_EVENTS();
      this.MOUSE_EVT.UI_MOVIE = 5;
      this.MOUSE_EVT.INTERFACE_TYPE = this.SF_BASE_CLASS_MOUSE;
   }
   function SET_CAROUSEL_ITEM_DETAILS(str, mainImgTxd, mainImgTexture, itemType, isRichText)
   {
      this._initialTitlePosition = new flash.geom.Point(15,98);
      if(itemType == undefined)
      {
         itemType = 0;
      }
      this.currentText = str;
      this._itemType = itemType;
      this._isRichText = isRichText;
      switch(itemType)
      {
         case this.TYPE_PRICE:
            this._titleText = com.rockstargames.gtav.FrontendGen9.components.Text(this.attachMovie("carouselPrice","carouselPrice",100));
            break;
         case this.TYPE_TEXT:
            this._titleText = com.rockstargames.gtav.FrontendGen9.components.Text(this.attachMovie("carouselText","carouselText",100));
            break;
         case this.TYPE_BONUS:
            this._titleText = com.rockstargames.gtav.FrontendGen9.components.Text(this.attachMovie("carouselText","carouselText",100));
      }
      this.SET_GRID_ITEM_DETAILS(this.currentText,"",mainImgTxd,mainImgTexture);
   }
   function SET_MOUSE_ACTIVE(active)
   {
      this._isMousePendingActive = active;
      if(active == false)
      {
         this._isMouseActive = false;
      }
   }
   function rearrangeContent()
   {
      super.rearrangeContent();
      this._initialTitlePosition.y = this.itemHeight - this._titleText.getTextHeight() / 100 * this._textScale - 13.333;
      this._titleText._y = this._initialTitlePosition.y;
      if(com.rockstargames.gtav.FrontendGen9.components.Text.isAsian)
      {
         this._titleText.resizeAsianText();
      }
      this._gradient._y = 0;
      this._gradient._height = this.itemHeight;
   }
   function SET_GRID_ITEM_DETAILS(titleStr, descStr, mainImgTxd, mainImgTexture, iconTxd, iconTexure, tagTxd, tagTexture)
   {
      this._titleText.SET_TEXT(titleStr,this._isRichText);
      this._image.SET_IMAGE(mainImgTxd,mainImgTexture,true);
      this.rearrangeContent();
   }
   function UPDATE_ITEM_TEXTURE(mainImgTxd, mainImgTexture)
   {
      this._image.SET_IMAGE(mainImgTxd,mainImgTexture,true);
      this.rearrangeContent();
   }
   function onMouseMove()
   {
      super.onMouseMove();
      if(this._isMousePendingActive == true)
      {
         this._isMouseActive = true;
         this._isMousePendingActive = false;
      }
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

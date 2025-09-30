class com.rockstargames.gtav.FrontendGen9.components.CareersItem extends com.rockstargames.gtav.FrontendGen9.components.GridItem
{
   var _description;
   var _image;
   var _initialTitlePosition;
   var _textAnimationDistance;
   var _textScale;
   var _titleText;
   var attachMovie;
   var itemHeight;
   var itemWidth;
   function CareersItem()
   {
      super();
      this.itemWidth = 280;
      this.itemHeight = 558;
      this._initialTitlePosition = new flash.geom.Point(13.3333,210);
      this._description = com.rockstargames.gtav.FrontendGen9.components.Text(this.attachMovie("careersDescription","description",this._description.getDepth(),{_x:13.3333,_y:395,_visible:false}));
      this._description._alpha = 0;
      this.rearrangeContent();
   }
   function SET_GRID_ITEM_DETAILS(titleStr, descStr, mainImgTxd, mainImgTexture, iconTxd, iconTexure, tagTxd, tagTexture)
   {
      this._titleText.SET_TEXT(titleStr);
      this._description.SET_TEXT(descStr);
      this._image.SET_IMAGE(mainImgTxd,mainImgTexture,true);
      this._textAnimationDistance = this._description.getTextHeight() + 4.6666;
      this._description._alpha = 0;
      this.rearrangeContent();
   }
   function rearrangeContent()
   {
      super.rearrangeContent();
      this._initialTitlePosition.y = this.itemHeight - this._titleText.getTextHeight() / 100 * this._textScale;
      this._titleText._y = this._initialTitlePosition.y;
      this._description._y = this._titleText._y + this._titleText.getTextHeight() / 100 * this._textScale - this._textAnimationDistance + 4.3333;
   }
}

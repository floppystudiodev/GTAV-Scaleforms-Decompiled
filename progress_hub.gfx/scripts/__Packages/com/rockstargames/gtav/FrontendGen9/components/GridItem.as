class com.rockstargames.gtav.FrontendGen9.components.GridItem extends com.rockstargames.gtav.FrontendGen9.components.BaseItem
{
   var MOUSE_EVT;
   var _alpha;
   var _description;
   var _gradient;
   var _highlight;
   var _hover;
   var _image;
   var _initialTitlePosition;
   var _spinner;
   var _sticker;
   var _titleText;
   var attachMovie;
   var myBtnType = 2;
   var SF_BASE_CLASS_MOUSE = 10;
   var _itemId = -1;
   var _textAnimationDistance = 60;
   var _disabledAlpha = 60;
   var _spacerSize = 13.33333;
   var _textScale = 85;
   var _animInState = 1;
   var _animOutState = 1;
   var _descriptionAlphaCache = 0;
   var _isLit = false;
   var itemHeight = 128.66666;
   var itemWidth = 375.33333;
   var _isSelected = false;
   var _isHover = false;
   var _isRolledOver = false;
   function GridItem()
   {
      super();
      this._initialTitlePosition = new flash.geom.Point(10,98);
      this._spinner = this.attachMovie("spinner","spinner",170,{_visible:false});
      this._image = com.rockstargames.gtav.FrontendGen9.components.ScalableImage(this.attachMovie("gridImage","image",80));
      this._gradient = this.attachMovie("itemGradient","gradient",85);
      this._sticker = com.rockstargames.gtav.FrontendGen9.components.Sticker(this.attachMovie("sticker","sticker",90,{_visible:false,_x:13,_y:13}));
      this._titleText = com.rockstargames.gtav.FrontendGen9.components.Text(this.attachMovie("title","title",100));
      this._highlight = this.attachMovie("highlight","highlight",120,{_x:-4,_y:-4,_visible:false});
      this._description = com.rockstargames.gtav.FrontendGen9.components.Text(this.attachMovie("description","description",130,{_x:14.5,_y:205,_visible:false}));
      this._description._leading = 10;
      this._description._alpha = 0;
      this._descriptionAlphaCache = 0;
      this._hover = this.attachMovie("highlight","hover",150,{_x:-4,_y:-4,_visible:false});
      this.MOUSE_EVT = new com.rockstargames.ui.mouse.MOUSE_EVENTS();
      this.MOUSE_EVT.UI_MOVIE = 5;
      this.MOUSE_EVT.INTERFACE_TYPE = this.SF_BASE_CLASS_MOUSE;
      this.rearrangeContent();
   }
   function SET_GRID_ITEM_ID(itemId)
   {
      this._itemId = itemId;
   }
   function SET_GRID_ITEM_DETAILS(titleStr, descStr, mainImgTxd, mainImgTexture, iconTxd, iconTexure, tagTxd, tagTexture)
   {
      this._titleText.SET_TEXT(titleStr);
      this._description.SET_TEXT(descStr);
      this._image.SET_IMAGE(mainImgTxd,mainImgTexture,true);
      this._textAnimationDistance = this._description.getTextHeight() + 7;
      this._description._alpha = 0;
      this.rearrangeContent();
   }
   function rearrangeContent()
   {
      if(com.rockstargames.gtav.FrontendGen9.components.Text.isAsian)
      {
         this._titleText.resizeAsianText();
      }
      this._titleText._xscale = this._textScale;
      this._titleText._yscale = this._textScale;
      this._image.setSize(this.itemWidth,this.itemHeight);
      this._titleText._x = this._initialTitlePosition.x;
      this._initialTitlePosition.y = this.itemHeight - this._titleText.getTextHeight() / 100 * this._textScale - 10;
      this._titleText._y = this._initialTitlePosition.y;
      this._description._y = this._titleText._y + this._titleText.getTextHeight() / 100 * this._textScale - this._textAnimationDistance + this._spacerSize + 2.6666;
      this._description._alpha = 0;
      this._highlight._height = this.itemHeight + 8;
      this._highlight._width = this.itemWidth + 8;
      this._hover._height = this._highlight._height;
      this._hover._width = this._highlight._width;
      this._spinner._x = this.itemWidth / 2;
      this._spinner._y = this.itemHeight / 2;
      this._gradient._y = this.itemHeight;
      this._gradient._height = 0;
      this._gradient._width = this.itemWidth;
      var _loc2_ = 2 * (this.itemHeight - this._initialTitlePosition.y);
      if(_loc2_ > this.itemHeight)
      {
         _loc2_ = this.itemHeight;
      }
      this._gradient._height = _loc2_;
      this._gradient._y = this.itemHeight - _loc2_ + 0.6666;
   }
   function setHighlight(isLit)
   {
      this._animInState = 1;
      this._animOutState = 1;
      this._isLit = isLit;
      this._highlight._visible = isLit;
      var _loc4_;
      var _loc2_;
      if(isLit)
      {
         this._description._visible = true;
         this._description._alpha = 0;
         _loc4_ = this._initialTitlePosition.y - this._textAnimationDistance;
         _loc2_ = 2 * (this.itemHeight - _loc4_);
         if(_loc2_ > this.itemHeight)
         {
            _loc2_ = this.itemHeight;
         }
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this._gradient,0.2,{_height:_loc2_,_y:this.itemHeight - _loc2_,_alpha:100});
         this.animateTextIn();
      }
      else
      {
         _loc4_ = this._initialTitlePosition.y;
         _loc2_ = 2 * (this.itemHeight - _loc4_);
         if(_loc2_ > this.itemHeight)
         {
            _loc2_ = this.itemHeight;
         }
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this._gradient,0.2,{_height:_loc2_,_y:this.itemHeight - _loc2_,_alpha:100});
         this.animateTextOut();
      }
      this._image.setHighlight(isLit);
   }
   function animateTextIn()
   {
      var _loc2_ = this._initialTitlePosition.y - this._textAnimationDistance;
      switch(this._animInState)
      {
         case 1:
            this._descriptionAlphaCache = 100;
            this._titleText._y = this._initialTitlePosition.y;
            this._titleText._alpha = 100;
            this._description._alpha = 0;
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this._titleText,0.1,{_alpha:0,onComplete:this.animateTextIn,onCompleteScope:this});
            this._animInState = 2;
            break;
         case 2:
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this._titleText,0.2,{_y:_loc2_,onComplete:this.animateTextIn,onCompleteScope:this});
            this._animInState = 3;
            break;
         case 3:
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this._titleText,0.1,{_alpha:100,onComplete:this.animateTextIn,onCompleteScope:this});
            this._animInState = 4;
            break;
         case 4:
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this._description,0.2,{_alpha:this._descriptionAlphaCache});
            this._animInState = 1;
         default:
            return;
      }
   }
   function animateTextOut()
   {
      var _loc2_ = this._initialTitlePosition.y;
      switch(this._animOutState)
      {
         case 1:
            this._descriptionAlphaCache = 0;
            this._titleText._y = this._initialTitlePosition.y - this._textAnimationDistance;
            this._titleText._alpha = 100;
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this._description,0.1,{_alpha:this._descriptionAlphaCache,onComplete:this.animateTextOut,onCompleteScope:this});
            this._animOutState = 2;
            break;
         case 2:
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this._titleText,0.1,{_alpha:0,onComplete:this.animateTextOut,onCompleteScope:this});
            this._animOutState = 3;
            break;
         case 3:
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this._titleText,0.2,{_y:_loc2_,onComplete:this.animateTextOut,onCompleteScope:this});
            this._animOutState = 4;
            break;
         case 4:
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this._titleText,0.1,{_alpha:100});
            this._animOutState = 1;
         default:
            return;
      }
   }
   function setHover(isLit)
   {
      this._isLit = isLit;
      this._hover._visible = isLit;
   }
   function SET_STATE(state)
   {
      if(state == 0)
      {
         this._isSelected = false;
      }
      else if(state == 1)
      {
         this._isSelected = true;
      }
      if(this._isSelected)
      {
         this.setHighlight(true);
         this.breatheIn();
      }
      else if(this._isHover)
      {
         this.SET_HOVER_STATE(1);
      }
      else
      {
         this.setHighlight(false);
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this._highlight);
      }
   }
   function SET_ENABLED(isEnabled)
   {
      if(isEnabled)
      {
         this._image._alpha = 100;
         this._sticker._alpha = 100;
         this._titleText._alpha = 100;
      }
      else
      {
         this._image._alpha = this._disabledAlpha;
         this._sticker._alpha = this._disabledAlpha;
         this._highlight._alpha = this._disabledAlpha;
      }
   }
   function SET_HOVER_STATE(state)
   {
      if(state == 0)
      {
         this._isHover = false;
      }
      else if(state == 1)
      {
         this._isHover = true;
      }
      if(!this._isSelected)
      {
         this.setHover(this._isHover);
         this._image.setHighlight(this._isHover);
      }
   }
   function ADD_STICKER(id, str)
   {
      this._sticker.SET_TYPE_AND_TEXT(id,str,com.rockstargames.gtav.FrontendGen9.components.Text.isAsian);
      this._sticker._visible = true;
   }
   function REMOVE_STICKER()
   {
      this._sticker._visible = false;
   }
   function breatheIn()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this._highlight,0.5,{_alpha:100,onComplete:this.breatheOut,onCompleteScope:this});
   }
   function breatheOut()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this._highlight,0.5,{_alpha:65,onComplete:this.breatheIn,onCompleteScope:this});
   }
   function ANIMATE_IN(sequenceIndex)
   {
      var _loc2_ = 0.367;
      var _loc3_ = 0.1 * sequenceIndex;
      this._alpha = 0;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this,_loc2_,{_alpha:100,delay:_loc3_});
   }
   function SET_SPINNER_VISIBLE(isVisible)
   {
      this._spinner._visible = isVisible;
   }
   function onPress()
   {
      this.sendMouseEvent(com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_PRESS);
   }
   function onRollOver()
   {
      this._isRolledOver = true;
      this.sendMouseEvent(com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_ROLL_OVER);
   }
   function onRollOut()
   {
      this._isRolledOver = false;
      this.sendMouseEvent(com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_ROLL_OUT);
   }
   function onRelease()
   {
      this.sendMouseEvent(com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_RELEASE);
   }
   function onReleaseOutside()
   {
      this.sendMouseEvent(com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_RELEASE_OUTSIDE);
      this._isRolledOver = false;
   }
   function onMouseMove()
   {
      if(this._isRolledOver && !this._isHover && !this._isSelected)
      {
         this.sendMouseEvent(com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_ROLL_OVER);
      }
   }
   function sendMouseEvent(evt)
   {
      this.MOUSE_EVT.triggerEvent([this.myBtnType,evt,this._itemId]);
   }
}

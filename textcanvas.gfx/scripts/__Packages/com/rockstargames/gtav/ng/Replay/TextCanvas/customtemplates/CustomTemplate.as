class com.rockstargames.gtav.ng.Replay.TextCanvas.customtemplates.CustomTemplate extends MovieClip implements com.rockstargames.gtav.ng.Replay.TextCanvas.ITextTemplate
{
   var _allTextfields;
   var _constrainedCanvas;
   var _constrainedHeight;
   var _constrainedWidth;
   var _currentTemplateId;
   var _isCanvasConstrained;
   var _mask;
   var _textfieldsContainer;
   static var HD_TITLE_SAFE = 0.8;
   static var NON_WIDESCREEN_TITLE_SAFE_WIDTH = 0.75;
   static var MINIMUM_FONT_SIZE = 55;
   static var MACHINE_BOLD = "$Machine";
   static var ANIMATION_PREVIEW_DELAY = 5;
   var _introDuration = 1;
   var _onScreenDuration = 3;
   var _outroDuration = 1;
   var _screenWidthPixels = 1280;
   var _screenHeightPixels = 720;
   var _safeTop = 54;
   var _safeBottom = 666;
   var _safeLeft = 96;
   var _safeRight = 1184;
   var _isWidescreen = false;
   var _numTextfields = 2;
   function CustomTemplate()
   {
      super();
   }
   function start()
   {
      this.play();
   }
   function pause()
   {
      this.stop();
   }
   function dispose()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this._textfieldsContainer);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this);
      this.removeMovieClip();
   }
   function updatePropertyWithString(itemIndex, propertyId, data)
   {
      switch(propertyId)
      {
         case com.rockstargames.gtav.ng.Replay.TextCanvas.types.PropertyTypes.TEXT:
            this.setNewText(itemIndex,data);
            break;
         case com.rockstargames.gtav.ng.Replay.TextCanvas.types.PropertyTypes.FONT:
            this.updateFontByLabel(itemIndex,data);
         default:
            return;
      }
   }
   function updatePropertyWithNumber(itemIndex, propertyId, data)
   {
      switch(propertyId)
      {
         case com.rockstargames.gtav.ng.Replay.TextCanvas.types.PropertyTypes.OPACITY:
            this.updateOpacityByValue(itemIndex,data);
            break;
         case com.rockstargames.gtav.ng.Replay.TextCanvas.types.PropertyTypes.COLOUR:
            this.updateColourById(itemIndex,data);
            break;
         case com.rockstargames.gtav.ng.Replay.TextCanvas.types.PropertyTypes.POSITION_X:
            this.updateTextfieldsContainerPositionX(data);
            break;
         case com.rockstargames.gtav.ng.Replay.TextCanvas.types.PropertyTypes.POSITION_Y:
            this.updateTextfieldsContainerPositionY(data);
            break;
         case com.rockstargames.gtav.ng.Replay.TextCanvas.types.PropertyTypes.SCALE:
            this.updateScale(data);
         default:
            return;
      }
   }
   function init(templateTypeId)
   {
      this._currentTemplateId = templateTypeId;
      var _loc0_;
      if((_loc0_ = this._currentTemplateId) !== com.rockstargames.gtav.ng.Replay.TextCanvas.types.TemplateTypes.NEW_TEMPLATES)
      {
         this._numTextfields = 1;
         this._isCanvasConstrained = false;
      }
      else
      {
         this._numTextfields = 2;
         this._isCanvasConstrained = true;
      }
      this._mask = this.createEmptyMovieClip("mask",this.getNextHighestDepth());
      this.setMaskDimensions();
      this._constrainedCanvas = this.createEmptyMovieClip("constrainedCanvas",this.getNextHighestDepth());
      this.setConstrainedCanvas();
      this.initTextfields();
      if(this._currentTemplateId == com.rockstargames.gtav.ng.Replay.TextCanvas.types.TemplateTypes.SNAPMATIC)
      {
         this._mask._alpha = 0;
      }
   }
   function setDisplayConfig(screenWidthPixels, screenHeightPixels, safeTopPercent, safeBottomPercent, safeLeftPercent, safeRightPercent, isWideScreen, isHiDef, isAsian)
   {
      this._screenWidthPixels = screenWidthPixels;
      this._screenHeightPixels = screenHeightPixels;
      this._safeLeft = Math.round(screenWidthPixels * safeLeftPercent);
      this._safeRight = Math.round(screenWidthPixels * safeRightPercent);
      this._safeTop = Math.round(screenHeightPixels * safeTopPercent);
      this._safeBottom = Math.round(screenHeightPixels * safeBottomPercent);
      this._isWidescreen = isWideScreen;
   }
   function setMaskDimensions()
   {
      this._mask.beginFill(65280,50);
      this._mask.moveTo(0,0);
      this._mask.lineTo(this._screenWidthPixels,0);
      this._mask.lineTo(this._screenWidthPixels,this._screenHeightPixels);
      this._mask.lineTo(0,this._screenHeightPixels);
      this._mask.endFill();
   }
   function setConstrainedCanvas()
   {
      var _loc2_ = this._screenWidthPixels * 0.5;
      var _loc3_ = this._screenHeightPixels * 0.5;
      if(this._isCanvasConstrained)
      {
         _loc2_ *= com.rockstargames.gtav.ng.Replay.TextCanvas.customtemplates.CustomTemplate.HD_TITLE_SAFE;
         _loc3_ *= com.rockstargames.gtav.ng.Replay.TextCanvas.customtemplates.CustomTemplate.HD_TITLE_SAFE;
      }
      if(!this._isWidescreen)
      {
         _loc2_ *= com.rockstargames.gtav.ng.Replay.TextCanvas.customtemplates.CustomTemplate.NON_WIDESCREEN_TITLE_SAFE_WIDTH;
      }
      this._constrainedCanvas.lineStyle(2,16711680,!this._isCanvasConstrained ? 0 : 100);
      this._constrainedCanvas.moveTo(- _loc2_,- _loc3_);
      this._constrainedCanvas.lineTo(_loc2_,- _loc3_);
      this._constrainedCanvas.lineTo(_loc2_,_loc3_);
      this._constrainedCanvas.lineTo(- _loc2_,_loc3_);
      this._constrainedCanvas.lineTo(- _loc2_,- _loc3_);
      this._constrainedCanvas.endFill();
      this._constrainedCanvas._x = this._screenWidthPixels * 0.5;
      this._constrainedCanvas._y = this._screenHeightPixels * 0.5;
      this._constrainedWidth = _loc2_ * 2;
      this._constrainedHeight = _loc3_ * 2;
      this._constrainedCanvas.setMask(this._mask);
   }
   function initTextfields()
   {
      this._allTextfields = [];
      this._textfieldsContainer = this._constrainedCanvas.createEmptyMovieClip("textfieldsContainer",this.getNextHighestDepth());
      var _loc7_ = new TextFormat();
      _loc7_.font = "$Font2";
      _loc7_.color = 16777215;
      _loc7_.size = 16;
      if(!this._isCanvasConstrained)
      {
         _loc7_.align = "center";
      }
      var _loc3_ = 0;
      var _loc2_;
      var _loc5_;
      var _loc6_;
      while(_loc3_ < this._numTextfields)
      {
         _loc2_ = this._textfieldsContainer.createTextField(String(_loc3_),this._textfieldsContainer.getNextHighestDepth(),0,0,1,1);
         if(!this._isCanvasConstrained)
         {
            _loc2_._width = this._screenWidthPixels * com.rockstargames.gtav.ng.Replay.TextCanvas.customtemplates.CustomTemplate.HD_TITLE_SAFE * 0.25;
            _loc2_.multiline = true;
            _loc2_.wordWrap = true;
         }
         else
         {
            _loc2_.multiline = false;
            _loc2_.wordWrap = false;
         }
         _loc2_._xscale = _loc2_._yscale = 400;
         _loc2_.setNewTextFormat(_loc7_);
         _loc2_.autoSize = "center";
         _loc2_.selectable = false;
         _loc2_.embedFonts = true;
         _loc2_.antiAliasType = "normal";
         _loc2_._visible = false;
         _loc2_.text = "";
         if(this._allTextfields.length != 0)
         {
            _loc5_ = TextField(this._allTextfields[_loc3_ - 1]).getTextFormat();
            _loc6_ = TextField(this._allTextfields[_loc3_ - 1])._y + _loc5_.size;
            _loc2_._y = _loc6_;
         }
         this._allTextfields.push(_loc2_);
         this.updateTextfieldXPositionInContainer(_loc2_);
         _loc3_ = _loc3_ + 1;
      }
      var _loc8_;
      var _loc4_;
      if(this._numTextfields > 1)
      {
         _loc8_ = (- this._textfieldsContainer._height) * 0.5;
         _loc4_ = 0;
         while(_loc4_ < this._numTextfields)
         {
            this._allTextfields[_loc4_]._y += _loc8_;
            _loc4_ = _loc4_ + 1;
         }
      }
   }
   function updateTextfieldsContainerPositionX(posX)
   {
      var _loc3_ = posX - 0.5;
      var _loc2_ = _loc3_ * this._screenWidthPixels >> 0;
      if(_loc2_ != this._textfieldsContainer._x)
      {
         this._textfieldsContainer._x = _loc2_;
      }
   }
   function updateTextfieldsContainerPositionY(posY)
   {
      var _loc3_ = posY - 0.5;
      var _loc2_ = _loc3_ * this._screenHeightPixels >> 0;
      if(_loc2_ != this._textfieldsContainer._y)
      {
         this._textfieldsContainer._y = _loc2_;
      }
   }
   function setNewText(textfieldId, currentData)
   {
      var _loc3_ = TextField(this._allTextfields[textfieldId]);
      var _loc4_ = this._textfieldsContainer._width;
      _loc3_.text = currentData;
      _loc3_._visible = true;
      var _loc2_;
      if(this._currentTemplateId == com.rockstargames.gtav.ng.Replay.TextCanvas.types.TemplateTypes.NEW_TEMPLATES)
      {
         _loc2_ = _loc3_.getTextFormat();
         while(_loc3_.textWidth > this._constrainedWidth)
         {
            _loc2_.size = Number(_loc2_.size) - 1;
            _loc3_.setNewTextFormat(_loc2_);
            _loc3_.setTextFormat(_loc2_);
         }
      }
      this.updateTextfieldXPositionInContainer(_loc3_);
      this.updateTextfieldYPositionInContainer();
   }
   function updateTextfieldXPositionInContainer(textfield)
   {
      var _loc3_ = "";
      if(this._currentTemplateId != com.rockstargames.gtav.ng.Replay.TextCanvas.types.TemplateTypes.NEW_TEMPLATES)
      {
         textfield = TextField(this._allTextfields[0]);
         _loc3_ = String(textfield.autoSize);
      }
      if(_loc3_ == "center")
      {
         textfield._x = (- textfield._width) * 0.5;
      }
      else if(_loc3_ == "left")
      {
         textfield._x = 0;
      }
      else if(_loc3_ == "right")
      {
         textfield._x = - textfield._width;
      }
   }
   function updateTextfieldYPositionInContainer()
   {
      var _loc2_ = 0;
      var _loc3_;
      var _loc5_;
      var _loc6_;
      var _loc7_;
      while(_loc2_ < this._numTextfields)
      {
         _loc3_ = this._allTextfields[_loc2_];
         if(_loc2_ == 0)
         {
            _loc5_ = _loc3_.getTextFormat();
            _loc3_._y = (- (_loc3_._height - Number(_loc5_.size))) * 0.5;
         }
         else
         {
            _loc6_ = TextField(this._allTextfields[_loc2_ - 1]).getTextFormat();
            _loc7_ = TextField(this._allTextfields[_loc2_ - 1])._y + Number(_loc6_.size);
            _loc3_._y = _loc7_;
         }
         _loc2_ = _loc2_ + 1;
      }
      var _loc8_;
      var _loc4_;
      if(this._numTextfields > 1)
      {
         _loc8_ = (- this._textfieldsContainer._height) * 0.5;
         _loc4_ = 0;
         while(_loc4_ < this._allTextfields.length)
         {
            this._allTextfields[_loc4_]._y += _loc8_;
            _loc4_ = _loc4_ + 1;
         }
      }
   }
   function updateOpacityByValue(itemIndex, currentData)
   {
      var _loc2_ = this._allTextfields[itemIndex];
      _loc2_._alpha = currentData;
   }
   function updateFontByLabel(itemIndex, currentData)
   {
      var _loc3_;
      var _loc2_;
      if(currentData != "")
      {
         _loc3_ = TextField(this._allTextfields[itemIndex]);
         _loc2_ = _loc3_.getTextFormat();
         _loc2_.bold = Boolean(currentData == com.rockstargames.gtav.ng.Replay.TextCanvas.customtemplates.CustomTemplate.MACHINE_BOLD);
         _loc2_.font = currentData;
         _loc3_.setNewTextFormat(_loc2_);
         _loc3_.setTextFormat(_loc2_);
      }
   }
   function updateColourById(itemIndex, currentData)
   {
      var _loc2_ = TextField(this._allTextfields[itemIndex]);
      var _loc3_ = _loc2_._alpha;
      com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(_loc2_,currentData);
      _loc2_._alpha = _loc3_;
   }
   function updateScale(currentData)
   {
      var _loc2_;
      var _loc3_;
      var _loc4_;
      if(this._currentTemplateId != com.rockstargames.gtav.ng.Replay.TextCanvas.types.TemplateTypes.NEW_TEMPLATES)
      {
         if(currentData >= com.rockstargames.gtav.ng.Replay.TextCanvas.customtemplates.CustomTemplate.MINIMUM_FONT_SIZE)
         {
            _loc2_ = TextField(this._allTextfields[0]);
            _loc3_ = _loc2_.getTextFormat();
            _loc4_ = 0.209 * (currentData - 65) + 16;
            _loc3_.size = _loc4_ >> 0;
            _loc2_.setNewTextFormat(_loc3_);
            _loc2_.setTextFormat(_loc3_);
            this.updateTextfieldYPositionInContainer();
         }
      }
   }
}

class com.rockstargames.gtav.loadingScreens.OPENING_CREDITS extends com.rockstargames.ui.core.BaseScreenLayout
{
   var CONTENT;
   var dispConf;
   var creditBlockList = [];
   var defaultFadeDuration = 2;
   var yAdjustment = -60;
   var currentY = 0;
   var currentX = 0;
   var ALIGN_LEFT = "left";
   var ALIGN_RIGHT = "right";
   var ALIGN_CENTER = "center";
   var ANIM_IN_XROT = "_xrotation";
   var ANIM_IN_YROT = "_yrotation";
   var ANIM_IN_X = "_x";
   var ANIM_IN_Y = "_y";
   var FONT2 = "$font2";
   var FONT5 = "$font5";
   var descendersList = ["q","y","p","g","j"];
   function OPENING_CREDITS(mc)
   {
      super();
      _global.gfxExtensions = true;
   }
   function INITIALISE(mc)
   {
      this.CONTENT = mc;
      this.dispConf = new com.rockstargames.ui.utils.DisplayConfig();
      this.dispConf = this.getDisplayConfig(true);
      if(!this.dispConf.isWideScreen)
      {
         Stage.scaleMode = "noBorder";
         this.dispConf.screenWidth = 960;
      }
   }
   function TEST_LOGO(fadeInDuration, fadeOutDuration, logoFadeInDuration, logoFadeOutDuration, logoFadeInDelay, logoFadeOutDelay, logoScaleDuration)
   {
      this.SHOW_LOGO("logo",fadeInDuration,fadeOutDuration,logoFadeInDuration,logoFadeOutDuration,logoFadeInDelay,logoFadeOutDelay,logoScaleDuration);
   }
   function TEST_CREDIT_BLOCK(role, names, align, xOffset, namesXOffset, stepDuration, animInStyle, animInValue, animOutValue)
   {
      this.SETUP_CREDIT_BLOCK("art",xOffset,350,align,0.5,0.5);
      this.ADD_ROLE_TO_CREDIT_BLOCK("art",role,0,"HUD_COLOUR_MICHAEL",true);
      this.ADD_NAMES_TO_CREDIT_BLOCK("art",names,namesXOffset,",",true);
      this.SHOW_CREDIT_BLOCK("art",stepDuration);
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.CONTENT,5,{onComplete:this.HIDE,onCompleteScope:this,onCompleteArgs:["art",stepDuration,animInStyle,animOutValue]});
   }
   function TEST_SINGLE_LINE(animInStyle, animInValue, animOutValue)
   {
      this.SETUP_SINGLE_LINE("presents",0.5,0.5,70,125,"left");
      this.ADD_TEXT_TO_SINGLE_LINE("presents","a","$font5","HUD_COLOUR_MICHAEL",true);
      this.ADD_TEXT_TO_SINGLE_LINE("presents","ROCKSTAR GAMES","$font2","HUD_COLOUR_WHITE",true);
      this.ADD_TEXT_TO_SINGLE_LINE("presents","production","$font5","HUD_COLOUR_MICHAEL",true);
      this.ADD_TEXT_TO_SINGLE_LINE("presents","ROCKSTAR GAMES","$font2","HUD_COLOUR_WHITE",true);
      this.ADD_TEXT_TO_SINGLE_LINE("presents","normal","$font5","HUD_COLOUR_MICHAEL",true);
      this.SHOW_SINGLE_LINE("presents",animInStyle,animInValue);
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.CONTENT,5,{onComplete:this.HIDE,onCompleteScope:this,onCompleteArgs:["presents",0,animInStyle,animOutValue]});
   }
   function SETUP_SINGLE_LINE(mcName, fadeInDuration, fadeOutDuration, x, y, align)
   {
      this.REMOVE_ALL();
      this.currentX = 0;
      if(isNaN(fadeInDuration))
      {
         fadeInDuration = this.defaultFadeDuration;
      }
      if(isNaN(fadeOutDuration))
      {
         fadeOutDuration = fadeInDuration;
      }
      if(isNaN(x))
      {
         x = 0;
      }
      if(isNaN(y))
      {
         y = 0;
      }
      var _loc2_ = this.CONTENT.createEmptyMovieClip(mcName,this.CONTENT.getNextHighestDepth());
      _loc2_._alpha = 20;
      var _loc3_ = {mcName:mcName,mc:_loc2_,fadeInDuration:fadeInDuration,fadeOutDuration:fadeOutDuration,align:this.setAlignment(align),xOffset:x,yOffset:y};
      this.creditBlockList.push(_loc3_);
   }
   function ADD_TEXT_TO_SINGLE_LINE(mcName, text, font, colour, isRawText, language, yOffset)
   {
      var _loc6_;
      var _loc2_;
      var _loc9_;
      var _loc8_;
      var _loc5_;
      if(font == this.FONT5)
      {
         _loc6_ = this.getMovieClipFromName(mcName).attachMovie("role","sl_" + this.getMovieClipFromName(mcName).getNextHighestDepth(),this.getMovieClipFromName(mcName).getNextHighestDepth());
         _loc2_ = _loc6_.roleTxt;
         _loc9_ = text.split("");
         _loc8_ = _loc9_[0];
         if(this.stringInArray(this.descendersList,_loc8_))
         {
            text = " " + text;
            this.currentX -= 8;
         }
         if(isRawText)
         {
            _loc2_.text = text;
         }
         else
         {
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_,text,0,false);
         }
         if(isNaN(yOffset) || !yOffset || yOffset == 0)
         {
            _loc5_ = new TextFormat();
            switch(language)
            {
               case "ja":
               case "japanese":
               case "ko":
               case "korean":
                  _loc5_.size = 46;
                  _loc2_.setTextFormat(_loc5_);
                  _loc6_._y += 10;
                  break;
               case "zh":
               case "chinese":
                  _loc5_.size = 46;
                  _loc2_.setTextFormat(_loc5_);
                  break;
               default:
                  _loc6_._y += 15;
            }
         }
         else
         {
            _loc6_._y += yOffset;
         }
      }
      else
      {
         _loc6_ = this.getMovieClipFromName(mcName).attachMovie("name_singleline","sl_" + this.getMovieClipFromName(mcName).getNextHighestDepth(),this.getMovieClipFromName(mcName).getNextHighestDepth());
         _loc2_ = _loc6_.nameTxt;
         if(isRawText)
         {
            _loc2_.text = text;
         }
         else
         {
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_,text,0,false);
         }
         _loc2_.text = _loc2_.text.toUpperCase();
      }
      _loc6_._x = this.currentX;
      _loc2_.textColor = this.getColour(colour);
      _loc2_.autoSize = "left";
      _loc2_.wordWrap = false;
      _loc2_.embedFonts = true;
      this.currentX += _loc6_._width + 6;
   }
   function SHOW_SINGLE_LINE(mcName, animInStyle, animInValue)
   {
      var _loc2_ = this.getMovieClipFromName(mcName);
      var _loc3_ = this.getObjectFromMcName(mcName);
      _loc2_._visible = true;
      var _loc6_ = this.dispConf.screenWidth - this.safeLeft * 2;
      if(_loc2_._width > _loc6_)
      {
         _loc2_._xscale = _loc2_._yscale = _loc6_ / _loc2_._width * 100;
         _loc3_.xOffset = 0;
      }
      switch(_loc3_.align)
      {
         case this.ALIGN_LEFT:
            _loc2_._x = this.safeLeft + _loc3_.xOffset;
            if(_loc2_._x < this.safeLeft)
            {
               _loc2_._x = this.safeLeft;
            }
            break;
         case this.ALIGN_RIGHT:
            _loc2_._x = this.safeRight - (_loc2_._width + _loc3_.xOffset);
            if(_loc2_._x + _loc2_._width > this.safeRight)
            {
               _loc2_._x = this.safeRight - _loc2_._width;
            }
            break;
         default:
            _loc2_._x = this.dispConf.screenWidth / 2 - _loc2_._width / 2;
      }
      if(!this.dispConf.isWideScreen)
      {
         _loc2_._x += 160;
      }
      _loc2_._y = this.dispConf.screenHeight / 2 - _loc2_._height / 2 - 12;
      _loc2_._y += _loc3_.yOffset;
      if(_loc2_._y < this.safeTop)
      {
         _loc2_._y = this.safeTop;
      }
      if(_loc2_._y + _loc2_._height > this.safeBottom)
      {
         _loc2_._y = this.safeBottom - _loc2_._height;
      }
      var _loc4_ = {_alpha:100,ease:com.rockstargames.ui.tweenStar.Ease.SINE_IN};
      var _loc7_;
      if(this.getAnimInStyle(animInStyle) && !isNaN(animInValue))
      {
         _loc7_ = _loc2_[this.getAnimInStyle(animInStyle)];
         _loc4_[this.getAnimInStyle(animInStyle)] = _loc7_;
         _loc2_[this.getAnimInStyle(animInStyle)] = _loc2_[this.getAnimInStyle(animInStyle)] + animInValue;
      }
      com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2_,_loc3_.fadeInDuration,_loc4_);
   }
   function SETUP_CREDIT_BLOCK(mcName, x, y, align, fadeInDuration, fadeOutDuration)
   {
      this.REMOVE_ALL();
      this.currentY = 0;
      if(isNaN(y))
      {
         y = 0;
      }
      if(isNaN(x))
      {
         x = 0;
      }
      if(isNaN(fadeInDuration))
      {
         fadeInDuration = this.defaultFadeDuration;
      }
      if(isNaN(fadeOutDuration))
      {
         fadeOutDuration = fadeInDuration;
      }
      var _loc2_ = this.CONTENT.createEmptyMovieClip(mcName,this.CONTENT.getNextHighestDepth());
      _loc2_._alpha = 0;
      _loc2_._visible = false;
      _loc2_._y = this.dispConf.safeTop * this.dispConf.screenHeight + y;
      var _loc5_ = {mcName:mcName,mc:_loc2_,xOffset:x,align:this.setAlignment(align),fadeInDuration:fadeInDuration,fadeOutDuration:fadeOutDuration};
      this.creditBlockList.push(_loc5_);
   }
   function ADD_ROLE_TO_CREDIT_BLOCK(mcName, role, xOffset, colour, isRawText, language)
   {
      if(!this.getMovieClipFromName(mcName))
      {
         this.SETUP_CREDIT_BLOCK(mcName);
      }
      if(this.currentY > 0)
      {
         this.currentY += 6;
      }
      var _loc6_ = this.getMovieClipFromName(mcName).attachMovie("role","role_" + this.getMovieClipFromName(mcName).getNextHighestDepth(),this.getMovieClipFromName(mcName).getNextHighestDepth(),{_x:xOffset,_y:this.currentY});
      var _loc3_ = _loc6_.roleTxt;
      _loc3_.textColor = this.getColour(colour);
      _loc3_.autoSize = "left";
      _loc3_.embedFonts = true;
      if(isRawText)
      {
         _loc3_.text = role;
      }
      else
      {
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc3_,role,0,false);
      }
      var _loc8_;
      switch(language)
      {
         case "ja":
         case "japanese":
         case "ko":
         case "korean":
            _loc8_ = new TextFormat();
            _loc8_.size = 42;
            _loc3_.setTextFormat(_loc8_);
            _loc3_._y += 10;
            this.currentY += _loc6_._height + 10;
            break;
         case "zh":
         case "chinese":
            _loc8_ = new TextFormat();
            _loc8_.size = 42;
            _loc3_.setTextFormat(_loc8_);
            this.currentY += _loc6_._height;
            break;
         default:
            this.currentY += _loc6_._height - 24;
      }
      var _loc4_ = false;
      var _loc5_ = String(_loc3_.text).split("");
      var _loc2_ = 0;
      while(_loc2_ < this.descendersList.length)
      {
         if(this.stringInArray(_loc5_,this.descendersList[_loc2_]))
         {
            _loc4_ = true;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      if(_loc4_)
      {
         this.currentY += 8;
      }
   }
   function ADD_NAMES_TO_CREDIT_BLOCK(mcName, names, xOffset, delimiter, isRawText)
   {
      if(!delimiter)
      {
         delimiter = ",";
      }
      var _loc15_ = this.getObjectFromMcName(mcName);
      var _loc12_ = this.getMovieClipFromName(mcName).attachMovie("name","name_" + this.getMovieClipFromName(mcName).getNextHighestDepth(),this.getMovieClipFromName(mcName).getNextHighestDepth(),{_x:xOffset,_y:this.currentY});
      var _loc11_ = _loc12_.nameTxt;
      if(isRawText)
      {
         _loc11_.text = names;
      }
      else
      {
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc11_,names,0,false);
      }
      var _loc6_ = _loc11_.text.split(delimiter);
      var _loc9_ = [];
      _loc12_.removeMovieClip();
      var _loc4_ = 0;
      var _loc3_;
      var _loc2_;
      while(_loc4_ < _loc6_.length)
      {
         _loc3_ = this.getMovieClipFromName(mcName).attachMovie("name","name_" + this.getMovieClipFromName(mcName).getNextHighestDepth(),this.getMovieClipFromName(mcName).getNextHighestDepth(),{_x:xOffset,_y:this.currentY});
         _loc2_ = _loc3_.nameTxt;
         _loc9_.push(_loc3_);
         _loc2_.textColor = this.getColour("HUD_COLOUR_WHITE");
         _loc2_.autoSize = "left";
         _loc2_.wordWrap = false;
         _loc2_.multiline = false;
         _loc2_.html = true;
         _loc2_.htmlText = String(_loc6_[_loc4_]);
         this.currentY += _loc3_._height - 17;
         _loc4_ = _loc4_ + 1;
      }
   }
   function SHOW_CREDIT_BLOCK(mcName, stepDuration, animInStyle, animInValue)
   {
      var _loc2_ = this.getMovieClipFromName(mcName);
      var _loc14_ = this.getObjectFromMcName(mcName);
      _loc2_._visible = true;
      if(_loc14_.align == this.ALIGN_RIGHT)
      {
         this.normaliseXRightAlignment(mcName);
         _loc2_._x = this.dispConf.safeRight * this.dispConf.screenWidth - (_loc2_._width + _loc14_.xOffset);
         if(_loc2_._x + _loc2_._width > this.dispConf.safeRight * this.dispConf.screenWidth)
         {
            _loc2_._x = this.dispConf.safeRight * this.dispConf.screenWidth - _loc2_._width;
         }
      }
      else
      {
         _loc2_._x = this.dispConf.safeLeft * this.dispConf.screenWidth + _loc14_.xOffset;
         if(_loc2_._x - _loc2_._width < this.dispConf.safeLeft * this.dispConf.screenWidth)
         {
            _loc2_._x = this.dispConf.safeLeft * this.dispConf.screenWidth;
         }
      }
      if(!this.dispConf.isWideScreen)
      {
         _loc2_._x += 160;
      }
      if(_loc2_._y + _loc2_._height > this.dispConf.safeBottom * this.dispConf.screenHeight)
      {
         _loc2_._y = this.dispConf.safeBottom * this.dispConf.screenHeight - _loc2_._height;
      }
      var _loc7_;
      var _loc8_;
      var _loc6_;
      var _loc10_;
      var _loc3_;
      var _loc4_;
      if(isNaN(stepDuration) || stepDuration == 0)
      {
         for(var _loc3_ in _loc2_)
         {
            if(typeof _loc2_[_loc3_] == "movieclip")
            {
               MovieClip(_loc2_[_loc3_])._alpha = 100;
            }
         }
         _loc7_ = {_alpha:100,ease:com.rockstargames.ui.tweenStar.Ease.SINE_IN};
         if(this.getAnimInStyle(animInStyle) && !isNaN(animInValue))
         {
            _loc8_ = _loc2_[this.getAnimInStyle(animInStyle)];
            _loc7_[this.getAnimInStyle(animInStyle)] = _loc8_;
            _loc2_[this.getAnimInStyle(animInStyle)] = _loc2_[this.getAnimInStyle(animInStyle)] + animInValue;
         }
         com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2_,_loc14_.fadeInDuration,_loc7_);
      }
      else
      {
         _loc6_ = [];
         for(_loc3_ in _loc2_)
         {
            if(typeof _loc2_[_loc3_] == "movieclip")
            {
               _loc6_[_loc2_[_loc3_].getDepth()] = _loc2_[_loc3_];
            }
         }
         _loc10_ = 0;
         _loc3_ = 0;
         while(_loc3_ < _loc6_.length)
         {
            _loc4_ = MovieClip(_loc6_[_loc3_]);
            _loc4_._alpha = 0;
            _loc7_ = {delay:stepDuration * _loc10_,_alpha:100,ease:com.rockstargames.ui.tweenStar.Ease.SINE_IN};
            if(this.getAnimInStyle(animInStyle) != "" && !isNaN(animInValue))
            {
               _loc8_ = _loc4_[this.getAnimInStyle(animInStyle)];
               _loc7_[this.getAnimInStyle(animInStyle)] = _loc8_;
               _loc4_[this.getAnimInStyle(animInStyle)] = _loc4_[this.getAnimInStyle(animInStyle)] + animInValue;
            }
            com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc6_[_loc3_],_loc14_.fadeInDuration,_loc7_);
            _loc10_ = _loc10_ + 1;
            _loc3_ = _loc3_ + 1;
         }
         _loc2_._alpha = 100;
      }
   }
   function SHOW_LOGO(mcName, fadeInDuration, fadeOutDuration, logoFadeInDuration, logoFadeOutDuration, logoFadeInDelay, logoFadeOutDelay, logoScaleDuration)
   {
      if(isNaN(fadeInDuration))
      {
         fadeInDuration = this.defaultFadeDuration;
      }
      if(isNaN(fadeOutDuration))
      {
         fadeOutDuration = fadeInDuration;
      }
      if(isNaN(logoFadeInDuration))
      {
         logoFadeInDuration = fadeInDuration;
      }
      if(isNaN(logoFadeOutDuration))
      {
         logoFadeOutDuration = fadeInDuration;
      }
      if(isNaN(logoFadeInDelay))
      {
         logoFadeInDelay = fadeInDuration;
      }
      if(isNaN(logoFadeOutDelay))
      {
         logoFadeOutDelay = fadeInDuration;
      }
      if(isNaN(logoScaleDuration))
      {
         logoScaleDuration = fadeInDuration * 6;
      }
      var _loc3_ = this.CONTENT.createEmptyMovieClip(mcName,this.CONTENT.getNextHighestDepth());
      var _loc5_ = this.createOverlay(_loc3_,_loc3_.getNextHighestDepth());
      _loc5_._alpha = 0;
      var _loc2_ = _loc3_.attachMovie("logo","logo",_loc3_.getNextHighestDepth(),{_x:this.screenWidthPixels / 2,_y:this.screenWidthPixels / 2,_xrotation:-10,_xscale:55,_yscale:55,_visible:false});
      var _loc4_ = this.createOverlay(_loc2_,_loc2_.getNextHighestDepth());
      _loc4_._x -= _loc4_._width / 2;
      _loc4_._y -= _loc4_._height / 2;
      _loc4_._alpha = 100;
      _loc2_._x = this.screenWidthPixels / 2;
      _loc2_._y = this.screenHeightPixels / 2 - 10;
      if(!this.isWideScreen)
      {
         _loc2_._x += 160;
      }
      var _loc6_ = {mcName:mcName,mc:_loc3_,overlayMc:_loc5_,logoMc:_loc2_,fadeInDuration:fadeInDuration,fadeOutDuration:fadeOutDuration,logoFadeInDuration:logoFadeInDuration,logoFadeOutDuration:logoFadeOutDuration,logoFadeInDelay:logoFadeInDelay,logoFadeOutDelay:logoFadeOutDelay,logoScaleDuration:logoScaleDuration * 1.2};
      this.creditBlockList.push(_loc6_);
      com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc5_,_loc6_.fadeInDuration,{_alpha:100,ease:com.rockstargames.ui.tweenStar.Ease.SINE_OUT});
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.CONTENT,_loc6_.logoFadeInDelay,{onComplete:this.unhideLogo,onCompleteScope:this,onCompleteArgs:[mcName]});
   }
   function unhideLogo(mcName)
   {
      var _loc2_ = this.getObjectFromMcName(mcName);
      var _loc3_ = _loc2_.logoMc;
      var _loc4_ = _loc3_.overlay;
      _loc3_._visible = true;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc3_,_loc2_.logoScaleDuration,{_xscale:85,_yscale:85,_xrotation:0,ease:com.rockstargames.ui.tweenStar.Ease.LINEAR});
      com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc4_,_loc2_.logoFadeInDuration,{_alpha:0,ease:com.rockstargames.ui.tweenStar.Ease.SINE_OUT});
   }
   function HIDE_LOGO(mcToHide)
   {
      var _loc2_ = this.getObjectFromMcName(mcToHide);
      var _loc3_ = _loc2_.logoMc;
      var _loc4_ = _loc3_.overlay;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc4_,_loc2_.logoFadeInDuration,{_alpha:100,ease:com.rockstargames.ui.tweenStar.Ease.SINE_OUT,onComplete:this.REMOVE_MC,onCompleteScope:this,onCompleteArgs:[_loc3_]});
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.CONTENT,_loc2_.logoFadeOutDelay,{onComplete:this.HIDE,onCompleteScope:this,onCompleteArgs:[mcToHide]});
   }
   function HIDE(mcToHide, stepDuration, animOutStyle, animOutValue)
   {
      var _loc3_ = this.getMovieClipFromName(mcToHide);
      var _loc11_ = this.getObjectFromMcName(mcToHide);
      var _loc5_ = {_alpha:0,ease:com.rockstargames.ui.tweenStar.Ease.SINE_OUT,onCompleteScope:this};
      var _loc8_;
      var _loc4_;
      var _loc9_;
      var _loc2_;
      var _loc7_;
      if(isNaN(stepDuration) || stepDuration == 0)
      {
         if(this.getAnimInStyle(animOutStyle) && !isNaN(animOutValue))
         {
            _loc8_ = _loc3_[this.getAnimInStyle(animOutStyle)] + animOutValue;
            _loc5_[this.getAnimInStyle(animOutStyle)] = _loc8_;
         }
         _loc5_.onComplete = this.REMOVE;
         _loc5_.onCompleteArgs = mcToHide;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.getMovieClipFromName(mcToHide),_loc11_.fadeOutDuration,_loc5_);
      }
      else
      {
         _loc4_ = [];
         for(var _loc2_ in _loc3_)
         {
            if(typeof _loc3_[_loc2_] == "movieclip")
            {
               _loc4_[_loc3_[_loc2_].getDepth()] = _loc3_[_loc2_];
            }
         }
         _loc9_ = 0;
         _loc2_ = _loc4_.length;
         while(_loc2_ >= 0)
         {
            _loc7_ = MovieClip(_loc4_[_loc2_]);
            _loc5_.delay = stepDuration * _loc9_;
            if(this.getAnimInStyle(animOutStyle) != "" && !isNaN(animOutValue))
            {
               _loc8_ = _loc7_[this.getAnimInStyle(animOutStyle)] + animOutValue;
               _loc5_[this.getAnimInStyle(animOutStyle)] = _loc8_;
            }
            com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc4_[_loc2_],_loc11_.fadeOutDuration,_loc5_);
            _loc9_ = _loc9_ + 1;
            _loc2_ = _loc2_ - 1;
         }
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.CONTENT,_loc11_.fadeOutDuration * (_loc9_ + 1),{onComplete:this.REMOVE,onCompleteScope:this,onCompleteArgs:[mcToHide]});
      }
   }
   function REMOVE(mcToRemove)
   {
      this.getMovieClipFromName(mcToRemove).removeMovieClip();
   }
   function REMOVE_MC(mcToRemove)
   {
      mcToRemove.removeMovieClip();
   }
   function REMOVE_ALL()
   {
      var _loc2_ = 0;
      var _loc4_;
      var _loc3_;
      while(_loc2_ < this.creditBlockList.length)
      {
         _loc4_ = this.creditBlockList[_loc2_];
         _loc3_ = this.getMovieClipFromName(_loc4_.mcName);
         _loc3_.removeMovieClip();
         _loc2_ = _loc2_ + 1;
      }
   }
   function createOverlay(parentMc, depth)
   {
      var _loc1_ = parentMc.createEmptyMovieClip("overlay",depth);
      _loc1_.beginFill(0);
      _loc1_.moveTo(-50,-50);
      _loc1_.lineTo(1380,0);
      _loc1_.lineTo(1380,820);
      _loc1_.lineTo(0,820);
      _loc1_.endFill();
      _loc1_._alpha = 0;
      return _loc1_;
   }
   function getMovieClipFromName(mcName)
   {
      return this.CONTENT[mcName];
   }
   function normaliseXRightAlignment(mcName)
   {
      var _loc3_ = 0;
      var _loc2_ = this.getMovieClipFromName(mcName);
      for(var _loc5_ in _loc2_)
      {
         if(typeof _loc2_[_loc5_] == "movieclip")
         {
            if(_loc2_[_loc5_]._x < _loc3_)
            {
               _loc3_ = _loc2_[_loc5_]._x;
            }
         }
      }
      for(var _loc4_ in _loc2_)
      {
         if(typeof _loc2_[_loc4_] == "movieclip")
         {
            _loc2_[_loc4_]._x += _loc3_ * -1;
         }
      }
   }
   function setAlignment(align)
   {
      switch(align)
      {
         case "right":
         case "RIGHT":
            return this.ALIGN_RIGHT;
         case "center":
         case "CENTER":
         case "centre":
         case "CENTRE":
            return this.ALIGN_CENTER;
         default:
            return this.ALIGN_LEFT;
      }
   }
   function getAnimInStyle(animStyle)
   {
      switch(animStyle)
      {
         case "x":
         case "_x":
         case "X":
            return this.ANIM_IN_X;
         case "y":
         case "_y":
         case "Y":
            return this.ANIM_IN_Y;
         case "xrotation":
         case "_xrotation":
            return this.ANIM_IN_XROT;
         case "yrotation":
         case "_yrotation":
            return this.ANIM_IN_YROT;
         default:
            return "";
      }
   }
   function getColour(col)
   {
      var _loc1_ = new com.rockstargames.ui.utils.HudColour();
      var _loc2_ = com.rockstargames.ui.utils.HudColour[col];
      if(isNaN(_loc2_))
      {
         _loc2_ = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE;
      }
      com.rockstargames.ui.utils.Colour.setHudColour(_loc2_,_loc1_);
      return _loc1_.r * 65536 + _loc1_.g * 256 + _loc1_.b;
   }
   function getObjectFromMcName(mcName)
   {
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < this.creditBlockList.length)
      {
         _loc3_ = this.creditBlockList[_loc2_];
         if(_loc3_.mcName == mcName)
         {
            return _loc3_;
         }
         _loc2_ = _loc2_ + 1;
      }
      return {};
   }
   function stringInArray(input, what)
   {
      var _loc1_ = 0;
      while(_loc1_ < input.length)
      {
         if(input[_loc1_] == what)
         {
            return true;
         }
         _loc1_ = _loc1_ + 1;
      }
      return false;
   }
}

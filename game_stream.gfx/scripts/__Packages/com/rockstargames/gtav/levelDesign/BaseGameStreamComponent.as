class com.rockstargames.gtav.levelDesign.BaseGameStreamComponent extends MovieClip
{
   var bgColor;
   var CONTENT;
   var imgLoadedCallback;
   var imgLoadedCallbackScope;
   var intervalId;
   static var IMG_SIZE = 36;
   var important = false;
   var isAnimating = false;
   var animateCounter = 0;
   var animateCounterMax = 90;
   var baseClassStrID = "GAME_STREAM";
   var returnPath1 = "";
   var returnPath2 = "";
   var returnPathLvl = 2;
   var timerDuration = 3000;
   var shouldStayOnFeedBottom = false;
   var flashAlpha = 80;
   var flashDuration = 0.3;
   var bgImportantColour = [0,0,0];
   var bIsWideScreen = false;
   var bIsAsianLanguage = false;
   function BaseGameStreamComponent()
   {
      super();
   }
   function INITIALISE(bgImpR, bgImpG, bgImpB, _flashAlpha, _flashRate, _bIsWideScreen, _bIsAsianLanguage, _bgColor)
   {
      this.bgColor = _bgColor;
      var _loc2_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(this.bgColor,_loc2_);
      this.CONTENT = this;
      this.CONTENT.BackgroundFlash._visible = false;
      this.CONTENT.BackgroundHighlight._visible = false;
      com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.Background,_loc2_.r,_loc2_.g,_loc2_.b,_loc2_.a);
      this.flashAlpha = _flashAlpha;
      this.timerDuration = _flashRate * 500;
      this.bgImportantColour[0] = bgImpR;
      this.bgImportantColour[1] = bgImpG;
      this.bgImportantColour[2] = bgImpB;
      this.bIsWideScreen = _bIsWideScreen;
      this.bIsAsianLanguage = _bIsAsianLanguage;
   }
   function setImageLoadedCallback(_imgLoadedCallback, _imgLoadedCallbackScope)
   {
      this.imgLoadedCallback = _imgLoadedCallback;
      this.imgLoadedCallbackScope = _imgLoadedCallbackScope;
   }
   function SET_DISPLAY_CONFIG_OBJECT()
   {
   }
   function SET_FEED_COMPONENT()
   {
   }
   function parseForGamerNameSpaces(str)
   {
      var _loc3_ = "";
      var _loc4_ = false;
      var _loc1_ = 0;
      while(_loc1_ < str.length)
      {
         if(_loc4_)
         {
            if(str.substr(_loc1_,4) == "</C>")
            {
               _loc4_ = false;
               _loc1_ += 3;
               _loc3_ += "</C>";
            }
            else if(str.charAt(_loc1_) == " ")
            {
               _loc3_ += String.fromCharCode(181);
            }
            else
            {
               _loc3_ += str.charAt(_loc1_);
            }
         }
         else if(str.substr(_loc1_,3) == "<C>")
         {
            _loc4_ = true;
            _loc1_ += 2;
            _loc3_ += "<C>";
         }
         else
         {
            _loc3_ += str.charAt(_loc1_);
         }
         _loc1_ = _loc1_ + 1;
      }
      return _loc3_;
   }
   function parseForFonts(str)
   {
      str = str.split("<C>").join("<FONT FACE=\'$Font2_cond\' SIZE=\'16\'>");
      str = str.split("</C>").join("<FONT FACE=\'$Font2\' SIZE=\'11\'>");
      return str;
   }
   function parseForTitleFonts(str)
   {
      str = str.split("<C>").join("<FONT FACE=\'$Font2_cond\' SIZE=\'16\'>");
      str = str.split("</C>").join("<FONT FACE=\'$Font2\' SIZE=\'13\'>");
      return str;
   }
   function parseForGamerTagTitleFonts(tf, str, stdPtSize)
   {
      var _loc3_ = str.split("<C>");
      if(_loc3_.length > 1)
      {
         var _loc2_ = 1;
         while(_loc2_ < _loc3_.length)
         {
            var _loc6_ = String(_loc3_[_loc2_]).split("</C>");
            var _loc4_ = undefined;
            var _loc5_ = _loc6_[0].split("<");
            if(_loc5_.length > 1)
            {
               _loc4_ = _loc5_[1].split(">")[1];
            }
            else
            {
               _loc4_ = _loc6_[0];
            }
            var _loc7_ = this.getFontSizeFit(_loc4_,stdPtSize + 3,tf._width);
            _loc3_[_loc2_] = "<FONT FACE=\'$Font2_cond\' SIZE=\'" + _loc7_ + "\'>" + _loc3_[_loc2_];
            _loc2_ += 2;
         }
         str = _loc3_.join("");
         str = str.split("</C>").join("<FONT FACE=\'$Font2\' SIZE=\'" + stdPtSize + "\'>");
      }
      return str;
   }
   function getFontSizeFit(gamerName, fontSize, widthToFit)
   {
      var _loc2_ = new TextFormat("$Font2_cond");
      var _loc3_ = undefined;
      do
      {
         _loc2_.size = fontSize;
         _loc3_ = _loc2_.getTextExtent(gamerName,this._width);
      }
      while(_loc3_.textFieldWidth > widthToFit && (fontSize = fontSize - 1));
      
      return fontSize;
   }
   function CLEAR_TXD()
   {
   }
   function STREAM_COMP_READY()
   {
      if(this.important && !this.isAnimating)
      {
         this.isAnimating = true;
         this.animateCounter = this.animateCounterMax;
         this.CONTENT.ref = this;
         this.CONTENT.BackgroundFlash._visible = false;
         this.flashOn();
         clearInterval(this.intervalId);
         this.intervalId = setInterval(this,"stopFlash",this.timerDuration);
      }
   }
   function stopFlash()
   {
      clearInterval(this.intervalId);
      this.resetBackground();
      this.isAnimating = false;
   }
   function resetBackground()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.CONTENT.Background);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.Background,this.bgColor);
      this.CONTENT.BackgroundFlash._visible = false;
   }
   function flashOn()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.CONTENT.Background);
      com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.Background,this.bgImportantColour[0],this.bgImportantColour[1],this.bgImportantColour[2],this.flashAlpha);
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.CONTENT.Background,0.25,{onCompleteScope:this,onComplete:this.flashOff});
   }
   function flashOff()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.CONTENT.Background);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.Background,this.bgColor);
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.CONTENT.Background,0.25,{onCompleteScope:this,onComplete:this.flashOn});
   }
   function altFlashOn()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.CONTENT.BackgroundHighlight);
      this.CONTENT.BackgroundHighlight._visible = true;
      com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.BackgroundHighlight,this.bgImportantColour[0],this.bgImportantColour[1],this.bgImportantColour[2],this.flashAlpha);
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT.BackgroundHighlight,this.flashDuration,{_alpha:0});
   }
   function altFlashOff()
   {
   }
   function hasPendingImage()
   {
      return false;
   }
   function getContentLength()
   {
      return -1;
   }
   function onCleanup()
   {
      this.CLEAR_TXD();
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.CONTENT.Background);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.CONTENT.BackgroundHighlight);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this);
   }
}

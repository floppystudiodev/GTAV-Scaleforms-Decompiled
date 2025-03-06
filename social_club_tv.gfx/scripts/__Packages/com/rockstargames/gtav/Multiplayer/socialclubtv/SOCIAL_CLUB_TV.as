class com.rockstargames.gtav.Multiplayer.socialclubtv.SOCIAL_CLUB_TV extends com.rockstargames.ui.core.BaseScreenLayout
{
   var lowerThirdMC;
   var CONTENT;
   var ticker;
   var livePanelMC;
   var imgLdr;
   function SOCIAL_CLUB_TV()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.lowerThirdMC = this.CONTENT.attachMovie("LowerThird","lowerThirdMC",this.CONTENT.getNextHighestDepth());
      this.ticker = com.rockstargames.gtav.Multiplayer.socialclubtv.SocialClubTicker(this.lowerThirdMC.attachMovie("Ticker","ticker",this.lowerThirdMC.getNextHighestDepth(),{_y:50}));
      this.livePanelMC = this.CONTENT.attachMovie("LivePanel","livePanelMC",this.CONTENT.getNextHighestDepth());
      this.livePanelMC.titleTF.autoSize = true;
      this.livePanelMC.descTF.autoSize = true;
      this.livePanelMC.playerTF.autoSize = true;
      this.SHOW_LIVE_PANEL(false);
      this.SHOW_TICKER(false);
      this.SET_LIVE_PANEL();
      this.initScreenLayout();
   }
   function initScreenLayout()
   {
      super.initScreenLayout();
      this._positionLivePanel();
      this._positionLowerThird();
   }
   function SET_DISPLAY_CONFIG(_screenWidthPixels, _screenHeightPixels, _safeTopPercent, _safeBottomPercent, _safeLeftPercent, _safeRightPercent, _isWideScreen, _isHiDef, _isAsian)
   {
      this.isWideScreen = _isWideScreen;
      this.isHiDef = _isHiDef;
      if(!this.isWideScreen)
      {
         Stage.scaleMode = "noBorder";
         var _loc4_ = 1.7777777777777777;
         var _loc3_ = 1.3333333333333333;
         this.FOUR_THREE_PADDING = (this.FILE_WIDTH - Math.round(this.FILE_WIDTH / _loc4_ * _loc3_)) / 2;
         _screenWidthPixels = this.FILE_WIDTH - this.FOUR_THREE_PADDING * 2;
      }
      this.safeLeft = this.FOUR_THREE_PADDING + Math.round(_screenWidthPixels * _safeLeftPercent);
      this.safeRight = this.FOUR_THREE_PADDING + Math.round(_screenWidthPixels * _safeRightPercent);
      this.safeTop = Math.round(_screenHeightPixels * _safeTopPercent);
      this.safeBottom = Math.round(_screenHeightPixels * _safeBottomPercent);
      this.initScreenLayout();
   }
   function SHOW_LIVE_PANEL(value)
   {
      this.livePanelMC._visible = value;
   }
   function SET_LIVE_PANEL(title, description, player, crewTag, txd, txn)
   {
      var _loc2_ = this.livePanelMC.ct;
      var _loc4_ = false;
      this.livePanelMC._visible = title != "" && title != undefined;
      this.livePanelMC.titleTF.text = title;
      if(description != "" && description != undefined && player != "" && player != undefined)
      {
         this.livePanelMC.descTF._width = 10;
         this.livePanelMC.descTF.text = description;
         this.livePanelMC.playerTF._width = 10;
         this.livePanelMC.playerTF.text = player;
         if(txd != "" && txd != undefined && txn != "" && txn != undefined)
         {
            this.livePanelMC.imgLdrFrameMC._visible = true;
            this.livePanelMC.descTF._x = 46;
            this.livePanelMC.playerTF._x = 46;
            if(this.imgLdr == undefined)
            {
               this.imgLdr = com.rockstargames.ui.media.ImageLoaderMC(this.livePanelMC.imgLdrFrameMC.attachMovie("GenericImageLoader","imgLdr",this.livePanelMC.imgLdrFrameMC.getNextHighestDepth()));
            }
            this.imgLdr._visible = false;
            if(this.imgLdr.textureDict != txd || this.imgLdr.textureFilename != txn)
            {
               if(this.imgLdr.isLoaded)
               {
                  this.imgLdr.removeTxdRef();
               }
               this.imgLdr.init("SOCIAL_CLUB_TV",txd,txn,32,32);
               this.imgLdr.addTxdRef(String(this.imgLdr));
            }
         }
         else
         {
            this.livePanelMC.imgLdrFrameMC._visible = false;
            this.livePanelMC.descTF._x = 6;
            this.livePanelMC.playerTF._x = 6;
         }
         if(crewTag != "" && crewTag != undefined)
         {
            if(_loc2_ == undefined)
            {
               _loc2_ = com.rockstargames.gtav.Multiplayer.CREW_TAG_MOVIECLIP(this.livePanelMC.attachMovie("CREW_TAG_MOVIECLIP","ct",this.livePanelMC.getNextHighestDepth(),{_y:this.livePanelMC.playerTF._y + 3,_xscale:70,_yscale:70}));
            }
            _loc2_._x = this.livePanelMC.playerTF._x + this.livePanelMC.playerTF._width + 6;
            _loc2_.UNPACK_CREW_TAG(crewTag);
         }
         else if(_loc2_ != undefined)
         {
            _loc2_.removeMovieClip();
            _loc2_ = undefined;
         }
         this.livePanelMC.descTF._visible = true;
         this.livePanelMC.playerTF._visible = true;
         this.livePanelMC.bg._visible = true;
      }
      else
      {
         _loc4_ = true;
         this.livePanelMC.imgLdrFrameMC._visible = false;
         this.livePanelMC.descTF._visible = false;
         this.livePanelMC.playerTF._visible = false;
         this.livePanelMC.bg._visible = false;
         _loc2_.removeMovieClip();
         _loc2_ = undefined;
      }
      var _loc3_ = 142;
      var _loc9_ = 11;
      if(!_loc4_)
      {
         _loc3_ = Math.max(this._howWide(this.livePanelMC.playerTF),Math.max(this._howWide(this.livePanelMC.descTF),_loc3_));
         if(_loc2_ != undefined)
         {
            _loc3_ = Math.max(this._howWide(_loc2_) - _loc9_,_loc3_);
         }
      }
      this.livePanelMC.titleBG._width = _loc3_ + 10;
      this.livePanelMC.bg._width = _loc3_ + 10;
      this._positionLivePanel();
   }
   function SHOW_TICKER(value)
   {
      this.lowerThirdMC._visible = value;
   }
   function SET_TICKER_TITLE(title)
   {
      this.lowerThirdMC.titleTF.htmlText = title;
   }
   function ADD_TICKER_TEXT()
   {
      this.ticker.ADD_TICKER_TEXT.apply(this.ticker,arguments);
   }
   function ADD_TXD_REF_RESPONSE(txd, strRef, success)
   {
      var il = com.rockstargames.ui.media.ImageLoaderMC(eval(strRef));
      il._visible = true;
      il.displayTxdResponse(txd);
   }
   function _positionLivePanel()
   {
      this.livePanelMC._x = this.safeRight - this.livePanelMC.titleBG._width;
      this.livePanelMC._y = this.safeTop;
   }
   function _positionLowerThird()
   {
      this.lowerThirdMC._x = this.safeLeft;
      this.lowerThirdMC._y = this.safeBottom - this.lowerThirdMC._height;
      this.lowerThirdMC.logoMC._x = this.safeRight - this.safeLeft - this.lowerThirdMC.logoMC._width;
      this.lowerThirdMC.titleBG._x = - this.safeLeft;
      this.lowerThirdMC.titleBG._width = this.lowerThirdMC.logoMC._x + this.safeLeft;
      this.ticker.updateWidth(this.lowerThirdMC.logoMC._x);
   }
   function _howWide(target)
   {
      return target._x + target._width;
   }
}

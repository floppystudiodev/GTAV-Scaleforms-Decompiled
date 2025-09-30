class com.rockstargames.gtav.Multiplayer.GTAV_ONLINE extends com.rockstargames.ui.core.BaseScreenLayout
{
   var BIGFEED_HOLDER;
   var BIGFEED_ITEM;
   var CONTENT;
   var NEWS_PLACEHOLDER_DESCRIPTION;
   var TIMELINE;
   var alignmentType;
   var bShowingLogo;
   var bigFeedFadeInDuration;
   var bodyIconsMC;
   var eContext;
   var gfxName;
   var imgLdr;
   var missionDetailsMC;
   var NEWS_CONTEXT_IMG = 0;
   var NEWS_CONTEXT_MODE_STATS = 1;
   var NEWS_CONTEXT_CONTACT_STATS = 2;
   var NEWS_CONTEXT_MISSION_CARD = 3;
   var FEED_IMAGE_WIDTH = 288;
   var FEED_ITEM_HEIGHT = 430;
   var FEED_ITEM_WIDTH = 864;
   var STAT_ITEM_WIDTH = 259;
   var STAT_ITEM_HEIGHT = 40;
   var STAT_ITEM_PADDING_X = 20;
   var STAT_ITEM_PADDING_Y = 50;
   function GTAV_ONLINE()
   {
      super();
      this.NEWS_PLACEHOLDER_DESCRIPTION = new com.rockstargames.ui.utils.HudColourLite();
      this.NEWS_PLACEHOLDER_DESCRIPTION.r = 242;
      this.NEWS_PLACEHOLDER_DESCRIPTION.g = 16;
      this.NEWS_PLACEHOLDER_DESCRIPTION.b = 45;
      _global.gfxExtensions = true;
      this.alignmentType = "CC";
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.gfxName = "GTAV_ONLINE";
      this.bigFeedFadeInDuration = 0.35;
      this.bShowingLogo = true;
   }
   function initScreenLayout(alignmentType)
   {
      this.CONTENT.logo._x = this.safeLeft;
      this.CONTENT.logo._y = this.safeBottom - 183.5;
      this.positionToScreenLayout(this.BIGFEED_HOLDER,alignmentType,true);
      this.alignmentType = alignmentType;
   }
   function SET_DISPLAY_CONFIG(_screenWidthPixels, _screenHeightPixels, _safeTopPercent, _safeBottomPercent, _safeLeftPercent, _safeRightPercent, _isWideScreen, _isHiDef, _isAsian)
   {
      this.isWideScreen = _isWideScreen;
      this.isHiDef = _isHiDef;
      this.screenWidthPixels = _screenWidthPixels;
      this.screenHeightPixels = _screenHeightPixels;
      this.safeLeft = Math.round(this.screenWidthPixels * _safeLeftPercent);
      this.safeRight = Math.round(this.screenWidthPixels * _safeRightPercent);
      this.safeTop = Math.round(this.screenHeightPixels * _safeTopPercent);
      this.safeBottom = Math.round(this.screenHeightPixels * _safeBottomPercent);
      this.initScreenLayout(this.alignmentType);
   }
   function SET_BIG_LOGO_VISIBLE(isBig, playFromStart)
   {
      if(this.TIMELINE.logoBig == undefined)
      {
         this.TIMELINE.attachMovie("logoBig","logoBig",-10,{_x:640,_y:305});
      }
      this.TIMELINE.logoBig._visible = isBig;
      this.CONTENT._visible = !isBig;
      if(playFromStart)
      {
         this.TIMELINE.logoBig.gotoAndPlay(1);
      }
   }
   function HIDE_ONLINE_LOGO()
   {
      this.CONTENT.logo._visible = false;
   }
   function OVERRIDE_SIZE(scaleX, scaleY)
   {
      this.TIMELINE.logoBig._width = !this.isWideScreen ? scaleX * 960 : scaleX * 1280;
      this.TIMELINE.logoBig._height = scaleY * 720;
   }
   function OVERRIDE_POSITION(posX, posY)
   {
      this.TIMELINE.logoBig._x = !this.isWideScreen ? posX * 960 + 160 : posX * 1280;
      this.TIMELINE.logoBig._y = posY * 720;
   }
   function fadeLogoOut()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT.logo,0.35,{_alpha:0,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_IN});
      this.bShowingLogo = false;
   }
   function SETUP_BIGFEED(bAlignRight)
   {
      com.rockstargames.ui.utils.Debug.log("GTAV_ONLINE.SETUP_BIGFEED(" + arguments + ")");
      if(!this.BIGFEED_HOLDER)
      {
         this.BIGFEED_HOLDER = this.TIMELINE.createEmptyMovieClip("bigFeedHolder",this.TIMELINE.getNextHighestDepth());
         this.BIGFEED_ITEM = this.BIGFEED_HOLDER.attachMovie("transitionNews","currentTab",this.BIGFEED_HOLDER.getNextHighestDepth());
         this.BIGFEED_ITEM.titleTF.textAutoSize = "shrink";
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.BIGFEED_ITEM.tileBGMC.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG);
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.BIGFEED_ITEM.tileBGMC.placeholderImgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG);
         com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.BIGFEED_ITEM.titleTF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
         com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.BIGFEED_ITEM.subtitleTF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
         com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.BIGFEED_ITEM.bodyTF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
         this.initScreenLayout(!bAlignRight ? "CC" : "RC");
      }
   }
   function SETUP_TABS(count, bAlignRight)
   {
      com.rockstargames.ui.utils.Debug.log("GTAV_ONLINE.SETUP_TABS(" + arguments + ")");
      this.SETUP_BIGFEED(bAlignRight);
      this.BIGFEED_HOLDER._alpha = 0;
   }
   function SET_BIGFEED_INFO(footerStr, bodyStr, whichTab, txd, txn, subtitle, urlDeprecated, title, newsItemType)
   {
      if(newsItemType == 622774931)
      {
         this.BIGFEED_ITEM.gotoAndStop(2);
         this.BIGFEED_ITEM.titleTF.textAutoSize = "shrink";
         com.rockstargames.ui.utils.Colour.Colourise(this.BIGFEED_ITEM.tileBGMC.bgMC,this.NEWS_PLACEHOLDER_DESCRIPTION.r,this.NEWS_PLACEHOLDER_DESCRIPTION.g,this.NEWS_PLACEHOLDER_DESCRIPTION.b,0);
         com.rockstargames.ui.utils.Colour.Colourise(this.BIGFEED_ITEM.tileBGMC.placeholderImgMC,this.NEWS_PLACEHOLDER_DESCRIPTION.r,this.NEWS_PLACEHOLDER_DESCRIPTION.g,this.NEWS_PLACEHOLDER_DESCRIPTION.b);
         com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.BIGFEED_ITEM.titleTF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
         com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.BIGFEED_ITEM.subtitleTF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
         com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.BIGFEED_ITEM.bodyTF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
         com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.BIGFEED_ITEM.footerTF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
      }
      else
      {
         this.BIGFEED_ITEM.gotoAndStop(1);
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.BIGFEED_ITEM.tileBGMC.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG);
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.BIGFEED_ITEM.tileBGMC.placeholderImgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG);
         com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.BIGFEED_ITEM.titleTF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
         com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.BIGFEED_ITEM.subtitleTF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
         com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.BIGFEED_ITEM.bodyTF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
         com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.BIGFEED_ITEM.footerTF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      }
      com.rockstargames.ui.utils.Debug.log("GTAV_ONLINE.SET_BIGFEED_INFO(" + arguments + ")");
      this.SET_NEWS_CONTEXT(this.NEWS_CONTEXT_IMG);
      if(this.BIGFEED_ITEM.progressBarMC)
      {
         this.BIGFEED_ITEM.progressBarMC._visible = false;
      }
      if(title && title != "")
      {
         if(newsItemType == 622774931)
         {
            this.BIGFEED_ITEM.titleTF.htmlText = title.split(" ").join("<font face=\'$Redemption\' size=\'23\'> </font>");
         }
         else
         {
            this.BIGFEED_ITEM.titleTF.htmlText = title;
         }
      }
      else
      {
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.BIGFEED_ITEM.titleTF,"HUD_MAINTIT",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,false);
      }
      this.BIGFEED_ITEM.subtitleTF.htmlText = !subtitle ? "" : subtitle;
      this.BIGFEED_ITEM.bodyTF._y = this.BIGFEED_ITEM.subtitleTF._y + (subtitle != "" ? Math.min(this.BIGFEED_ITEM.subtitleTF.textHeight,this.BIGFEED_ITEM.subtitleTF._height) + 18 : 0);
      this.SET_BIGFEED_BODY_TEXT(bodyStr);
      this.SET_BIGFEED_IMAGE(txd,txn);
      if(this.bShowingLogo)
      {
         this.fadeLogoOut();
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.BIGFEED_HOLDER,0.25,{onComplete:this.FADE_IN_BIGFEED,onCompleteScope:this});
      }
      this.BIGFEED_HOLDER._visible = true;
   }
   function SET_BIGFEED_BODY_TEXT(bodyStr)
   {
      if(this.bodyIconsMC)
      {
         this.bodyIconsMC.removeMovieClip();
      }
      this.bodyIconsMC = this.BIGFEED_ITEM.createEmptyMovieClip("bodyIconsMC",this.BIGFEED_ITEM.getNextHighestDepth());
      var _loc2_ = new com.rockstargames.ui.utils.Text();
      _loc2_.setTextWithIcons(bodyStr,this.bodyIconsMC,this.BIGFEED_ITEM.bodyTF,0,14,4,false);
   }
   function HIDE_BIGFEED_INFO()
   {
      this.BIGFEED_HOLDER._visible = false;
   }
   function FADE_OUT_BIGFEED()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.BIGFEED_HOLDER,this.bigFeedFadeInDuration / 2,{_alpha:0,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_OUT});
   }
   function FADE_IN_BIGFEED()
   {
      this.BIGFEED_HOLDER._alpha = 0;
      this.BIGFEED_HOLDER._visible = true;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.BIGFEED_HOLDER,this.bigFeedFadeInDuration,{_alpha:100,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_IN});
   }
   function SET_BIGFEED_PROGRESS(eHudColour, progress)
   {
      if(!this.BIGFEED_ITEM.progressBarMC)
      {
         this.BIGFEED_ITEM.attachMovie("GenericColourBar","progBarMC",this.BIGFEED_ITEM.getNextHighestDepth(),{_x:594,_y:338});
      }
      com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar(this.BIGFEED_ITEM.progBarMC).init(eHudColour,258,13);
      com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar(this.BIGFEED_ITEM.progBarMC).percent(progress);
   }
   function END_BIGFEED()
   {
      com.rockstargames.ui.utils.Debug.log("GTAV_ONLINE.END_BIGFEED(" + arguments + ")");
      if(this.BIGFEED_HOLDER)
      {
         this.imgLdr.removeTxdRef();
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.BIGFEED_HOLDER,0.5,{_alpha:0});
      }
      this.SET_DATA_SLOT_EMPTY();
   }
   function SET_BIGFEED_IMAGE(txd, image)
   {
      com.rockstargames.ui.utils.Debug.log("GTAV_ONLINE.SET_BIGFEED_IMAGE(" + arguments + ")");
      if(!this.imgLdr)
      {
         this.imgLdr = com.rockstargames.ui.media.ImageLoaderMC(this.BIGFEED_ITEM.attachMovie("GenericImageLoader","GenericImageLoader",this.BIGFEED_ITEM.getNextHighestDepth(),{_x:580}));
      }
      if(this.imgLdr.textureDict == txd)
      {
         if(this.imgLdr.isLoaded)
         {
            this.imgLdr.init(this.gfxName,txd,image,this.FEED_IMAGE_WIDTH,this.FEED_ITEM_HEIGHT);
            this.imgLdr.displayTxdResponse(txd);
            this.fadeImgIn();
         }
      }
      else if(txd != undefined && image != undefined && txd != "" && image != "")
      {
         if(this.imgLdr.isLoaded)
         {
            this.imgLdr.removeTxdRef();
         }
         this.imgLdr.init(this.gfxName,txd,image,this.FEED_IMAGE_WIDTH,this.FEED_ITEM_HEIGHT);
         this.imgLdr.addTxdRef(String(this),this.fadeImgIn,this);
      }
      else
      {
         this.fadeImgOut();
      }
   }
   function SET_NEWS_CONTEXT(eContext)
   {
      com.rockstargames.ui.utils.Debug.log("GTAV_ONLINE.SET_NEWS_CONTEXT(" + arguments + ")");
      this.SET_DATA_SLOT_EMPTY();
      this.eContext = eContext;
      if(eContext == this.NEWS_CONTEXT_IMG)
      {
         this.imgLdr._visible = true;
         this.BIGFEED_ITEM.tileBGMC.placeholderImgMC._visible = true;
         this.BIGFEED_ITEM.tileBGMC.bgMC._width = 580;
         this.BIGFEED_ITEM.tileBGMC.bgMC._height = 430;
         this.BIGFEED_ITEM.subtitleTF._width = 554;
      }
      else if(eContext == this.NEWS_CONTEXT_MISSION_CARD)
      {
         this.imgLdr._visible = false;
         this.BIGFEED_ITEM.tileBGMC.placeholderImgMC._visible = false;
         this.BIGFEED_ITEM.tileBGMC.bgMC._width = 868;
         this.BIGFEED_ITEM.tileBGMC.bgMC._height = 435;
         this.BIGFEED_ITEM.subtitleTF._width = 554;
         if(!this.missionDetailsMC)
         {
            this.missionDetailsMC = com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_FREEMODE_DETAILS(this.BIGFEED_ITEM.attachMovie("freemodeDetails","missionDetailsMC",this.BIGFEED_ITEM.getNextHighestDepth(),{_x:580}));
            this.missionDetailsMC.INITIALISE();
            this.missionDetailsMC.setImageLoaderInfo(this.gfxName,6);
         }
      }
      else
      {
         this.imgLdr._visible = false;
         this.BIGFEED_ITEM.tileBGMC.placeholderImgMC._visible = false;
         this.BIGFEED_ITEM.tileBGMC.bgMC._width = 868;
         this.BIGFEED_ITEM.tileBGMC.bgMC._height = 430;
         this.BIGFEED_ITEM.subtitleTF._width = 840;
      }
   }
   function SET_TITLE()
   {
      if(this.eContext == this.NEWS_CONTEXT_MISSION_CARD)
      {
         this.missionDetailsMC.SET_TITLE.apply(this.missionDetailsMC,arguments);
         this.BIGFEED_ITEM.tileBGMC.bgMC._width = 580;
      }
   }
   function SET_DATA_SLOT(i)
   {
      com.rockstargames.ui.utils.Debug.log("GTAV_ONLINE.SET_DATA_SLOT(" + arguments + ")");
      var _loc3_;
      var _loc6_;
      var _loc5_;
      if(this.eContext == this.NEWS_CONTEXT_MODE_STATS || this.eContext == this.NEWS_CONTEXT_CONTACT_STATS)
      {
         _loc3_ = this.BIGFEED_ITEM["statMC" + i];
         if(!_loc3_)
         {
            _loc6_ = 21 + i % 3 * (this.STAT_ITEM_WIDTH + this.STAT_ITEM_PADDING_X);
            _loc5_ = 128 + Math.floor(i / 3) * (this.STAT_ITEM_HEIGHT + this.STAT_ITEM_PADDING_Y);
            _loc3_ = com.rockstargames.gtav.Multiplayer.items.TransitionNewsProgressItem(this.BIGFEED_ITEM.attachMovie("transitionNewsStatItem","statMC" + i,this.BIGFEED_ITEM.getNextHighestDepth(),{_x:_loc6_,_y:_loc5_}));
         }
         _loc3_.setData.apply(_loc3_,arguments);
      }
      else if(this.eContext == this.NEWS_CONTEXT_MISSION_CARD)
      {
         this.missionDetailsMC.SET_DATA_SLOT.apply(this.missionDetailsMC,arguments);
      }
   }
   function SET_DATA_SLOT_EMPTY()
   {
      com.rockstargames.ui.utils.Debug.log("GTAV_ONLINE.SET_DATA_SLOT_EMPTY(" + arguments + ")");
      var _loc4_;
      var _loc3_;
      if(this.eContext == this.NEWS_CONTEXT_MODE_STATS || this.eContext == this.NEWS_CONTEXT_CONTACT_STATS)
      {
         _loc4_ = 0;
         _loc3_ = this.BIGFEED_ITEM["statMC" + _loc4_];
         while(_loc3_)
         {
            _loc3_.onCleanup();
            _loc3_.removeMovieClip();
            _loc4_ = _loc4_ + 1;
            _loc3_ = this.BIGFEED_ITEM["statMC" + _loc4_];
         }
      }
      else if(this.eContext == this.NEWS_CONTEXT_MISSION_CARD)
      {
         this.missionDetailsMC.SET_DATA_SLOT_EMPTY(0);
      }
   }
   function DISPLAY_VIEW(viewIndex, itemIndex)
   {
      var _loc4_;
      var _loc3_;
      if(this.eContext == this.NEWS_CONTEXT_MISSION_CARD)
      {
         _loc4_ = this.missionDetailsMC.model.getCurrentView().dataList.length;
         _loc3_ = _loc4_;
         while(_loc3_ < 10)
         {
            this.SET_DATA_SLOT(_loc3_,0,0,0,0,0," "," ");
            _loc3_ = _loc3_ + 1;
         }
         this.missionDetailsMC.DISPLAY_VIEW.apply(this.missionDetailsMC,arguments);
         this.missionDetailsMC.CONTENT.descBG._alpha = 80;
         this.missionDetailsMC.CONTENT.descBG._height = this.BIGFEED_ITEM.tileBGMC._height - this.missionDetailsMC.CONTENT.descBG._y;
         this.BIGFEED_ITEM.tileBGMC.bgMC._width = 580;
      }
   }
   function TXD_HAS_LOADED(textureDict, success, uniqueID)
   {
      com.rockstargames.ui.utils.Debug.log("TXD_HAS_LOADED: " + arguments);
      if(success)
      {
         var tempArray = uniqueID.split(".");
         var MCstring = tempArray[0];
         var ROOT = this.eContext != this.NEWS_CONTEXT_MISSION_CARD ? this.CONTENT : this.TIMELINE;
         if(ROOT[MCstring] == undefined)
         {
            com.rockstargames.ui.game.GameInterface.call("REMOVE_TXD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.gfxName,textureDict);
         }
         else
         {
            var il = com.rockstargames.ui.media.ImageLoaderMC(eval(ROOT + "." + uniqueID));
            if(il)
            {
               il.displayTxdResponse(textureDict,success);
            }
         }
      }
   }
   function TXD_ALREADY_LOADED(textureDict, uniqueID)
   {
      com.rockstargames.ui.utils.Debug.log("TXD_ALREADY_LOADED: " + arguments);
      var tempArray = uniqueID.split(".");
      var MCstring = tempArray[0];
      var ROOT = this.eContext != this.NEWS_CONTEXT_MISSION_CARD ? this.CONTENT : this.TIMELINE;
      if(ROOT[MCstring] == undefined)
      {
         com.rockstargames.ui.game.GameInterface.call("REMOVE_TXD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.gfxName,textureDict);
      }
      else
      {
         var il = com.rockstargames.ui.media.ImageLoaderMC(eval(ROOT + "." + uniqueID));
         if(il != undefined)
         {
            il.displayTxdResponse(textureDict,true);
         }
      }
   }
   function ADD_TXD_REF_RESPONSE(textureDict, uniqueID, success)
   {
      com.rockstargames.ui.utils.Debug.log("ADD_TXD_REF_RESPONSE: " + arguments);
      if(success)
      {
         this.imgLdr.displayTxdResponse();
      }
   }
   function fadeImgIn()
   {
      this.imgLdr._alpha = 0;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.imgLdr,0.35,{_alpha:100,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_OUT});
   }
   function fadeImgOut()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.imgLdr,0.35,{_alpha:0,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_OUT});
   }
}

class com.rockstargames.gtav.levelDesign.GAME_STREAM extends MovieClip
{
   var TIMELINE;
   var CONTENT;
   var BOUNDING_BOX;
   var snapNextItemIntoPosition;
   var componentList;
   var pendingSSObjList;
   var _displayConfig;
   var _enumID;
   var safeTop;
   var screenHeight;
   var isAsianLang;
   var topLine;
   var baseLine;
   var defaultBaseLine;
   var bigmapBaseLine;
   var loadingscreenBaseLine;
   var onlineBaseLine;
   var currentHeight;
   var isWideScreen;
   var DISPLAY_STATE_MAP_OFF = 0;
   var DISPLAY_STATE_MAP_SMALL = 1;
   var DISPLAY_STATE_MAP_LARGE = 2;
   var DISPLAY_STATE_LOADING_SCREEN_LOGO = 3;
   var DISPLAY_STATE_ONLINE_LOGO = 4;
   var spacing = 2;
   var helpTextHeight = 0;
   var mapVisibleState = com.rockstargames.gtav.levelDesign.GAME_STREAM.prototype.DISPLAY_STATE_MAP_OFF;
   var minimapSizeY = 142;
   var bigmapSizeY = 308;
   var onlineLogoSize = 190;
   var loadingLogoSize = 195;
   var timerDuration = 3;
   var flashBgR = 0;
   var flashBgG = 0;
   var flashBgB = 0;
   var flashBgA = 80;
   var bgColor = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK;
   var didBgColorChange = false;
   var playSound = true;
   var debugIsEnabled = false;
   function GAME_STREAM()
   {
      super();
      _global.gfxExtensions = true;
   }
   function INITIALISE(mc)
   {
      this.TIMELINE = mc;
      this.CONTENT = this.TIMELINE.attachMovie("CONTENT","CONTENT",this.TIMELINE.getNextHighestDepth());
      this.BOUNDING_BOX = this.TIMELINE.attachMovie("BOUNDING_BOX","BOUNDING_BOX",this.TIMELINE.getNextHighestDepth());
      this.BOUNDING_BOX._alpha = 10;
      this.ENABLE_SHOW_DEBUG_BOUNDS(false);
      this.snapNextItemIntoPosition = false;
      this.componentList = [];
      this.pendingSSObjList = [];
      this.SHOW();
      this.SET_DISPLAY_CONFIG(1280,720,0.04,0.96,0.04,0.96,true,false);
      this._displayConfig = new com.rockstargames.ui.utils.DisplayConfig();
      com.rockstargames.ui.game.GameInterface.call("SET_DISPLAY_CONFIG",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this._displayConfig);
   }
   function READY(id)
   {
      this._enumID = id;
   }
   function SET_DISPLAY_CONFIG(_screenWidthPixels, _screenHeightPixels, _safeTopPercent, _safeBottomPercent, _safeLeftPercent, _safeRightPercent, _isWideScreen, _isCircleAccept, _isAsianLang)
   {
      this.safeTop = _safeTopPercent * _screenHeightPixels * 2;
      this.screenHeight = _screenHeightPixels;
      this.isAsianLang = _isAsianLang;
      this.topLine = this.safeTop + this.helpTextHeight * this.screenHeight;
      this.adjustBaselines();
      switch(this.mapVisibleState)
      {
         case this.DISPLAY_STATE_MAP_OFF:
         default:
            this.baseLine = this.screenHeight;
            break;
         case this.DISPLAY_STATE_MAP_SMALL:
            this.baseLine = this.defaultBaseLine;
            break;
         case this.DISPLAY_STATE_MAP_LARGE:
            this.baseLine = this.bigmapBaseLine;
            break;
         case this.DISPLAY_STATE_LOADING_SCREEN_LOGO:
            this.baseLine = this.loadingscreenBaseLine;
            break;
         case this.DISPLAY_STATE_ONLINE_LOGO:
            this.baseLine = this.onlineBaseLine;
      }
      this.reorderListComponents();
      if(this.debugIsEnabled)
      {
         this.repositionDebugLines();
      }
   }
   function SET_HELPTEXT_HEIGHT(_helpTextHeight)
   {
      this.helpTextHeight = _helpTextHeight;
      this.topLine = this.safeTop + this.helpTextHeight * this.screenHeight;
      this.reorderListComponents();
      if(this.debugIsEnabled)
      {
         this.repositionDebugLines();
      }
   }
   function adjustBaselines()
   {
      this.defaultBaseLine = this.screenHeight - this.minimapSizeY;
      this.bigmapBaseLine = this.screenHeight - this.bigmapSizeY;
      this.loadingscreenBaseLine = this.screenHeight - this.loadingLogoSize;
      this.onlineBaseLine = this.screenHeight - this.onlineLogoSize;
      this.baseLine = this.defaultBaseLine;
   }
   function SET_MINIMAP_VISIBLE_STATE(_mapVisibleState)
   {
      this.mapVisibleState = _mapVisibleState;
      this.adjustBaselines();
      switch(this.mapVisibleState)
      {
         case this.DISPLAY_STATE_MAP_OFF:
         default:
            this.baseLine = this.screenHeight;
            this.CONTENT._visible = false;
            com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.CONTENT,0.1,{onComplete:this.SHOW_CONTENT,onCompleteScope:this});
            break;
         case this.DISPLAY_STATE_MAP_SMALL:
            this.baseLine = this.defaultBaseLine;
            break;
         case this.DISPLAY_STATE_MAP_LARGE:
            this.baseLine = this.bigmapBaseLine;
            break;
         case this.DISPLAY_STATE_LOADING_SCREEN_LOGO:
            this.baseLine = this.loadingscreenBaseLine;
            break;
         case this.DISPLAY_STATE_ONLINE_LOGO:
            this.baseLine = this.onlineBaseLine;
      }
      this.reorderListComponents();
      if(this.debugIsEnabled)
      {
         this.repositionDebugLines();
      }
   }
   function SET_IMPORTANT_PARAMS(bgR, bgG, bgB, _flashAlpha, _flashRate)
   {
      this.flashBgA = _flashAlpha;
      this.timerDuration = _flashRate;
      this.flashBgR = bgR;
      this.flashBgG = bgG;
      this.flashBgB = bgB;
   }
   function SET_NEXT_FEED_POST_BACKGROUND_COLOR(color)
   {
      this.bgColor = color;
      this.didBgColorChange = true;
   }
   function createStreamComponent(type, id)
   {
      var _loc2_ = "comp" + type;
      var _loc3_ = com.rockstargames.gtav.levelDesign.BaseGameStreamComponent(this.CONTENT.attachMovie(_loc2_,_loc2_ + id + "MC",this.CONTENT.getNextHighestDepth(),{_visible:false,_y:this.baseLine}));
      var _loc4_ = new com.rockstargames.gtav.levelDesign.StreamShuffleObj(_loc3_,id,type);
      return _loc4_;
   }
   function getStreamComponent(type, id)
   {
      var _loc3_ = undefined;
      var _loc4_ = undefined;
      var _loc5_ = this.componentList.length;
      var _loc2_ = 0;
      while(_loc2_ < _loc5_)
      {
         _loc3_ = this.componentList[_loc2_];
         if(_loc3_.type == type && _loc3_.id == id)
         {
            _loc4_ = _loc3_;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      return _loc4_;
   }
   function shuffleStreamComponents(currComp)
   {
      var _loc8_ = this.baseLine;
      currComp.ypos = currComp.mc._y = this.baseLine - currComp.mc.Background._height;
      var _loc9_ = this.componentList.length;
      if(_loc9_ > 1)
      {
         var _loc3_ = this.baseLine;
         var _loc6_ = this.baseLine;
         var _loc2_ = undefined;
         var _loc5_ = 0;
         while(_loc5_ < _loc9_)
         {
            _loc2_ = this.componentList[_loc5_];
            if(_loc2_.mc.shouldStayOnFeedBottom)
            {
               _loc3_ -= _loc2_.mc.Background._height + this.spacing;
            }
            _loc5_ = _loc5_ + 1;
         }
         var _loc4_ = 0;
         while(_loc4_ < _loc9_)
         {
            _loc2_ = this.componentList[_loc4_];
            if(_loc2_.mc.shouldStayOnFeedBottom)
            {
               _loc6_ -= _loc2_.mc.Background._height;
               _loc2_.ypos = _loc2_.mc._y = _loc6_;
               _loc6_ -= this.spacing;
            }
            else
            {
               _loc3_ -= _loc2_.mc.Background._height;
               _loc2_.ypos = _loc3_;
               if(_loc2_ == currComp)
               {
                  _loc2_.mc._alpha = 0;
               }
               if(_loc3_ < this.topLine)
               {
                  _loc2_.mc._visible = false;
               }
               else
               {
                  if(!_loc2_.mc._visible)
                  {
                     _loc2_.mc._alpha = 0;
                  }
                  _loc2_.mc._visible = true;
               }
               if(this.snapNextItemIntoPosition)
               {
                  _loc2_.mc._y = _loc2_.ypos;
                  _loc2_.mc._alpha = 100;
               }
               else
               {
                  com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2_.mc,0.2,{_alpha:100,_y:_loc2_.ypos,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT,onCompleteScope:this,onComplete:com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf,onCompleteArgs:[_loc2_.mc]});
               }
               _loc2_.mc._visible = true;
               if(_loc2_.ypos < _loc8_)
               {
                  _loc8_ = _loc2_.ypos;
               }
               _loc3_ -= this.spacing;
            }
            _loc4_ = _loc4_ + 1;
         }
      }
      else
      {
         _loc8_ = currComp.ypos;
         if(currComp.mc._y < this.topLine)
         {
            if(currComp.mc)
            {
               com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(currComp.mc);
            }
            if(this.snapNextItemIntoPosition)
            {
               currComp.mc._y = this.baseLine;
            }
            else
            {
               com.rockstargames.ui.tweenStar.TweenStarLite.to(currComp.mc,0.2,{_y:this.baseLine,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT,onCompleteScope:this,onComplete:com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf,onCompleteArgs:[currComp.mc]});
            }
         }
      }
      this.snapNextItemIntoPosition = false;
      this.currentHeight = _loc8_;
      this.animateInComplete(currComp.mc);
   }
   function animateInComplete(comp)
   {
      comp.STREAM_COMP_READY();
   }
   function reorderListComponents()
   {
      var _loc6_ = this.baseLine;
      var _loc2_ = undefined;
      var _loc8_ = undefined;
      _loc8_ = this.componentList[0];
      var _loc3_ = this.baseLine;
      var _loc5_ = this.baseLine;
      var _loc7_ = this.componentList.length;
      var _loc4_ = 0;
      while(_loc4_ < _loc7_)
      {
         _loc2_ = this.componentList[_loc4_];
         if(_loc2_.mc.shouldStayOnFeedBottom)
         {
            _loc3_ -= _loc2_.mc.Background._height + this.spacing;
         }
         _loc4_ = _loc4_ + 1;
      }
      _loc4_ = 0;
      while(_loc4_ < _loc7_)
      {
         _loc2_ = this.componentList[_loc4_];
         if(_loc2_.mc.shouldStayOnFeedBottom)
         {
            _loc5_ -= _loc2_.mc.Background._height;
            _loc2_.ypos = _loc2_.mc._y = _loc5_;
            _loc5_ -= this.spacing;
         }
         else
         {
            _loc3_ -= _loc2_.mc.Background._height;
            _loc2_.ypos = _loc3_;
            if(_loc3_ < this.topLine)
            {
               _loc2_.mc._visible = false;
            }
            else
            {
               if(_loc2_.mc._alpha < 100)
               {
                  _loc2_.mc._alpha = 100;
               }
               _loc2_.mc._visible = true;
            }
            com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(_loc2_.mc);
            _loc2_.mc._y = _loc2_.ypos;
            if(_loc2_.ypos < _loc6_)
            {
               _loc6_ = _loc2_.ypos;
            }
            _loc3_ -= this.spacing;
         }
         _loc4_ = _loc4_ + 1;
      }
      this.currentHeight = _loc6_;
      if(this.baseLine != this.screenHeight)
      {
         this.CONTENT._visible = true;
      }
   }
   function deleteStreamComponent(type, id)
   {
      if(this.deleteStreamComponentFromArray(false,type,id))
      {
         this.reorderListComponents();
      }
      else
      {
         this.deleteStreamComponentFromArray(true,type,id);
      }
   }
   function deleteStreamComponentFromArray(bFromPending, type, id)
   {
      var _loc5_ = false;
      var _loc4_ = !bFromPending ? this.componentList : this.pendingSSObjList;
      var _loc6_ = _loc4_.length;
      var _loc3_ = undefined;
      var _loc2_ = 0;
      while(_loc2_ < _loc6_)
      {
         _loc3_ = _loc4_[_loc2_];
         if(_loc3_.type == type && _loc3_.id == id && _loc3_.mc)
         {
            this.removeFeedMC(_loc3_);
            _loc4_.splice(_loc2_,1);
            _loc5_ = true;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      return _loc5_;
   }
   function removeFeedMC(ssObj)
   {
      ssObj.mc.onCleanup();
      ssObj.mc.removeMovieClip();
   }
   function willComponentFit(compHeight, compID)
   {
      var _loc2_ = true;
      if(this.currentHeight - (compHeight + this.spacing) < this.topLine)
      {
         _loc2_ = false;
         com.rockstargames.ui.game.GameInterface.call("STREAM_ITEM_FAILED",com.rockstargames.ui.game.GameInterface.HUD_TYPE,compID);
      }
      return _loc2_;
   }
   function validateComponent(ssObj)
   {
      if(this.willComponentFit(ssObj.mc.Background._height,ssObj.id))
      {
         if(ssObj.mc.hasPendingImage())
         {
            this.pendingSSObjList.push(ssObj);
         }
         else
         {
            ssObj.mc._visible = true;
            if(ssObj.type == com.rockstargames.gtav.levelDesign.GAME_STREAM_ENUMS.MSGTEXT && this.playSound)
            {
               com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"DPAD_WEAPON_SCROLL","HUD_FRONTEND_DEFAULT_SOUNDSET");
            }
            com.rockstargames.ui.game.GameInterface.call("STREAM_ITEM_SHOWN",com.rockstargames.ui.game.GameInterface.GAMESTREAM,ssObj.id,ssObj.mc.getContentLength());
            this.componentList.unshift(ssObj);
            this.shuffleStreamComponents(ssObj);
         }
      }
      else
      {
         this.removeFeedMC(ssObj);
      }
   }
   function updatePendingItems()
   {
      var _loc3_ = undefined;
      var _loc2_ = 0;
      while(_loc2_ < this.pendingSSObjList.length)
      {
         _loc3_ = this.pendingSSObjList[_loc2_];
         if(!_loc3_.mc.hasPendingImage())
         {
            this.validateComponent(_loc3_);
            this.pendingSSObjList.splice(_loc2_,1);
            _loc2_ = _loc2_ - 1;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function resetBgColor()
   {
      this.bgColor = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK;
      this.didBgColorChange = false;
   }
   function TXD_HAS_LOADED(textureDict, success, uniqueID)
   {
      if(success)
      {
         var tempArray = uniqueID.split(".");
         var MCstring = tempArray[0];
         if(this.CONTENT[MCstring] == undefined)
         {
            com.rockstargames.ui.game.GameInterface.call("REMOVE_TXD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"GAME_STREAM",textureDict);
         }
         else
         {
            var il = com.rockstargames.ui.media.ImageLoaderMC(eval(this.CONTENT + "." + uniqueID));
            if(il)
            {
               il.displayTxdResponse(textureDict,success);
            }
         }
      }
   }
   function TXD_ALREADY_LOADED(textureDict, uniqueID)
   {
      var tempArray = uniqueID.split(".");
      var MCstring = tempArray[0];
      if(this.CONTENT[MCstring] == undefined)
      {
         com.rockstargames.ui.game.GameInterface.call("REMOVE_TXD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"GAME_STREAM",textureDict);
      }
      else
      {
         var il = com.rockstargames.ui.media.ImageLoaderMC(eval(this.CONTENT + "." + uniqueID));
         if(il != undefined)
         {
            il.displayTxdResponse(textureDict,true);
         }
      }
   }
   function ADD_TXD_REF_RESPONSE(textureDict, uniqueID)
   {
      var tempArray = uniqueID.split(".");
      var MCstring = tempArray[0];
      if(this.CONTENT[MCstring] == undefined)
      {
         com.rockstargames.ui.game.GameInterface.call("REMOVE_TXD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"GAME_STREAM",textureDict);
      }
      else
      {
         var il = com.rockstargames.ui.media.ImageLoaderMC(eval(this.CONTENT + "." + uniqueID));
         if(il)
         {
            il.displayTxdResponse(textureDict,true);
         }
      }
   }
   function SET_STREAM_COMPONENT()
   {
      var _loc5_ = getTimer();
      com.rockstargames.ui.utils.Debug.log("Creating Stream Component: " + arguments);
      var _loc3_ = this.createStreamComponent(arguments[arguments.length - 1],arguments[0]);
      _loc3_.mc.setImageLoadedCallback(this.updatePendingItems,this);
      _loc3_.mc.INITIALISE(this.flashBgR,this.flashBgG,this.flashBgB,this.flashBgA,this.timerDuration,this.isWideScreen,this.isAsianLang,this.bgColor,this.updatePendingItems);
      _loc3_.mc.SET_DISPLAY_CONFIG_OBJECT(this._displayConfig);
      _loc3_.mc.SET_FEED_COMPONENT.apply(_loc3_.mc,arguments.slice(1,arguments.length - 1));
      this.validateComponent(_loc3_);
      if(this.didBgColorChange)
      {
         this.resetBgColor();
      }
      var _loc4_ = getTimer();
      com.rockstargames.ui.utils.Debug.log("SET_STREAM_COMPONENT creation time: " + (_loc4_ - _loc5_));
      if(this.debugIsEnabled)
      {
         this.repositionDebugLines();
      }
   }
   function SNAP_NEXT_FEED_ITEM_INTO_POSITION()
   {
      this.snapNextItemIntoPosition = true;
   }
   function UPDATE_STREAM_COMPONENT()
   {
      com.rockstargames.ui.utils.Debug.log("Updating Stream Component: " + arguments);
      var _loc3_ = this.getStreamComponent(arguments[arguments.length - 1],arguments[0]);
      if(_loc3_)
      {
         _loc3_.mc.SET_FEED_COMPONENT.apply(_loc3_.mc,arguments.slice(1));
         _loc3_.mc.STREAM_COMP_READY();
         this.reorderListComponents();
      }
      if(this.debugIsEnabled)
      {
         this.repositionDebugLines();
      }
   }
   function REMOVE_STREAM_COMPONENT(compTypeIndex, compType)
   {
      com.rockstargames.ui.utils.Debug.log("Removing Stream Component: " + arguments);
      this.deleteStreamComponent(compType,compTypeIndex);
      if(this.debugIsEnabled)
      {
         this.repositionDebugLines();
      }
   }
   function UPDATE_STREAM_STATS()
   {
      arguments.push(com.rockstargames.gtav.levelDesign.GAME_STREAM_ENUMS.STATS);
      this.UPDATE_STREAM_COMPONENT.apply(this,arguments);
   }
   function UPDATE_STREAM_TICKER()
   {
      arguments.push(com.rockstargames.gtav.levelDesign.GAME_STREAM_ENUMS.TICKER);
      this.UPDATE_STREAM_COMPONENT.apply(this,arguments);
   }
   function SHOW()
   {
      this.playSound = true;
   }
   function HIDE()
   {
      this.playSound = false;
   }
   function SHOW_CONTENT()
   {
      this.CONTENT._visible = true;
   }
   function ENABLE_SHOW_DEBUG_BOUNDS(isEnabled)
   {
      this.debugIsEnabled = isEnabled;
      this.BOUNDING_BOX._visible = isEnabled;
      this.CONTENT.debug_top._visible = isEnabled;
      this.CONTENT.debug_bottom._visible = isEnabled;
      this.CONTENT.debug_stage._visible = isEnabled;
      this.CONTENT.debug_currentHeight._visible = isEnabled;
      this.repositionDebugLines();
   }
   function repositionDebugLines()
   {
      this.CONTENT.debug_top._y = this.topLine;
      this.CONTENT.debug_bottom._y = this.baseLine;
      this.CONTENT.debug_top.gotoAndPlay(2);
      this.CONTENT.debug_bottom.gotoAndPlay(2);
      this.CONTENT.debug_currentHeight._y = this.currentHeight;
   }
}

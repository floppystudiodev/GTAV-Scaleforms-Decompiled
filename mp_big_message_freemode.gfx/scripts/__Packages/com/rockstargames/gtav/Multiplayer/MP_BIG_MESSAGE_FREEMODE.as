class com.rockstargames.gtav.Multiplayer.MP_BIG_MESSAGE_FREEMODE extends com.rockstargames.ui.core.BaseScreenLayout
{
   var SINGLE_TEXT_HEIGHT;
   var BIG_TEXT_OUTLINE_STRENGTH;
   var BigMessageMaster;
   var CONTENT;
   var shardBG_ID;
   var isAnimating;
   var hasMsgBG;
   var crewEmblemImg;
   var MESSAGE_POSITION;
   var RankIconImageMC;
   var BigMessageTF;
   var BigMessageTextMC;
   var IconNameTF;
   var RankUpIconMC;
   var strapline_background;
   var weaponPurchased;
   var showDoubleBG;
   var BIG_MSG_DURATION = 0;
   var STRAP_MSG_DURATION = 0;
   var STRAP_MSG_DELAY_DURATION = 0;
   var MESSAGE_POSITION_TOP_Y = 90;
   var MESSAGE_POSITION_CENTER_Y = 240;
   var TEXT_PADDING_LEFT = 20;
   var TEXT_PADDING_RIGHT = 50;
   var isAlignedCenter = false;
   var ENFORCED_DEPTH = 100;
   var PADDING = 100;
   var bigTextDestY = 116;
   var initialbigTextDestY = 116;
   var lastTransitionDuration = 0.16;
   var shardTime = 0.5;
   var _isPlayingMessage = false;
   var messageFadeUpStarted = false;
   var bigTextGoalY = 0;
   function MP_BIG_MESSAGE_FREEMODE()
   {
      super();
      _global.gfxExtensions = true;
      this.SINGLE_TEXT_HEIGHT = 26;
      this.BIG_TEXT_OUTLINE_STRENGTH = 9;
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
   }
   function createMessageNG(linkageID, args)
   {
      var _loc3_ = args[0];
      var _loc7_ = args[1];
      var _loc12_ = args[2];
      var _loc13_ = args[3];
      var _loc14_ = !(args.length > 6 && !isNaN(args[6])) ? com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK : args[6];
      if(this.BigMessageMaster != undefined)
      {
         this.BigMessageMaster.removeMovieClip();
      }
      this.BigMessageMaster = this.CONTENT.attachMovie(linkageID,linkageID,this.ENFORCED_DEPTH,{_x:640,_alpha:(_loc12_ != undefined ? _loc12_ : 100)});
      this.BigMessageMaster.BIG_TEXT_WRAPPER.BIG_TEXT.textAutoSize = "shrink";
      this.BigMessageMaster.BIG_TEXT_WRAPPER.BIG_TEXT.htmlText = _loc3_;
      this.BigMessageMaster.BIG_TEXT_WRAPPER.BIG_TEXT._alpha = 65;
      if(this.shardBG_ID)
      {
         this.BigMessageMaster.attachMovie(this.shardBG_ID,"shard",this.BigMessageMaster.shard.getDepth(),{_x:-640,_y:283});
      }
      this.UPDATE_STRAP_MESSAGE(_loc7_);
      this.initialbigTextDestY = this.BigMessageMaster.BIG_TEXT_WRAPPER._y;
      if(_loc13_)
      {
         this.bigTextDestY = this.BigMessageMaster.BIG_TEXT_WRAPPER._y;
         this.BigMessageMaster.BIG_TEXT_WRAPPER._y = 0.4 * this.screenHeightPixels;
      }
      else if(linkageID == "GENERIC_CENTRAL_MESSAGE" && !this.BigMessageMaster.BLACK_BAR_DOUBLE._visible && !this.BigMessageMaster.BLACK_BAR_SINGLE._visible)
      {
         this.BigMessageMaster.BIG_TEXT_WRAPPER._y = (this.screenHeightPixels - this.BigMessageMaster.BIG_TEXT_WRAPPER.BIG_TEXT.textHeight) * 0.5;
      }
      if(this.BigMessageMaster.BLACK_BAR_DOUBLE)
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.BigMessageMaster.BLACK_BAR_DOUBLE.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG);
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.BigMessageMaster.BLACK_BAR_SINGLE.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG);
      }
      this.BigMessageMaster.shard._y = this.BigMessageMaster.BIG_TEXT_WRAPPER._y - 32;
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.BigMessageMaster.shard,_loc14_);
      var _loc8_ = "gqyGYÃ‡";
      var _loc2_ = 0;
      while(_loc2_ < _loc8_.length)
      {
         if(_loc3_.indexOf(_loc8_.charAt(_loc2_)) != -1)
         {
            var _loc5_ = this.BigMessageMaster.BIG_TEXT_WRAPPER.BIG_TEXT.textHeight;
            var _loc4_ = 0.18 * _loc5_;
            this.BigMessageMaster.BIG_TEXT_WRAPPER._y -= _loc4_;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      var _loc6_ = false;
      _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         if(_loc3_.charCodeAt(_loc2_) > 11263)
         {
            _loc6_ = true;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      if(!_loc6_)
      {
         _loc2_ = 0;
         while(_loc2_ < _loc7_.length)
         {
            if(_loc7_.charCodeAt(_loc2_) > 11263)
            {
               _loc6_ = true;
               break;
            }
            _loc2_ = _loc2_ + 1;
         }
      }
      if(_loc6_)
      {
         var _loc10_ = this.BigMessageMaster.BIG_TEXT_WRAPPER.BIG_TEXT;
         _loc10_._y -= 10;
         var _loc11_ = _loc10_.getNewTextFormat();
         _loc11_.size *= 0.85;
         _loc10_.setTextFormat(_loc11_);
      }
   }
   function SET_SHARD_BACKGROUND_TARGET_HEIGHT(numStats)
   {
      numStats = Math.min(13,Math.max(1,numStats));
      this.shardBG_ID = "SHARD_BG_" + numStats;
   }
   function SET_SHARD_BACKGROUND_HEIGHT(height)
   {
      height *= 720;
      var _loc2_ = Math.round(99 * (height - 70) / 650) + 1;
      if(_loc2_ < 1)
      {
         _loc2_ = 1;
      }
      else if(_loc2_ > this.BigMessageMaster.shard._totalframes)
      {
         _loc2_ = this.BigMessageMaster.shard._totalframes;
      }
      this.BigMessageMaster.shard.gotoAndStop(_loc2_);
   }
   function ROLL_DOWN_BACKGROUND()
   {
      this.BigMessageMaster.shard.gotoAndPlay("rollDown");
   }
   function ROLL_UP_BACKGROUND()
   {
      this.BigMessageMaster.shard.gotoAndPlay("rollUp");
   }
   function UPDATE_MESSAGE(msgText)
   {
      if(this.BigMessageMaster.textHolderMC.MESSAGE_TEXT)
      {
         this.BigMessageMaster.textHolderMC.MESSAGE_TEXT.htmlText = msgText;
      }
      else if(this.BigMessageMaster.MESSAGE_TEXT_WRAPPER.MESSAGE_TEXT)
      {
         this.BigMessageMaster.MESSAGE_TEXT_WRAPPER.MESSAGE_TEXT.htmlText = msgText;
      }
   }
   function createMessage(linkageID, args)
   {
      var _loc2_ = args[0];
      var _loc6_ = args[1];
      var _loc4_ = args[2];
      var _loc5_ = args[3];
      if(this.BigMessageMaster != undefined)
      {
         this.BigMessageMaster.removeMovieClip();
      }
      this.BigMessageMaster = this.CONTENT.attachMovie(linkageID,linkageID,this.ENFORCED_DEPTH,{_x:640,_alpha:(_loc4_ != undefined ? _loc4_ : 100)});
      this.BigMessageMaster.BIG_TEXT.textAutoSize = "shrink";
      this.BigMessageMaster.BIG_TEXT.htmlText = _loc2_;
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.BigMessageMaster.BLACK_BAR_DOUBLE.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.BigMessageMaster.BLACK_BAR_SINGLE.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG);
      this.UPDATE_STRAP_MESSAGE(_loc6_);
      this.initialbigTextDestY = this.BigMessageMaster.BIG_TEXT._y;
      if(_loc5_)
      {
         this.bigTextDestY = this.BigMessageMaster.BIG_TEXT._y;
         this.BigMessageMaster.BIG_TEXT._y = (this.screenHeightPixels - this.BigMessageMaster.BIG_TEXT.textHeight) * 0.5;
         this.isAnimating = true;
         this.saveStrapStateOnAnimate();
      }
      else if(linkageID == "GENERIC_CENTRAL_MESSAGE" && !this.BigMessageMaster.BLACK_BAR_DOUBLE._visible && !this.BigMessageMaster.BLACK_BAR_SINGLE._visible)
      {
         this.BigMessageMaster.BIG_TEXT._y = (this.screenHeightPixels - this.BigMessageMaster.BIG_TEXT.textHeight) * 0.5;
      }
      this.setBigMessageOutline(_loc2_);
   }
   function setBigMessageOutline(bigTextStr)
   {
      this.BigMessageMaster.BIG_TEXT_OUTLINE.textAutoSize = "shrink";
      this.BigMessageMaster.BIG_TEXT_OUTLINE.outline = this.BIG_TEXT_OUTLINE_STRENGTH;
      this.BigMessageMaster.BIG_TEXT_OUTLINE._y = this.BigMessageMaster.BIG_TEXT._y;
      this.BigMessageMaster.BIG_TEXT_OUTLINE.htmlText = bigTextStr;
      this.BigMessageMaster.BIG_TEXT_OUTLINE.textColor = 0;
   }
   function SET_RESPAWN_BAR_PERCENTAGE(precent)
   {
      if(this.BigMessageMaster.respawn_bar._alpha != 100)
      {
         this.hasMsgBG = true;
         if(this.BigMessageMaster.BIG_TEXT._y != this.initialbigTextDestY)
         {
            this.bigTextDestY = this.initialbigTextDestY;
            this.BigMessageMaster.BIG_TEXT._y = (this.screenHeightPixels - this.BigMessageMaster.BIG_TEXT.textHeight) * 0.5;
            this.isAnimating = true;
            this.TRANSITION_UP(this.lastTransitionDuration);
         }
      }
      this.BigMessageMaster.BLACK_BAR_SINGLE._visible = true;
      this.BigMessageMaster.BLACK_BAR_DOUBLE._visible = false;
      this.BigMessageMaster.MESSAGE_TEXT._visible = false;
      this.BigMessageMaster.MESSAGE_TEXT_WRAPPER.MESSAGE_TEXT._visible = false;
      this.BigMessageMaster.BLACK_BAR_SINGLE._width = 160;
      this.BigMessageMaster.respawn_bar._alpha = 100;
      this.BigMessageMaster.respawn_bar_bg._alpha = 20;
      this.BigMessageMaster.respawn_bar._xscale = precent;
      this.BigMessageMaster.respawn_bar_flash._xscale = precent;
   }
   function FLASH_RESPAWN_BAR(duration)
   {
      var _loc2_ = this.BigMessageMaster.respawn_bar_flash;
      _loc2_._alpha = 100;
      if(duration == undefined)
      {
         duration = 0.2;
      }
      com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2_,duration,{_alpha:0});
   }
   function UPDATE_STRAP_MESSAGE(msgText)
   {
      if(msgText == undefined)
      {
         msgText = "";
      }
      msgText = com.rockstargames.gtav.utils.GTAVUIUtils.parseHTMLForFonts(msgText,18);
      this.BigMessageMaster.BLACK_BAR_DOUBLE._visible = false;
      this.BigMessageMaster.BLACK_BAR_SINGLE._visible = false;
      var _loc3_ = this.BigMessageMaster.MESSAGE_TEXT || this.BigMessageMaster.MESSAGE_TEXT_WRAPPER.MESSAGE_TEXT;
      _loc3_.htmlText = msgText;
      _loc3_.autosize = true;
      if(!this.messageFadeUpStarted && this.BigMessageMaster.MESSAGE_TEXT_WRAPPER)
      {
         this.messageFadeUpStarted = true;
         this.BigMessageMaster.MESSAGE_TEXT_WRAPPER._alpha = 0;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.BigMessageMaster.MESSAGE_TEXT_WRAPPER,0.35,{_alpha:100});
      }
      if(msgText != "" && msgText != undefined)
      {
         var _loc4_ = new flash.geom.Point(_loc3_.textWidth,_loc3_.textHeight);
         if(_loc4_.y > this.SINGLE_TEXT_HEIGHT)
         {
            this.BigMessageMaster.BLACK_BAR_DOUBLE._visible = true;
            this.BigMessageMaster.BLACK_BAR_SINGLE._visible = false;
            this.BigMessageMaster.BLACK_BAR_DOUBLE._width = _loc4_.x + 100;
         }
         else
         {
            this.BigMessageMaster.BLACK_BAR_DOUBLE._visible = false;
            this.BigMessageMaster.BLACK_BAR_SINGLE._visible = true;
            this.BigMessageMaster.BLACK_BAR_SINGLE._width = _loc4_.x + 100;
         }
      }
      if(this.isAnimating)
      {
         this.saveStrapStateOnAnimate();
      }
   }
   function ADD_TXD_REF_RESPONSE(textureDict, uniqueID, success)
   {
      this.crewEmblemImg.displayTxdResponse(textureDict,success);
   }
   function CLEAR_CREW_RANKUP_MP_MESSAGE()
   {
      if(this.BigMessageMaster != undefined)
      {
         this.BigMessageMaster.removeMovieClip();
      }
      if(this.crewEmblemImg)
      {
         this.crewEmblemImg.removeTxdRef();
         this.crewEmblemImg.removeMovieClip();
         this.crewEmblemImg = null;
      }
   }
   function SHOW_BUSTED_MP_MESSAGE()
   {
      this.createMessageNG("GENERIC_CENTRAL_MESSAGE",arguments);
      this.SET_SHARD_BACKGROUND_HEIGHT(0.1111111111111111);
   }
   function SHOW_WASTED_MP_MESSAGE()
   {
      this.createMessageNG("GENERIC_CENTRAL_MESSAGE_LARGE",arguments);
      if(typeof this.BigMessageMaster.respawn_bar == "movieclip")
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.BigMessageMaster.respawn_bar,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_RED);
         this.BigMessageMaster.respawn_bar._alpha = 0;
      }
      if(typeof this.BigMessageMaster.respawn_bar_bg == "movieclip")
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.BigMessageMaster.respawn_bar_bg,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_RED);
         this.BigMessageMaster.respawn_bar_bg._alpha = 0;
      }
      this.SET_SHARD_BACKGROUND_HEIGHT(0.1111111111111111);
   }
   function SHOW_RANKUP_MP_MESSAGE(bigText)
   {
      var _loc6_ = undefined;
      if(this.BigMessageMaster != undefined)
      {
         this.BigMessageMaster.removeMovieClip();
      }
      var _loc7_ = arguments[3];
      this.BigMessageMaster = this.CONTENT.attachMovie("MASTER_RANK_UP","MASTER_RANK_UP",this.ENFORCED_DEPTH,{_x:640,_alpha:(_loc7_ != undefined ? _loc7_ : 100)});
      this.BigMessageMaster.BLACK_BAR_SINGLE._visible = false;
      this.BigMessageMaster.RANK_ICON._visible = false;
      var _loc4_ = arguments[1];
      var _loc3_ = arguments[2];
      this.BigMessageMaster.BIG_TEXT.textAutoSize = "shrink";
      this.BigMessageMaster.BIG_TEXT.htmlText = bigText;
      this.setBigMessageOutline(bigText);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.BigMessageMaster.BLACK_BAR_SINGLE.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG);
      if(_loc4_ != "" && _loc4_ != undefined)
      {
         this.BigMessageMaster.MESSAGE_TEXT.htmlText = _loc4_;
         var _loc5_ = new flash.geom.Point(this.BigMessageMaster.MESSAGE_TEXT.textWidth,this.BigMessageMaster.MESSAGE_TEXT.textHeight);
         this.BigMessageMaster.BLACK_BAR_SINGLE._width = _loc5_.x + 10 + this.PADDING / 2 + this.BigMessageMaster.RANK_ICON._width;
         this.BigMessageMaster.BLACK_BAR_SINGLE._visible = true;
         _loc6_ = _loc5_.x + 10 + this.BigMessageMaster.RANK_ICON._width;
         this.BigMessageMaster.RANK_ICON._x = - _loc6_ / 2;
         this.BigMessageMaster.MESSAGE_TEXT._x = this.BigMessageMaster.RANK_ICON._x + this.BigMessageMaster.RANK_ICON._width + 10;
      }
      this.BigMessageMaster.RANK_ICON._visible = Number(_loc3_) > 0;
      if(Number(_loc3_) > 0 && _loc3_ != undefined)
      {
         if(Number(_loc3_) > 99)
         {
            this.BigMessageMaster.RANK_ICON.RANK_THREE_DIGITS.htmlText = _loc3_;
            this.BigMessageMaster.RANK_ICON.RANK_THREE_DIGITS._visible = true;
            this.BigMessageMaster.RANK_ICON.RANK_DIGITS._visible = false;
         }
         else
         {
            this.BigMessageMaster.RANK_ICON.RANK_DIGITS.htmlText = _loc3_;
            this.BigMessageMaster.RANK_ICON.RANK_DIGITS._visible = true;
            this.BigMessageMaster.RANK_ICON.RANK_THREE_DIGITS._visible = false;
         }
      }
      else
      {
         this.BigMessageMaster.MESSAGE_TEXT._x = - _loc6_ / 2 - 10;
      }
   }
   function SHOW_CREW_RANKUP_MP_MESSAGE(titleStr, msgStr, rankNumber, emblemTXD, emblemTXN, alpha)
   {
      var _loc5_ = undefined;
      if(this.BigMessageMaster != undefined)
      {
         this.BigMessageMaster.removeMovieClip();
      }
      this.BigMessageMaster = this.CONTENT.attachMovie("MASTER_CREW_RANK_UP","MASTER_CREW_RANK_UP",this.ENFORCED_DEPTH,{_x:640,_alpha:(alpha != undefined ? alpha : 100)});
      this.BigMessageMaster.BLACK_BAR_SINGLE._visible = false;
      this.BigMessageMaster.CREW_RANK_ICON._visible = false;
      this.BigMessageMaster.BIG_TEXT.textAutoSize = "shrink";
      this.BigMessageMaster.BIG_TEXT.htmlText = titleStr;
      this.setBigMessageOutline(titleStr);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.BigMessageMaster.BLACK_BAR_SINGLE.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG);
      var _loc2_ = 0;
      if(msgStr != "" && msgStr != undefined)
      {
         this.BigMessageMaster.MESSAGE_TEXT.htmlText = msgStr;
         var _loc3_ = new flash.geom.Point(this.BigMessageMaster.MESSAGE_TEXT.textWidth,this.BigMessageMaster.MESSAGE_TEXT.textHeight);
         this.BigMessageMaster.BLACK_BAR_SINGLE._width = _loc3_.x + 10 + this.PADDING + this.BigMessageMaster.CREW_RANK_ICON._width;
         this.BigMessageMaster.BLACK_BAR_SINGLE._visible = true;
         _loc5_ = _loc3_.x + 10 + this.BigMessageMaster.CREW_RANK_ICON._width;
         _loc2_ = (- _loc5_) / 2 - 50;
         this.BigMessageMaster.CREW_RANK_ICON._x = _loc2_;
         _loc2_ += this.BigMessageMaster.CREW_RANK_ICON._width + 10;
      }
      this.BigMessageMaster.CREW_RANK_ICON._visible = Number(rankNumber) > 0;
      if(Number(rankNumber) > 0 && rankNumber != undefined)
      {
         this.BigMessageMaster.CREW_RANK_ICON.RANK_DIGITS.textAutoSize = "shrink";
         this.BigMessageMaster.CREW_RANK_ICON.RANK_DIGITS.htmlText = rankNumber;
      }
      if(!this.crewEmblemImg)
      {
         this.crewEmblemImg = com.rockstargames.ui.media.ImageLoaderMC(this.BigMessageMaster.attachMovie("GenericImageLoader","GenericImageLoaderMC",this.BigMessageMaster.getNextHighestDepth(),{_x:_loc2_,_y:192}));
      }
      this.crewEmblemImg.loadWithValidation("MP_BIG_MESSAGE_FREEMODE",emblemTXD,emblemTXN,2,25,25);
      _loc2_ += 35;
      this.BigMessageMaster.MESSAGE_TEXT._x = _loc2_;
   }
   function SHOW_LOCKED_UP_MP_MESSAGE()
   {
      this.MESSAGE_POSITION = this.MESSAGE_POSITION_TOP_Y;
      return this.SHOW_BIG_MP_MESSAGE.apply(this,arguments);
   }
   function SHOW_MISSION_END_MP_MESSAGE()
   {
      this.createMessageNG("MISSION_PASSED_FAILED",arguments);
   }
   function SHOW_MISSION_FAILED_MP_MESSAGE()
   {
      this.createMessageNG("MISSION_PASSED_FAILED",arguments);
      this.SET_SHARD_BACKGROUND_HEIGHT(0.25);
   }
   function SHOW_MISSION_PASSED_MESSAGE()
   {
      if(arguments.length >= 5)
      {
         var _loc3_ = arguments[4];
         var _loc5_ = arguments[5];
         if(_loc5_ && _loc3_ > 0)
         {
            _loc3_ -= 1;
         }
         this.SET_SHARD_BACKGROUND_TARGET_HEIGHT(_loc3_);
         this.createMessageNG("MISSION_PASSED_FAILED",arguments);
         if(arguments[1] && arguments[1] != "")
         {
            this.bigTextGoalY = this.BigMessageMaster.BIG_TEXT_WRAPPER._y;
            var _loc4_ = 170;
            this.BigMessageMaster.BIG_TEXT_WRAPPER._y = 0.5 * (_loc4_ - this.BigMessageMaster.BIG_TEXT_WRAPPER._height) + this.BigMessageMaster.shard._y;
            this.BigMessageMaster.MESSAGE_TEXT_WRAPPER.MESSAGE_TEXT._alpha = 0;
            this.bigTextGoalY -= this.BigMessageMaster.BIG_TEXT_WRAPPER._y;
         }
      }
      else
      {
         this.createMessage("MISSION_PASSED_FAILED_OLD",arguments);
      }
   }
   function SHOW_WEAPON_PURCHASED(bigMessage, weaponName, weaponHash, weaponDescription, alpha)
   {
      if(this.BigMessageMaster != undefined)
      {
         this.BigMessageMaster.removeMovieClip();
      }
      this.BigMessageMaster = this.CONTENT.attachMovie("WEAPON_PURCHASED","WEAPON_PURCHASED",this.ENFORCED_DEPTH,{_x:640,_alpha:(alpha != undefined ? alpha : 100)});
      var _loc13_ = 10;
      var _loc4_ = this.BigMessageMaster.BLACK_BAR_DOUBLE;
      var _loc5_ = this.BigMessageMaster.BLACK_BAR_SINGLE;
      var _loc2_ = this.BigMessageMaster.WEAPON_ICON_AND_INFO.weaponIcon;
      var _loc7_ = this.BigMessageMaster.WEAPON_ICON_AND_INFO;
      var _loc11_ = this.BigMessageMaster.BIG_TEXT;
      var _loc3_ = this.BigMessageMaster.WEAPON_ICON_AND_INFO.MESSAGE_TEXT;
      var _loc8_ = this.BigMessageMaster.WEAPON_ICON_AND_INFO.DETAILS;
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.BigMessageMaster.BLACK_BAR_DOUBLE.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.BigMessageMaster.BLACK_BAR_SINGLE.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG);
      _loc4_._visible = false;
      _loc2_._visible = true;
      _loc5_._visible = false;
      _loc11_.textAutoSize = "shrink";
      _loc11_.htmlText = bigMessage;
      this.BigMessageMaster.shard.gotoAndStop(19);
      var _loc6_ = weaponName;
      if(weaponHash != -1 && weaponHash != 0)
      {
         _loc2_.gotoAndStop("INT" + weaponHash);
      }
      else
      {
         _loc2_.gotoAndStop(1);
      }
      _loc3_._x = 0 + _loc2_._x + _loc2_._width + _loc13_;
      if(_loc6_ != "" && _loc6_ != undefined)
      {
         _loc3_.autoSize = "left";
         _loc3_._width = 2;
         _loc3_.htmlText = _loc6_;
         _loc8_.autoSize = "left";
         _loc8_._width = 2;
         var _loc10_ = new flash.geom.Point(_loc3_.textWidth,_loc3_.textHeight);
         if(weaponDescription != undefined)
         {
            _loc2_._y = 0 + _loc4_._height / 2;
            _loc4_._visible = true;
            _loc5_._visible = false;
            _loc4_._width = _loc10_.x + 100 + _loc2_._width;
         }
         else
         {
            _loc4_._visible = false;
            _loc5_._visible = true;
            _loc2_._y = 0 + _loc5_._height / 2;
            _loc5_._width = _loc10_.x + 100 + _loc2_._width;
         }
      }
      var _loc9_ = _loc7_.getBounds(_loc7_);
      _loc7_._x = -0.5 * (_loc9_.xMax - _loc9_.xMin);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.BigMessageMaster.shard,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
   }
   function SHOW_PLANE_MESSAGE(bigMessage, planeName, planeHash)
   {
      if(this.BigMessageMaster != undefined)
      {
         this.BigMessageMaster.removeMovieClip();
      }
      this.BigMessageMaster = this.CONTENT.attachMovie("PLANE_EQUIPPED","PLANE_EQUIPPED",this.ENFORCED_DEPTH,{_x:640});
      var _loc9_ = 10;
      var _loc3_ = this.BigMessageMaster.WEAPON_ICON_AND_INFO.weaponIcon;
      var _loc4_ = this.BigMessageMaster.WEAPON_ICON_AND_INFO;
      var _loc6_ = this.BigMessageMaster.BIG_TEXT;
      var _loc2_ = this.BigMessageMaster.WEAPON_ICON_AND_INFO.MESSAGE_TEXT;
      _loc6_.textAutoSize = "shrink";
      _loc6_.htmlText = bigMessage.toUpperCase();
      this.BigMessageMaster.shard.gotoAndStop(19);
      if(planeHash != -1 && planeHash != 0)
      {
         _loc3_.gotoAndStop("INT" + planeHash);
      }
      else
      {
         _loc3_.gotoAndStop(1);
      }
      _loc2_._x = 0 + _loc3_._x + _loc3_._width + _loc9_;
      if(planeName != "" && planeName != undefined)
      {
         _loc2_.autoSize = "left";
         _loc2_._width = 2;
         _loc2_.htmlText = planeName;
      }
      var _loc5_ = _loc4_.getBounds(_loc4_);
      _loc4_._x = -0.5 * (_loc5_.xMax - _loc5_.xMin);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.BigMessageMaster.shard,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
      com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.BigMessageMaster.BIG_TEXT,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
   }
   function SHOW_TERRITORY_CHANGE_MP_MESSAGE()
   {
      this.MESSAGE_POSITION = this.MESSAGE_POSITION_TOP_Y;
      return this.SHOW_BIG_MP_MESSAGE.apply(this,arguments);
   }
   function SHOW_MP_MESSAGE_TOP()
   {
      this.createMessageNG("MASTER_GENERIC_SINGLE_LINE",arguments);
   }
   function SHOW_CENTERED_MP_MESSAGE_LARGE()
   {
      this.createMessageNG("GENERIC_CENTRAL_MESSAGE_LARGE",arguments);
      if(arguments[1] && arguments[1] != "")
      {
         this.SET_SHARD_BACKGROUND_HEIGHT(0.08333333333333333);
      }
      else
      {
         this.SET_SHARD_BACKGROUND_HEIGHT(0.06944444444444445);
      }
      if(arguments[4] && !isNaN(arguments[4]))
      {
         this.BigMessageMaster.BIG_TEXT_WRAPPER.BIG_TEXT._alpha = arguments[4];
      }
   }
   function SHOW_CENTERED_MP_MESSAGE()
   {
      this.createMessageNG("GENERIC_CENTRAL_MESSAGE",arguments);
      if(arguments[1] && arguments[1] != "")
      {
         this.SET_SHARD_BACKGROUND_HEIGHT(0.06944444444444445);
      }
      else
      {
         this.SET_SHARD_BACKGROUND_HEIGHT(0.08333333333333333);
      }
   }
   function SHOW_CENTERED_TOP_MP_MESSAGE()
   {
      this.createMessageNG("MASTER_GENERIC_SINGLE_LINE",arguments);
   }
   function SHOW_BIG_MP_MESSAGE_WITH_STRAP_AND_RANK()
   {
      this.SHOW_BIG_MP_MESSAGE.apply(this,arguments);
      var _loc3_ = this.BIG_MSG_DURATION;
      _loc3_ += Math.min(this.STRAP_MSG_DELAY_DURATION,this.STRAP_MSG_DURATION);
      _loc3_ += Math.max(this.STRAP_MSG_DELAY_DURATION,this.STRAP_MSG_DURATION) - Math.min(this.STRAP_MSG_DELAY_DURATION,this.STRAP_MSG_DURATION);
      return _loc3_ * 1000;
   }
   function SHOW_BIG_MP_MESSAGE_WITH_STRAP()
   {
      this.SHOW_BIG_MP_MESSAGE.apply(this,arguments);
      var _loc3_ = this.BIG_MSG_DURATION;
      _loc3_ += Math.min(this.STRAP_MSG_DELAY_DURATION,this.STRAP_MSG_DURATION);
      _loc3_ += Math.max(this.STRAP_MSG_DELAY_DURATION,this.STRAP_MSG_DURATION) - Math.min(this.STRAP_MSG_DELAY_DURATION,this.STRAP_MSG_DURATION);
      return _loc3_ * 1000;
   }
   function SHOW_BIG_MP_MESSAGE()
   {
      this.RESET_MOVIE();
      this.BigMessageMaster._y = this.MESSAGE_POSITION;
      var _loc4_ = this.BIG_MSG_DURATION;
      var _loc3_ = arguments;
      var _loc8_ = _loc3_[0];
      var _loc9_ = _loc3_[3];
      if(_loc3_[2] != undefined)
      {
         var _loc5_ = _loc3_[2];
         if(this.RankIconImageMC.numberTF != undefined)
         {
            this.RankIconImageMC.numberTF.htmlText = _loc5_;
            if(_loc5_ > 99)
            {
               this.RankIconImageMC.numberTF._y = 11;
               var _loc7_ = this.RankIconImageMC.numberTF.getTextFormat();
               _loc7_.size = 24;
               this.RankIconImageMC.numberTF.setTextFormat(_loc7_);
            }
         }
      }
      else
      {
         this.RankIconImageMC.rankIconImage._visible = false;
         this.RankIconImageMC.gotoAndStop(1);
      }
      this.BigMessageTF.htmlText = _loc8_;
      this.BigMessageTextMC._xscale = 100;
      this.BigMessageTextMC._yscale = 100;
      var _loc6_ = _loc3_[1];
      if(_loc6_ != undefined)
      {
         _loc4_ += Math.min(this.STRAP_MSG_DELAY_DURATION,this.STRAP_MSG_DURATION);
         _loc4_ += Math.max(this.STRAP_MSG_DELAY_DURATION,this.STRAP_MSG_DURATION) - Math.min(this.STRAP_MSG_DELAY_DURATION,this.STRAP_MSG_DURATION);
         this.playIconAnimation(_loc6_);
      }
      return _loc4_ * 1000;
   }
   function SHOW_SHARD_CENTERED_MP_MESSAGE()
   {
      var _loc4_ = arguments[2];
      var _loc3_ = arguments[3];
      this.DO_SHARD(arguments,true,_loc4_,_loc3_);
   }
   function SHOW_SHARD_CENTERED_MP_MESSAGE_LARGE()
   {
      var _loc3_ = arguments[2];
      this.DO_SHARD(arguments,true,_loc3_,undefined,true);
   }
   function SHOW_SHARD_WASTED_MP_MESSAGE(bigTxt, msgTxt, colId, someUnusedBoolean, darkenBackground)
   {
      colId = arguments[2];
      this.DO_SHARD(arguments,true,colId);
      if(darkenBackground)
      {
         var _loc5_ = this.BigMessageMaster.bgMC.duplicateMovieClip("bgMC2",-1,{_x:this.BigMessageMaster.bgMC._x,_y:this.BigMessageMaster.bgMC._y,_alpha:20});
      }
   }
   function SHOW_SHARD_CENTERED_TOP_MP_MESSAGE()
   {
      var _loc3_ = arguments[2];
      this.DO_SHARD(arguments,false,_loc3_);
   }
   function SHOW_SHARD_RANKUP_MP_MESSAGE()
   {
      var _loc3_ = arguments[2];
      this.DO_SHARD(arguments,false,0,_loc3_);
   }
   function SHOW_SHARD_CREW_RANKUP_MP_MESSAGE()
   {
      this.DO_SHARD(arguments,false);
   }
   function DO_SHARD(args, isCenter, colID, shardColID, useLargeShard)
   {
      var _loc3_ = args[0];
      var _loc5_ = args[1];
      if(this.BigMessageMaster != undefined)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.BigMessageMaster);
         this.BigMessageMaster.removeMovieClip();
      }
      var _loc9_ = !useLargeShard ? "SHARD_MESSAGE" : "SHARD_MESSAGE_LARGE";
      this.BigMessageMaster = this.CONTENT.attachMovie(_loc9_,"SHARD_MESSAGE",this.ENFORCED_DEPTH,{_x:640});
      var _loc15_ = !isCenter ? 116 : 324;
      this.BigMessageMaster.textHolderMC._y = _loc15_;
      this.SHARD_SET_TEXT(_loc3_,_loc5_,colID);
      if(colID != undefined && colID != 0)
      {
         this.colourSwitch();
      }
      else
      {
         this.BigMessageMaster.textHolderMC.titleMC._visible = true;
         this.BigMessageMaster.textHolderMC.titleMC._alpha = 65;
      }
      var _loc4_ = false;
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         if(_loc3_.charCodeAt(_loc2_) > 11263)
         {
            _loc4_ = true;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      if(!_loc4_)
      {
         _loc2_ = 0;
         while(_loc2_ < _loc5_.length)
         {
            if(_loc5_.charCodeAt(_loc2_) > 11263)
            {
               _loc4_ = true;
               break;
            }
            _loc2_ = _loc2_ + 1;
         }
      }
      if(_loc4_)
      {
         var _loc7_ = this.BigMessageMaster.textHolderMC.titleMC.BIG_TEXT;
         _loc7_._y -= 10;
         var _loc8_ = _loc7_.getNewTextFormat();
         _loc8_.size *= 0.85;
         _loc7_.setTextFormat(_loc8_);
         _loc7_ = this.BigMessageMaster.textHolderMC.coltitleMC.BIG_TEXT;
         _loc7_._y -= 10;
         _loc8_ = _loc7_.getNewTextFormat();
         _loc8_.size *= 0.85;
         _loc7_.setTextFormat(_loc8_);
      }
      var _loc11_ = 30;
      this.BigMessageMaster.bgMC._y = this.BigMessageMaster.textHolderMC._y + this.BigMessageMaster.textHolderMC._height / 2;
      this.BigMessageMaster.bgMC._height = this.BigMessageMaster.textHolderMC._height + _loc11_ * 2;
      if(shardColID == undefined || shardColID == 0)
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.BigMessageMaster.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
      }
      else
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.BigMessageMaster.bgMC,shardColID);
      }
      if(isCenter)
      {
         var _loc14_ = 8;
         var _loc13_ = 360 - _loc14_;
         this.BigMessageMaster.bgMC._y = _loc13_;
         com.rockstargames.ui.utils.Debug.log("CENTRING TEXT");
         this.BigMessageMaster.textHolderMC._y = this.BigMessageMaster.bgMC._y - this.BigMessageMaster.textHolderMC._height / 2;
         var _loc6_ = "gqyGYÃ‡";
         _loc2_ = 0;
         while(_loc2_ < _loc6_.length)
         {
            if(_loc3_.indexOf(_loc6_.charAt(_loc2_)) != -1)
            {
               this.BigMessageMaster.textHolderMC._y -= 8;
               break;
            }
            _loc2_ = _loc2_ + 1;
         }
      }
      this.BigMessageMaster._alpha = 100;
   }
   function getFontSizeFit(gamerName, fontSize, widthToFit)
   {
      var _loc2_ = new TextFormat("$Font2_cond");
      do
      {
         _loc2_.size = fontSize;
         var tfExtent = _loc2_.getTextExtent(gamerName,this._width);
      }
      while(tfExtent.textFieldWidth > widthToFit && (fontSize = fontSize - 1));
      
      return fontSize;
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
   function colourSwitch()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.BigMessageMaster.textHolderMC.titleMC);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.BigMessageMaster.textHolderMC.coltitleMC);
      this.BigMessageMaster.textHolderMC.titleMC._alpha = 0;
      this.BigMessageMaster.textHolderMC.titleMC._visible = true;
      this.BigMessageMaster.textHolderMC.coltitleMC._alpha = 65;
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.BigMessageMaster.textHolderMC.titleMC,0.5,{onComplete:this.colourSwitchAnim,onCompleteScope:this});
   }
   function colourSwitchAnim()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.BigMessageMaster.textHolderMC.titleMC);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.BigMessageMaster.textHolderMC.coltitleMC);
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.BigMessageMaster.textHolderMC.titleMC,1,{ease:com.rockstargames.ui.tweenStar.Ease.CUBIC_IN,_alpha:65});
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.BigMessageMaster.textHolderMC.coltitleMC,1,{ease:com.rockstargames.ui.tweenStar.Ease.CUBIC_IN,_alpha:0});
   }
   function SHARD_SET_TEXT(bigText, msgText, colID)
   {
      var _loc8_ = this.BigMessageMaster.textHolderMC.titleMC.BIG_TEXT;
      var _loc3_ = this.BigMessageMaster.textHolderMC.MESSAGE_TEXT;
      var _loc9_ = this.BigMessageMaster.textHolderMC.coltitleMC;
      if(bigText == "")
      {
         _loc8_._visible = false;
      }
      else
      {
         _loc8_.htmlText = "<font color=\'#FFFFFF\'>" + bigText + "</font>";
         var _loc6_ = _loc8_.textHeight;
         _loc8_.textAutoSize = "shrink";
         _loc8_._visible = true;
      }
      if(colID != undefined && colID != 0)
      {
         _loc9_.BIG_TEXT.textAutoSize = "shrink";
         _loc9_.BIG_TEXT.htmlText = "<font color=\'#FFFFFF\'>" + bigText + "</font>";
         com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc9_,colID);
         _loc9_._visible = true;
         this.BigMessageMaster.textHolderMC.titleMC._alpha = 65;
      }
      else
      {
         _loc9_._visible = false;
         this.BigMessageMaster.textHolderMC.titleMC._alpha = 100;
      }
      if(msgText == "" || msgText == undefined)
      {
         _loc3_._visible = false;
         _loc3_._y = 0;
      }
      else
      {
         _loc3_.htmlText = this.parseForGamerTagTitleFonts(_loc3_,msgText,18);
         _loc3_.multiline = true;
         _loc3_.wordWrap = true;
         _loc3_.autoSize = true;
         if(_loc8_._visible == true)
         {
            _loc3_._y = _loc6_;
            var _loc10_ = 0.5 * _loc3_.textHeight + 2;
            _loc9_._y -= _loc10_;
            _loc8_._y -= _loc10_;
            _loc3_._y -= _loc10_;
         }
         _loc3_._visible = true;
      }
      var _loc5_ = "gqyGYÃ‡";
      var _loc2_ = 0;
      while(_loc2_ < _loc5_.length)
      {
         if(bigText.indexOf(_loc5_.charAt(_loc2_)) != -1)
         {
            var _loc4_ = 0.18 * _loc6_;
            _loc3_._y += _loc4_;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function SHARD_ANIM_DELAY(delayTime)
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.BigMessageMaster,delayTime,{onCompleteArgs:[com.rockstargames.ui.utils.HudColour.HUD_COLOUR_ENEMY,0.33],onComplete:this.SHARD_ANIM_OUT,onCompleteScope:this});
   }
   function SHARD_ANIM_OUT(colID, animTime, textColourId)
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.BigMessageMaster);
      this.BigMessageMaster._y = 0;
      this.BigMessageMaster._alpha = 100;
      if(animTime == undefined)
      {
         animTime = 0.33;
      }
      if(colID == undefined)
      {
         colID = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK;
      }
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.BigMessageMaster.bgMC,colID);
      if(textColourId != undefined)
      {
         var _loc2_ = this.BigMessageMaster.textHolderMC.titleMC;
         var _loc3_ = this.BigMessageMaster.textHolderMC.coltitleMC;
         var _loc6_ = _loc2_._alpha;
         var _loc7_ = _loc3_._alpha;
         var _loc9_ = _loc2_.BIG_TEXT;
         var _loc10_ = this.BigMessageMaster.textHolderMC.MESSAGE_TEXT;
         this.SHARD_SET_TEXT(_loc9_.text,_loc10_.text,textColourId);
         _loc2_._alpha = _loc7_;
         _loc3_._alpha = _loc6_;
         _loc3_._y = _loc2_._y;
      }
      var _loc5_ = - this.BigMessageMaster.textHolderMC._y;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.BigMessageMaster,animTime,{ease:com.rockstargames.ui.tweenStar.Ease.CUBIC_INOUT,_y:_loc5_,_alpha:0});
   }
   function SET_RANK_ICON_RGB(r, g, b)
   {
      com.rockstargames.ui.utils.Colour.Colourise(this.BigMessageMaster.RANK_ICON.icon.RankIconImageMC,r,g,b);
   }
   function playIconAnimation(iconText)
   {
      var _loc4_ = undefined;
      var _loc2_ = this.RankIconImageMC.strapline_background;
      this.IconNameTF.htmlText = iconText;
      this.IconNameTF.autoSize = true;
      this.IconNameTF._x = 0;
      this.RankIconImageMC._x = this.IconNameTF._x + this.IconNameTF._width + 10;
      _loc2_._width = this.IconNameTF.textWidth + this.TEXT_PADDING_LEFT + this.TEXT_PADDING_RIGHT;
      if(this.isAlignedCenter)
      {
         _loc2_.gotoAndStop(2);
         this.IconNameTF._x = this.IconNameTF._parent._x * -1 - this.IconNameTF.textWidth / 2;
         _loc2_._x = this.IconNameTF._x + this.TEXT_PADDING_LEFT;
         this.RankUpIconMC._alpha = 100;
      }
      else
      {
         this.RankUpIconMC._x = 30;
         this.RankUpIconMC._alpha = 100;
      }
   }
   function TRANSITION_OUT(duration)
   {
      if(duration == undefined)
      {
         duration = 0.4;
      }
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.CONTENT);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.BigMessageMaster.BIG_TEXT);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.BigMessageMaster.BIG_TEXT_WRAPPER);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.BigMessageMaster.BIG_TEXT_OUTLINE);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.BigMessageMaster.textHolderMC.titleMC);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.BigMessageMaster.textHolderMC.coltitleMC);
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.BigMessageMaster,0.5 * duration,{_alpha:0,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_IN,_y:- this.BigMessageMaster._height});
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.BigMessageMaster.BIG_TEXT_OUTLINE,duration * 0.5,{_alpha:0,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_IN});
   }
   function getStringSize(str)
   {
      this.CONTENT.MESSAGE_TEXT.autoSize = true;
      this.CONTENT.MESSAGE_TEXT.htmlText = str;
      var _loc2_ = new flash.geom.Point(this.CONTENT.MESSAGE_TEXT.textWidth,this.CONTENT.MESSAGE_TEXT.textHeight);
      this.CONTENT.MESSAGE_TEXT.htmlText = "";
      return _loc2_;
   }
   function RESET_MOVIE()
   {
      this.BigMessageTextMC._xscale = 100;
      this.BigMessageTextMC._yscale = 100;
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.CONTENT);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.RankUpIconMC);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.BigMessageTextMC);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.RankUpIconMC);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.BigMessageTextMC);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.BigMessageMaster.smallMessageText);
      if(this.BigMessageMaster != undefined)
      {
         this.BigMessageMaster.removeMovieClip();
      }
      this.BigMessageMaster = this.CONTENT.attachMovie("BigMessage_Anim","BigMessage_Anim",this.ENFORCED_DEPTH,{_x:640,_y:140});
      this.BigMessageTextMC = this.BigMessageMaster.BigMessageText;
      this.RankUpIconMC = this.BigMessageMaster.rankup_icon;
      this.IconNameTF = this.RankUpIconMC.nameTF;
      this.BigMessageTF = this.BigMessageTextMC.bigMessageTF;
      this.strapline_background = this.BigMessageMaster.rankup_icon.strapline_background;
      if(this.RankUpIconMC.rankIconImage != undefined)
      {
         this.RankIconImageMC = this.RankUpIconMC.rankIconImage;
      }
      this.CONTENT.fullScreenBlack._alpha = 0;
      this.BigMessageMaster.FailedText.htmlText = "";
      this.BigMessageMaster.FailedText._alpha = 0;
      this.BigMessageMaster.smallMessageText._alpha = 0;
      this.weaponPurchased = this.BigMessageMaster.weaponPurchased;
      this.weaponPurchased._alpha = 0;
      this.weaponPurchased.weaponNameTF.htmlText = "";
   }
   function OVERRIDE_Y_POSITION(newYPosition)
   {
      this.CONTENT._y = newYPosition * this.screenHeightPixels;
   }
   function TRANSITION_IN(duration)
   {
   }
   function TRANSITION_UP(duration, preventAutoExpansion)
   {
      this.lastTransitionDuration = duration;
      if(this.hasMsgBG)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.CONTENT,duration * 0.5,{onCompleteScope:this,onComplete:this.showStrapMessage});
      }
      if(isNaN(this.bigTextDestY))
      {
         return undefined;
      }
      if(this.BigMessageMaster.BIG_TEXT)
      {
         if(preventAutoExpansion)
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this.BigMessageMaster.BIG_TEXT,duration,{_y:this.bigTextDestY,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_IN});
         }
         else
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this.BigMessageMaster.BIG_TEXT,duration,{_y:this.bigTextDestY,onCompleteScope:this,onComplete:this.transitionUpComplete,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_IN});
         }
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.BigMessageMaster.shard,duration,{_y:this.bigTextDestY + this.BigMessageMaster.shard._y - this.BigMessageMaster.BIG_TEXT._y,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_IN});
      }
      else
      {
         if(preventAutoExpansion)
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this.BigMessageMaster.BIG_TEXT_WRAPPER,duration,{_y:this.bigTextDestY + this.bigTextGoalY,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_IN,onComplete:this.showMessageAfterTransitionUp,onCompleteScope:this});
         }
         else
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this.BigMessageMaster.BIG_TEXT_WRAPPER,duration,{_y:this.bigTextDestY,onCompleteScope:this,onComplete:this.transitionUpComplete,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_IN});
         }
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.BigMessageMaster.shard,duration,{_y:this.bigTextDestY + this.BigMessageMaster.shard._y - this.BigMessageMaster.BIG_TEXT_WRAPPER._y,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_IN});
      }
      if(this.BigMessageMaster.MESSAGE_TEXT_WRAPPER)
      {
         this.BigMessageMaster.MESSAGE_TEXT_WRAPPER._alpha = 100;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.BigMessageMaster.MESSAGE_TEXT_WRAPPER,duration,{_y:this.bigTextDestY + this.BigMessageMaster.MESSAGE_TEXT_WRAPPER._y - this.BigMessageMaster.BIG_TEXT_WRAPPER._y,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_IN});
      }
      if(this.BigMessageMaster.BIG_TEXT_OUTLINE)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.BigMessageMaster.BIG_TEXT_OUTLINE,duration,{_y:this.bigTextDestY,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_IN});
      }
   }
   function showMessageAfterTransitionUp()
   {
      this.BigMessageMaster.MESSAGE_TEXT_WRAPPER.MESSAGE_TEXT._alpha = 100;
      this.BigMessageMaster.MESSAGE_TEXT_WRAPPER._alpha = 100;
   }
   function TRANSITION_DOWN(duration)
   {
      var _loc2_ = 0.4 * this.screenHeightPixels;
      this.lastTransitionDuration = duration;
      if(this.BigMessageMaster.BIG_TEXT)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.BigMessageMaster.BIG_TEXT,duration,{_y:_loc2_});
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.BigMessageMaster.shard,duration,{_y:_loc2_ + this.BigMessageMaster.shard._y - this.BigMessageMaster.BIG_TEXT._y});
      }
      else
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.BigMessageMaster.BIG_TEXT_WRAPPER,duration,{_y:_loc2_});
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.BigMessageMaster.shard,duration,{_y:_loc2_ + this.BigMessageMaster.shard._y - this.BigMessageMaster.BIG_TEXT_WRAPPER._y});
      }
      if(this.BigMessageMaster.MESSAGE_TEXT_WRAPPER)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.BigMessageMaster.MESSAGE_TEXT_WRAPPER,duration,{_y:_loc2_ + this.BigMessageMaster.MESSAGE_TEXT_WRAPPER._y - this.BigMessageMaster.BIG_TEXT_WRAPPER._y,_alpha:100});
      }
      if(this.BigMessageMaster.BIG_TEXT_OUTLINE)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.BigMessageMaster.BIG_TEXT_OUTLINE,duration,{_y:_loc2_});
      }
   }
   function showStrapMessage()
   {
      this.BigMessageMaster.MESSAGE_TEXT._visible = true;
      this.BigMessageMaster.MESSAGE_TEXT_WRAPPER.MESSAGE_TEXT._visible = true;
      if(this.showDoubleBG)
      {
         this.BigMessageMaster.BLACK_BAR_DOUBLE._visible = true;
      }
      else
      {
         this.BigMessageMaster.BLACK_BAR_SINGLE._visible = true;
      }
   }
   function transitionUpComplete()
   {
      this.isAnimating = false;
      if(this.shardBG_ID)
      {
         this.BigMessageMaster.shard.play();
      }
   }
   function saveStrapStateOnAnimate()
   {
      this.hasMsgBG = this.BigMessageMaster.BLACK_BAR_DOUBLE._visible || this.BigMessageMaster.BLACK_BAR_SINGLE._visible;
      if(this.hasMsgBG)
      {
         this.showDoubleBG = this.BigMessageMaster.BLACK_BAR_DOUBLE._visible;
         this.BigMessageMaster.MESSAGE_TEXT._visible = false;
         this.BigMessageMaster.MESSAGE_TEXT_WRAPPER.MESSAGE_TEXT._visible = false;
         this.BigMessageMaster.BLACK_BAR_DOUBLE._visible = false;
         this.BigMessageMaster.BLACK_BAR_SINGLE._visible = false;
      }
   }
   function debug()
   {
   }
}

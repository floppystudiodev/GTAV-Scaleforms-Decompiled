class com.rockstargames.gtav.Multiplayer.MP_CELEBRATION extends com.rockstargames.ui.core.BaseScreenLayout
{
   var CONTENT;
   var ascendersPricedown;
   var celebrationGfxType;
   var condensedTextFormat;
   var descendersPricedown;
   var dispConf;
   var moneyMeshMask;
   var numberCountMC;
   var pricedownTextFormat;
   var removeMovieClip;
   var scriptTextFormat;
   var syncClearCallback;
   var syncedMovies;
   var verticalFlagLeftY;
   var verticalFlagRightY;
   var verticalFlagTextureId;
   var statWallArray = [];
   var positionId = "position";
   var rankBarId = "rank";
   var winnerId = "winner";
   var challengePartId = "challenge_part_win_lose";
   var timeId = "time";
   var worldRecordId = "world_record";
   var statNumericId = "stat_numeric";
   var introId = "intro";
   var challengeSetId = "challenge_set";
   var statTableId = "stat_table";
   var statRowId = "stat_row";
   var readyId = "ready";
   var pointsId = "points";
   var tournamentId = "tournament_qualification";
   var cashWonId = "cash_won";
   var incrementalCashWonId = "incremental_cash_won";
   var defaultFgAlpha = 40;
   var defaultBgAlpha = 75;
   var slamDuration = 0.333;
   var glideDuration = 15;
   var pauseDuration = 2;
   var ignorePauses = false;
   var bgTopHeight = 60;
   var bgBottomHeight = 100;
   var defaultPadding = 10;
   var ALIGN_LEFT = "left";
   var ALIGN_RIGHT = "right";
   var ALIGN_CENTER = "center";
   var TYPE_BG = "typeBg";
   var TYPE_FG = "typeFg";
   var TYPE_STANDARD = "typeStandard";
   var TYPE_OVERLAY = "typeOverlay";
   var screenSwipeSound = "SCREEN_SWIPE";
   var screenSwipeSoundSet = "CELEBRATION_SOUNDSET";
   var statsScreenSound = "STATS_SCREEN";
   var statsScreenSoundSet = "CELEBRATION_SOUNDSET";
   var screenFlashSound = "SCREEN_FLASH";
   var screenFlashSoundSet = "CELEBRATION_SOUNDSET";
   var finishedPlaceSound = "FINISHED_PLACE_SCREEN";
   var finishedPlaceSoundSet = "CELEBRATION_SOUNDSET";
   var rankUpSound = "RANK_UP";
   var rankUpSoundSet = "HUD_AWARDS";
   var numberTurnSound = "NUMBER_TURN";
   var numberTurnSoundSet = "CELEBRATION_SOUNDSET";
   var numberTurnStopSound = "NUMBER_TURN_STOP";
   var numberTurnStopSoundSet = "CELEBRATION_SOUNDSET";
   var screenStartSound = "SCREEN_START";
   var screenStartSoundSet = "CELEBRATION_SOUNDSET";
   var winnerSound = "WINNER";
   var winnerSoundSet = "CELEBRATION_SOUNDSET";
   var numberCountSound = "NUMBER_COUNT_ONE_SHOT";
   var numberCountSoundSet = "CELEBRATION_SOUNDSET";
   var numberCountStopSound = "NUMBER_COUNT_STOP";
   var numberCountStopSoundSet = "CELEBRATION_SOUNDSET";
   var totalDurationMs = 0;
   var pauseNextDuration = 0;
   var wallList = [];
   static var NUM_MOVIES_TO_SYNC = 1;
   static var MOVIE_BIT_MATCH = (1 << com.rockstargames.gtav.Multiplayer.MP_CELEBRATION.NUM_MOVIES_TO_SYNC) - 1;
   static var BACKGROUND_READY = 0;
   static var BACKGROUND_START_TWEEN_IN = 1;
   static var BACKGROUND_FINISH_TWEEN_IN = 2;
   static var BACKGROUND_START_TWEEN_OUT = 3;
   static var BACKGROUND_HALFWAY_TWEEN_OUT = 4;
   static var BACKGROUND_FINISH_TWEEN_OUT = 5;
   static var MISSION_RESULT_SHOWN = 6;
   function MP_CELEBRATION()
   {
      super();
      _global.gfxExtensions = true;
   }
   function SET_DISPLAY_CONFIG(_screenWidthPixels, _screenHeightPixels, _safeTopPercent, _safeBottomPercent, _safeLeftPercent, _safeRightPercent, _isWideScreen, _isHiDef)
   {
      super.SET_DISPLAY_CONFIG(_screenWidthPixels,_screenHeightPixels,_safeTopPercent,_safeBottomPercent,_safeLeftPercent,_safeRightPercent,_isWideScreen,_isHiDef);
   }
   function INITIALISE(mc, type)
   {
      super.INITIALISE(mc);
      this.CONTENT = mc;
      this.celebrationGfxType = this.SET_GFX_TYPE(type);
      this.numberCountMC = this.CONTENT.createEmptyMovieClip("numberCountMC",this.CONTENT.getNextHighestDepth());
      this.dispConf = new com.rockstargames.ui.utils.DisplayConfig();
      this.dispConf = this.getDisplayConfig(true);
      if(!this.dispConf.isWideScreen)
      {
         Stage.scaleMode = "noBorder";
         this.dispConf.screenWidth = 960;
      }
      this.pricedownTextFormat = new TextFormat();
      this.pricedownTextFormat.font = "$gtaCash";
      this.condensedTextFormat = new TextFormat();
      if(!this.dispConf.isAsian)
      {
         this.condensedTextFormat.font = "$Font2_cond";
      }
      else
      {
         this.condensedTextFormat.font = "$Font2_cond_NOT_GAMERNAME";
      }
      this.scriptTextFormat = new TextFormat();
      this.scriptTextFormat.font = "$Font5";
      this.ascendersPricedown = this.CONTENT.ascendersPricedown.text;
      this.descendersPricedown = this.CONTENT.descendersPricedown.text;
      this.syncedMovies = 0;
      if(this.celebrationGfxType == this.TYPE_OVERLAY)
      {
         com.rockstargames.ui.game.GameGlobals.setGlobalFlag(com.rockstargames.ui.game.GameGlobals.CELEBRATION_SCREEN,com.rockstargames.gtav.Multiplayer.MP_CELEBRATION.BACKGROUND_READY);
      }
   }
   function SET_GFX_TYPE(type)
   {
      switch(type)
      {
         case this.TYPE_BG:
            return this.TYPE_BG;
         case this.TYPE_FG:
            return this.TYPE_FG;
         case this.TYPE_OVERLAY:
            return this.TYPE_OVERLAY;
         case this.TYPE_STANDARD:
         default:
            return this.TYPE_STANDARD;
      }
   }
   function SET_CUSTOM_SOUND(id, sound, soundSet)
   {
      switch(id)
      {
         case 0:
            this.screenSwipeSound = sound;
            this.screenSwipeSoundSet = soundSet;
            break;
         case 1:
            this.statsScreenSound = sound;
            this.statsScreenSoundSet = soundSet;
            break;
         case 2:
            this.screenFlashSound = sound;
            this.screenFlashSoundSet = soundSet;
            break;
         case 3:
            this.finishedPlaceSound = sound;
            this.finishedPlaceSoundSet = soundSet;
            break;
         case 4:
            this.rankUpSound = sound;
            this.rankUpSoundSet = soundSet;
            break;
         case 5:
            this.numberTurnSound = sound;
            this.numberTurnSoundSet = soundSet;
            break;
         case 6:
            this.numberTurnStopSound = sound;
            this.numberTurnStopSoundSet = soundSet;
            break;
         case 7:
            this.screenStartSound = sound;
            this.screenStartSoundSet = soundSet;
            break;
         case 8:
            this.winnerSound = sound;
            this.winnerSoundSet = soundSet;
            break;
         case 9:
            this.numberCountSound = sound;
            this.numberCountSoundSet = soundSet;
            break;
         case 10:
            break;
         default:
            return;
      }
      this.numberCountStopSound = sound;
      this.numberCountStopSoundSet = soundSet;
   }
   function CREATE_STAT_WALL(id, colourName, fgAlpha)
   {
      if(this.CONTENT[id])
      {
         MovieClip(this.CONTENT[id]).removeMovieClip();
      }
      if(fgAlpha)
      {
         this.defaultFgAlpha = fgAlpha;
      }
      var _loc3_ = this.CONTENT.createEmptyMovieClip(id,this.CONTENT.getNextHighestDepth());
      var _loc12_ = _loc3_.createEmptyMovieClip("bg",_loc3_.getNextHighestDepth());
      var _loc5_ = [];
      var _loc4_ = [];
      var _loc6_ = {mcName:id,currentHeight:0,bgColour:colourName,tweens:_loc5_,tweensToRemove:_loc4_};
      this.wallList.push(_loc6_);
   }
   function ADD_BREAKPOINT(wallId)
   {
      var _loc3_ = this.getObjectFromMcName(wallId);
      var _loc2_ = _loc3_.tweens;
      _loc2_.push("breakpoint");
   }
   function RESUME_FROM_BREAKPOINT(wallId)
   {
      this.doNextAnimation(wallId,false);
   }
   function SET_PAUSE_DURATION(duration)
   {
      this.pauseDuration = duration;
   }
   function SHOW_STAT_WALL(wallId)
   {
      var _loc5_ = this.getMovieClipFromName(wallId);
      var _loc4_ = this.getObjectFromMcName(wallId);
      var _loc12_ = _loc4_.tweens;
      var _loc6_ = _loc4_.tweensToRemove;
      var _loc2_ = [];
      _loc2_.push({method:"delayCall",mc:_loc5_._parent,duration:this.pauseDuration * 0.85,noDelay:true,tweenerObject:{onComplete:this.playSound,onCompleteScope:this,onCompleteArgs:[this.screenSwipeSound,this.screenSwipeSoundSet]}});
      this.addAnimationsToWall(wallId,this.dispConf.screenHeight + this.bgTopHeight + this.bgBottomHeight,100,_loc2_);
      this.doNextAnimation(wallId,true);
      if(this.celebrationGfxType == this.TYPE_OVERLAY)
      {
         com.rockstargames.ui.game.GameGlobals.setGlobalFlag(com.rockstargames.ui.game.GameGlobals.CELEBRATION_SCREEN,com.rockstargames.gtav.Multiplayer.MP_CELEBRATION.BACKGROUND_START_TWEEN_IN);
      }
   }
   function PAUSE_BEFORE_PREVIOUS_LAYOUT(wallId, duration)
   {
      var _loc4_ = this.getObjectFromMcName(wallId);
      var _loc2_ = _loc4_.tweens;
      var _loc3_;
      if(_loc2_.length > 0)
      {
         _loc3_ = _loc2_.pop();
         if(!duration)
         {
            _loc3_.pauseBefore = true;
         }
         else
         {
            _loc3_.delay = duration;
         }
         _loc2_.push(_loc3_);
      }
   }
   function PAUSE(wallId, duration)
   {
      this.pauseNextDuration += duration;
   }
   function UNPAUSE(wallId)
   {
      this.doNextAnimation(wallId,true);
   }
   function OVERRIDE_PAUSES(wallId, ignore)
   {
      if(!ignore)
      {
         ignore = true;
      }
      this.ignorePauses = ignore;
   }
   function GET_TOTAL_WALL_DURATION()
   {
      return this.totalDurationMs;
   }
   function doNextAnimation(wallId, firstRun)
   {
      var _loc13_ = this.getObjectFromMcName(wallId);
      var _loc9_ = this.getMovieClipFromName(wallId);
      var _loc11_ = _loc13_.tweens;
      var _loc10_ = _loc13_.tweensToRemove;
      var _loc5_;
      var _loc12_;
      var _loc6_;
      var _loc7_;
      var _loc17_;
      var _loc19_;
      var _loc14_;
      var _loc16_;
      var _loc15_;
      var _loc18_;
      var _loc8_;
      var _loc4_;
      var _loc2_;
      var _loc3_;
      if(_loc11_.length > 0)
      {
         _loc5_ = _loc11_.shift();
         if(_loc5_ == "breakpoint")
         {
            _loc5_ = _loc11_[0];
            if(_loc5_ != undefined)
            {
               _loc5_.delay = 0;
               _loc5_.pauseNextDuration = 0;
            }
            return undefined;
         }
         if(_loc5_.pauseBefore && !this.ignorePauses)
         {
            _loc5_.pauseBefore = false;
            _loc11_.unshift(_loc5_);
            return undefined;
         }
         _loc12_ = _loc5_.duration;
         _loc6_ = _loc5_.delay + _loc5_.pauseNextDuration;
         _loc7_ = _loc5_.pauseNextDuration;
         _loc17_ = _loc5_.offsetY;
         _loc19_ = _loc5_.targetY;
         _loc14_ = _loc5_.soundName;
         _loc16_ = _loc5_.soundSet || "CELEBRATION_SOUNDSET";
         _loc15_ = Math.abs(_loc19_ + _loc17_);
         _loc18_ = _loc9_._y + _loc15_;
         if(firstRun)
         {
            _loc6_ = 0;
            com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc9_.bg,_loc12_,{_y:_loc13_.currentHeight * -1,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_IN,onCompleteScope:this,onComplete:this.backgroundTweenInComplete,onCompleteArgs:[_loc9_.bg]});
            this.playSound(this.screenSwipeSound,this.screenSwipeSoundSet);
            if(this.moneyMeshMask)
            {
               this.moneyMeshMask._y = _loc9_._y + _loc9_.bg._y;
               com.rockstargames.ui.tweenStar.TweenStarLite.to(this.moneyMeshMask,_loc12_,{_y:this.moneyMeshMask._y + _loc15_ + 100,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_IN});
            }
         }
         else
         {
            if(_loc14_)
            {
               this.playSound(_loc14_,_loc16_);
            }
            else
            {
               this.playSound(this.statsScreenSound,this.statsScreenSoundSet);
            }
            if(this.celebrationGfxType == this.TYPE_OVERLAY)
            {
               com.rockstargames.ui.game.GameGlobals.setGlobalFlag(com.rockstargames.ui.game.GameGlobals.CELEBRATION_SCREEN,com.rockstargames.gtav.Multiplayer.MP_CELEBRATION.MISSION_RESULT_SHOWN);
            }
         }
         com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc9_,_loc12_,{_y:_loc18_,onComplete:this.syncBeforeNextAnimation,onCompleteScope:this,onCompleteArgs:[wallId],delay:_loc6_,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_IN});
         if(_loc11_.length == 0)
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT.moneyMesh,_loc12_,{_alpha:0,delay:_loc6_,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_IN});
            if(this.celebrationGfxType == this.TYPE_OVERLAY)
            {
               com.rockstargames.ui.game.GameGlobals.setGlobalFlag(com.rockstargames.ui.game.GameGlobals.CELEBRATION_SCREEN,com.rockstargames.gtav.Multiplayer.MP_CELEBRATION.BACKGROUND_START_TWEEN_OUT);
               com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(_loc9_.bg,_loc12_ + _loc6_,{onCompleteScope:this,onComplete:this.backgroundTweenOutComplete});
            }
            else if(this.celebrationGfxType == this.TYPE_BG && this.verticalFlagTextureId != -1)
            {
               this.drawFinalVerticalFlag(_loc9_.bg,_loc13_);
            }
         }
         if(_loc5_.childAnims && this.celebrationGfxType != this.TYPE_BG)
         {
            _loc8_ = _loc5_.childAnims;
            _loc4_ = 0;
            while(_loc4_ < _loc8_.length)
            {
               _loc2_ = _loc8_[_loc4_];
               _loc3_ = _loc2_.tweenerObject;
               _loc10_.push(_loc2_.mc);
               switch(_loc2_.method)
               {
                  case "to":
                     if(!_loc3_.delay)
                     {
                        _loc3_.delay = 0;
                     }
                     if(!_loc2_.noDelay)
                     {
                        _loc3_.delay += this.slamDuration + _loc6_;
                     }
                     else
                     {
                        _loc3_.delay += _loc7_;
                     }
                     com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2_.mc,_loc2_.duration,_loc3_);
                     break;
                  case "delayCall":
                     if(!_loc2_.noDelay)
                     {
                        _loc2_.duration = this.slamDuration + _loc6_;
                     }
                     else
                     {
                        _loc2_.duration += _loc7_;
                     }
                     com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(_loc2_.mc,_loc2_.duration,_loc3_);
               }
               _loc4_ = _loc4_ + 1;
            }
         }
      }
      else
      {
         _loc10_.push(_loc9_);
      }
   }
   function drawFinalVerticalFlag(bg, wallObject)
   {
      var _loc7_ = {x:0,y:this.CONTENT.flagTexture._y};
      this.CONTENT.localToGlobal(_loc7_);
      bg.globalToLocal(_loc7_);
      this.CONTENT.flagTexture.removeMovieClip();
      var _loc2_ = bg.createEmptyMovieClip("flagTexture",bg.getNextHighestDepth());
      _loc2_._y = _loc7_.y;
      var _loc3_;
      if(this.verticalFlagTextureId == 4)
      {
         _loc3_ = flash.display.BitmapData.loadBitmap("VERTICAL_RACE_FLAG");
      }
      else if(this.verticalFlagTextureId == 5)
      {
         _loc3_ = flash.display.BitmapData.loadBitmap("TRANSFORM_RACE_FLAG");
      }
      else if(this.verticalFlagTextureId == 7)
      {
         _loc3_ = flash.display.BitmapData.loadBitmap("VERTICAL_GRID");
      }
      else if(this.verticalFlagTextureId == 9)
      {
         _loc3_ = flash.display.BitmapData.loadBitmap("VERTICAL_TARGET_ASSAULT");
      }
      else if(this.verticalFlagTextureId == 11)
      {
         _loc3_ = flash.display.BitmapData.loadBitmap("VERTICAL_REMIX_1");
      }
      else if(this.verticalFlagTextureId == 13)
      {
         _loc3_ = flash.display.BitmapData.loadBitmap("VERTICAL_REMIX_2");
      }
      else if(this.verticalFlagTextureId == 15)
      {
         _loc3_ = flash.display.BitmapData.loadBitmap("VERTICAL_REMIX_3");
      }
      else if(this.verticalFlagTextureId == 17)
      {
         _loc3_ = flash.display.BitmapData.loadBitmap("VERTICAL_REMIX_4");
      }
      else if(this.verticalFlagTextureId == 19)
      {
         _loc3_ = flash.display.BitmapData.loadBitmap("VERTICAL_REMIX_5");
      }
      else if(this.verticalFlagTextureId == 21)
      {
         _loc3_ = flash.display.BitmapData.loadBitmap("VERTICAL_BANNER_ARENA_WARS");
      }
      var _loc6_ = new flash.geom.Matrix();
      var _loc14_ = - this.bgTopHeight - this.bgBottomHeight;
      var _loc5_ = 0;
      var _loc4_ = - _loc7_.y;
      var _loc8_ = _loc3_.width;
      var _loc10_ = _loc14_ * _loc3_.width / this.dispConf.screenWidth - _loc7_.y;
      var _loc13_ = _loc5_;
      var _loc9_ = _loc4_ + _loc3_.height;
      var _loc12_ = _loc8_;
      var _loc11_ = _loc9_;
      _loc6_.translate(0,this.verticalFlagLeftY);
      _loc2_.beginBitmapFill(_loc3_,_loc6_,false);
      _loc2_.moveTo(_loc5_,_loc4_);
      _loc2_.lineTo(_loc8_,_loc10_);
      _loc2_.lineTo(_loc12_,_loc11_);
      _loc2_.lineTo(_loc13_,_loc9_);
      _loc2_.lineTo(_loc5_,_loc4_);
      _loc2_.endFill();
      _loc8_ = this.dispConf.screenWidth;
      _loc10_ = _loc14_ - _loc7_.y;
      _loc5_ = _loc8_ - _loc3_.width;
      _loc4_ = _loc10_ - _loc14_ * _loc3_.width / this.dispConf.screenWidth;
      _loc13_ = _loc5_;
      _loc9_ = _loc4_ + _loc3_.height;
      _loc12_ = _loc8_;
      _loc11_ = _loc9_;
      _loc6_.identity();
      _loc6_.rotate(3.141592653589793);
      _loc6_.translate(this.dispConf.screenWidth,this.verticalFlagRightY + _loc3_.height);
      _loc2_.beginBitmapFill(_loc3_,_loc6_,false);
      _loc2_.moveTo(_loc5_,_loc4_);
      _loc2_.lineTo(_loc8_,_loc10_);
      _loc2_.lineTo(_loc12_,_loc11_);
      _loc2_.lineTo(_loc13_,_loc9_);
      _loc2_.lineTo(_loc5_,_loc4_);
      _loc2_.endFill();
   }
   function syncBeforeNextAnimation(wallId)
   {
      this.syncPointReached(this.createDelegate(this,this.doNextAnimation,wallId));
   }
   function backgroundTweenInComplete(bg)
   {
      if(this.celebrationGfxType == this.TYPE_OVERLAY)
      {
         com.rockstargames.ui.game.GameGlobals.setGlobalFlag(com.rockstargames.ui.game.GameGlobals.CELEBRATION_SCREEN,com.rockstargames.gtav.Multiplayer.MP_CELEBRATION.BACKGROUND_FINISH_TWEEN_IN);
      }
      else if(this.celebrationGfxType == this.TYPE_BG && this.verticalFlagTextureId != -1)
      {
         this.drawStaticVerticalFlag(bg);
      }
   }
   function drawStaticVerticalFlag(bg)
   {
      var _loc11_ = {x:0,y:bg.flagTexture._y};
      bg.localToGlobal(_loc11_);
      this.CONTENT.globalToLocal(_loc11_);
      bg.flagTexture.removeMovieClip();
      var _loc2_ = this.CONTENT.createEmptyMovieClip("flagTexture",this.CONTENT.getNextHighestDepth());
      _loc2_._y = _loc11_.y;
      if(!this.isWideScreen)
      {
         _loc2_._x = 160;
      }
      var _loc5_;
      if(this.verticalFlagTextureId == 4)
      {
         _loc5_ = flash.display.BitmapData.loadBitmap("VERTICAL_RACE_FLAG");
      }
      else if(this.verticalFlagTextureId == 5)
      {
         _loc5_ = flash.display.BitmapData.loadBitmap("TRANSFORM_RACE_FLAG");
      }
      else if(this.verticalFlagTextureId == 7)
      {
         _loc5_ = flash.display.BitmapData.loadBitmap("VERTICAL_GRID");
      }
      else if(this.verticalFlagTextureId == 9)
      {
         _loc5_ = flash.display.BitmapData.loadBitmap("VERTICAL_TARGET_ASSAULT");
      }
      else if(this.verticalFlagTextureId == 11)
      {
         _loc5_ = flash.display.BitmapData.loadBitmap("VERTICAL_REMIX_1");
      }
      else if(this.verticalFlagTextureId == 13)
      {
         _loc5_ = flash.display.BitmapData.loadBitmap("VERTICAL_REMIX_2");
      }
      else if(this.verticalFlagTextureId == 15)
      {
         _loc5_ = flash.display.BitmapData.loadBitmap("VERTICAL_REMIX_3");
      }
      else if(this.verticalFlagTextureId == 17)
      {
         _loc5_ = flash.display.BitmapData.loadBitmap("VERTICAL_REMIX_4");
      }
      else if(this.verticalFlagTextureId == 19)
      {
         _loc5_ = flash.display.BitmapData.loadBitmap("VERTICAL_REMIX_5");
      }
      else if(this.verticalFlagTextureId == 21)
      {
         _loc5_ = flash.display.BitmapData.loadBitmap("VERTICAL_BANNER_ARENA_WARS");
      }
      var _loc6_ = new flash.geom.Matrix();
      var _loc4_ = 0;
      var _loc3_ = this.verticalFlagLeftY;
      var _loc7_ = _loc5_.width;
      var _loc9_ = _loc3_;
      var _loc13_ = _loc4_;
      var _loc8_ = _loc3_ + _loc5_.height;
      var _loc12_ = _loc7_;
      var _loc10_ = _loc8_;
      _loc6_.translate(_loc4_,_loc3_);
      _loc2_.beginBitmapFill(_loc5_,_loc6_,false);
      _loc2_.moveTo(_loc4_,_loc3_);
      _loc2_.lineTo(_loc7_,_loc9_);
      _loc2_.lineTo(_loc12_,_loc10_);
      _loc2_.lineTo(_loc13_,_loc8_);
      _loc2_.lineTo(_loc4_,_loc3_);
      _loc2_.endFill();
      _loc7_ = this.dispConf.screenWidth;
      _loc9_ = this.verticalFlagRightY;
      _loc4_ = _loc7_ - _loc5_.width;
      _loc3_ = _loc9_;
      _loc13_ = _loc4_;
      _loc8_ = _loc3_ + _loc5_.height;
      _loc12_ = _loc7_;
      _loc10_ = _loc8_;
      _loc6_.identity();
      _loc6_.rotate(3.141592653589793);
      _loc6_.translate(_loc4_ + _loc5_.width,_loc3_ + _loc5_.height);
      _loc2_.beginBitmapFill(_loc5_,_loc6_,false);
      _loc2_.moveTo(_loc4_,_loc3_);
      _loc2_.lineTo(_loc7_,_loc9_);
      _loc2_.lineTo(_loc12_,_loc10_);
      _loc2_.lineTo(_loc13_,_loc8_);
      _loc2_.lineTo(_loc4_,_loc3_);
      _loc2_.endFill();
   }
   function backgroundTweenOutComplete()
   {
      if(this.celebrationGfxType == this.TYPE_OVERLAY)
      {
         com.rockstargames.ui.game.GameGlobals.setGlobalFlag(com.rockstargames.ui.game.GameGlobals.CELEBRATION_SCREEN,com.rockstargames.gtav.Multiplayer.MP_CELEBRATION.BACKGROUND_FINISH_TWEEN_OUT);
      }
   }
   function SHOW_FLASH(inDuration, holdDuration, outDuration, colourName)
   {
      if(!inDuration)
      {
         inDuration = 0.25;
      }
      if(!holdDuration)
      {
         holdDuration = 0.15;
      }
      if(!outDuration)
      {
         outDuration = 0.25;
      }
      if(!colourName)
      {
         colourName = "HUD_COLOUR_WHITE";
      }
      if(this.CONTENT.flashMc)
      {
         MovieClip(this.CONTENT.flashMc).removeMovieClip();
      }
      var _loc2_ = this.CONTENT.createEmptyMovieClip("flashMc",this.CONTENT.getNextHighestDepth());
      _loc2_.beginFill(this.getColour(colourName));
      _loc2_.moveTo(0,0);
      _loc2_.lineTo(1280,0);
      _loc2_.lineTo(1280,720);
      _loc2_.lineTo(0,720);
      _loc2_.lineTo(0,0);
      _loc2_.endFill();
      _loc2_._alpha = 0;
      this.playSound(this.screenFlashSound,this.screenFlashSoundSet);
      com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2_,inDuration,{_alpha:100,onComplete:this.fadeAndRemoveMc,onCompleteScope:this,onCompleteArgs:[_loc2_,outDuration,holdDuration],ease:com.rockstargames.ui.tweenStar.Ease.LINEAR});
   }
   function fadeAndRemoveMc(mc, duration, delay)
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.to(mc,duration,{_alpha:0,delay:delay,onComplete:this.removeMovieClip,onCompleteScope:mc,ease:com.rockstargames.ui.tweenStar.Ease.LINEAR});
   }
   function CLEANUP(wallId)
   {
      var _loc5_ = this.getObjectFromMcName(wallId);
      var _loc6_ = this.getMovieClipFromName(wallId);
      var _loc4_ = _loc5_.tweensToRemove;
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < _loc4_.length)
      {
         _loc3_ = _loc4_[_loc2_];
         if(_loc3_ != null)
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(_loc3_);
         }
         _loc2_ = _loc2_ + 1;
      }
      _loc6_.removeMovieClip();
      _loc5_ = {};
      this.wallList = [];
      false;
      false;
      delete this.numberCountMC.onEnterFrame;
   }
   function ADD_BACKGROUND_TO_WALL(wallId, alpha, textureId)
   {
      if(isNaN(alpha))
      {
         alpha = this.defaultBgAlpha;
      }
      var _loc3_ = this.getObjectFromMcName(wallId);
      var _loc18_ = this.getMovieClipFromName(wallId);
      var _loc4_ = _loc18_.bg;
      _loc4_._y = (_loc3_.currentHeight + this.bgBottomHeight) * -1;
      var _loc24_ = this.getColour(_loc3_.bgColour);
      var _loc6_ = _loc4_.createEmptyMovieClip("bg_fill",_loc4_.getNextHighestDepth());
      _loc6_.beginFill(_loc24_,alpha);
      _loc6_.moveTo(0,0);
      _loc6_.lineTo(this.dispConf.screenWidth,- (this.bgTopHeight + this.bgBottomHeight));
      _loc6_.lineTo(this.dispConf.screenWidth,_loc3_.currentHeight);
      _loc6_.lineTo(0,_loc3_.currentHeight + this.bgBottomHeight);
      _loc6_.lineTo(0,0);
      _loc6_.endFill();
      this.CONTENT.moneyMesh.removeMovieClip();
      this.moneyMeshMask.removeMovieClip();
      this.verticalFlagTextureId = -1;
      var _loc5_;
      var _loc19_;
      var _loc11_;
      var _loc15_;
      var _loc7_;
      var _loc13_;
      var _loc14_;
      var _loc17_;
      var _loc9_;
      var _loc8_;
      var _loc23_;
      var _loc22_;
      var _loc16_;
      var _loc12_;
      var _loc21_;
      var _loc20_;
      var _loc10_;
      if(textureId == 1 || textureId == 3 || textureId == 6 || textureId == 8 || textureId == 10 || textureId == 12 || textureId == 14 || textureId == 16 || textureId == 18 || textureId == 20)
      {
         _loc5_ = _loc4_.createEmptyMovieClip("shardTextureMC",_loc4_.getNextHighestDepth());
         if(textureId == 1)
         {
            _loc19_ = "shard_texture";
         }
         else if(textureId == 3)
         {
            _loc19_ = "SHARD_RACE_FLAG";
         }
         else if(textureId == 6)
         {
            _loc19_ = "SHARD_GRID";
         }
         else if(textureId == 8)
         {
            _loc19_ = "SHARD_TARGET_ASSAULT";
         }
         else if(textureId == 10)
         {
            _loc19_ = "SHARD_REMIX_1";
         }
         else if(textureId == 12)
         {
            _loc19_ = "SHARD_REMIX_2";
         }
         else if(textureId == 14)
         {
            _loc19_ = "SHARD_REMIX_3";
         }
         else if(textureId == 16)
         {
            _loc19_ = "SHARD_REMIX_4";
         }
         else if(textureId == 18)
         {
            _loc19_ = "SHARD_REMIX_5";
         }
         else if(textureId == 20)
         {
            _loc19_ = "SHARD_ARENA_WARS";
         }
         _loc11_ = flash.display.BitmapData.loadBitmap(_loc19_);
         _loc15_ = new flash.geom.Matrix();
         _loc7_ = this.dispConf.screenWidth;
         _loc13_ = - (this.bgTopHeight + this.bgBottomHeight);
         _loc14_ = _loc3_.currentHeight + this.bgBottomHeight;
         _loc17_ = _loc3_.currentHeight;
         _loc9_ = _loc7_ - _loc11_.width;
         _loc8_ = _loc9_ * _loc13_ / _loc7_;
         _loc23_ = _loc7_;
         _loc22_ = _loc13_;
         _loc16_ = _loc9_;
         _loc12_ = _loc14_ - _loc16_ * (_loc14_ - _loc17_) / _loc7_;
         if(_loc12_ - _loc8_ > _loc11_.height)
         {
            _loc12_ = _loc8_ + _loc11_.height;
         }
         _loc21_ = _loc7_;
         _loc20_ = _loc17_;
         _loc15_.translate(_loc9_,_loc8_);
         _loc5_.beginBitmapFill(_loc11_,_loc15_,false);
         _loc5_.moveTo(_loc9_,_loc8_);
         _loc5_.lineTo(_loc23_,_loc22_);
         _loc5_.lineTo(_loc21_,_loc20_);
         _loc5_.lineTo(_loc16_,_loc12_);
         _loc5_.lineTo(_loc9_,_loc8_);
         _loc5_.endFill();
      }
      else if(textureId == 2)
      {
         _loc10_ = this.CONTENT.attachMovie("vertical_money_mesh","moneyMesh",this.CONTENT.getNextHighestDepth());
         com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc10_,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREENLIGHT);
         _loc10_._alpha = 40;
         _loc10_.right._x = this.dispConf.screenWidth;
         _loc10_.swapDepths(0);
         this.moneyMeshMask = this.CONTENT.createEmptyMovieClip("texture_mask_fill",this.CONTENT.getNextHighestDepth());
         this.moneyMeshMask.beginFill(0,100);
         this.moneyMeshMask.moveTo(0,0);
         this.moneyMeshMask.lineTo(this.dispConf.screenWidth,- (this.bgTopHeight + this.bgBottomHeight));
         this.moneyMeshMask.lineTo(this.dispConf.screenWidth,_loc3_.currentHeight);
         this.moneyMeshMask.lineTo(0,_loc3_.currentHeight + this.bgBottomHeight);
         this.moneyMeshMask.lineTo(0,0);
         this.moneyMeshMask.endFill();
         _loc10_.setMask(this.moneyMeshMask);
      }
      else if(textureId == 4 || textureId == 5 || textureId == 7 || textureId == 9 || textureId == 11 || textureId == 13 || textureId == 15 || textureId == 17 || textureId == 19 || _loc5_ == 21)
      {
         if(this.celebrationGfxType == this.TYPE_BG)
         {
            this.verticalFlagTextureId = textureId;
            this.drawStartingVerticalFlag(_loc4_,_loc3_);
         }
      }
      if(!this.isWideScreen)
      {
         _loc4_._x += 160;
      }
      if(this.celebrationGfxType == this.TYPE_FG || this.celebrationGfxType == this.TYPE_OVERLAY)
      {
         _loc4_._visible = false;
      }
   }
   function drawStartingVerticalFlag(mc, wallObject)
   {
      var _loc2_ = mc.createEmptyMovieClip("flagTexture",mc.getNextHighestDepth());
      var _loc3_;
      if(this.verticalFlagTextureId == 4)
      {
         _loc3_ = flash.display.BitmapData.loadBitmap("VERTICAL_RACE_FLAG");
      }
      else if(this.verticalFlagTextureId == 5)
      {
         _loc3_ = flash.display.BitmapData.loadBitmap("TRANSFORM_RACE_FLAG");
      }
      else if(this.verticalFlagTextureId == 7)
      {
         _loc3_ = flash.display.BitmapData.loadBitmap("VERTICAL_GRID");
      }
      else if(this.verticalFlagTextureId == 9)
      {
         _loc3_ = flash.display.BitmapData.loadBitmap("VERTICAL_TARGET_ASSAULT");
      }
      else if(this.verticalFlagTextureId == 11)
      {
         _loc3_ = flash.display.BitmapData.loadBitmap("VERTICAL_REMIX_1");
      }
      else if(this.verticalFlagTextureId == 13)
      {
         _loc3_ = flash.display.BitmapData.loadBitmap("VERTICAL_REMIX_2");
      }
      else if(this.verticalFlagTextureId == 15)
      {
         _loc3_ = flash.display.BitmapData.loadBitmap("VERTICAL_REMIX_3");
      }
      else if(this.verticalFlagTextureId == 17)
      {
         _loc3_ = flash.display.BitmapData.loadBitmap("VERTICAL_REMIX_4");
      }
      else if(this.verticalFlagTextureId == 19)
      {
         _loc3_ = flash.display.BitmapData.loadBitmap("VERTICAL_REMIX_5");
      }
      else if(this.verticalFlagTextureId == 21)
      {
         _loc3_ = flash.display.BitmapData.loadBitmap("VERTICAL_BANNER_ARENA_WARS");
      }
      var _loc6_ = new flash.geom.Matrix();
      var _loc8_ = this.dispConf.screenWidth;
      var _loc16_ = - (this.bgTopHeight + this.bgBottomHeight);
      var _loc14_ = wallObject.currentHeight + this.bgBottomHeight;
      var _loc13_ = wallObject.currentHeight;
      var _loc10_ = _loc8_ - _loc3_.width;
      var _loc7_ = this.bgBottomHeight * _loc3_.width / _loc8_ + _loc13_;
      var _loc12_ = _loc8_;
      var _loc11_ = Math.max(_loc16_,Math.max(_loc7_,_loc13_) - _loc3_.height);
      var _loc5_ = _loc10_;
      var _loc4_ = _loc11_;
      var _loc15_ = _loc12_;
      var _loc9_ = _loc13_;
      this.verticalFlagRightY = _loc4_;
      _loc6_.rotate(3.141592653589793);
      _loc6_.translate(_loc5_ + _loc3_.width,_loc4_ + _loc3_.height);
      _loc2_.beginBitmapFill(_loc3_,_loc6_,false);
      _loc2_.moveTo(_loc5_,_loc4_);
      _loc2_.lineTo(_loc12_,_loc11_);
      _loc2_.lineTo(_loc15_,_loc9_);
      _loc2_.lineTo(_loc10_,_loc7_);
      _loc2_.lineTo(_loc5_,_loc4_);
      _loc2_.endFill();
      _loc10_ = 0;
      _loc7_ = _loc14_;
      _loc15_ = _loc3_.width;
      _loc9_ = (_loc13_ - _loc14_) * _loc3_.width / _loc8_ + _loc14_;
      _loc5_ = 0;
      _loc4_ = Math.max(0,Math.max(_loc7_,_loc9_) - _loc3_.height);
      _loc12_ = _loc3_.width;
      _loc11_ = _loc4_;
      this.verticalFlagLeftY = _loc4_;
      _loc6_.identity();
      _loc6_.translate(_loc5_,_loc4_);
      _loc2_.beginBitmapFill(_loc3_,_loc6_,false);
      _loc2_.moveTo(_loc5_,_loc4_);
      _loc2_.lineTo(_loc12_,_loc11_);
      _loc2_.lineTo(_loc15_,_loc9_);
      _loc2_.lineTo(_loc10_,_loc7_);
      _loc2_.lineTo(_loc5_,_loc4_);
      _loc2_.endFill();
   }
   function ADD_SCORE_TO_WALL(wallId, textLabel, score)
   {
      this.ADD_POSITION_TO_WALL(wallId,score,textLabel,false,true);
   }
   function getAvailableTextWidth(tf, belowText, rightToLeft, limit)
   {
      var _loc9_ = this.descendersPricedown;
      if(!belowText)
      {
         _loc9_ = this.ascendersPricedown;
      }
      var _loc7_ = 0;
      var _loc3_ = String(tf.text).split("");
      if(rightToLeft)
      {
         _loc3_.reverse();
      }
      if(!limit)
      {
         limit = _loc3_.length;
      }
      var _loc6_ = "";
      var _loc4_ = tf._parent.createTextField("dummyPos",tf._parent.getNextHighestDepth(),tf._x,tf._y,tf._width,tf._height);
      var _loc11_ = tf.getNewTextFormat();
      _loc4_.setNewTextFormat(_loc11_);
      _loc4_.autoSize = "left";
      _loc4_._visible = false;
      var _loc2_ = 0;
      while(_loc2_ < limit)
      {
         if(this.stringInArray(_loc9_.split(""),_loc3_[_loc2_]))
         {
            break;
         }
         _loc4_.text += _loc3_[_loc2_];
         _loc7_ = _loc4_.textWidth;
         if(_loc2_ < limit - 1)
         {
            _loc6_ = String(_loc3_[_loc2_ + 1]).toLowerCase();
         }
         _loc2_ = _loc2_ + 1;
      }
      if(_loc4_.textWidth >= tf.textWidth)
      {
         _loc7_ = 10000;
         _loc6_ = "";
      }
      if(_loc6_ != "")
      {
         _loc4_.text = _loc6_;
         if(_loc6_ == "d" && !belowText && !rightToLeft)
         {
            _loc7_ += _loc4_.textWidth * 0.53;
         }
         else if(_loc6_ == "q" && belowText && !rightToLeft)
         {
            _loc7_ += _loc4_.textWidth * 0.53;
         }
      }
      _loc4_.removeTextField();
      return _loc7_;
   }
   function ADD_POSITION_TO_WALL(wallId, position, positionLabel, isPositionLabelRawText, isScore)
   {
      var _loc10_ = this.positionId;
      if(this.dispConf.isAsian)
      {
         _loc10_ = this.positionId + "_asian";
      }
      if(!positionLabel && !isNaN(position))
      {
         positionLabel = "CELEB_YOU_FINISHED";
      }
      var _loc2_ = this.createLayoutMc(wallId,this.positionId);
      if(positionLabel)
      {
         if(!isPositionLabelRawText)
         {
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_.finishedText,positionLabel,0,false);
         }
         else
         {
            _loc2_.finishedText.text = positionLabel;
         }
      }
      if(!isNaN(position))
      {
         if(!isScore)
         {
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_.positionText,"CELEB_POSITION_" + position,0,false);
         }
         else
         {
            _loc2_.positionText.text = String(position);
         }
      }
      else
      {
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_.positionText,"CELEB_POSITION_DNF",0,false);
      }
      this.processTextField(_loc2_.finishedText,this.condensedTextFormat,{autoSize:"right"});
      this.processTextField(_loc2_.positionText,this.pricedownTextFormat,{autoSize:"left"});
      var _loc6_ = this.getAvailableTextWidth(_loc2_.positionText);
      if(isScore)
      {
         this.processTextField(_loc2_.finishedText,this.condensedTextFormat,{autoSize:"left"});
         TextField(_loc2_.finishedText)._x = TextField(_loc2_.positionText)._x + 15;
      }
      else
      {
         if(_loc6_ > _loc2_.positionText.textWidth)
         {
            _loc6_ = _loc2_.positionText.textWidth;
         }
         TextField(_loc2_.finishedText)._x = _loc6_ - (TextField(_loc2_.finishedText)._width + 9);
      }
      if(this.dispConf.isAsian)
      {
         _loc2_.positionText._y = TextField(_loc2_.finishedText)._height;
      }
      var _loc14_ = this.dispConf.screenWidth - this.safeLeft * 2;
      var _loc8_ = 720 - this.safeTop * 2;
      var _loc3_ = _loc2_._height;
      var _loc11_ = this.getAvailableTextWidth(_loc2_.finishedText,true);
      if(_loc11_ >= _loc2_.positionText.textWidth)
      {
         _loc3_ = 520;
      }
      _loc2_._xscale = _loc2_._yscale = _loc14_ / _loc2_._width * 100;
      if(_loc3_ * (_loc2_._xscale / 100) > _loc8_)
      {
         _loc2_._xscale = _loc2_._yscale = _loc8_ / _loc3_ * 100;
      }
      var _loc5_ = 720;
      var _loc12_ = _loc5_ / 2 - _loc3_ * (_loc2_._xscale / 100) / 2;
      this.addMcToWall(wallId,_loc2_,_loc5_,_loc12_,this.ALIGN_CENTER,0);
      var _loc4_ = [];
      _loc4_.push({method:"to",mc:_loc2_.finishedText,duration:this.slamDuration,tweenerObject:{_alpha:0,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_IN,delay:this.pauseDuration}});
      _loc4_.push({method:"delayCall",mc:_loc2_.positionText,duration:0,tweenerObject:{onComplete:this.playSound,onCompleteScope:this,onCompleteArgs:[this.finishedPlaceSound,this.finishedPlaceSoundSet]}});
      this.addAnimationsToWall(wallId,0,_loc5_,_loc4_);
      this.processMcsForGfxType([_loc2_]);
   }
   function ADD_JOB_POINTS_TO_WALL(wallId, points, xAlign)
   {
      var _loc2_ = "+";
      if(points < 0)
      {
         _loc2_ = "-";
      }
      this.ADD_POINTS_TO_WALL(wallId,points,3,_loc2_,xAlign);
   }
   function ADD_ARENA_POINTS_TO_WALL(wallId, points, xAlign)
   {
      this.ADD_POINTS_TO_WALL(wallId,points,4,points >= 0 ? "+" : "-",xAlign);
   }
   function ADD_POINTS_TO_WALL(wallId, points, type, prefix, xAlign, marginTop, noAnims)
   {
      var _loc2_ = this.createLayoutMc(wallId,this.pointsId);
      _loc2_.icon.gotoAndStop(type);
      _loc2_.plusMinusText.text = prefix;
      _loc2_.pointsText.text = String(points);
      var _loc9_ = 60;
      if(!xAlign)
      {
         xAlign = this.ALIGN_LEFT;
      }
      if(!marginTop)
      {
         marginTop = 100;
      }
      this.processTextField(_loc2_.plusMinusText,null,{autoSize:"left"});
      this.processTextField(_loc2_.pointsText,null,{autoSize:"left"});
      TextField(_loc2_.pointsText)._x = TextField(_loc2_.plusMinusText)._x + TextField(_loc2_.plusMinusText).textWidth;
      var _loc5_ = _loc2_._height + marginTop - 60;
      this.addMcToWall(wallId,_loc2_,_loc5_,marginTop,xAlign,_loc9_);
      switch(this.celebrationGfxType)
      {
         case this.TYPE_BG:
         case this.TYPE_FG:
            _loc2_.icon._visible = false;
            this.processMcsForGfxType([_loc2_.pointsText,_loc2_.plusMinusText]);
            break;
         default:
            this.processMcsForGfxType([_loc2_.pointsText,_loc2_.plusMinusText]);
      }
      if(noAnims)
      {
         return _loc2_;
      }
      _loc2_.pointsText.text = "0";
      _loc2_._y -= marginTop;
      var _loc4_ = [];
      var _loc10_ = this.getObjectFromMcName(wallId);
      var _loc7_ = _loc10_.tweens;
      if(_loc7_.length > 0)
      {
         _loc4_.push({method:"to",mc:_loc2_,duration:this.slamDuration,noDelay:true,tweenerObject:{_y:_loc2_._y + marginTop,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_IN,delay:this.pauseDuration}});
      }
      else
      {
         _loc4_.push({method:"to",mc:_loc2_,duration:this.slamDuration,noDelay:true,tweenerObject:{_y:_loc2_._y + marginTop,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_IN,delay:0}});
      }
      _loc4_.push({method:"delayCall",mc:_loc2_.pointsText,duration:0.1,tweenerObject:{onComplete:this.doNumericTween,onCompleteScope:this,onCompleteArgs:[TextField(_loc2_.pointsText),0,points]}});
      this.addAnimationsToWall(wallId,0,_loc5_,_loc4_);
      return _loc2_;
   }
   function ADD_REP_POINTS_AND_RANK_BAR_TO_WALL(wallId, repPointsGained, startRepPoints, minRepPointsForRank, maxRepPointsForRank, currentRank, nextRank, rank1Txt, rank2Txt)
   {
      this.addPointsAndRankBarToWall(wallId,repPointsGained,startRepPoints,minRepPointsForRank,maxRepPointsForRank,currentRank,nextRank,rank1Txt,rank2Txt,2,1);
   }
   function addPointsAndRankBarToWall(wallId, repPointsGained, startRepPoints, minRepPointsForRank, maxRepPointsForRank, currentRank, nextRank, rank1Txt, rank2Txt, iconNum, rankBGIcon)
   {
      var _loc23_ = "+";
      if(repPointsGained < 0)
      {
         _loc23_ = "-";
      }
      var _loc18_ = 230;
      var _loc13_ = this.ADD_POINTS_TO_WALL(wallId,repPointsGained,iconNum,_loc23_,this.ALIGN_LEFT,_loc18_,true);
      _loc13_.pointsText.text = "0";
      var _loc10_ = [];
      var _loc33_ = this.getObjectFromMcName(wallId);
      var _loc26_ = _loc33_.tweens;
      _loc13_._y -= _loc18_;
      if(_loc26_.length > 0)
      {
         _loc10_.push({method:"to",mc:_loc13_,duration:this.slamDuration,noDelay:true,tweenerObject:{_y:_loc13_._y + _loc18_,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_IN,delay:this.pauseDuration}});
      }
      else
      {
         _loc10_.push({method:"to",mc:_loc13_,duration:this.slamDuration,noDelay:true,tweenerObject:{_y:_loc13_._y + _loc18_,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_IN,delay:0}});
      }
      var _loc2_ = this.createLayoutMc(wallId,this.rankBarId);
      _loc2_.currentRankIcon.gotoAndStop(rankBGIcon);
      _loc2_.nextRankIcon.gotoAndStop(rankBGIcon);
      _loc2_.rankup.globe.gotoAndStop(rankBGIcon);
      _loc2_.currentRankText.text = String(currentRank);
      _loc2_.nextRankText.text = String(nextRank);
      this.processTextField(_loc2_.currentRankText,null,{autoSize:"left"});
      this.processTextField(_loc2_.nextRankText,null,{autoSize:"left"});
      if(TextField(_loc2_.currentRankText).textWidth > _loc2_.currentRankIcon._width * 0.8)
      {
         _loc2_.currentRankText._xscale = _loc2_.currentRankText._yscale = _loc2_.currentRankIcon._width / _loc2_.currentRankText._width * 80;
      }
      if(TextField(_loc2_.nextRankText).textWidth > _loc2_.nextRankIcon._width * 0.8)
      {
         _loc2_.nextRankText._xscale = _loc2_.nextRankText._yscale = _loc2_.nextRankIcon._width / _loc2_.nextRankText._width * 80;
      }
      TextField(_loc2_.currentRankText)._x = _loc2_.currentRankIcon._x + _loc2_.currentRankIcon._width / 2 - TextField(_loc2_.currentRankText)._width / 2;
      TextField(_loc2_.nextRankText)._x = _loc2_.nextRankIcon._x + _loc2_.nextRankIcon._width / 2 - TextField(_loc2_.nextRankText)._width / 2;
      _loc2_.nextRankText._y = _loc2_.nextRankIcon._y + (_loc2_.nextRankIcon._height - _loc2_.nextRankText._height) / 2;
      _loc2_.currentRankText._y = _loc2_.currentRankIcon._y + (_loc2_.currentRankIcon._height - _loc2_.currentRankText._height) / 2;
      var _loc20_ = false;
      _loc2_.rankup._visible = false;
      var _loc22_ = maxRepPointsForRank - minRepPointsForRank;
      var _loc21_ = this.pauseDuration * 0.3;
      var _loc27_ = (startRepPoints - minRepPointsForRank) / _loc22_ * 100;
      var _loc24_ = (startRepPoints + repPointsGained - minRepPointsForRank) / _loc22_ * 100;
      if(startRepPoints + repPointsGained >= maxRepPointsForRank)
      {
         _loc20_ = true;
         _loc24_ = 100;
      }
      _loc10_.push({method:"delayCall",mc:_loc13_.pointsText,duration:0,tweenerObject:{onComplete:this.doNumericTween,onCompleteScope:this,onCompleteArgs:[TextField(_loc13_.pointsText),0,repPointsGained,_loc21_]}});
      _loc2_.rankBarFg._height = _loc2_.rankBarBg._height;
      _loc2_.rankBarFg._y = _loc2_.rankBarBg._y;
      var _loc17_ = 60;
      var _loc25_ = 200;
      var _loc15_;
      if(_loc20_)
      {
         _loc15_ = 270;
         _loc17_ = 100 + _loc15_;
         _loc25_ = 230;
         if(rank1Txt != undefined)
         {
            _loc2_.rankup.rankText.text = rank1Txt;
         }
         else
         {
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_.rankup.upText,"CELEB_RANK_UP_2",0,false);
         }
         if(rank2Txt != undefined)
         {
            _loc2_.rankup.upText.text = rank2Txt;
         }
         else
         {
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_.rankup.rankText,"CELEB_RANK_UP_1",0,false);
         }
         _loc2_.rankup.rankNumberMc.nextRankText.text = nextRank;
         this.processTextField(_loc2_.rankup.rankText,this.condensedTextFormat,{textAutoSize:"shrink"});
         this.processTextField(_loc2_.rankup.upText,this.pricedownTextFormat,{textAutoSize:"shrink"});
         this.processTextField(_loc2_.rankup.rankNumberMc.nextRankText,null,{autoSize:"center"});
         _loc2_.rankup.upText._y = 112;
         if(this.dispConf.isAsian)
         {
            _loc2_.rankup.rankText._y -= 30;
            _loc2_.rankup.upText._y -= 30;
         }
         if(_loc2_.rankup.rankNumberMc._width > _loc2_.rankup.globe._width * 0.8)
         {
            _loc2_.rankup.rankNumberMc._xscale = _loc2_.rankup.rankNumberMc._yscale = _loc2_.rankup.globe._width * 0.8 / _loc2_.rankup.rankNumberMc._width * 100;
            _loc2_.rankup.rankNumberMc._x = _loc2_.rankup.globe._x + _loc2_.rankup.globe._width / 2;
            _loc2_.rankup.rankNumberMc._y = _loc2_.rankup.globe._y + (_loc2_.rankup.globe._height - _loc2_.rankup.rankNumberMc._height) / 2;
         }
         _loc2_.rankup._y += _loc15_;
         _loc2_.currentRankText._y += _loc15_;
         _loc2_.currentRankIcon._y += _loc15_;
         _loc2_.nextRankText._y += _loc15_;
         _loc2_.nextRankIcon._y += _loc15_;
         _loc2_.rankBarFg._y += _loc15_;
         _loc2_.rankBarBg._y += _loc15_;
      }
      var _loc3_ = _loc27_;
      var _loc4_ = _loc24_ - _loc3_;
      var _loc8_ = _loc21_ / Math.ceil(_loc4_ / 10);
      var _loc11_ = 0;
      var _loc5_ = 0;
      var _loc6_;
      var _loc7_;
      var _loc12_;
      var _loc9_;
      while(_loc5_ < 10)
      {
         _loc6_ = _loc2_.rankBarFg["sect" + _loc5_];
         _loc6_._xscale = 0;
         if(_loc3_ <= 0)
         {
            _loc7_ = {method:"to",mc:_loc6_,duration:_loc8_};
            if(_loc4_ >= 10)
            {
               _loc7_.tweenerObject = {_width:26,delay:(_loc5_ - _loc11_) * _loc8_};
               _loc4_ -= 10;
            }
            else if(_loc4_ > 0)
            {
               _loc7_.tweenerObject = {_width:2.6 * _loc4_,delay:(_loc5_ - _loc11_) * _loc8_};
               _loc4_ = 0;
            }
            if(_loc7_.tweenerObject)
            {
               _loc10_.push(_loc7_);
            }
         }
         if(_loc3_ >= 10)
         {
            _loc6_._xscale = 100;
            _loc3_ -= 10;
         }
         else if(_loc3_ > 0)
         {
            _loc6_._width = 2.6 * _loc3_;
            _loc12_ = _loc4_ + _loc3_ <= 10 ? _loc4_ + _loc3_ : 10;
            _loc9_ = _loc12_ - _loc3_;
            _loc4_ -= _loc9_;
            _loc11_ = _loc5_ - 1;
            _loc10_.push({method:"to",mc:_loc6_,duration:_loc8_,tweenerObject:{_width:2.6 * (_loc9_ + _loc3_)}});
            _loc3_ = 0;
         }
         _loc5_ = _loc5_ + 1;
      }
      this.addMcToWall(wallId,_loc2_,_loc17_,_loc25_,this.ALIGN_CENTER,0);
      var _loc28_;
      if(_loc20_)
      {
         _loc10_.push({method:"delayCall",mc:_loc13_.rankBarBg,duration:0,tweenerObject:{delay:_loc21_,onComplete:this.showRankUp,onCompleteScope:this,onCompleteArgs:[_loc2_,currentRank,nextRank]}});
         this.addAnimationsToWall(wallId,0,_loc17_ - 35,_loc10_,0);
         _loc28_ = [{method:"delayCall",mc:_loc13_.finishedText,duration:0,tweenerObject:{onComplete:this.playSound,onCompleteScope:this,onCompleteArgs:[this.rankUpSound,this.rankUpSoundSet]}}];
         this.addAnimationsToWall(wallId,670,0,_loc28_,this.pauseDuration * 0.5,this.slamDuration * 1.5);
      }
      else
      {
         this.addAnimationsToWall(wallId,280,_loc17_,_loc10_,0);
      }
      switch(this.celebrationGfxType)
      {
         case this.TYPE_BG:
            this.processMcsForGfxType([_loc2_]);
            return;
         case this.TYPE_FG:
            _loc2_.currentRankIcon._visible = false;
            _loc2_.nextRankIcon._visible = false;
            _loc2_.rankBarBg._visible = false;
            _loc2_.rankBarFg._visible = false;
            _loc2_.rankup.glow._visible = false;
            this.processMcsForGfxType([_loc2_.rankup.rankText,_loc2_.rankup.upText]);
            return;
         default:
            _loc2_.rankBarBg._alpha = 30;
            this.processMcsForGfxType([_loc2_.rankup.rankText,_loc2_.rankup.upText]);
            return;
      }
   }
   function ADD_ARENA_POINTS_AND_RANK_BAR_TO_WALL(wallId, repPointsGained, startRepPoints, minRepPointsForRank, maxRepPointsForRank, currentRank, nextRank, rank1Txt, rank2Txt)
   {
      var _loc32_ = 4;
      var _loc25_ = 2;
      var _loc27_ = "+";
      if(repPointsGained < 0)
      {
         _loc27_ = "-";
      }
      var _loc20_ = 230;
      var _loc16_ = this.ADD_POINTS_TO_WALL(wallId,repPointsGained,_loc32_,_loc27_,this.ALIGN_LEFT,_loc20_,true);
      _loc16_.pointsText.text = "0";
      var _loc13_ = [];
      var _loc35_ = this.getObjectFromMcName(wallId);
      var _loc29_ = _loc35_.tweens;
      _loc16_._y -= _loc20_;
      if(_loc29_.length > 0)
      {
         _loc13_.push({method:"to",mc:_loc16_,duration:this.slamDuration,noDelay:true,tweenerObject:{_y:_loc16_._y + _loc20_,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_IN,delay:this.pauseDuration}});
      }
      else
      {
         _loc13_.push({method:"to",mc:_loc16_,duration:this.slamDuration,noDelay:true,tweenerObject:{_y:_loc16_._y + _loc20_,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_IN,delay:0}});
      }
      var _loc2_ = this.createLayoutMc(wallId,this.rankBarId);
      _loc2_.currentRankIcon.gotoAndStop(_loc25_);
      _loc2_.nextRankIcon.gotoAndStop(_loc25_);
      _loc2_.rankup.globe.gotoAndStop(_loc25_);
      _loc2_.currentRankText.text = String(currentRank);
      _loc2_.nextRankText.text = String(nextRank);
      this.processTextField(_loc2_.currentRankText,null,{autoSize:"left"});
      this.processTextField(_loc2_.nextRankText,null,{autoSize:"left"});
      if(TextField(_loc2_.currentRankText).textWidth > _loc2_.currentRankIcon._width * 0.8)
      {
         _loc2_.currentRankText._xscale = _loc2_.currentRankText._yscale = _loc2_.currentRankIcon._width / _loc2_.currentRankText._width * 80;
      }
      if(TextField(_loc2_.nextRankText).textWidth > _loc2_.nextRankIcon._width * 0.8)
      {
         _loc2_.nextRankText._xscale = _loc2_.nextRankText._yscale = _loc2_.nextRankIcon._width / _loc2_.nextRankText._width * 80;
      }
      TextField(_loc2_.currentRankText)._x = _loc2_.currentRankIcon._x + _loc2_.currentRankIcon._width / 2 - TextField(_loc2_.currentRankText)._width / 2;
      TextField(_loc2_.nextRankText)._x = _loc2_.nextRankIcon._x + _loc2_.nextRankIcon._width / 2 - TextField(_loc2_.nextRankText)._width / 2;
      _loc2_.nextRankText._y = _loc2_.nextRankIcon._y + (_loc2_.nextRankIcon._height - _loc2_.nextRankText._height) / 2;
      _loc2_.currentRankText._y = _loc2_.currentRankIcon._y + (_loc2_.currentRankIcon._height - _loc2_.currentRankText._height) / 2;
      var _loc22_ = false;
      _loc2_.rankup._visible = false;
      var _loc26_ = maxRepPointsForRank - minRepPointsForRank;
      var _loc24_ = this.pauseDuration * 0.3;
      var _loc12_ = (startRepPoints - minRepPointsForRank) / _loc26_;
      var _loc9_ = (startRepPoints + repPointsGained - minRepPointsForRank) / _loc26_;
      if(_loc12_ > _loc9_)
      {
         _loc12_ = _loc9_;
      }
      if(startRepPoints + repPointsGained >= maxRepPointsForRank)
      {
         _loc22_ = true;
         _loc9_ = 1;
      }
      _loc13_.push({method:"delayCall",mc:_loc16_.pointsText,duration:0,tweenerObject:{onComplete:this.doNumericTween,onCompleteScope:this,onCompleteArgs:[TextField(_loc16_.pointsText),0,repPointsGained,_loc24_]}});
      _loc2_.rankBarFg._height = _loc2_.rankBarBg._height;
      _loc2_.rankBarFg._y = _loc2_.rankBarBg._y;
      var _loc23_ = 60;
      var _loc28_ = 200;
      var _loc18_;
      if(_loc22_)
      {
         _loc18_ = 270;
         _loc23_ = 100 + _loc18_;
         _loc28_ = 230;
         if(rank1Txt != undefined)
         {
            _loc2_.rankup.rankText.text = rank1Txt;
         }
         else
         {
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_.rankup.upText,"CELEB_RANK_UP_2",0,false);
         }
         if(rank2Txt != undefined)
         {
            _loc2_.rankup.upText.text = rank2Txt;
         }
         else
         {
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_.rankup.rankText,"CELEB_RANK_UP_1",0,false);
         }
         _loc2_.rankup.rankNumberMc.nextRankText.text = nextRank;
         this.processTextField(_loc2_.rankup.rankText,this.condensedTextFormat,{textAutoSize:"shrink"});
         this.processTextField(_loc2_.rankup.upText,this.pricedownTextFormat,{textAutoSize:"shrink"});
         this.processTextField(_loc2_.rankup.rankNumberMc.nextRankText,null,{autoSize:"center"});
         _loc2_.rankup.upText._y = 112;
         if(this.dispConf.isAsian)
         {
            _loc2_.rankup.rankText._y -= 30;
            _loc2_.rankup.upText._y -= 30;
         }
         if(_loc2_.rankup.rankNumberMc._width > _loc2_.rankup.globe._width * 0.8)
         {
            _loc2_.rankup.rankNumberMc._xscale = _loc2_.rankup.rankNumberMc._yscale = _loc2_.rankup.globe._width * 0.8 / _loc2_.rankup.rankNumberMc._width * 100;
            _loc2_.rankup.rankNumberMc._x = _loc2_.rankup.globe._x + _loc2_.rankup.globe._width / 2;
            _loc2_.rankup.rankNumberMc._y = _loc2_.rankup.globe._y + (_loc2_.rankup.globe._height - _loc2_.rankup.rankNumberMc._height) / 2;
         }
         _loc2_.rankup._y += _loc18_;
         _loc2_.currentRankText._y += _loc18_;
         _loc2_.currentRankIcon._y += _loc18_;
         _loc2_.nextRankText._y += _loc18_;
         _loc2_.nextRankIcon._y += _loc18_;
         _loc2_.rankBarFg._y += _loc18_;
         _loc2_.rankBarBg._y += _loc18_;
      }
      var _loc14_ = _loc24_ / ((_loc9_ - _loc12_) * 10);
      var _loc15_ = 0;
      var _loc7_ = 10;
      var _loc8_ = 1 / _loc7_;
      var _loc4_ = 0;
      var _loc3_ = 0;
      var _loc6_ = _loc8_;
      var _loc5_;
      var _loc11_;
      var _loc10_;
      while(_loc4_ < _loc7_)
      {
         _loc5_ = _loc2_.rankBarFg["sect" + _loc4_];
         if(_loc3_ > _loc9_)
         {
            _loc5_._xscale = 0;
         }
         else if(_loc6_ > _loc12_)
         {
            _loc5_._xscale = 100 * Math.max(0,_loc7_ * (_loc12_ - _loc3_));
            _loc11_ = 100 * Math.min(1,_loc7_ * (_loc9_ - _loc3_));
            _loc10_ = {method:"to",mc:_loc5_,duration:_loc14_,tweenerObject:{_xscale:_loc11_,delay:_loc15_}};
            _loc15_ += _loc14_;
            _loc13_.push(_loc10_);
         }
         _loc4_++;
         _loc3_ += _loc8_;
         _loc6_ += _loc8_;
      }
      this.addMcToWall(wallId,_loc2_,_loc23_,_loc28_,this.ALIGN_CENTER,0);
      var _loc30_;
      if(_loc22_)
      {
         _loc13_.push({method:"delayCall",mc:_loc16_.rankBarBg,duration:0,tweenerObject:{delay:_loc24_,onComplete:this.showRankUp,onCompleteScope:this,onCompleteArgs:[_loc2_,currentRank,nextRank]}});
         this.addAnimationsToWall(wallId,0,_loc23_ - 35,_loc13_,0);
         _loc30_ = [{method:"delayCall",mc:_loc16_.finishedText,duration:0,tweenerObject:{onComplete:this.playSound,onCompleteScope:this,onCompleteArgs:[this.rankUpSound,this.rankUpSoundSet]}}];
         this.addAnimationsToWall(wallId,670,0,_loc30_,this.pauseDuration * 0.5,this.slamDuration * 1.5);
      }
      else
      {
         this.addAnimationsToWall(wallId,570,-100,_loc13_,0);
      }
      switch(this.celebrationGfxType)
      {
         case this.TYPE_BG:
            this.processMcsForGfxType([_loc2_]);
            return;
         case this.TYPE_FG:
            _loc2_.currentRankIcon._visible = false;
            _loc2_.nextRankIcon._visible = false;
            _loc2_.rankBarBg._visible = false;
            _loc2_.rankBarFg._visible = false;
            _loc2_.rankup.glow._visible = false;
            this.processMcsForGfxType([_loc2_.rankup.rankText,_loc2_.rankup.upText]);
            return;
         default:
            _loc2_.rankBarBg._alpha = 30;
            this.processMcsForGfxType([_loc2_.rankup.rankText,_loc2_.rankup.upText]);
            return;
      }
   }
   function showRankUp(layoutMc, currentRank, nextRank)
   {
      layoutMc.rankup._visible = true;
      layoutMc.rankup.rankNumberMc.nextRankText.text = String(currentRank);
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(layoutMc.rankup,this.pauseDuration * 0.45,{onComplete:this.playSound,onCompleteScope:this,onCompleteArgs:[this.numberTurnSound,this.numberTurnSoundSet]});
      com.rockstargames.ui.tweenStar.TweenStarLite.to(layoutMc.rankup.rankNumberMc,this.slamDuration * 0.8,{delay:this.pauseDuration * 0.5,_yrotation:90,onComplete:this.completeRankUpAnimation,onCompleteScope:this,onCompleteArgs:[layoutMc,nextRank]});
   }
   function completeRankUpAnimation(layoutMc, nextRank)
   {
      layoutMc.rankup.rankNumberMc._yrotation = 275;
      layoutMc.rankup.rankNumberMc.nextRankText.text = String(nextRank);
      com.rockstargames.ui.tweenStar.TweenStarLite.to(layoutMc.rankup.rankNumberMc,this.slamDuration * 0.8,{_yrotation:0,ease:com.rockstargames.ui.tweenStar.Ease.SINE_OUT,onComplete:this.completeRankUpAnimationGlobe,onCompleteScope:this,onCompleteArgs:[layoutMc,nextRank]});
   }
   function completeRankUpAnimationGlobe(layoutMc, nextRank)
   {
      if(layoutMc.rankup.globe._currentframe == 2)
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(layoutMc.rankup.globe,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PINK);
      }
      else if(nextRank >= 750)
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(layoutMc.rankup.globe,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GOLD);
      }
      else if(nextRank >= 500)
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(layoutMc.rankup.globe,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_SILVER);
      }
      else if(nextRank >= 100)
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(layoutMc.rankup.globe,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BRONZE);
      }
      else
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(layoutMc.rankup.globe,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE);
      }
      layoutMc.rankup.globe._x = 633.05;
      layoutMc.rankup.globe._y = -48.45;
      layoutMc.rankup.globe._width = layoutMc.rankup.globe._height = 497.9;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(layoutMc.rankup.globe,this.slamDuration * 2,{_y:-30,_x:652.5,_width:461,_height:461,ease:com.rockstargames.ui.tweenStar.Ease.SINE_OUT});
      var _loc7_ = layoutMc.rankup.rankNumberMc._x;
      var _loc5_ = layoutMc.rankup.rankNumberMc._y;
      var _loc4_ = layoutMc.rankup.rankNumberMc._width;
      var _loc3_ = layoutMc.rankup.rankNumberMc._height;
      layoutMc.rankup.rankNumberMc._y -= _loc3_ * 0.05;
      layoutMc.rankup.rankNumberMc._xscale = layoutMc.rankup.rankNumberMc._yscale = layoutMc.rankup.rankNumberMc._xscale + 10;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(layoutMc.rankup.rankNumberMc,this.slamDuration * 2,{_y:_loc5_,_width:_loc4_,_height:_loc3_,ease:com.rockstargames.ui.tweenStar.Ease.SINE_OUT});
      this.playSound(this.numberTurnStopSound,this.numberTurnStopSoundSet);
      layoutMc.rankup.gotoAndPlay(2);
   }
   function ADD_WINNER_TO_WALL(wallId, winLoseTextLabel, gamerName, crewName, betAmount, isInFlow, teamName, gamerNameIsLabel)
   {
      var _loc3_;
      if(gamerNameIsLabel)
      {
         _loc3_ = this.ADD_CHALLENGE_WINNER_TO_WALL(wallId,gamerName,winLoseTextLabel,crewName,null,betAmount,isInFlow,false,null,null,teamName);
      }
      else
      {
         _loc3_ = this.ADD_CHALLENGE_WINNER_TO_WALL(wallId,gamerName,winLoseTextLabel,crewName,null,betAmount,isInFlow,true,null,null,teamName);
      }
      if(crewName != undefined && crewName.length > 0)
      {
         _loc3_._y -= 12;
      }
   }
   function ADD_OBJECTIVE_TO_WALL(wallId, objectiveTitleLabel, objectiveText, isObjectiveTitleRawText)
   {
      var _loc5_ = this.winnerId;
      var _loc7_ = 155;
      var _loc4_ = 125 + _loc7_;
      var _loc6_ = -16;
      if(this.dispConf.isAsian)
      {
         _loc5_ = this.winnerId + "_asian";
         _loc6_ = 0;
      }
      var _loc2_ = this.createLayoutMc(wallId,_loc5_);
      if(!isObjectiveTitleRawText)
      {
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_.introText,objectiveTitleLabel,0,false);
      }
      else
      {
         _loc2_.introText.text = objectiveTitleLabel;
      }
      _loc2_.challengeNameText.text = objectiveText;
      this.processTextField(_loc2_.challengeNameText,this.condensedTextFormat,{autoSize:"left"});
      this.processTextField(_loc2_.introText,this.condensedTextFormat,{autoSize:"left"});
      _loc2_.challengeNameText._y = _loc2_.introText.textHeight + _loc6_;
      this.addMcToWall(wallId,_loc2_,_loc4_,_loc7_,this.ALIGN_LEFT);
      var _loc3_ = [];
      _loc3_.push({method:"to",mc:_loc2_,duration:this.slamDuration,tweenerObject:{_y:_loc2_._y + 20,delay:this.pauseDuration * 2 + this.slamDuration}});
      this.addAnimationsToWall(wallId,0,_loc4_,_loc3_);
      this.processMcsForGfxType([_loc2_]);
   }
   function ADD_ARENA_UNLOCK_TO_WALL(wallId, objectiveTitleLabel, objectiveText, isObjectiveTitleRawText)
   {
      var _loc3_ = "unlock";
      var _loc7_ = 0;
      var _loc6_ = 175;
      var _loc4_ = -16;
      if(this.dispConf.isAsian)
      {
         _loc3_ = "unlock_asian";
         _loc4_ = 0;
      }
      var _loc2_ = this.createLayoutMc(wallId,_loc3_);
      if(!isObjectiveTitleRawText)
      {
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_.unlockTopText.label,objectiveTitleLabel,0,false);
      }
      else
      {
         _loc2_.unlockTopText.label.text = objectiveTitleLabel;
      }
      _loc2_.unlockBottomText.label.text = objectiveText;
      this.processTextField(_loc2_.unlockBottomText.label,this.condensedTextFormat,{autoSize:"left"});
      this.processTextField(_loc2_.unlockTopText.label,this.condensedTextFormat,{autoSize:"left"});
      _loc2_.unlockBottomText._y = _loc2_.unlockTopText.label.textHeight + _loc4_;
      this.addMcToWall(wallId,_loc2_,_loc6_,_loc7_,this.ALIGN_LEFT);
      var _loc13_ = [];
      _loc13_.push({method:"to",mc:_loc2_,duration:this.slamDuration,tweenerObject:{_y:_loc2_._y,delay:this.pauseDuration * 2 + this.slamDuration}});
      _loc13_.push({method:"to",mc:_loc2_.unlockTopText,duration:this.slamDuration,noDelay:true,tweenerObject:{_y:_loc2_.unlockTopText._y,delay:0.5 * this.slamDuration,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_IN}});
      _loc13_.push({method:"to",mc:_loc2_.unlockBottomText,duration:this.slamDuration,noDelay:true,tweenerObject:{_y:_loc2_.unlockBottomText._y,delay:0.5 * this.slamDuration,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_IN}});
      _loc2_.unlockTopText._y -= 250;
      _loc2_.unlockBottomText._y -= 250;
      var _loc9_ = this.getObjectFromMcName(wallId);
      var _loc5_ = {duration:0,targetY:0,offsetY:0,delay:0,pauseNextDuration:0,childAnims:_loc13_,pauseBefore:false,soundName:undefined,soundSet:undefined};
      _loc9_.tweens.push(_loc5_);
      this.processMcsForGfxType([_loc2_]);
      if(this.celebrationGfxType != this.TYPE_BG)
      {
         _loc2_._alpha = 100;
      }
   }
   function ADD_MISSION_RESULT_TO_WALL(wallId, missionTextLabel, passFailTextLabel, missionReasonString, isReasonRawText, isPassFailRawText, isMissionTextRawText, forcedAlpha, hudColourId)
   {
      if(isMissionTextRawText == undefined)
      {
         isMissionTextRawText = false;
      }
      var _loc3_ = this.ADD_CHALLENGE_WINNER_TO_WALL(wallId,missionTextLabel,passFailTextLabel,"",missionReasonString,null,true,isMissionTextRawText,true,isPassFailRawText);
      if(!isNaN(forcedAlpha))
      {
         if(this.celebrationGfxType != this.TYPE_BG && this.celebrationGfxType != this.TYPE_FG)
         {
            _loc3_._alpha = forcedAlpha;
         }
      }
      var _loc2_;
      var _loc6_;
      if(!isNaN(hudColourId))
      {
         if(this.celebrationGfxType == this.TYPE_OVERLAY)
         {
            _loc2_ = new com.rockstargames.ui.utils.HudColour();
            com.rockstargames.ui.utils.Colour.setHudColour(hudColourId,_loc2_);
            _loc6_ = !isNaN(forcedAlpha) ? forcedAlpha : 40;
            com.rockstargames.ui.utils.Colour.Colourise(_loc3_,_loc2_.r,_loc2_.g,_loc2_.b,_loc6_);
         }
         if(this.celebrationGfxType == this.TYPE_FG)
         {
            _loc3_._alpha = 0;
         }
      }
   }
   function ADD_TIME_TO_WALL(wallId, time, timeTitleLabel, timeDifference)
   {
      var _loc2_ = this.createLayoutMc(wallId,this.timeId);
      com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_.timeTitleText,timeTitleLabel,0,false);
      _loc2_.timeText.text = this.formatTimeMs(time);
      _loc2_.timeDiffText.text = this.formatTimeMs(timeDifference);
      this.processTextField(_loc2_.timeTitleText,this.condensedTextFormat,{autoSize:"left"});
      this.processTextField(_loc2_.timeText,null,{autoSize:"left"});
      this.processTextField(_loc2_.timeDiffText,null,{autoSize:"left"});
      TextField(_loc2_.timeDiffText)._x = TextField(_loc2_.timeText)._x + TextField(_loc2_.timeText)._width + 50;
      if(this.dispConf.isAsian)
      {
         _loc2_.timeTitleText._y -= 10;
      }
      var _loc4_ = 85;
      var _loc3_ = _loc2_._height + 50;
      this.addMcToWall(wallId,_loc2_,_loc3_,_loc4_,this.ALIGN_LEFT,0);
      this.addAnimationsToWall(wallId,0,_loc3_);
      this.processMcsForGfxType([_loc2_]);
   }
   function ADD_CHALLENGE_SET_TO_WALL(wallId, score, time, setTextLabel, challengeName, alpha)
   {
      var _loc4_ = this.challengeSetId;
      if(this.dispConf.isAsian)
      {
         _loc4_ = this.challengeSetId + "_asian";
      }
      var _loc2_ = this.createLayoutMc(wallId,_loc4_);
      com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_.setText,setTextLabel,0,false);
      _loc2_.challengeNameText.text = challengeName;
      if(score)
      {
         _loc2_.scoreText.text = String(score);
         if(!time)
         {
            TextField(_loc2_.scoreText)._xscale = TextField(_loc2_.scoreText)._yscale = 200;
            TextField(_loc2_.scoreText)._x -= 5;
            TextField(_loc2_.scoreText)._y -= 38;
         }
      }
      if(time)
      {
         _loc2_.timeText.text = this.formatTimeMs(time);
         if(!score)
         {
            TextField(_loc2_.timeText)._xscale = TextField(_loc2_.timeText)._yscale = 200;
            TextField(_loc2_.timeText)._y = _loc2_.scoreText._y - 53;
            TextField(_loc2_.timeText)._x -= 7;
            _loc2_.challengeNameText._y -= 22;
         }
      }
      this.processTextField(_loc2_.setText,this.condensedTextFormat,{autoSize:"left"});
      this.processTextField(_loc2_.timeText,null,{autoSize:"left"});
      this.processTextField(_loc2_.scoreText,null,{autoSize:"left"});
      this.processTextField(_loc2_.challengeNameText,this.scriptTextFormat,{autoSize:"left"});
      var _loc3_ = 720;
      var _loc8_ = _loc3_ / 2 - _loc2_._height / 2;
      this.addMcToWall(wallId,_loc2_,_loc3_,_loc8_,this.ALIGN_LEFT,0);
      var _loc6_ = [];
      this.addAnimationsToWall(wallId,0,_loc3_,_loc6_);
      this.processMcsForGfxType([_loc2_]);
      if(!isNaN(alpha))
      {
         if(this.celebrationGfxType != this.TYPE_BG && this.celebrationGfxType != this.TYPE_FG)
         {
            _loc2_._alpha = alpha;
         }
      }
   }
   function ADD_STAT_NUMERIC_TO_WALL(wallId, statLabel, statValue, xAlign, isRawText)
   {
      if(!xAlign)
      {
         xAlign = this.ALIGN_LEFT;
      }
      var _loc5_ = !this.dispConf.isAsian ? this.statNumericId : this.statNumericId + "_asian";
      var _loc2_ = this.createLayoutMc(wallId,_loc5_);
      if(!isRawText)
      {
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_.statNameText,statLabel,0,false);
      }
      else
      {
         _loc2_.statNameText.text = statLabel;
      }
      _loc2_.statValueText.text = String(statValue);
      this.processTextField(_loc2_.statValueText,null,{autoSize:"left"});
      this.processTextField(_loc2_.statNameText,this.condensedTextFormat,{autoSize:"left"});
      TextField(_loc2_.statValueText)._x = TextField(_loc2_.statNameText)._x + TextField(_loc2_.statNameText)._width + 30;
      var _loc6_ = 100;
      var _loc4_ = _loc2_._height + 50;
      this.addMcToWall(wallId,_loc2_,_loc4_,_loc6_,xAlign,60);
      _loc2_.statValueText.text = "0";
      var _loc3_ = [];
      _loc3_.push({method:"delayCall",mc:_loc2_.statValueText,duration:0.1,tweenerObject:{onComplete:this.doNumericTween,onCompleteScope:this,onCompleteArgs:[TextField(_loc2_.statValueText),0,statValue]}});
      this.addAnimationsToWall(wallId,0,_loc4_,_loc3_);
      this.processMcsForGfxType([_loc2_]);
   }
   function ADD_CASH_WON_TO_WALL(wallId, statLabel, statValue, potentialValue, xAlign, isRawText)
   {
      if(!xAlign)
      {
         xAlign = this.ALIGN_LEFT;
      }
      var _loc5_ = !this.dispConf.isAsian ? this.cashWonId : this.cashWonId + "_asian";
      var _loc2_ = this.createLayoutMc(wallId,_loc5_);
      if(!isRawText)
      {
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_.statNameText,statLabel,0,false);
      }
      else
      {
         _loc2_.statNameText.text = statLabel;
      }
      _loc2_.statValueText.text = String(statValue);
      this.processTextField(_loc2_.statValueText,this.pricedownTextFormat,{autoSize:"left"});
      this.processTextField(_loc2_.statNameText,this.condensedTextFormat,{autoSize:"left"});
      var _loc6_ = 250;
      var _loc4_ = 720;
      this.addMcToWall(wallId,_loc2_,_loc4_,_loc6_,xAlign,60);
      _loc2_.statValueText.text = potentialValue;
      var _loc3_ = [];
      _loc3_.push({method:"delayCall",mc:_loc2_.statValueText,duration:0.1,tweenerObject:{onComplete:this.doNumericTween,onCompleteScope:this,onCompleteArgs:[TextField(_loc2_.statValueText),potentialValue,statValue,this.pauseDuration * 0.4,1]}});
      this.addAnimationsToWall(wallId,0,_loc4_,_loc3_);
      this.processMcsForGfxType([_loc2_]);
   }
   function CREATE_INCREMENTAL_CASH_ANIMATION(wallId, animationId)
   {
      var _loc4_ = !this.dispConf.isAsian ? this.incrementalCashWonId : this.incrementalCashWonId + "_asian";
      var _loc2_ = this.createLayoutMc(wallId,_loc4_,animationId);
      this.processTextField(_loc2_.topText,this.condensedTextFormat,{autoSize:"left"});
      this.processTextField(_loc2_.bottomLine.bottomText,this.condensedTextFormat,{autoSize:"left"});
      this.processTextField(_loc2_.bottomLine.statText,this.condensedTextFormat,{autoSize:"right"});
      var _loc5_ = 250;
      var _loc3_ = 720;
      var _loc6_ = 60;
      this.addMcToWall(wallId,_loc2_,_loc3_,_loc5_,this.ALIGN_LEFT,_loc6_);
      this.processMcsForGfxType([_loc2_]);
      _loc2_.bottomLine._visible = false;
   }
   function ADD_INCREMENTAL_CASH_WON_STEP(wallId, animationId, startingValue, finishingValue, topText, bottomText, rightHandStat, rightHandIcon, hideDollarSymbol)
   {
      var _loc3_ = this.getMovieClipFromName(wallId);
      var _loc2_ = _loc3_[animationId];
      var _loc7_ = 720;
      if(_loc2_.steps == undefined)
      {
         _loc2_.steps = [];
      }
      _loc2_.steps.push({startingValue:startingValue,finishingValue:finishingValue,topText:topText,bottomText:bottomText,rightHandStat:rightHandStat,rightHandIcon:rightHandIcon,hideDollarSymbol:hideDollarSymbol === true});
      if(_loc2_.moneyText.text == "")
      {
         _loc2_.moneyText.text = startingValue.toString();
      }
   }
   function ADD_INCREMENTAL_CASH_ANIMATION_TO_WALL(wallId, animationId)
   {
      var _loc20_ = this.getMovieClipFromName(wallId);
      var _loc4_ = _loc20_[animationId];
      var _loc19_ = [];
      var _loc8_;
      var _loc3_ = 0;
      var _loc6_ = _loc4_.steps.length;
      var _loc5_;
      var _loc2_;
      var _loc7_;
      while(_loc3_ < _loc6_)
      {
         _loc5_ = _loc4_.getNextHighestDepth();
         _loc2_ = _loc4_.attachMovie("incremental_cash_cash","cash" + _loc5_,_loc5_,{_visible:false});
         if(_loc4_.steps[_loc3_].hideDollarSymbol)
         {
            _loc2_.moneyText._x = 2;
            _loc2_.dollarText._visible = false;
         }
         else
         {
            _loc2_.moneyText._x = 112;
            _loc2_.dollarText._visible = true;
         }
         this.processTextField(_loc2_.moneyText,this.pricedownTextFormat,{autoSize:"left"});
         _loc7_ = {method:"delayCall",mc:_loc2_,duration:0.1,tweenerObject:{delay:_loc3_ * (this.pauseDuration + 1),onComplete:this.incrementCashAnimation,onCompleteScope:this,onCompleteArgs:[_loc4_.steps[_loc3_],_loc4_,_loc2_,_loc8_]}};
         _loc19_.push(_loc7_);
         _loc8_ = _loc2_;
         _loc3_ = _loc3_ + 1;
      }
      var _loc21_ = 720;
      this.addAnimationsToWall(wallId,0,_loc21_,_loc19_);
   }
   function incrementCashAnimation(stepData, animation, cashMC, prevCashMC)
   {
      cashMC._visible = true;
      prevCashMC._visible = false;
      this.doNumericTween(cashMC.moneyText,stepData.startingValue,stepData.finishingValue,this.pauseDuration * 0.4,1);
      if(stepData.topText)
      {
         animation.topText.text = stepData.topText;
      }
      else
      {
         animation.topText.text = "";
      }
      if(stepData.bottomText)
      {
         animation.bottomLine.bottomText.text = stepData.bottomText;
      }
      else
      {
         animation.bottomLine.bottomText.text = "";
      }
      if(stepData.rightHandStat)
      {
         animation.bottomLine.statText.text = stepData.rightHandStat;
      }
      else
      {
         animation.bottomLine.statText.text = "";
      }
      animation.bottomLine.statIcon.gotoAndStop(3);
      animation.bottomLine.statIcon.gotoAndStop(stepData.rightHandIcon || 3);
      var _loc5_ = animation.bottomLine._y;
      var _loc4_ = {x:0,y:720};
      animation.globalToLocal(_loc4_);
      animation.bottomLine._y = _loc4_.y;
      animation.bottomLine._visible = true;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(animation.bottomLine,this.slamDuration,{_y:_loc5_,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_IN});
   }
   function ADD_WAVE_REACHED_TO_WALL(wallId, waveText, reachedLabel)
   {
      if(!reachedLabel)
      {
         reachedLabel = "CELEB_SURVIVED";
      }
      this.ADD_MISSION_RESULT_TO_WALL(wallId,reachedLabel,waveText,null,null,true);
   }
   function ADD_WORLD_RECORD_TO_WALL(wallId, time)
   {
      var _loc5_ = this.worldRecordId;
      if(this.dispConf.isAsian)
      {
         _loc5_ = this.worldRecordId + "_asian";
      }
      var _loc2_ = this.createLayoutMc(wallId,_loc5_);
      var _loc3_ = 38;
      var _loc6_ = 1;
      com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_.introText,"CELEB_YOU_SET_A",0,false);
      com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_.worldText,"CELEB_WORLD",0,false);
      com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_.recordText,"CELEB_RECORD",0,false);
      _loc2_.timeText.text = this.formatTimeMs(time);
      this.processTextField(_loc2_.introText,this.condensedTextFormat,{autoSize:"left"});
      this.processTextField(_loc2_.worldText,this.pricedownTextFormat,{autoSize:"left"});
      this.processTextField(_loc2_.recordText,this.pricedownTextFormat,{autoSize:"left"});
      this.processTextField(_loc2_.timeText,null,{autoSize:"left"});
      var _loc8_ = this.getAvailableTextWidth(_loc2_.worldText);
      var _loc12_ = this.getAvailableTextWidth(_loc2_.worldText,true);
      var _loc7_ = this.getAvailableTextWidth(_loc2_.recordText);
      var _loc10_ = this.getAvailableTextWidth(_loc2_.recordText,true);
      if(TextField(_loc2_.introText).textWidth > _loc8_)
      {
         _loc2_.worldText._y += _loc3_;
         _loc2_.recordText._y += _loc3_;
         _loc2_.timeText._y += _loc3_;
         _loc6_ += _loc3_;
      }
      if(_loc7_ < _loc12_ && _loc7_ < _loc2_.worldText.textWidth)
      {
         _loc2_.recordText._y += _loc3_;
         _loc2_.timeText._y += _loc3_;
         _loc6_ += _loc3_;
      }
      if(TextField(_loc2_.timeText).textWidth > _loc10_)
      {
         _loc2_.timeText._y += _loc3_;
      }
      if(this.dispConf.isAsian)
      {
         _loc2_.worldText._y -= 65;
         _loc2_.recordText._y -= 70;
      }
      var _loc4_ = 720;
      this.addMcToWall(wallId,_loc2_,_loc4_,(_loc4_ - _loc2_._height) / 2,this.ALIGN_CENTER,0);
      var _loc9_ = [];
      this.addAnimationsToWall(wallId,0,_loc4_,_loc9_);
      this.processMcsForGfxType([_loc2_]);
   }
   function ADD_TOURNAMENT_TO_WALL(wallId, playlistName, qualificationLabel, resultText, isResultTextRawText, resultValue)
   {
      var _loc2_ = this.createLayoutMc(wallId,this.tournamentId);
      _loc2_.playlistNameText.text = playlistName;
      com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_.qualificationText,qualificationLabel,0,false);
      if(isResultTextRawText)
      {
         _loc2_.resultText.text = resultText;
      }
      else
      {
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_.resultText,resultText,0,false);
      }
      this.processTextField(_loc2_.playlistNameText,this.scriptTextFormat,{autoSize:"left"});
      this.processTextField(_loc2_.qualificationText,this.condensedTextFormat,{autoSize:"left"});
      this.processTextField(_loc2_.resultText,this.condensedTextFormat,{autoSize:"left"});
      if(resultValue)
      {
         if(resultText == "CELEB_TOTAL_TIME")
         {
            TextField(_loc2_.resultValueText).text = " " + this.formatTimeMs(resultValue);
            this.processTextField(_loc2_.resultValueText,this.condensedTextFormat,{autoSize:"left"});
         }
         else
         {
            TextField(_loc2_.resultValueText).text = " " + String(resultValue);
            this.processTextField(_loc2_.resultValueText,this.pricedownTextFormat,{autoSize:"left"});
            _loc2_.resultValueText._y += 3;
         }
         TextField(_loc2_.resultValueText)._x = TextField(_loc2_.resultText).textWidth;
      }
      var _loc3_ = 720;
      var _loc5_ = _loc3_ - (_loc2_._height + 100);
      this.addMcToWall(wallId,_loc2_,_loc3_,_loc5_,this.ALIGN_LEFT,0);
      var _loc4_ = [];
      _loc4_.push({method:"to",mc:_loc2_.playlistNameText,duration:this.glideDuration,tweenerObject:{_x:_loc2_.playlistNameText._x + 50,ease:com.rockstargames.ui.tweenStar.Ease.LINEAR}});
      _loc4_.push({method:"delayCall",mc:_loc2_.resultText,duration:0,tweenerObject:{onComplete:this.playSound,onCompleteScope:this,onCompleteArgs:[this.screenStartSound,this.screenStartSoundSet]}});
      this.addAnimationsToWall(wallId,this.dispConf.screenHeight - _loc3_,_loc3_,_loc4_);
      switch(this.celebrationGfxType)
      {
         case this.TYPE_BG:
            this.processMcsForGfxType([_loc2_]);
            return;
         case this.TYPE_FG:
            this.processMcsForGfxType([_loc2_.qualificationText,_loc2_.resultText,_loc2_.resultValueText]);
            return;
         default:
            this.processMcsForGfxType([_loc2_.qualificationText,_loc2_.resultText,_loc2_.resultValueText]);
            return;
      }
   }
   function ADD_INTRO_TO_WALL(wallId, modeLabel, jobName, challengeTextLabel, challengePartsText, targetTypeTextLabel, targetValue, delay, targetValuePrefix, modeLabelIsStringLiteral, textColourName)
   {
      if(!delay)
      {
         delay = this.pauseDuration * 2.5;
      }
      var _loc2_ = this.createLayoutMc(wallId,this.introId);
      var _loc5_;
      var _loc3_;
      if(textColourName != undefined)
      {
         _loc5_ = this.getColour(textColourName);
         _loc3_ = _loc2_.modeText.getNewTextFormat();
         _loc3_.color = _loc5_;
         _loc2_.modeText.setNewTextFormat(_loc3_);
         _loc3_ = _loc2_.targetTypeText.getNewTextFormat();
         _loc3_.color = _loc5_;
         _loc2_.targetTypeText.setNewTextFormat(_loc3_);
         _loc3_ = _loc2_.targetText.getNewTextFormat();
         _loc3_.color = _loc5_;
         _loc2_.targetText.setNewTextFormat(_loc3_);
         _loc3_ = _loc2_.challengeText.getNewTextFormat();
         _loc3_.color = _loc5_;
         _loc2_.challengeText.setNewTextFormat(_loc3_);
         _loc3_ = _loc2_.challengePartText.getNewTextFormat();
         _loc3_.color = _loc5_;
         _loc2_.challengePartText.setNewTextFormat(_loc3_);
      }
      if(textColourName == undefined || this.celebrationGfxType != this.TYPE_FG)
      {
         if(modeLabelIsStringLiteral == true)
         {
            _loc2_.modeText.text = modeLabel.toUpperCase();
         }
         else
         {
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_.modeText,modeLabel,0,false);
            _loc2_.modeText.text = String(_loc2_.modeText.text).toUpperCase();
         }
      }
      _loc2_.jobNameText.text = jobName;
      var _loc7_;
      if(textColourName == undefined || this.celebrationGfxType != this.TYPE_FG)
      {
         if(challengeTextLabel)
         {
            _loc7_ = TextField(_loc2_.targetTypeText);
            if(targetTypeTextLabel && !isNaN(targetValue))
            {
               _loc7_ = TextField(_loc2_.challengeText);
               com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_.targetTypeText,targetTypeTextLabel,0,false);
               if(!targetValuePrefix)
               {
                  targetValuePrefix = "";
               }
               if(targetTypeTextLabel == "CELEB_TARGET_TIME")
               {
                  TextField(_loc2_.targetText).text = " " + targetValuePrefix + this.formatTimeMs(targetValue);
                  this.processTextField(_loc2_.targetText,this.condensedTextFormat,{autoSize:"left"});
               }
               else
               {
                  TextField(_loc2_.targetText).text = " " + targetValuePrefix + String(targetValue);
                  this.processTextField(_loc2_.targetText,this.condensedTextFormat,{autoSize:"left"});
               }
            }
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc7_,challengeTextLabel,0,false);
            if(_loc7_.text != "")
            {
               _loc7_.text += " ";
            }
            _loc7_.text += challengePartsText;
            this.processTextField(_loc2_.challengeText,this.condensedTextFormat,{autoSize:"left"});
            this.processTextField(_loc2_.targetTypeText,this.condensedTextFormat,{autoSize:"left"});
            this.processTextField(_loc2_.challengePartText,this.condensedTextFormat,{autoSize:"left"});
            TextField(_loc2_.challengePartText)._x = TextField(_loc2_.challengeText).textWidth;
            TextField(_loc2_.targetText)._x = TextField(_loc2_.targetTypeText).textWidth;
         }
      }
      this.processTextField(_loc2_.modeText,this.condensedTextFormat,{autoSize:"left"});
      _loc2_.modeText._y = -15;
      this.processTextField(_loc2_.jobNameText,this.scriptTextFormat,{autoSize:"left"});
      var _loc6_ = 10;
      var _loc4_ = 0.8 * _loc2_._height;
      this.bgTopHeight = -160;
      var _loc13_ = 0.04 * _loc2_.modeText.textWidth;
      _loc6_ += _loc13_;
      _loc4_ += _loc13_;
      if(challengeTextLabel && challengeTextLabel != "")
      {
         _loc6_ += 30;
         _loc4_ += 30;
         if(targetTypeTextLabel && targetValue)
         {
            _loc6_ += 30;
            _loc4_ += 30;
         }
      }
      if(challengeTextLabel == undefined && targetTypeTextLabel == undefined)
      {
         _loc6_ += 24;
      }
      this.addMcToWall(wallId,_loc2_,_loc4_,_loc6_,this.ALIGN_LEFT,0);
      var _loc8_ = [];
      _loc8_.push({method:"to",mc:_loc2_.jobNameText,duration:this.glideDuration,tweenerObject:{_x:_loc2_.jobNameText._x + 50,ease:com.rockstargames.ui.tweenStar.Ease.LINEAR}});
      _loc8_.push({method:"delayCall",mc:_loc2_.modeText,duration:0,tweenerObject:{onComplete:this.playSound,onCompleteScope:this,onCompleteArgs:[this.screenStartSound,this.screenStartSoundSet]}});
      this.addAnimationsToWall(wallId,this.dispConf.screenHeight - _loc4_,_loc4_,_loc8_,delay);
      switch(this.celebrationGfxType)
      {
         case this.TYPE_BG:
            this.processMcsForGfxType([_loc2_]);
            break;
         case this.TYPE_FG:
            _loc2_.jobNameText._visible = false;
            this.processMcsForGfxType([_loc2_.modeText,_loc2_.challengeText,_loc2_.targetTypeText,_loc2_.challengePartText,_loc2_.targetText]);
            break;
         default:
            _loc2_.jobNameText._alpha = 100;
            this.processMcsForGfxType([_loc2_.modeText,_loc2_.challengeText,_loc2_.targetTypeText,_loc2_.challengePartText,_loc2_.targetText]);
      }
      if(this.isWideScreen)
      {
         _loc2_._x += 40;
      }
      else
      {
         _loc2_._x -= 80;
      }
   }
   function ADD_READY_TO_WALL(wallId, readyLabel)
   {
      var _loc2_ = this.createLayoutMc(wallId,this.readyId);
      com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_.readyText,readyLabel,0,false);
      this.processTextField(_loc2_.readyText,this.pricedownTextFormat,{autoSize:"left",textColor:this.getColour("HUD_COLOUR_FREEMODE"),_alpha:100});
      var _loc3_ = 10;
      var _loc6_ = _loc2_.readyText.textHeight + _loc3_ + 720 * (1 - this.dispConf.safeBottom);
      this.addMcToWall(wallId,_loc2_,_loc6_,_loc3_,this.ALIGN_LEFT,0);
      var _loc5_ = [];
      _loc5_.push({method:"delayCall",mc:_loc2_.readyText,duration:0,tweenerObject:{onComplete:this.playSound,onCompleteScope:this,onCompleteArgs:[this.screenStartSound,this.screenStartSoundSet]}});
      this.addAnimationsToWall(wallId,720,0,[]);
      this.addAnimationsToWall(wallId,720,0,[],null,null,true);
      switch(this.celebrationGfxType)
      {
         case this.TYPE_BG:
         case this.TYPE_FG:
            _loc2_.readyText._visible = false;
            this.processMcsForGfxType([_loc2_.jobNameText,_loc2_.challengeText,_loc2_.targetTypeText,_loc2_.challengePartText,_loc2_.targetText]);
            return;
         default:
            this.processMcsForGfxType([_loc2_.jobNameText,_loc2_.challengeText,_loc2_.targetTypeText,_loc2_.challengePartText,_loc2_.targetText]);
            return;
      }
   }
   function ADD_CASH_TO_WALL(wallId, cashAmount, xAlign)
   {
      if(!cashAmount)
      {
         return undefined;
      }
      var _loc3_ = "+$";
      if(cashAmount < 0)
      {
         _loc3_ = "-$";
      }
      if(!xAlign)
      {
         xAlign = this.ALIGN_RIGHT;
      }
      this.ADD_POINTS_TO_WALL(wallId,cashAmount,1,_loc3_,xAlign);
   }
   function ADD_POST_UNLOCK_CASH_TO_WALL(wallId, cashAmount, xAlign)
   {
      var _loc9_ = cashAmount >= 0 ? "+$" : "-$";
      var _loc4_ = 0;
      var _loc2_ = this.createLayoutMc(wallId,this.pointsId);
      _loc2_.icon.gotoAndStop(1);
      _loc2_.plusMinusText.text = _loc9_;
      _loc2_.pointsText.text = String(cashAmount);
      var _loc11_ = 0;
      if(!xAlign)
      {
         xAlign = this.ALIGN_RIGHT;
      }
      this.processTextField(_loc2_.plusMinusText,null,{autoSize:"left"});
      this.processTextField(_loc2_.pointsText,null,{autoSize:"left"});
      TextField(_loc2_.pointsText)._x = TextField(_loc2_.plusMinusText)._x + TextField(_loc2_.plusMinusText).textWidth;
      var _loc5_ = _loc2_._height + _loc4_ + 55;
      this.addMcToWall(wallId,_loc2_,_loc5_,_loc4_,xAlign,_loc11_);
      switch(this.celebrationGfxType)
      {
         case this.TYPE_BG:
         case this.TYPE_FG:
            _loc2_.icon._visible = false;
            this.processMcsForGfxType([_loc2_.pointsText,_loc2_.plusMinusText]);
            break;
         default:
            this.processMcsForGfxType([_loc2_.pointsText,_loc2_.plusMinusText]);
      }
      _loc2_.pointsText.text = "0";
      _loc2_._y -= _loc4_;
      var _loc3_ = [];
      var _loc12_ = this.getObjectFromMcName(wallId);
      var _loc7_ = _loc12_.tweens;
      if(_loc7_.length > 0)
      {
         _loc3_.push({method:"to",mc:_loc2_,duration:this.slamDuration,noDelay:true,tweenerObject:{_y:_loc2_._y,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_IN,delay:this.pauseDuration}});
      }
      else
      {
         _loc3_.push({method:"to",mc:_loc2_,duration:this.slamDuration,noDelay:true,tweenerObject:{_y:_loc2_._y,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_IN,delay:0}});
      }
      _loc3_.push({method:"delayCall",mc:_loc2_.pointsText,duration:0.1,tweenerObject:{onComplete:this.doNumericTween,onCompleteScope:this,onCompleteArgs:[TextField(_loc2_.pointsText),0,cashAmount]}});
      this.addAnimationsToWall(wallId,0,_loc5_,_loc3_);
      _loc2_._y -= 200;
      return _loc2_;
   }
   function ADD_CHALLENGE_PART_TO_WALL(wallId, winLoseTextLabel, challengePartsText)
   {
      var _loc2_ = this.createLayoutMc(wallId,this.challengePartId);
      com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_.winLoseText,winLoseTextLabel,0,false);
      TextField(_loc2_.challengePartText).text = challengePartsText;
      this.processTextField(_loc2_.winLoseText,this.pricedownTextFormat,{autoSize:"left"});
      this.processTextField(_loc2_.challengePartText,this.condensedTextFormat,{autoSize:"left"});
      var _loc6_ = this.getAvailableTextWidth(_loc2_.winLoseText,true);
      if(_loc6_ < _loc2_.challengePartText.textWidth && !this.dispConf.isAsian)
      {
         _loc2_.challengePartText._y += 40;
      }
      if(this.dispConf.isAsian)
      {
         _loc2_.challengePartText._y += 60;
      }
      var _loc4_ = 110;
      var _loc3_ = _loc2_._height + _loc4_;
      this.addMcToWall(wallId,_loc2_,_loc3_,_loc4_,this.ALIGN_LEFT);
      var _loc5_ = [];
      this.addAnimationsToWall(wallId,0,_loc3_,_loc5_);
      this.processMcsForGfxType([_loc2_]);
   }
   function CREATE_STAT_TABLE(wallId, tableId)
   {
      var _loc2_ = this.createLayoutMc(wallId,this.statTableId,tableId);
      var _loc3_ = [];
      _loc2_.tableChildAnims = _loc3_;
   }
   function ADD_STAT_TO_TABLE(wallId, tableId, statText, statValue, isStatTextRawText, isStatValueRawText, isTotalRow, isStatValueTime, colour)
   {
      var _loc10_ = this.getMovieClipFromName(wallId);
      var _loc9_ = _loc10_[tableId];
      var _loc5_ = _loc9_.getNextHighestDepth();
      var _loc11_ = _loc9_._height;
      var _loc4_ = this.statRowId;
      var _loc6_ = 24;
      var _loc13_ = 75;
      if(isTotalRow)
      {
         _loc4_ = this.statNumericId;
         _loc6_ = 48;
         _loc13_ = 150;
      }
      if(this.dispConf.isAsian)
      {
         _loc4_ = this.statNumericId + "_asian";
         _loc6_ = 0;
      }
      var _loc2_ = _loc9_.attachMovie(_loc4_,this.statRowId + "_" + _loc5_,_loc5_);
      if(!isStatTextRawText)
      {
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_.statNameText,statText,0,false);
      }
      else
      {
         _loc2_.statNameText.text = statText;
      }
      if(!isStatValueRawText)
      {
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_.statValueText,statValue,0,false);
      }
      else
      {
         if(!isNaN(statValue) && isStatValueTime)
         {
            statValue = this.formatTimeMs(Number(statValue));
         }
         _loc2_.statValueText.text = statValue;
      }
      var _loc3_;
      var _loc7_;
      if(colour)
      {
         _loc3_ = new com.rockstargames.ui.utils.HudColour();
         _loc7_ = com.rockstargames.ui.utils.HudColour[colour];
         if(isNaN(_loc7_))
         {
            _loc7_ = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE;
         }
         com.rockstargames.ui.utils.Colour.setHudColour(_loc7_,_loc3_);
         com.rockstargames.ui.utils.Colour.Colourise(_loc2_.statValueText,_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
      }
      var _loc12_ = this.condensedTextFormat;
      _loc12_.align = "left";
      this.processTextField(_loc2_.statNameText,this.condensedTextFormat,{autoSize:"right"});
      if(!this.dispConf.isAsian)
      {
         this.processTextField(_loc2_.statValueText,this.condensedTextFormat,{autoSize:"left"});
      }
      else
      {
         this.processTextField(_loc2_.statValueText,null,{autoSize:"left"});
      }
      if(_loc5_ > 0)
      {
         _loc2_._y = _loc11_ - _loc6_;
      }
      _loc2_.statValueText._x = 20;
      _loc2_.statNameText._x = _loc2_.statNameText.textWidth * -1;
   }
   function ADD_STAT_TABLE_TO_WALL(wallId, tableId)
   {
      var _loc19_ = this.getMovieClipFromName(wallId);
      var _loc2_ = _loc19_[tableId];
      var _loc18_;
      var _loc3_;
      var _loc4_;
      var _loc5_;
      var _loc17_;
      if(_loc2_)
      {
         _loc18_ = 720;
         _loc3_ = [];
         _loc4_ = 0;
         _loc5_ = 0;
         for(var _loc16_ in _loc2_)
         {
            if(typeof _loc2_[_loc16_] == "movieclip")
            {
               if(_loc2_[_loc16_].statNameText.textWidth > _loc5_)
               {
                  _loc5_ = _loc2_[_loc16_].statNameText.textWidth;
               }
            }
         }
         for(_loc16_ in _loc2_)
         {
            if(typeof _loc2_[_loc16_] == "movieclip")
            {
               _loc2_[_loc16_].statNameText._x += _loc5_;
               _loc2_[_loc16_].statValueText._x = _loc2_[_loc16_].statNameText._x + _loc2_[_loc16_].statNameText.textWidth + 20;
               if(_loc4_ == 0)
               {
                  _loc3_.push({method:"delayCall",mc:_loc2_[_loc16_].statValueText,duration:0,tweenerObject:{onComplete:this.playSound,onCompleteScope:this,onCompleteArgs:[this.numberCountStopSound,this.numberCountStopSoundSet]}});
                  _loc3_.push({method:"delayCall",mc:_loc2_[_loc16_],duration:0,tweenerObject:{onComplete:this.doNumericTween,onCompleteScope:this,onCompleteArgs:[TextField(_loc2_[_loc16_].statValueText),0,Number(TextField(_loc2_[_loc16_].statValueText).text),this.slamDuration]}});
               }
               else
               {
                  _loc2_[_loc16_]._y -= 520;
                  _loc3_.push({method:"to",mc:_loc2_[_loc16_],duration:this.slamDuration * 1.5,tweenerObject:{_y:_loc2_[_loc16_]._y + 520,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_IN,delay:this.slamDuration * _loc4_,onComplete:this.playSound,onCompleteScope:this,onCompleteArgs:[this.numberCountStopSound,this.numberCountStopSoundSet]}});
               }
               _loc4_ = _loc4_ + 1;
            }
         }
         _loc17_ = 120;
         if(_loc4_ > 6)
         {
            _loc17_ = 70;
         }
         this.addMcToWall(wallId,_loc2_,_loc18_,_loc17_,this.ALIGN_RIGHT,60);
         this.addAnimationsToWall(wallId,0,_loc18_,_loc3_);
         this.processMcsForGfxType([_loc2_]);
      }
   }
   function ADD_CHALLENGE_WINNER_TO_WALL(wallId, challengeTextLabel, winLoseTextLabel, crewName, challengeName, cashAmount, isInFlow, isWinner, isMission, isWinLoseTextLabelRawText, teamName)
   {
      if(!isInFlow)
      {
         isInFlow = false;
      }
      var _loc15_ = this.winnerId;
      if(this.dispConf.isAsian)
      {
         _loc15_ = this.winnerId + "_asian";
      }
      var _loc2_ = this.createLayoutMc(wallId,_loc15_);
      if(isWinLoseTextLabelRawText)
      {
         TextField(_loc2_.winLoseText).text = winLoseTextLabel;
      }
      else
      {
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_.winLoseText,winLoseTextLabel,0,false);
      }
      if(challengeTextLabel && challengeTextLabel != "")
      {
         if(isWinner)
         {
            TextField(_loc2_.introText).text = challengeTextLabel;
         }
         else
         {
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_.introText,challengeTextLabel,0,false);
         }
      }
      if(challengeName)
      {
         _loc2_.challengeNameText.text = challengeName;
      }
      if(crewName)
      {
         _loc2_.crewNameText.htmlText = crewName;
      }
      if(teamName)
      {
         _loc2_.teamNameText.htmlText = teamName;
      }
      if(cashAmount)
      {
         if(cashAmount < 0)
         {
            _loc2_.dollarText.text = " -$";
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_.cashText,"CELEB_BET_LOSSES",0,false);
         }
         else
         {
            _loc2_.dollarText.text = " +$";
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_.cashText,"CELEB_BET_WINS",0,false);
         }
         if(!isWinner)
         {
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2_.cashText,"CELEB_CASH",0,false);
         }
         _loc2_.cashAmountText.text = String(Math.abs(cashAmount));
      }
      this.processTextField(_loc2_.cashText,this.condensedTextFormat,{autoSize:"left"});
      this.processTextField(_loc2_.teamNameText,this.condensedTextFormat,{autoSize:"left"});
      this.processTextField(_loc2_.cashAmountText,null,{autoSize:"left"});
      this.processTextField(_loc2_.dollarText,null,{autoSize:"left"});
      if(!isMission)
      {
         this.processTextField(_loc2_.challengeNameText,this.scriptTextFormat,{textAutoSize:"shrink"});
      }
      else
      {
         this.processTextField(_loc2_.challengeNameText,this.condensedTextFormat,{autoSize:"left"});
      }
      this.processTextField(_loc2_.crewNameText,this.condensedTextFormat,{autoSize:"right"});
      this.processTextField(_loc2_.winLoseText,this.pricedownTextFormat,{autoSize:"left"});
      this.processTextField(_loc2_.introText,this.condensedTextFormat,{autoSize:"left"});
      this.doCentralisedTextLayout(_loc2_.winLoseText,[_loc2_.introText],[_loc2_.cashText,_loc2_.dollarText,_loc2_.cashAmountText],[_loc2_.challengeNameText,_loc2_.teamNameText],[_loc2_.crewNameText]);
      _loc2_.teamNameText._x = _loc2_.challengeNameText._x;
      if(challengeName && challengeName != "" && (teamName && teamName != ""))
      {
         this.toggleVisibility([_loc2_.challengeNameText,_loc2_.teamNameText]);
      }
      var _loc7_ = 720;
      var _loc6_ = 1;
      var _loc4_ = _loc2_._height + _loc2_.crewNameText.textHeight * 0.12;
      var _loc18_ = this.dispConf.screenWidth - this.safeLeft * 2;
      if(_loc2_._width > _loc18_)
      {
         _loc6_ = _loc18_ / _loc2_._width;
         _loc4_ *= _loc6_;
      }
      var _loc17_ = 720 * this.dispConf.safeBottom - _loc4_;
      var _loc16_ = _loc4_ - _loc2_.cashText.textHeight * 1.3 * _loc6_;
      if(isMission)
      {
         if(String(challengeTextLabel) == "")
         {
            _loc4_ -= 75 * _loc6_;
         }
         if(String(challengeName) == "" && String(crewName) == "")
         {
            _loc4_ -= 65 * _loc6_;
         }
         _loc17_ = _loc7_ / 2 - _loc4_ / 2;
      }
      if(!isInFlow)
      {
         TextField(_loc2_.cashAmountText)._y -= 800;
         TextField(_loc2_.dollarText)._y -= 800;
         TextField(_loc2_.cashText)._y -= 800;
      }
      this.addMcToWall(wallId,_loc2_,_loc7_,_loc17_,this.ALIGN_CENTER,0);
      var _loc19_ = this.getMovieClipFromName(wallId);
      var _loc21_ = _loc19_.bg;
      var _loc3_ = [];
      var _loc12_ = this.screenStartSound;
      var _loc9_ = this.screenStartSoundSet;
      if(isWinner)
      {
         _loc12_ = this.winnerSound;
         _loc9_ = this.winnerSoundSet;
      }
      if(cashAmount)
      {
         _loc2_.cashAmountText.text = "0";
         _loc3_.push({method:"to",mc:_loc2_.cashAmountText,duration:this.slamDuration,tweenerObject:{_y:0,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_IN,onComplete:this.doNumericTween,onCompleteScope:this,onCompleteArgs:[TextField(_loc2_.cashAmountText),0,Math.abs(cashAmount)]}});
      }
      if(!isInFlow && cashAmount)
      {
         _loc3_.push({method:"to",mc:_loc2_.cashText,duration:this.slamDuration * 0.5,tweenerObject:{_y:0,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_IN}});
         _loc3_.push({method:"to",mc:_loc2_.dollarText,duration:this.slamDuration * 0.5,tweenerObject:{_y:0,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_IN}});
         _loc3_.push({method:"to",mc:_loc2_.winLoseText,duration:this.slamDuration,tweenerObject:{_y:_loc2_.winLoseText._y + 200,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_IN}});
         _loc3_.push({method:"to",mc:_loc21_,duration:this.slamDuration,tweenerObject:{_y:(_loc16_ + 120) * -1,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_IN,onCompleteScope:this,onComplete:this.backgroundTweenOutComplete}});
      }
      var _loc23_;
      if(!isInFlow)
      {
         _loc23_ = [{method:"delayCall",mc:_loc2_.crewNameText,duration:0,tweenerObject:{onComplete:this.playSound,onCompleteScope:this,onCompleteArgs:[_loc12_,_loc9_]}}];
         this.addAnimationsToWall(wallId,0,_loc7_,_loc23_);
         if(cashAmount)
         {
            this.addAnimationsToWall(wallId,_loc16_,0,_loc3_,this.pauseDuration);
         }
      }
      else
      {
         _loc3_.push({method:"delayCall",mc:_loc2_.crewNameText,duration:0,tweenerObject:{onComplete:this.playSound,onCompleteScope:this,onCompleteArgs:[_loc12_,_loc9_]}});
         this.addAnimationsToWall(wallId,0,_loc7_,_loc3_,null,null,null);
      }
      this.processMcsForGfxType([_loc2_]);
      return _loc2_;
   }
   function toggleVisibility(mcs, delay, parentMc)
   {
      if(!delay)
      {
         delay = 1;
      }
      if(!parentMc)
      {
         parentMc = mcs[0]._parent._parent;
      }
      var _loc4_ = 0;
      var _loc5_ = 1;
      var _loc3_ = 0;
      while(_loc3_ < mcs.length)
      {
         if(mcs[_loc3_]._visible == true)
         {
            _loc4_ = _loc3_;
            if(_loc4_ + 1 >= mcs.length)
            {
               _loc5_ = 0;
               break;
            }
            _loc5_ = _loc4_ + 1;
            break;
         }
         _loc3_ = _loc3_ + 1;
      }
      _loc3_ = 0;
      var _loc6_;
      while(_loc3_ < mcs.length)
      {
         if(_loc3_ == _loc5_)
         {
            mcs[_loc3_]._visible = true;
            _loc6_ = {x:mcs[_loc3_]._x,y:mcs[_loc3_]._y};
            mcs[_loc3_].localToGlobal(_loc6_);
            if(parentMc._y < 720)
            {
               com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(mcs[_loc3_],delay,{onComplete:this.toggleVisibility,onCompleteArgs:[mcs,delay],onCompleteScope:this});
            }
         }
         else
         {
            mcs[_loc3_]._visible = false;
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function processTextField(tf, format, props)
   {
      for(var _loc4_ in props)
      {
         tf[_loc4_] = props[_loc4_];
      }
      if(format)
      {
         tf.setTextFormat(format);
      }
      var _loc5_;
      var _loc6_;
      var _loc7_;
      if(this.dispConf.isAsian)
      {
         _loc5_ = tf.getTextFormat();
         _loc6_ = _loc5_.size;
         _loc7_ = tf.textHeight - _loc6_;
         tf._y -= _loc7_;
      }
   }
   function doCentralisedTextLayout(centralTf, topLeftTfs, topRightTfs, bottomLeftTfs, bottomRightTfs, maxWidth, maxHeight)
   {
      if(!maxWidth)
      {
         maxWidth = 1140;
      }
      if(!maxHeight)
      {
         maxHeight = 540;
      }
      var _loc31_ = centralTf.text;
      var _loc10_ = 0;
      var _loc13_ = 0;
      var _loc11_ = 0;
      var _loc14_ = 0;
      var _loc19_ = 0;
      var _loc17_ = 0;
      var _loc18_ = 0;
      var _loc16_ = 0;
      var _loc29_ = 0;
      var _loc23_ = this.getAvailableTextWidth(centralTf);
      var _loc24_ = this.getAvailableTextWidth(centralTf,false,true);
      var _loc26_ = this.getAvailableTextWidth(centralTf,true);
      var _loc27_ = this.getAvailableTextWidth(centralTf,true,true);
      var _loc30_ = TextField(centralTf).getTextFormat();
      var _loc9_ = 0;
      var _loc15_;
      while(_loc9_ < topLeftTfs.length)
      {
         _loc15_ = TextField(topLeftTfs[_loc9_]).getTextFormat();
         if(TextField(topLeftTfs[_loc9_])._height > _loc10_)
         {
            _loc10_ = TextField(topLeftTfs[_loc9_])._height;
         }
         _loc19_ += TextField(topLeftTfs[_loc9_]).textWidth;
         _loc13_ += TextField(topLeftTfs[_loc9_]).textWidth;
         _loc9_ = _loc9_ + 1;
      }
      _loc9_ = 0;
      while(_loc9_ < topRightTfs.length)
      {
         if(TextField(topRightTfs[_loc9_])._height > _loc10_)
         {
            _loc10_ = TextField(topRightTfs[_loc9_])._height;
         }
         _loc17_ += TextField(topRightTfs[_loc9_]).textWidth;
         _loc13_ += TextField(topRightTfs[_loc9_]).textWidth;
         _loc9_ = _loc9_ + 1;
      }
      _loc9_ = 0;
      while(_loc9_ < bottomLeftTfs.length)
      {
         if(TextField(bottomLeftTfs[_loc9_])._height > _loc11_)
         {
            _loc11_ = TextField(bottomLeftTfs[_loc9_])._height;
         }
         _loc18_ += TextField(bottomLeftTfs[_loc9_]).textWidth;
         _loc14_ += TextField(bottomLeftTfs[_loc9_]).textWidth;
         _loc9_ = _loc9_ + 1;
      }
      _loc9_ = 0;
      while(_loc9_ < bottomRightTfs.length)
      {
         if(TextField(bottomRightTfs[_loc9_])._height > _loc11_)
         {
            _loc11_ = TextField(bottomRightTfs[_loc9_])._height;
         }
         _loc16_ += TextField(bottomRightTfs[_loc9_]).textWidth + 15;
         _loc14_ += TextField(bottomRightTfs[_loc9_]).textWidth + 15;
         _loc9_ = _loc9_ + 1;
      }
      var _loc32_ = maxHeight - _loc11_ - _loc10_;
      var _loc12_ = 0;
      if(!this.dispConf.isAsian)
      {
         centralTf._y = _loc10_ - centralTf._height * 0.155;
         if(_loc23_ < _loc19_ || _loc24_ < _loc17_)
         {
            centralTf._y += centralTf._height * 0.15;
         }
         if(_loc26_ < _loc18_ || _loc27_ < _loc16_)
         {
            _loc12_ += centralTf._height * 0.18;
         }
      }
      var _loc28_ = centralTf._width * 0.01;
      var _loc21_ = centralTf._x + 6;
      var _loc20_ = centralTf._width - 6;
      if(_loc14_ + 30 > centralTf._width || _loc13_ + 30 > centralTf._width)
      {
         _loc21_ = 0;
         _loc20_ = maxWidth;
         centralTf._x = maxWidth / 2 - centralTf._width / 2;
      }
      var _loc2_ = _loc21_;
      _loc9_ = 0;
      var _loc8_;
      while(_loc9_ < topLeftTfs.length)
      {
         _loc8_ = topLeftTfs[_loc9_];
         _loc8_._x = _loc2_;
         _loc2_ += _loc8_._width;
         _loc9_ = _loc9_ + 1;
      }
      _loc2_ = _loc20_;
      _loc9_ = topRightTfs.length - 1;
      while(_loc9_ >= 0)
      {
         _loc8_ = topRightTfs[_loc9_];
         _loc2_ -= _loc8_._width;
         _loc8_._x = _loc2_;
         _loc9_ = _loc9_ - 1;
      }
      _loc2_ = _loc21_;
      _loc9_ = 0;
      while(_loc9_ < bottomLeftTfs.length)
      {
         _loc8_ = bottomLeftTfs[_loc9_];
         _loc8_._x = _loc2_;
         _loc2_ += _loc8_._width;
         if(!this.dispConf.isAsian)
         {
            _loc8_._y = centralTf._y + centralTf._height * 0.76;
            _loc8_._y += _loc12_;
         }
         _loc9_ = _loc9_ + 1;
      }
      _loc2_ = _loc20_;
      _loc9_ = bottomRightTfs.length - 1;
      while(_loc9_ >= 0)
      {
         _loc8_ = bottomRightTfs[_loc9_];
         _loc2_ -= _loc8_._width;
         _loc8_._x = _loc2_;
         if(!this.dispConf.isAsian)
         {
            _loc8_._y = centralTf._y + centralTf._height * 0.76;
            _loc8_._y += _loc12_;
         }
         _loc9_ = _loc9_ - 1;
      }
   }
   function createLayoutMc(wallId, layoutId, layoutName)
   {
      var _loc8_ = this.getObjectFromMcName(wallId);
      var _loc3_ = this.getMovieClipFromName(wallId);
      var _loc2_ = _loc3_.getNextHighestDepth();
      if(!layoutName)
      {
         layoutName = layoutId + "_" + _loc2_;
      }
      var _loc5_ = _loc3_.attachMovie(layoutId,layoutName,_loc2_);
      return _loc5_;
   }
   function addAnimationsToWall(wallId, targetY, offsetY, childAnims, delay, duration, pauseBefore, soundName, soundSet)
   {
      if(!duration)
      {
         duration = this.slamDuration;
      }
      if(!delay)
      {
         delay = this.pauseDuration;
      }
      this.totalDurationMs += (duration + delay + this.pauseNextDuration) * 1000;
      if(!pauseBefore)
      {
         pauseBefore = false;
      }
      var _loc4_ = this.getObjectFromMcName(wallId);
      var _loc2_ = {duration:duration,targetY:targetY,offsetY:offsetY,delay:delay,pauseNextDuration:this.pauseNextDuration,childAnims:childAnims,pauseBefore:pauseBefore,soundName:soundName,soundSet:soundSet};
      this.pauseNextDuration = 0;
      var _loc3_ = _loc4_.tweens;
      _loc3_.push(_loc2_);
   }
   function addMcToWall(wallId, mc, mcHeight, mcTopPadding, xAlign, xOffset, vAlign)
   {
      if(!xAlign)
      {
         xAlign = this.ALIGN_LEFT;
      }
      if(!xOffset)
      {
         xOffset = 0;
      }
      var _loc4_ = this.getObjectFromMcName(wallId);
      _loc4_.currentHeight += mcHeight;
      mc._y = (_loc4_.currentHeight - mcTopPadding) * -1;
      var _loc5_ = this.dispConf.screenWidth - this.safeLeft * 2;
      if(mc._width + xOffset > _loc5_)
      {
         mc._xscale = mc._yscale = (_loc5_ - xOffset) / (mc._width + xOffset) * 100;
      }
      switch(this.getAlignment(xAlign))
      {
         case this.ALIGN_LEFT:
            mc._x = this.safeLeft + xOffset;
            if(mc._x < this.safeLeft)
            {
               mc._x = this.safeLeft;
            }
            break;
         case this.ALIGN_RIGHT:
            mc._x = this.safeRight - (mc._width + xOffset);
            if(mc._x + mc._width > this.safeRight)
            {
               mc._x = this.safeRight - mc._width;
            }
            break;
         default:
            mc._x = this.dispConf.screenWidth / 2 - mc._width / 2;
      }
      if(!this.dispConf.isWideScreen)
      {
         mc._x += 160;
      }
   }
   function processMcsForGfxType(mcs)
   {
      var _loc3_ = 0;
      var _loc2_;
      while(_loc3_ < mcs.length)
      {
         _loc2_ = mcs[_loc3_];
         switch(this.celebrationGfxType)
         {
            case this.TYPE_BG:
               com.rockstargames.ui.utils.Colour.Colourise(_loc2_,255,255,255,0);
               break;
            case this.TYPE_FG:
               com.rockstargames.ui.utils.Colour.Colourise(_loc2_,255,255,255,51);
               break;
            default:
               _loc2_._alpha = this.defaultFgAlpha;
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function getMovieClipFromName(mcName)
   {
      return this.CONTENT[mcName];
   }
   function getObjectFromMcName(mcName)
   {
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < this.wallList.length)
      {
         _loc3_ = this.wallList[_loc2_];
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
   function getAlignment(align)
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
   function doNumericTween(tf, startNumber, targetNumber, duration, delay)
   {
      if(isNaN(Number(tf.text)))
      {
         return undefined;
      }
      if(!duration)
      {
         duration = this.pauseDuration * 0.5;
      }
      if(!delay)
      {
         delay = 0;
      }
      tf.text = String(startNumber);
      var _loc6_ = targetNumber - startNumber;
      duration *= 1000;
      if(delay == 0)
      {
         this.startCounter(tf,startNumber,_loc6_,duration);
      }
      else
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(tf._parent,delay,{onComplete:this.startCounter,onCompleteScope:this,onCompleteArgs:[tf,startNumber,_loc6_,duration]});
      }
   }
   function startCounter(tf, startNumber, delta, duration)
   {
      this.numberCountMC.onEnterFrame = this.createDelegate(this,this.updateCounter,tf,startNumber,delta,getTimer(),duration);
   }
   function updateCounter(tf, startNumber, delta, startTimestamp, duration)
   {
      var _loc2_ = (getTimer() - startTimestamp) / duration;
      _loc2_ = Math.max(0,Math.min(1,_loc2_));
      tf.text = Math.round(_loc2_ * delta + startNumber).toString();
      if(delta > 0)
      {
         this.playSound(this.numberCountSound,this.numberCountSoundSet);
      }
      if(_loc2_ == 1)
      {
         delete this.numberCountMC.onEnterFrame;
      }
   }
   function playSound(soundName, libName)
   {
      if(this.celebrationGfxType == this.TYPE_OVERLAY || this.celebrationGfxType == this.TYPE_STANDARD)
      {
         com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,soundName,libName);
      }
   }
   function formatTimeMs(ms)
   {
      if(!ms || ms == 0)
      {
         return "";
      }
      var _loc7_ = this.zeroPadNumberString(ms.toString().substr(-3,3),3);
      var _loc4_ = Number(ms.toString().slice(0,-3));
      var _loc2_ = 0;
      var _loc5_ = 0;
      var _loc3_ = 0;
      if(!isNaN(_loc4_))
      {
         _loc2_ = Math.floor(_loc4_ / 3600);
         _loc5_ = Math.floor(_loc4_ % 3600 / 60);
         _loc3_ = Math.floor(_loc4_ % 3600 % 60);
      }
      return (_loc2_ != 0 ? (_loc2_ >= 10 ? _loc2_.toString() + ":" : "0" + _loc2_.toString() + ":") : "") + (_loc5_ >= 10 ? _loc5_.toString() : "0" + _loc5_.toString()) + ":" + (_loc3_ >= 10 ? _loc3_.toString() : "0" + _loc3_.toString()) + "." + _loc7_;
   }
   function zeroPadNumberString(number, width)
   {
      var _loc1_ = "" + number;
      while(_loc1_.length < width)
      {
         _loc1_ = "0" + _loc1_;
      }
      return _loc1_;
   }
   function syncPointReached(syncClearCallback)
   {
      this.syncClearCallback = syncClearCallback;
      if(com.rockstargames.gtav.Multiplayer.MP_CELEBRATION.NUM_MOVIES_TO_SYNC <= 1)
      {
         this.syncPointClear();
      }
   }
   function registerSyncedMovie(sequenceTypeBit)
   {
      this.syncedMovies |= sequenceTypeBit;
      var _loc2_ = (com.rockstargames.gtav.Multiplayer.MP_CELEBRATION.MOVIE_BIT_MATCH & this.syncedMovies) == com.rockstargames.gtav.Multiplayer.MP_CELEBRATION.MOVIE_BIT_MATCH;
      if(_loc2_)
      {
         this.syncedMovies = 0;
      }
   }
   function syncPointClear()
   {
      if(this.syncClearCallback)
      {
         this.syncClearCallback();
         this.syncClearCallback = null;
      }
   }
   function createDelegate(scope, method)
   {
      var params = arguments.splice(2,arguments.length - 2);
      var _loc2_ = function()
      {
         method.apply(scope,params);
      };
      return _loc2_;
   }
}

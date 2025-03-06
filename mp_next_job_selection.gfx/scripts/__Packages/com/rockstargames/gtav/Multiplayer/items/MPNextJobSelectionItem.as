class com.rockstargames.gtav.Multiplayer.items.MPNextJobSelectionItem extends MovieClip
{
   var verifiedbgMC;
   var bgFlashMC;
   var titleTF;
   var defaultTitleA;
   var imgPlaceholderMC;
   var defaultPlaceholderA;
   var votesTF;
   var nameTF;
   var iconCheckMC;
   var rpIconMC;
   var cashIconMC;
   var imgMC;
   var queuedGamerNames;
   var imgContainerMC;
   var mouseCatcher;
   var _greyFilterMC;
   var voteBGMC;
   var votecircMC;
   var checkMarkMC;
   var verifiedMC;
   var iconMC;
   var rpMultTF;
   var cashMultTF;
   var apMultTF;
   var apIconMC;
   var cmMultTF;
   var cmIconMC;
   var voteBGColour;
   var flashingName;
   static var IMAGE_TYPE_CLOUD = 0;
   static var IMAGE_TYPE_DISK = 1;
   static var NUM_IMGS = 2;
   var imgMCIdx = 0;
   function MPNextJobSelectionItem()
   {
      super();
      this.verifiedbgMC._visible = this.bgFlashMC._visible = false;
      com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.titleTF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      this.defaultTitleA = this.titleTF._alpha;
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.imgPlaceholderMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
      this.defaultPlaceholderA = this.imgPlaceholderMC._alpha;
      this.votesTF.textAutoSize = "shrink";
      this.titleTF.textAutoSize = "shrink";
      this.nameTF.textAutoSize = "shrink";
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.iconCheckMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREEN);
      this.rpIconMC._visible = this.cashIconMC._visible = false;
      this.imgMC = [];
      this.queuedGamerNames = [];
   }
   function updateImgMCIdxToDisplay()
   {
      this.imgMCIdx = this.getPreviousImgMCIdx();
   }
   function getPreviousImgMCIdx()
   {
      if(this.imgMCIdx == 0)
      {
         return 1;
      }
      return 0;
   }
   function getImgMCFadingOut()
   {
      var _loc2_ = this.getPreviousImgMCIdx();
      if(!this.imgMC[_loc2_].isLoaded)
      {
         return undefined;
      }
      return this.imgMC[_loc2_];
   }
   function setData(sTitle, txd, txn, textureLoadType, verifiedType, eIcon, bCheck, rpMult, cashMult, bDisabled, iconCol, apMult, cmMult)
   {
      this.titleTF.text = sTitle;
      this.titleTF._x = 272 - this.titleTF.textWidth;
      this.setVotes(0,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      if(textureLoadType != -1)
      {
         if(txd != undefined && txn != undefined && txd != "" && txn != "")
         {
            var _loc2_ = undefined;
            if(this.imgMC.length < com.rockstargames.gtav.Multiplayer.items.MPNextJobSelectionItem.NUM_IMGS)
            {
               this.imgMC.push(com.rockstargames.ui.media.ImageLoaderMC(this.imgContainerMC.attachMovie("GenericImageLoader","imgMC" + this.imgMCIdx,this.imgContainerMC.getNextHighestDepth())));
            }
            _loc2_ = this.imgMC[this.imgMCIdx];
            var _loc8_ = _loc2_.textureDict == txd && _loc2_.textureFilename == txn;
            if(!_loc8_)
            {
               if(_loc2_.isLoaded)
               {
                  _loc2_.removeTxdRef();
               }
            }
            _loc2_.init("MP_NEXT_JOB_SELECTION",txd,txn,288,160,0,0);
            var _loc5_ = String(_loc2_).split(".");
            var _loc6_ = _loc5_.slice(_loc5_.length - 4).join(".");
            if(textureLoadType == com.rockstargames.gtav.Multiplayer.items.MPNextJobSelectionItem.IMAGE_TYPE_CLOUD)
            {
               _loc2_.addTxdRef(_loc6_,this.transitionInBitmap,this);
            }
            else
            {
               _loc2_.requestTxdRef(_loc6_,_loc8_,this.transitionInBitmap,this);
            }
         }
         this.bgFlashMC._height = 160;
         if(this.mouseCatcher)
         {
            this.mouseCatcher._height = 160;
         }
         if(this._greyFilterMC)
         {
            this._greyFilterMC._height = 160;
         }
      }
      else
      {
         this.titleTF._y = 12;
         this.votesTF._y = 10;
         this.voteBGMC._y = this.votecircMC._y = this.votesTF._y + 1;
         this.checkMarkMC._y = this.votesTF._y - 3;
         this.bgFlashMC._height = 52;
         if(this.mouseCatcher)
         {
            this.mouseCatcher._height = 52;
         }
         this.imgPlaceholderMC._visible = false;
         if(this._greyFilterMC)
         {
            this._greyFilterMC._height = 52;
         }
      }
      if(verifiedType != undefined)
      {
         var _loc7_ = 1.5;
         if(!this.verifiedMC)
         {
            this.verifiedMC = com.rockstargames.gtav.Multiplayer.ROCKSTAR_VERIFIED(this.attachMovie("verified","verifiedMC",this.getNextHighestDepth(),{_x:this.verifiedbgMC._x + _loc7_,_y:this.verifiedbgMC._y + _loc7_}));
         }
         this.verifiedbgMC._visible = verifiedType > 0;
         this.verifiedMC.SET_VERIFIED(verifiedType);
      }
      if(eIcon != undefined)
      {
         this.iconMC.gotoAndStop(eIcon + 2);
         if(iconCol != undefined)
         {
            com.rockstargames.ui.utils.Colour.ApplyHudColour(this.iconMC,iconCol);
         }
      }
      this.iconCheckMC._visible = bCheck;
      this.setItemMultiplier(rpMult,this.rpMultTF,this.rpIconMC);
      this.setItemMultiplier(cashMult,this.cashMultTF,this.cashIconMC);
      this.setItemMultiplier(apMult,this.apMultTF,this.apIconMC);
      this.setItemMultiplier(cmMult,this.cmMultTF,this.cmIconMC);
      var _loc3_ = !(apMult > 0 || cmMult > 0) ? 0 : 30;
      this.rpMultTF._y = this.apMultTF._y + _loc3_;
      this.rpIconMC._y = this.apIconMC._y + _loc3_;
      _loc3_ = rpMult <= 0 ? 0 : 30;
      this.cashMultTF._y = this.rpMultTF._y + _loc3_;
      this.cashIconMC._y = this.rpIconMC._y + _loc3_;
      this.titleTF._alpha = !bDisabled ? this.defaultTitleA : 30;
   }
   function setItemMultiplier(mult, tf, iconMC)
   {
      if(mult > 0)
      {
         iconMC._visible = tf._visible = true;
         tf.text = mult + " x";
      }
      else
      {
         iconMC._visible = tf._visible = false;
      }
   }
   function getHeight()
   {
      return this.bgFlashMC._height;
   }
   function transitionInBitmap()
   {
      this.imgMC[this.imgMCIdx]._alpha = 0;
      this.imgMC[this.imgMCIdx]._visible = true;
      var _loc2_ = this.getImgMCFadingOut();
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.imgMC[this.imgMCIdx],0.3,{_alpha:100,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_OUT});
      if(_loc2_)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2_,0.3,{_alpha:0,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_OUT,onCompleteScope:this,onComplete:this.transitionComplete});
      }
      else
      {
         this.imgPlaceholderMC._visible = true;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.imgPlaceholderMC,0.3,{_alpha:0,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_OUT,onCompleteScope:this,onComplete:this.transitionComplete});
      }
   }
   function transitionComplete()
   {
      var _loc2_ = this.getImgMCFadingOut();
      if(_loc2_ == undefined)
      {
         this.imgPlaceholderMC._alpha = this.defaultPlaceholderA;
         this.imgPlaceholderMC._visible = false;
      }
      else
      {
         _loc2_._visible = false;
      }
      this.updateImgMCIdxToDisplay();
   }
   function setVotes(iNumVotes, voteBGColour, bShowCheckMark, bFlashBG)
   {
      if(iNumVotes <= 0)
      {
         this.votesTF._visible = this.voteBGMC._visible = this.votecircMC._visible = this.checkMarkMC._visible = false;
      }
      else
      {
         this.votesTF._visible = this.voteBGMC._visible = this.votecircMC._visible = true;
         com.rockstargames.ui.utils.UIText.setSizedText(this.votesTF,"" + iNumVotes,true,false,-2);
         if(this.voteBGColour != voteBGColour)
         {
            com.rockstargames.ui.utils.Colour.ApplyHudColour(this.voteBGMC,voteBGColour);
         }
         this.checkMarkMC._visible = bShowCheckMark;
         if(bFlashBG)
         {
            this.bgFlashMC._alpha = 30;
            this.bgFlashMC._visible = true;
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this.bgFlashMC,0.5,{_alpha:0,onCompleteScope:this,onComplete:this.onBGFlashComplete});
         }
      }
   }
   function queueGamerNameFlash(sGamerName, hexColour)
   {
      if(this.flashingName)
      {
         this.queuedGamerNames.push({name:sGamerName,colour:hexColour});
      }
      else
      {
         this.flashGamerName(sGamerName,hexColour);
      }
   }
   function flashGamerName(sGamerName, hexColour)
   {
      this.nameTF._visible = true;
      this.flashingName = sGamerName;
      this.nameTF.text = sGamerName;
      this.nameTF.textColor = hexColour;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.nameTF,0.1,{_alpha:100,onComplete:this.onNameFadeInComplete,onCompleteScope:this});
   }
   function onNameFadeInComplete()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.nameTF,0.6,{onComplete:this.onNameDelayComplete,onCompleteScope:this});
   }
   function onNameDelayComplete()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.nameTF,0.25,{_alpha:0,onComplete:this.onNameFadeOutComplete,onCompleteScope:this});
   }
   function onNameFadeOutComplete()
   {
      if(this.queuedGamerNames.length > 0)
      {
         var _loc2_ = this.queuedGamerNames.shift();
         this.flashGamerName(_loc2_.name,_loc2_.colour);
      }
      else
      {
         this.nameTF._visible = false;
         this.flashingName = null;
      }
   }
   function findAndRemoveGamerName(sGamerName)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.queuedGamerNames.length)
      {
         if(sGamerName == this.queuedGamerNames[_loc2_].name)
         {
            this.queuedGamerNames.splice(_loc2_,1);
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function onBGFlashComplete()
   {
      this.bgFlashMC._visible = false;
   }
   function setGreyedOutAlpha(value)
   {
      this._alpha = value;
   }
   function onCleanup()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.bgFlashMC);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.imgPlaceholderMC);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.nameTF);
      var _loc2_ = 0;
      while(_loc2_ < this.imgMC.length)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.imgMC[_loc2_]);
         if(this.imgMC[_loc2_] && this.imgMC[_loc2_].isLoaded)
         {
            this.imgMC[_loc2_].removeTxdRef();
         }
         _loc2_ = _loc2_ + 1;
      }
   }
}

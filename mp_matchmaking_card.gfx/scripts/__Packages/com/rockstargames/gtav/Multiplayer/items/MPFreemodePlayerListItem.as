class com.rockstargames.gtav.Multiplayer.items.MPFreemodePlayerListItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
   var __get__data;
   var __get__uniqueID;
   var _highlighted;
   var attachMovie;
   var avatarBGMC;
   var avatarImg;
   var bgMC;
   var crewTagMC;
   var friendOrCrewTF;
   var getNextHighestDepth;
   var groupBGMC;
   var groupNumTF;
   var highlightBGMC;
   var icon1MC;
   var icon2MC;
   var index;
   var initialIndex;
   var jobPointsTF;
   var jpIconMC;
   var labelMC;
   var rankBGMC;
   var rankNumTF;
   var rankingTF;
   var scoreTF;
   var taggedMC;
   static var dIndex = 0;
   var hBGColourEnum = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK;
   var SELECT_ALPHA = 100;
   var NONSELECT_ALPHA = 30;
   var isActive = true;
   var hasMoved = false;
   var playerName = "";
   var txdCallbackStr = "mp_matchmaking_card";
   var altTxdCallbackStr = "mp_spectator_card";
   var txdLevel = 3;
   var altTxdLevel = 5;
   function MPFreemodePlayerListItem()
   {
      super();
      _global.gfxExtensions = true;
      this.labelMC.nameTF.textAutoSize = "shrink";
      this.rankNumTF.textAutoSize = "shrink";
      this.jpIconMC._visible = false;
   }
   function set data(_d)
   {
      super.data = _d;
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
      this.bgMC._alpha = this.index % 2 != 0 ? 60 : 50;
      if(this.data[0] == "")
      {
         this.data[0] = "-";
      }
      this.playerName = this.data[0];
      this.labelMC.nameTF.text = this.data[0];
      this.groupBGMC._visible = false;
      this.groupNumTF._visible = false;
      if(this.crewTagMC)
      {
         this.crewTagMC._visible = false;
      }
      this.hBGColourEnum = this.data[1];
      if(this.hBGColourEnum == undefined)
      {
         this.hBGColourEnum = 1;
      }
      if(this.hBGColourEnum == 1 || this.hBGColourEnum == 0)
      {
         this.hBGColourEnum = !Boolean(this.hBGColourEnum) ? com.rockstargames.ui.utils.HudColour.HUD_COLOUR_RED : com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLUE;
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.taggedMC,this.hBGColourEnum);
      }
      else
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.taggedMC,this.hBGColourEnum);
      }
      this.taggedMC.gotoAndStop(this.data[2]);
      this.setIcon(this.data[3],this.icon1MC);
      this.setIcon(this.data[4],this.icon2MC);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.avatarBGMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
      if(this.data[9] > 0)
      {
         this.setGroupedBG(this.data[9]);
      }
      var _loc3_ = false;
      var _loc4_ = false;
      if(this.data[10] != undefined && this.data[11] != undefined)
      {
         if(this.data[10] != "" && this.data[11] != "")
         {
            this.setAvatarImg(this.data[10],this.data[11]);
            _loc3_ = true;
         }
         else
         {
            _loc4_ = true;
         }
      }
      if(this.data[12])
      {
         this.friendOrCrewTF.text = this.data[12];
      }
      if(isNaN(this.data[5]))
      {
         this.setAvatarImg(this.data[5],this.data[6]);
         _loc3_ = true;
      }
      else
      {
         this.rankingTF.text = this.data[5];
         this.rankingTF._visible = this.data[5] >= 0;
         this.avatarImg._alpha = !this.rankingTF._visible ? 100 : 60;
         _loc3_ = this.data[5] != -1;
         if(_loc3_)
         {
            com.rockstargames.ui.utils.Colour.ApplyHudColour(this.avatarBGMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
         }
         this.setRightText(this.data[6],this.data[8]);
      }
      this.setCrewTag(this.data[7]);
      this.formatNameTF();
      this.rankNumTF.text = "" + this.initialIndex;
      this.rankBGMC._visible = false;
      if(_loc4_ == true)
      {
         _loc3_ = true;
      }
      this.avatarBGMC._visible = _loc3_;
      this.highlighted = this._highlighted;
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.labelMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.rankNumTF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
   }
   function setRank(r)
   {
      this.rankingTF.text = String(r);
      this.rankingTF._visible = r >= 0;
   }
   function setRightText(rightText, isJob)
   {
      this.jpIconMC._visible = isJob;
      this.jobPointsTF._visible = isJob;
      this.scoreTF._visible = !isJob;
      if(isJob)
      {
         this.jobPointsTF.text = rightText;
      }
      else
      {
         com.rockstargames.ui.utils.UIText.setSizedText(this.scoreTF,rightText,true);
      }
   }
   function setGroupedBG(numMembers)
   {
      this.groupBGMC._visible = true;
      this.groupNumTF._visible = true;
      this.groupBGMC._height = 27 * numMembers - 2;
      this.groupNumTF.text = String(this.uniqueID);
      this.groupNumTF._y = this.groupBGMC._height * 0.5 - this.groupNumTF._height * 0.5;
   }
   function setIcon(iconEnum, iconMC)
   {
      if(iconEnum == undefined)
      {
         iconEnum = 0;
      }
      var _loc2_ = com.rockstargames.gtav.constants.MPIconLabels.lookUp(iconEnum)[1];
      iconMC.gotoAndStop(_loc2_);
      if(_loc2_ == "RANK_FREEMODE")
      {
         com.rockstargames.gtav.utils.GTAVUIUtils.colourRankIcon(iconMC.rankMC);
      }
      if(iconMC.animIcon)
      {
         iconMC.animIcon.play();
      }
   }
   function setAvatarImg(txd, txn)
   {
      if(txd != undefined && txn != undefined)
      {
         if(txd != "" && txn != "")
         {
            this.ADD_TXD_REF(txd,txn);
         }
      }
   }
   function setCrewTag(crewTagStr)
   {
      if(crewTagStr && crewTagStr != "")
      {
         if(!this.crewTagMC)
         {
            this.crewTagMC = this.attachMovie("CREW_TAG_MOVIECLIP","crewTagMC",this.getNextHighestDepth(),{_y:4,_xscale:70,_yscale:70});
         }
         this.crewTagMC.UNPACK_CREW_TAG(crewTagStr);
         this.crewTagMC._visible = true;
      }
   }
   function formatNameTF()
   {
      var _loc2_ = 210 - (!this.crewTagMC._visible ? 0 : this.crewTagMC._width);
      this.labelMC.nameTF._width = _loc2_;
      this.crewTagMC._x = this.labelMC._x + this.labelMC.nameTF._x + this.labelMC.nameTF.textWidth + 10;
   }
   function set highlighted(_h)
   {
      var _loc2_ = !_h ? this.NONSELECT_ALPHA : this.SELECT_ALPHA;
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.highlightBGMC,this.hBGColourEnum);
      this.highlightBGMC._alpha = _loc2_;
      if(this.groupBGMC._visible)
      {
         this.groupNumTF._alpha = _loc2_ + 25;
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.groupBGMC,this.hBGColourEnum);
         this.groupBGMC._alpha = _loc2_;
      }
      this._highlighted = _h;
   }
   function setAltTxdCallback(str)
   {
      if(str != undefined)
      {
         this.txdCallbackStr = str;
      }
      else
      {
         this.txdCallbackStr = this.altTxdCallbackStr;
      }
      this.txdLevel = this.altTxdLevel;
   }
   function ADD_TXD_REF(txd, txn)
   {
      if(this.avatarImg == undefined)
      {
         this.avatarImg = com.rockstargames.ui.media.ImageLoaderMC(this.attachMovie("avatarImage","a",this.getNextHighestDepth(),{_x:25,_y:0}));
         this.avatarImg.swapDepths(this.rankingTF);
      }
      var _loc3_;
      if(this.avatarImg.textureDict == txd)
      {
         if(this.avatarImg.isLoaded)
         {
            this.avatarImg.init(this.txdCallbackStr,txd,txn,25,25);
            this.avatarImg.displayTxdResponse(txd);
         }
      }
      else
      {
         if(this.avatarImg.isLoaded)
         {
            this.avatarImg.removeTxdRef();
         }
         this.avatarImg.init(this.txdCallbackStr,txd,txn,25,25);
         _loc3_ = this.avatarImg.splitPath(String(this.avatarImg),this.txdLevel);
         this.avatarImg.requestTxdRef(_loc3_,true);
      }
   }
   function ON_DESTROY()
   {
      if(this.avatarImg != undefined && this.avatarImg.isLoaded)
      {
         this.avatarImg.removeTxdRef();
      }
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this);
   }
}

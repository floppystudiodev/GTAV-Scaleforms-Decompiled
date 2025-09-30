class com.rockstargames.gtav.pauseMenu.pauseComponents.MP_PLAYER_CARD extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
   var CONTENT;
   var btnLayer;
   var crewEmblemMC;
   var menuList;
   var playerColourEnum;
   var statID;
   var DESC_TYPE_TXT = 0;
   var DESC_TYPE_SC = 1;
   var DESC_TYPE_INV_SENT = 2;
   function MP_PLAYER_CARD()
   {
      super();
      _global.gfxExtensions = true;
   }
   function DISPLAY_VIEW()
   {
   }
   function INITIALISE(mc, collapse)
   {
      if(mc != undefined)
      {
         super.INITIALISE(mc);
      }
      else
      {
         this.CONTENT = this;
      }
      this.menuList = [];
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.headerBGMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
      com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.CONTENT.item0TF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.CONTENT.item1TF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.CONTENT.item2TF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.CONTENT.vehiclePanelMC.titleTF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.vehiclePanelMC.vehicleMC1,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.vehiclePanelMC.vehicleMC2,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.vehiclePanelMC.vehicleMC3,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.vehiclePanelMC.vehicleMC4,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.vehiclePanelMC.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
      com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.CONTENT.crewInfoMC.crewNameTF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.CONTENT.crewInfoMC.rankNameTF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.crewInfoMC.membersIconMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.CONTENT.crewInfoMC.membersTF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      if(collapse)
      {
         this.statID = "playerComparisonItem";
      }
      else
      {
         this.statID = "statItem";
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.CONTENT.vehiclePanelMC.titleTF,"VEH_ACCESS",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,false);
      }
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.descMC.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
      this.CONTENT.descMC._visible = false;
      this.CONTENT.rankNumTF.textAutoSize = "shrink";
      this.CONTENT.crewInfoMC.crewNameTF.textAutoSize = "shrink";
      this.CONTENT.crewInfoMC.rankNameTF.textAutoSize = "shrink";
      this.CONTENT.crewInfoMC.crewRankTF.textAutoSize = "shrink";
      this.CONTENT.crewInfoMC._visible = false;
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.crewInfoMC.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
   }
   function SET_TITLE(title)
   {
      this.CONTENT.titleTF.text = title;
      this.playerColourEnum = arguments[2];
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.titleBGMC,this.playerColourEnum);
      var _loc5_;
      var _loc3_;
      var _loc7_;
      var _loc4_;
      var _loc8_;
      if(arguments[1] == "" || arguments[1] == undefined)
      {
         this.CONTENT.crewInfoMC._visible = false;
         this.CONTENT.crewTagMC._visible = false;
      }
      else
      {
         this.CONTENT.crewTagMC.UNPACK_CREW_TAG(arguments[5]);
         this.CONTENT.crewTagMC._x = this.CONTENT.titleTF._x + this.CONTENT.titleTF.textWidth + 10;
         this.CONTENT.crewTagMC._visible = true;
         this.CONTENT.crewInfoMC.crewTagMC.UNPACK_CREW_TAG(arguments[5]);
         _loc5_ = arguments[6];
         _loc3_ = arguments[7];
         if(_loc5_ && _loc3_)
         {
            this.CONTENT.crewInfoMC.crewNameTF.text = arguments[1];
            this.CONTENT.crewInfoMC.rankNameTF.text = arguments[4];
            this.CONTENT.crewInfoMC.crewRankTF.text = arguments[8] == undefined ? "" : arguments[8];
            if(!this.crewEmblemMC)
            {
               this.crewEmblemMC = this.CONTENT.crewInfoMC.attachMovie("GenericImageLoader","playerCardCrewEmblemMC",this.CONTENT.crewInfoMC.getNextHighestDepth(),{_x:10,_y:9});
            }
            if(this.crewEmblemMC.isLoaded)
            {
               this.crewEmblemMC.removeTxdRef();
            }
            this.crewEmblemMC.init("PAUSE_MENU_SP_CONTENT",_loc5_,_loc3_,61,61);
            _loc7_ = 3;
            _loc4_ = String(this.crewEmblemMC).split(".");
            _loc8_ = _loc4_.slice(_loc4_.length - _loc7_).join(".");
            this.crewEmblemMC.addTxdRef(_loc8_);
            if(arguments[9] != undefined)
            {
               com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.crewInfoMC.rankBGMC,arguments[9],arguments[10],arguments[11],100);
               this.CONTENT.crewInfoMC._visible = true;
            }
            this.CONTENT.crewInfoMC.membersTF.text = !arguments[12] ? "" : arguments[12];
            this.CONTENT.crewInfoMC.membersIconMC._x = 267 - this.CONTENT.crewInfoMC.membersTF.textWidth;
         }
      }
      var _loc6_ = com.rockstargames.gtav.constants.MPIconLabels.lookUp(arguments[3])[1];
      this.CONTENT.rankEmblemMC.gotoAndStop(_loc6_);
      this.CONTENT.titleValTF.text = !arguments[13] ? "" : arguments[13];
      if(this.CONTENT.crewInfoMC._visible)
      {
         this.CONTENT.descMC._visible = false;
      }
   }
   function SET_DATA_SLOT(_viewIndex, _slotIndex)
   {
      var _loc11_;
      var _loc9_;
      var _loc3_;
      var _loc4_;
      var _loc5_;
      var _loc6_;
      var _loc7_;
      var _loc10_;
      var _loc8_;
      if(_viewIndex == 0)
      {
         this.CONTENT.vehiclePanelMC.vehicleMC1._alpha = !arguments[5] ? 30 : 100;
         this.CONTENT.vehiclePanelMC.vehicleMC2._alpha = !arguments[6] ? 30 : 100;
         this.CONTENT.vehiclePanelMC.vehicleMC3._alpha = !arguments[7] ? 30 : 100;
         this.CONTENT.vehiclePanelMC.vehicleMC4._alpha = !arguments[8] ? 30 : 100;
         _loc11_ = arguments[9];
         this.CONTENT.rankNumTF.text = _loc11_;
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.rankEmblemMC,this.playerColourEnum);
         _loc9_ = arguments.length;
         _loc3_ = 10;
         _loc4_ = 0;
         while(_loc3_ < _loc9_)
         {
            _loc5_ = this.CONTENT["item" + _loc4_ + "TF"];
            _loc5_.text = arguments[_loc3_] == undefined ? "" : arguments[_loc3_];
            _loc6_ = arguments[_loc3_ + 1];
            _loc7_ = this.CONTENT["icon" + _loc4_ + "MC"];
            _loc7_.gotoAndStop(com.rockstargames.gtav.constants.MPIconLabels.lookUp(_loc6_)[1]);
            if(_loc6_ != com.rockstargames.gtav.constants.MPIconLabels.EMPTY[0])
            {
               _loc5_._x = 82;
               com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc7_,arguments[_loc3_ + 2]);
            }
            _loc3_ += 3;
            _loc4_ = _loc4_ + 1;
         }
      }
      else
      {
         _loc10_ = _viewIndex - 1;
         if(!this.menuList[_loc10_])
         {
            _loc8_ = com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuPlayerCardItem(this.CONTENT.attachMovie(this.statID,this.statID + _loc10_ + "MC",_loc10_));
            _loc8_._y = this.CONTENT.headerBGMC._y + this.CONTENT.headerBGMC._height + 2 + _loc10_ * Math.round(_loc8_._height);
            this.menuList[_loc10_] = _loc8_;
         }
         else
         {
            _loc8_ = this.menuList[_loc10_];
         }
         _loc8_._visible = true;
         _loc8_.setColour(this.playerColourEnum);
         _loc8_.init(arguments);
         this.CONTENT.vehiclePanelMC._y = _loc8_._y + Math.round(_loc8_._height);
         this.CONTENT.crewInfoMC._y = this.CONTENT.vehiclePanelMC._y + this.CONTENT.vehiclePanelMC._height + 2;
         this.CONTENT.descMC._y = this.CONTENT.crewInfoMC._y;
      }
   }
   function SET_DESCRIPTION(descStr, descType, crewTagStr)
   {
      var _loc3_;
      if(descStr != "")
      {
         if(this.btnLayer)
         {
            this.btnLayer.removeMovieClip();
         }
         this.btnLayer = this.CONTENT.descMC.createEmptyMovieClip("btnLayer",1000);
         _loc3_ = new com.rockstargames.ui.utils.Text();
         _loc3_.setTextWithIcons(descStr,this.btnLayer,this.CONTENT.descMC.descTF,0,13,4,false);
         this.CONTENT.descMC.crewUpIconMC._visible = descType == this.DESC_TYPE_SC;
         this.CONTENT.descMC.crewTagMC._visible = descType == this.DESC_TYPE_INV_SENT;
         if(descType == this.DESC_TYPE_TXT)
         {
            this.CONTENT.descMC.descTF._x = 5;
            this.CONTENT.descMC.descTF._width = 278;
         }
         else
         {
            this.CONTENT.descMC.descTF._x = 54;
            this.CONTENT.descMC.descTF._width = 225;
            if(descType == this.DESC_TYPE_INV_SENT)
            {
               this.CONTENT.descMC.crewTagMC.UNPACK_CREW_TAG(crewTagStr);
            }
         }
         this.CONTENT.descMC.bgMC._height = Math.min(this.CONTENT.descMC.descTF._y + this.CONTENT.descMC.descTF.textHeight + 10,79);
         this.CONTENT.descMC._visible = !this.CONTENT.crewInfoMC._visible;
      }
      else
      {
         this.CONTENT.descMC._visible = false;
      }
   }
   function SET_DATA_SLOT_EMPTY()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.menuList.length)
      {
         MovieClip(this.menuList[_loc2_]).removeMovieClip();
         this.menuList[_loc2_] = null;
         _loc2_ = _loc2_ + 1;
      }
      if(this.CONTENT.descMC)
      {
         this.CONTENT.descMC._visible = false;
      }
      this.CONTENT.crewInfoMC._visible = false;
   }
}

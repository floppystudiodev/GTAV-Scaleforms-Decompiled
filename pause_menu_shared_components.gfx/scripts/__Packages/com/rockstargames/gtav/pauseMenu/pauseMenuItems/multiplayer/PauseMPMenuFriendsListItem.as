class com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuFriendsListItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
   var itemColour;
   var _data;
   var itemTextLeft;
   var __get__data;
   var colourBGMC;
   var tabMC;
   var type;
   var bgMC;
   var labelMC;
   var _view;
   var crewTagMC;
   var attachMovie;
   var getNextHighestDepth;
   var _highlighted;
   var initialIndex;
   var storedStatusColID;
   var __get__uniqueID;
   var index;
   var __get__columnID;
   var __get__highlighted;
   static var AS_OFFLINE = 0;
   static var AS_ONLINE_DIFFERENT_SESSION = 1;
   static var AS_ONLINE_IN_SESSION = 2;
   static var AS_ONLINE_DIFFERENT_MATCH = 3;
   var IS_NEXT_JOB_LIST = false;
   var isColour = false;
   var kick = 0;
   var frameID = "";
   function PauseMPMenuFriendsListItem()
   {
      super();
      _global.gfxExtensions = true;
      this.itemColour = new com.rockstargames.ui.utils.HudColour();
   }
   function set data(_d)
   {
      super.data = _d;
      if(this._data[0] != undefined)
      {
         com.rockstargames.ui.utils.UIText.setSizedText(this.itemTextLeft,this._data[0],true,false,0,com.rockstargames.ui.utils.UIText.SIZE_GTAG);
      }
      com.rockstargames.ui.utils.Colour.setHudColour(this.data[1],this.itemColour);
      this.isColour = this.data[1] >= 0;
      this.colourBGMC._visible = this.isColour;
      var _loc6_ = this.data[2];
      this.tabMC._visible = this.isColour && this.type != com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuFriendsListItem.AS_OFFLINE;
      if(this.isColour)
      {
         if(this.type != com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuFriendsListItem.AS_OFFLINE)
         {
            com.rockstargames.ui.utils.Colour.ApplyHudColour(this.tabMC,!_loc6_ ? this.data[1] : com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
         }
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
      }
      if(this.data[4] != undefined)
      {
         this.setIcon(this.data[4],this.labelMC.iconMC);
      }
      this.kick = this.data[7];
      if(this.data[7] != undefined)
      {
         if(this.kick >= 1)
         {
            this._view.startKick(true);
         }
         else
         {
            this._view.startKick(false);
            this.kickflip(0);
         }
      }
      var _loc4_ = this.data[6];
      if(_loc4_ == undefined || _loc4_ == "")
      {
         if(this.crewTagMC)
         {
            this.crewTagMC._visible = false;
         }
      }
      else
      {
         if(this.crewTagMC == undefined)
         {
            this.crewTagMC = this.attachMovie("CREW_TAG_MOVIECLIP","crewTagMC",this.getNextHighestDepth(),{_y:5,_xscale:70,_yscale:70});
         }
         this.crewTagMC.UNPACK_CREW_TAG(_loc4_);
         this.crewTagMC._x = this.itemTextLeft._x + this.itemTextLeft.textWidth + 8;
         this.crewTagMC._visible = true;
      }
      if(!this.IS_NEXT_JOB_LIST)
      {
         if(this.data[10] != undefined)
         {
            var _loc3_ = this.data[10];
            if(_loc3_ == undefined)
            {
               _loc3_ = 0;
            }
            var _loc5_ = com.rockstargames.gtav.constants.MPIconLabels.lookUp(_loc3_)[1];
            this.setIcon(_loc5_,this.labelMC.platformMC);
         }
      }
      this.setStatus(this.data[8],this.data[9]);
      this.highlighted = this._highlighted;
   }
   function setIcon(frameStr, fMC)
   {
      if(frameStr != this.frameID)
      {
         fMC.gotoAndStop(frameStr);
         this.frameID = frameStr;
      }
      if(fMC == this.labelMC.iconMC)
      {
         if(frameStr == "RANK_FREEMODE")
         {
            com.rockstargames.gtav.utils.GTAVUIUtils.colourRankIcon(fMC.rankMC);
            if(this.initialIndex > 0 && this.labelMC.valTF)
            {
               this.labelMC.valTF.textAutoSize = "shrink";
               this.labelMC.valTF.text = this.initialIndex;
            }
         }
         else
         {
            this.labelMC.valTF.text = "";
         }
      }
      if(fMC.animIcon)
      {
         fMC.animIcon.play();
      }
   }
   function setView(v)
   {
      this._view = v;
   }
   function setStatus(statusStr, statusColID)
   {
      if(statusStr)
      {
         this.labelMC.statusMC._visible = true;
         this.labelMC.statusMC.labelMC.itemTF.text = statusStr;
         this.labelMC.statusMC.bgMC._width = this.labelMC.statusMC.labelMC.itemTF.textWidth + 10;
         this.labelMC.statusMC.bgMC._x = 145 - this.labelMC.statusMC.bgMC._width;
         var _loc2_ = 112;
         if(this.labelMC.platformMC._currentframe != 1)
         {
            _loc2_ = 87;
         }
         this.labelMC.statusMC._x = _loc2_;
         this.storedStatusColID = statusColID;
      }
      else
      {
         this.labelMC.statusMC._visible = false;
      }
   }
   function kickflip(kickAnim)
   {
      if(kickAnim == 1)
      {
         this.labelMC.iconMC.gotoAndStop("KICK");
         this.labelMC.platformMC.gotoAndStop("EMPTY");
         this.labelMC.valTF.text = "";
      }
      else
      {
         if(this.data[4] != undefined)
         {
            this.setIcon(this.data[4],this.labelMC.iconMC);
         }
         com.rockstargames.ui.utils.Debug.log(" TRY ATTEMPT KICKFLIP --------------- " + this.IS_NEXT_JOB_LIST);
         if(!this.IS_NEXT_JOB_LIST)
         {
            if(this.data[10] != undefined)
            {
               this.setIcon(this.data[10],this.labelMC.platformMC);
            }
         }
      }
   }
   function set highlighted(_h)
   {
      var _loc11_ = !this.isColour ? this.bgMC : this.colourBGMC;
      var _loc2_ = new com.rockstargames.ui.utils.HudColour();
      var _loc6_ = new com.rockstargames.ui.utils.HudColour();
      var _loc4_ = new com.rockstargames.ui.utils.HudColour();
      var _loc3_ = new com.rockstargames.ui.utils.HudColour();
      var _loc5_ = new com.rockstargames.ui.utils.HudColour();
      var _loc7_ = 100;
      var _loc9_ = 100;
      var _loc10_ = 100;
      if(this.isColour)
      {
         if(this.type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuFriendsListItem.AS_OFFLINE)
         {
            _loc7_ = !_h ? 0 : 100;
            _loc9_ = !_h ? 30 : 60;
            _loc10_ = _loc9_;
         }
         else if(this.type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuFriendsListItem.AS_ONLINE_DIFFERENT_SESSION)
         {
            _loc7_ = !_h ? 20 : 60;
            _loc10_ = !_h ? 30 : 60;
         }
         else if(this.type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuFriendsListItem.AS_ONLINE_IN_SESSION)
         {
            _loc7_ = !_h ? 20 : 100;
         }
         else if(this.type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuFriendsListItem.AS_ONLINE_DIFFERENT_MATCH)
         {
            _loc7_ = !_h ? 20 : 60;
            _loc10_ = 60;
         }
         com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc4_);
      }
      if(_h)
      {
         if(this.isColour)
         {
            _loc2_ = this.itemColour;
            if(this.type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuFriendsListItem.AS_OFFLINE)
            {
               com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK,_loc6_);
            }
            else
            {
               com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc6_);
            }
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc4_);
         }
         else
         {
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK,_loc6_);
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc2_);
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK,_loc4_);
            _loc7_ = _loc2_.a;
         }
         if(this.storedStatusColID != undefined)
         {
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc3_);
            com.rockstargames.ui.utils.Colour.setHudColour(this.storedStatusColID,_loc5_);
         }
         else
         {
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc3_);
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK,_loc5_);
         }
      }
      else
      {
         com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc6_);
         if(this.isColour)
         {
            _loc2_ = this.itemColour;
         }
         else
         {
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG,_loc2_);
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc4_);
            _loc7_ = this.uniqueID != -1 ? _loc2_.a : 20;
         }
         if(this.storedStatusColID != undefined)
         {
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc3_);
            com.rockstargames.ui.utils.Colour.setHudColour(this.storedStatusColID,_loc5_);
         }
         else
         {
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK,_loc3_);
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc5_);
         }
      }
      com.rockstargames.ui.utils.Colour.Colourise(_loc11_,_loc2_.r,_loc2_.g,_loc2_.b,_loc7_);
      com.rockstargames.ui.utils.Colour.Colourise(this.labelMC.titleTF,_loc6_.r,_loc6_.g,_loc6_.b,_loc9_);
      com.rockstargames.ui.utils.Colour.Colourise(this.labelMC.iconMC,_loc4_.r,_loc4_.g,_loc4_.b,_loc4_.a);
      com.rockstargames.ui.utils.Colour.Colourise(this.labelMC.statusMC.labelMC,_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
      com.rockstargames.ui.utils.Colour.Colourise(this.labelMC.statusMC.bgMC,_loc5_.r,_loc5_.g,_loc5_.b,_loc5_.a);
      if(this.crewTagMC)
      {
         this.crewTagMC._alpha = _loc9_;
      }
      this._highlighted = _h;
   }
   function mOver()
   {
      var _loc2_ = this.data[0];
      if(this.uniqueID != -1 && _loc2_ != "")
      {
         _level0.TIMELINE.M_OVER_EVENT(this.index,this.columnID,this);
      }
   }
   function mOut()
   {
      var _loc2_ = this.data[0];
      if(this.uniqueID != -1 && _loc2_ != "")
      {
         _level0.TIMELINE.M_OUT_EVENT(this.index,this.columnID);
      }
   }
   function mPress()
   {
      var _loc2_ = this.data[0];
      if(this.uniqueID != -1 && _loc2_ != "")
      {
         if(!this.highlighted)
         {
            com.rockstargames.gtav.pauseMenu.PAUSE_MENU_SP_CONTENT(_level0.TIMELINE).M_PRESS_EVENT(this.index,this.columnID,false,true);
         }
         else
         {
            com.rockstargames.gtav.pauseMenu.PAUSE_MENU_SP_CONTENT(_level0.TIMELINE).M_PRESS_EVENT(this.index,this.columnID,true,true);
         }
      }
   }
}

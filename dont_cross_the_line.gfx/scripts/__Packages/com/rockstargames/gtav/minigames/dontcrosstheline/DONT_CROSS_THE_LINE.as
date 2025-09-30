class com.rockstargames.gtav.minigames.dontcrosstheline.DONT_CROSS_THE_LINE extends com.rockstargames.ui.core.BaseScreenLayout
{
   var BOUNDING_BOX;
   var CONTENT;
   var TIMELINE;
   var _name;
   var imageQueue;
   var txdRefs;
   static var ACTION_NONE = 0;
   static var ACTION_CROSS = 1;
   static var ACTION_TICK = 2;
   static var MIC_HIDDEN = 0;
   static var MIC_MUTED = 1;
   static var MIC_INACTIVE = 2;
   static var MIC_ACTIVE = 3;
   static var EFFECT_NONE = 0;
   static var EFFECT_FLASH = 1;
   static var EFFECT_SCANLINES = 2;
   static var PLAYER_1_COLOUR = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_DEGEN_CYAN;
   static var PLAYER_2_COLOUR = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_DEGEN_MAGENTA;
   static var PLAYER_3_COLOUR = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_DEGEN_GREEN;
   static var PLAYER_4_COLOUR = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_DEGEN_YELLOW;
   function DONT_CROSS_THE_LINE()
   {
      super();
      _global.gfxExtensions = true;
      this._name = "DONT_CROSS_THE_LINE";
   }
   function initialise(mc)
   {
      this.TIMELINE = mc;
      this.BOUNDING_BOX = this.TIMELINE.attachMovie("BOUNDING_BOX","BOUNDING_BOX",this.TIMELINE.getNextHighestDepth());
      this.BOUNDING_BOX._visible = false;
      this.CONTENT = this.TIMELINE.attachMovie("CONTENT","CONTENT",this.TIMELINE.getNextHighestDepth());
      this.CONTENT.loadingScreen._visible = false;
      this.CONTENT.centralMessage._visible = false;
      this.CONTENT.hud._visible = false;
      this.CONTENT.lobby._visible = false;
      var _loc5_ = 1;
      var _loc7_;
      var _loc6_;
      var _loc4_;
      var _loc3_;
      var _loc2_;
      while(_loc5_ <= 4)
      {
         _loc7_ = new com.rockstargames.ui.utils.HudColour();
         com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.gtav.minigames.dontcrosstheline.DONT_CROSS_THE_LINE["PLAYER_" + _loc5_ + "_COLOUR"],_loc7_);
         _loc6_ = _loc7_.r << 16 | _loc7_.g << 8 | _loc7_.b;
         _loc4_ = new flash.geom.ColorTransform();
         _loc4_.rgb = _loc6_;
         _loc2_ = this.CONTENT.hud["player" + _loc5_];
         _loc3_ = _loc2_.gamerTag.getNewTextFormat();
         _loc3_.color = _loc6_;
         _loc2_.gamerTag.setNewTextFormat(_loc3_);
         _loc3_ = _loc2_.score.getNewTextFormat();
         _loc3_.color = _loc6_;
         _loc2_.score.setNewTextFormat(_loc3_);
         _loc2_.imageBorder.transform.colorTransform = _loc4_;
         _loc2_.mic.transform.colorTransform = _loc4_;
         _loc2_ = this.CONTENT.lobby["player" + _loc5_];
         _loc3_ = _loc2_.gamerTag.getNewTextFormat();
         _loc3_.color = _loc6_;
         _loc2_.gamerTag.setNewTextFormat(_loc3_);
         _loc2_.imageBorder.transform.colorTransform = _loc4_;
         _loc2_.mic.transform.colorTransform = _loc4_;
         _loc5_ = _loc5_ + 1;
      }
      this.txdRefs = [];
      this.imageQueue = [];
   }
   function SHOW_LOADING_SCREEN()
   {
      this.CLEAR_CENTRAL_MESSAGE();
      this.HIDE_LOBBY();
      this.HIDE_HUD();
      this.CONTENT.loadingScreen.gotoAndPlay(1);
      this.CONTENT.loadingScreen._visible = true;
   }
   function HIDE_LOADING_SCREEN()
   {
      this.CONTENT.loadingScreen._visible = false;
   }
   function SET_CENTRAL_MESSAGE(message, hudColourEnum, effectEnum, secondaryMessage, secondaryHudColourEnum)
   {
      this.HIDE_LOBBY();
      var _loc4_ = !this.CONTENT.hud._visible ? 300 : 327;
      this.setOutlineText(this.CONTENT.centralMessage,message,hudColourEnum,true);
      var _loc5_;
      var _loc2_;
      var _loc7_;
      if(secondaryMessage != undefined && secondaryMessage != "")
      {
         _loc5_ = new flash.geom.ColorTransform();
         if(this.hudColourIsValid(secondaryHudColourEnum))
         {
            _loc2_ = new com.rockstargames.ui.utils.HudColour();
            com.rockstargames.ui.utils.Colour.setHudColour(secondaryHudColourEnum,_loc2_);
            _loc7_ = _loc2_.r << 16 | _loc2_.g << 8 | _loc2_.b;
            _loc5_.rgb = _loc7_;
         }
         this.CONTENT.centralMessage.secondary.transform.colorTransform = _loc5_;
         this.CONTENT.centralMessage.secondary.text = secondaryMessage;
         this.CONTENT.centralMessage._y = _loc4_ - 50;
      }
      else
      {
         this.CONTENT.centralMessage.secondary.text = "";
         this.CONTENT.centralMessage._y = _loc4_;
      }
      var _loc3_;
      switch(effectEnum)
      {
         case com.rockstargames.gtav.minigames.dontcrosstheline.DONT_CROSS_THE_LINE.EFFECT_SCANLINES:
            _loc3_ = "scanlines";
            break;
         case com.rockstargames.gtav.minigames.dontcrosstheline.DONT_CROSS_THE_LINE.EFFECT_FLASH:
            _loc3_ = "flash";
            break;
         default:
            _loc3_ = "normal";
      }
      this.CONTENT.centralMessage.reveal.gotoAndPlay(_loc3_);
      this.CONTENT.centralMessage._visible = true;
   }
   function CLEAR_CENTRAL_MESSAGE()
   {
      this.CONTENT.centralMessage._visible = false;
      this.CONTENT.centralMessage.tf.text = "";
      this.CONTENT.centralMessage.secondary.text = "";
   }
   function INIT_LOBBY(message, hudColourEnum, player1Txd, player1GamerTag, player2Txd, player2GamerTag, player3Txd, player3GamerTag, player4Txd, player4GamerTag, localPlayerIndex)
   {
      this.HIDE_LOADING_SCREEN();
      this.CLEAR_CENTRAL_MESSAGE();
      this.HIDE_HUD();
      this.setOutlineText(this.CONTENT.lobby.message,message,hudColourEnum,true);
      this.initLobbyPlayer(this.CONTENT.lobby.player1,player1Txd,player1GamerTag,localPlayerIndex == 0);
      this.initLobbyPlayer(this.CONTENT.lobby.player2,player2Txd,player2GamerTag,localPlayerIndex == 1);
      this.initLobbyPlayer(this.CONTENT.lobby.player3,player3Txd,player3GamerTag,localPlayerIndex == 2);
      this.initLobbyPlayer(this.CONTENT.lobby.player4,player4Txd,player4GamerTag,localPlayerIndex == 3);
      this.CONTENT.lobby._visible = true;
   }
   function UPDATE_LOBBY(player1Action, player2Action, player3Action, player4Action)
   {
      this.updateLobbyPlayer(this.CONTENT.lobby.player1,player1Action);
      this.updateLobbyPlayer(this.CONTENT.lobby.player2,player2Action);
      this.updateLobbyPlayer(this.CONTENT.lobby.player3,player3Action);
      this.updateLobbyPlayer(this.CONTENT.lobby.player4,player4Action);
   }
   function HIDE_LOBBY()
   {
      this.CONTENT.lobby._visible = false;
   }
   function SHOW_HUD(player1Score, player1Txd, player1GamerTag, player2Score, player2Txd, player2GamerTag, player3Score, player3Txd, player3GamerTag, player4Score, player4Txd, player4GamerTag, localPlayerIndex)
   {
      this.HIDE_LOADING_SCREEN();
      this.HIDE_LOBBY();
      this.initHUDPlayer(this.CONTENT.hud.player1,player1Score,player1Txd,player1GamerTag,localPlayerIndex == 0);
      this.initHUDPlayer(this.CONTENT.hud.player2,player2Score,player2Txd,player2GamerTag,localPlayerIndex == 1);
      this.initHUDPlayer(this.CONTENT.hud.player3,player3Score,player3Txd,player3GamerTag,localPlayerIndex == 2);
      this.initHUDPlayer(this.CONTENT.hud.player4,player4Score,player4Txd,player4GamerTag,localPlayerIndex == 3);
      var _loc8_ = (player1Score >= 0) + (player2Score >= 0) + (player3Score >= 0) + (player4Score >= 0);
      var _loc5_ = 200;
      var _loc7_ = 640;
      var _loc4_ = _loc7_ - 0.5 * (_loc8_ - 1) * _loc5_;
      var _loc2_ = 1;
      var _loc3_;
      while(_loc2_ <= 4)
      {
         _loc3_ = this.CONTENT.hud["player" + _loc2_];
         if(_loc3_._visible)
         {
            _loc3_._x = _loc4_;
            _loc4_ += _loc5_;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.CONTENT.hud._visible = true;
   }
   function HIDE_HUD()
   {
      this.CONTENT.hud._visible = false;
   }
   function SET_MICS(player1Mic, player2Mic, player3Mic, player4Mic)
   {
      var _loc3_ = 1;
      while(_loc3_ <= 4)
      {
         this.setMic(this.CONTENT.hud["player" + _loc3_].mic,arguments[_loc3_ - 1]);
         this.setMic(this.CONTENT.lobby["player" + _loc3_].mic,arguments[_loc3_ - 1]);
         _loc3_ = _loc3_ + 1;
      }
   }
   function initLobbyPlayer(mc, txd, gamerTag, isLocal)
   {
      mc.tick._visible = false;
      mc.cross._visible = false;
      if(gamerTag != undefined)
      {
         mc.gamerTag.text = gamerTag;
      }
      this.addImage(txd,txd,mc.image.tf);
   }
   function updateLobbyPlayer(mc, action)
   {
      var _loc1_ = new flash.geom.ColorTransform();
      if(action == com.rockstargames.gtav.minigames.dontcrosstheline.DONT_CROSS_THE_LINE.ACTION_CROSS)
      {
         _loc1_.rgb = 16711680;
      }
      else if(action == com.rockstargames.gtav.minigames.dontcrosstheline.DONT_CROSS_THE_LINE.ACTION_TICK)
      {
         _loc1_.rgb = 65280;
      }
      mc.bg.transform.colorTransform = _loc1_;
   }
   function initHUDPlayer(mc, score, txd, gamerTag, isLocal)
   {
      mc._visible = score >= 0;
      if(score != undefined)
      {
         mc.score.text = score.toString();
      }
      if(gamerTag != undefined)
      {
         mc.gamerTag.text = gamerTag;
      }
      mc.mic._x = mc.score._x + mc.score._width - 0.5 * (mc.score._width - mc.score.textWidth) + 8;
   }
   function addImage(txd, id, imageTextField)
   {
      if(txd == "")
      {
         imageTextField.text = "";
      }
      if(txd == undefined || txd == "")
      {
         return undefined;
      }
      if(this.txdRefs[txd] != "loading")
      {
         com.rockstargames.ui.game.GameInterface.call("REQUEST_TXD_AND_ADD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"DONT_CROSS_THE_LINE",txd,id,true);
         this.txdRefs[txd] = "loading";
      }
      this.imageQueue.push({txd:txd,id:id,path:String(imageTextField)});
   }
   function TXD_HAS_LOADED(txd)
   {
      this.txdRefs[txd] = "loaded";
      var _loc6_ = this.imageQueue.length - 1;
      var _loc7_;
      var _loc5_;
      var _loc4_;
      var _loc3_;
      while(_loc6_ >= 0)
      {
         _loc7_ = this.imageQueue[_loc6_];
         if(_loc7_.txd == txd)
         {
            _loc5_ = _loc7_.path.split(".");
            _loc4_ = _root;
            _loc3_ = 1;
            while(_loc3_ < _loc5_.length)
            {
               _loc4_ = _loc4_[_loc5_[_loc3_]];
               _loc3_ = _loc3_ + 1;
            }
            if(_loc4_)
            {
               this.displayImage(txd,_loc7_.id,TextField(_loc4_));
            }
            this.imageQueue.splice(_loc6_,1);
         }
         _loc6_ = _loc6_ - 1;
      }
   }
   function clearImageQueue()
   {
      this.imageQueue.length = 0;
   }
   function displayImage(txd, id, imageTextField)
   {
      var _loc3_ = Math.round(imageTextField._width - 4);
      var _loc2_ = Math.round(imageTextField._height - 4);
      imageTextField.htmlText = "<img src=\'img://" + txd + "/" + id + "\' vspace=\'0\' hspace=\'0\' width=\'" + _loc3_ + "\' height=\'" + _loc2_ + "\'/>";
   }
   function setOutlineText(container, text, hudColourEnum, shrink)
   {
      text = text.toUpperCase();
      var _loc8_ = new flash.geom.ColorTransform();
      var _loc7_;
      var _loc9_;
      if(this.hudColourIsValid(hudColourEnum))
      {
         _loc7_ = new com.rockstargames.ui.utils.HudColour();
         com.rockstargames.ui.utils.Colour.setHudColour(hudColourEnum,_loc7_);
         _loc9_ = _loc7_.r << 16 | _loc7_.g << 8 | _loc7_.b;
         _loc8_.rgb = _loc9_;
      }
      container.fill.transform.colorTransform = _loc8_;
      container.fill.label.textAutoSize = !shrink ? "none" : "shrink";
      container.fill.label.text = text;
      var _loc2_ = 1;
      var _loc3_;
      while(_loc2_ <= 16)
      {
         _loc3_ = container["border" + _loc2_];
         _loc3_.textAutoSize = !shrink ? "none" : "shrink";
         _loc3_.text = text;
         _loc2_ = _loc2_ + 1;
      }
   }
   function hudColourIsValid(hudColour)
   {
      return hudColour == com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PURE_WHITE || hudColour == com.rockstargames.ui.utils.HudColour.HUD_COLOUR_DEGEN_RED || hudColour == com.rockstargames.ui.utils.HudColour.HUD_COLOUR_DEGEN_YELLOW || hudColour == com.rockstargames.ui.utils.HudColour.HUD_COLOUR_DEGEN_GREEN || hudColour == com.rockstargames.ui.utils.HudColour.HUD_COLOUR_DEGEN_CYAN || hudColour == com.rockstargames.ui.utils.HudColour.HUD_COLOUR_DEGEN_BLUE || hudColour == com.rockstargames.ui.utils.HudColour.HUD_COLOUR_DEGEN_MAGENTA;
   }
   function setMic(mc, iconEnum)
   {
      switch(iconEnum)
      {
         case com.rockstargames.gtav.minigames.dontcrosstheline.DONT_CROSS_THE_LINE.MIC_ACTIVE:
            mc.gotoAndStop("active");
            return;
         case com.rockstargames.gtav.minigames.dontcrosstheline.DONT_CROSS_THE_LINE.MIC_INACTIVE:
            mc.gotoAndStop("inactive");
            return;
         case com.rockstargames.gtav.minigames.dontcrosstheline.DONT_CROSS_THE_LINE.MIC_MUTED:
            mc.gotoAndStop("muted");
            return;
         default:
            mc.gotoAndStop("hidden");
            return;
      }
   }
}

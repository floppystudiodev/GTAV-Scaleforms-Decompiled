class com.rockstargames.gtav.hud.hudComponents.HUD_RADIO_STATIONS_WHEEL extends com.rockstargames.ui.hud.HUD_COMPONENT
{
   var TIMELINE;
   var CONTENT;
   var BOUNDING_BOX;
   var m_bQuickSelectMode;
   var stationDisplayMC;
   var stationNameTF;
   var artistMC;
   var trackMC;
   var shareTF;
   var sharedTF;
   var blipLayer;
   var stationList;
   var stationRingMC;
   var playingOutlineMC;
   var _HUD;
   var _enumID;
   var baseOffset = 0;
   var bounds = 720;
   function HUD_RADIO_STATIONS_WHEEL()
   {
      super();
   }
   function INITIALISE(mc)
   {
      this.TIMELINE = this;
      this.CONTENT = this.TIMELINE.CONTENT;
      this.BOUNDING_BOX = this.TIMELINE.BOUNDING_BOX;
      this.BOUNDING_BOX._visible = false;
      this.m_bQuickSelectMode = false;
      this.stationDisplayMC = this.CONTENT.attachMovie("shareWindow","shareWindowMC",0,{_x:this.BOUNDING_BOX._width * 0.5,_y:this.BOUNDING_BOX._height * 0.5});
      this.stationNameTF = this.stationDisplayMC.stationTF;
      this.artistMC = this.stationDisplayMC.artistMC;
      this.trackMC = this.stationDisplayMC.trackMC;
      this.shareTF = this.stationDisplayMC.shareTF;
      this.shareTF.autoSize = "left";
      this.sharedTF = this.stationDisplayMC.sharedTF;
      if(this.blipLayer)
      {
         this.blipLayer.removeMovieClip();
      }
      this.blipLayer = this.stationDisplayMC.createEmptyMovieClip("blipLayer",1000);
      var _loc2_ = new com.rockstargames.ui.utils.Text();
      _loc2_.setTextWithIcons("RADIO_SHARE",this.blipLayer,this.shareTF,0,14,2,false);
      com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.sharedTF,"RADIO_SHARED",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,true);
      this.shareTF._x = (this.shareTF._width + this.blipLayer._width * 0.5) * -0.5;
      this.blipLayer._x = this.shareTF._x + this.shareTF._width + 140;
      this.blipLayer._y += 8;
      this.shareTF._visible = this.blipLayer._visible = false;
      this.sharedTF._visible = false;
      this.HIDE_CURRENTLY_PLAYING();
      this.stationList = [];
   }
   function clearStations()
   {
      if(this.stationRingMC != undefined)
      {
         this.stationRingMC.removeMovieClip();
      }
   }
   function drawStations()
   {
      if(this.stationList.length > 0)
      {
         this.clearStations();
         var _loc6_ = 360 / this.stationList.length;
         var _loc4_ = this.stationList.length <= 18 ? 100 : 95;
         this.stationRingMC = this.CONTENT.createEmptyMovieClip("stationRingMC",1);
         this.stationRingMC._x = this.stationRingMC._y = this.bounds * 0.5;
         this.playingOutlineMC = this.stationRingMC.attachMovie("highlightRing","stationRing",100,{_xscale:_loc4_,_yscale:_loc4_});
         if(this._HUD.charColourEnum)
         {
            com.rockstargames.ui.utils.Colour.ApplyHudColour(this.playingOutlineMC,this._HUD.charColourEnum);
         }
         var _loc2_ = 0;
         while(_loc2_ < this.stationList.length)
         {
            if(this.stationList[_loc2_] == "MO_RADOFF")
            {
               this.baseOffset = _loc2_ * _loc6_ - 180;
               break;
            }
            _loc2_ = _loc2_ + 1;
         }
         var _loc3_ = 0;
         var _loc5_ = 190;
         var _loc9_ = 0;
         var _loc8_ = 0;
         var _loc7_ = 0.0174532925199433;
         _loc2_ = 0;
         while(_loc2_ < this.stationList.length)
         {
            _loc3_ = _loc6_ * _loc2_ - this.baseOffset;
            _loc9_ = Math.sin(_loc3_ * _loc7_) * _loc5_;
            _loc8_ = (- Math.cos(_loc3_ * _loc7_)) * _loc5_;
            this.stationRingMC.attachMovie(this.stationList[_loc2_],this.stationList[_loc2_],_loc2_ + 2,{_x:_loc9_,_y:_loc8_,_xscale:_loc4_,_yscale:_loc4_});
            _loc2_ = _loc2_ + 1;
         }
      }
   }
   function SET_RADIO_STATIONS(params)
   {
      this.stationList = params;
      this.drawStations();
      var _loc2_ = 90;
      this.artistMC.setDelayTimeout(_loc2_);
      this.trackMC.setDelayTimeout(_loc2_);
   }
   function QUICK_SELECT_RADIO_STATION(params)
   {
      var _loc6_ = 386;
      this.stationRingMC._y = _loc6_;
      this.stationDisplayMC._y = 280;
      this.m_bQuickSelectMode = true;
      var _loc3_ = params[0];
      var _loc4_ = this.stationRingMC[this.stationList[_loc3_]];
      if(_loc3_ != undefined && _loc3_ >= 0)
      {
         var _loc2_ = 0;
         while(_loc2_ < this.stationList.length)
         {
            this.stationRingMC[this.stationList[_loc2_]]._visible = false;
            this.stationRingMC[this.stationList[_loc2_]]._alpha = 30;
            _loc2_ = _loc2_ + 1;
         }
         this.playingOutlineMC._visible = true;
         this.playingOutlineMC._x = _loc4_._x;
         this.playingOutlineMC._y = _loc4_._y;
         _loc4_._visible = true;
         _loc4_._alpha = 100;
         var _loc5_ = _loc3_ * (360 / this.stationList.length) - this.baseOffset;
         this.stationRingMC._rotation = - _loc5_;
         _loc4_._rotation = _loc5_;
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.stationNameTF,this.stationList[_loc3_]);
         com.rockstargames.ui.game.GameInterface.call("VIBRATE_PAD",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,-50,0.08,200);
      }
      else
      {
         this.playingOutlineMC._visible = false;
      }
      this.SHOW();
   }
   function SELECT_RADIO_STATION(params)
   {
      var _loc3_ = params[0];
      if(this.m_bQuickSelectMode)
      {
         this.stationRingMC._rotation = 0;
         this.stationRingMC._y = this.bounds * 0.5;
         var _loc2_ = 0;
         while(_loc2_ < this.stationList.length)
         {
            this.stationRingMC[this.stationList[_loc2_]]._rotation = 0;
            this.stationRingMC[this.stationList[_loc2_]]._visible = true;
            _loc2_ = _loc2_ + 1;
         }
         this.m_bQuickSelectMode = false;
         this.stationDisplayMC._y = this.BOUNDING_BOX._height * 0.5;
      }
      if(_loc3_ != undefined)
      {
         if(_loc3_ >= 0)
         {
            var _loc4_ = this.stationRingMC[this.stationList[_loc3_]];
            this.playingOutlineMC._x = _loc4_._x;
            this.playingOutlineMC._y = _loc4_._y;
            this.playingOutlineMC._visible = true;
            _loc2_ = 0;
            while(_loc2_ < this.stationList.length)
            {
               this.stationRingMC[this.stationList[_loc2_]]._alpha = 30;
               _loc2_ = _loc2_ + 1;
            }
            _loc4_._alpha = 100;
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.stationNameTF,this.stationList[_loc3_]);
            com.rockstargames.ui.game.GameInterface.call("VIBRATE_PAD",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,-50,0.08,200);
         }
         else
         {
            this.playingOutlineMC._visible = false;
         }
      }
      this.SHOW();
   }
   function SET_CURRENTLY_PLAYING(params)
   {
      var _loc3_ = params[0];
      var _loc2_ = params[1];
      var _loc4_ = params[2];
      this.stationDisplayMC._visible = true;
      this.sharedTF._visible = false;
      this.shareTF._visible = this.blipLayer._visible = _loc4_;
      if(_loc3_ != undefined)
      {
         this.artistMC.txtString.text = _loc3_;
         this.artistMC._visible = true;
      }
      if(_loc2_ != undefined)
      {
         this.trackMC.txtString.text = _loc2_;
         this.trackMC._visible = true;
      }
   }
   function SET_AS_SHARED()
   {
      this.sharedTF._visible = true;
      this.shareTF._visible = this.blipLayer._visible = false;
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.CONTENT,2,{onComplete:this.hideShared,onCompleteScope:this});
   }
   function hideShared()
   {
      this.sharedTF._visible = false;
   }
   function HIDE_CURRENTLY_PLAYING()
   {
      this.artistMC._visible = false;
      this.trackMC._visible = false;
   }
   function SHOW()
   {
      this.CONTENT._visible = true;
   }
   function HIDE()
   {
      this.CONTENT._visible = false;
      this.REMOVE();
   }
   function HIDE_RADIO_STATIONS()
   {
      this.HIDE();
   }
   function REMOVE()
   {
      this.clearStations();
      this._HUD.REMOVE_HUD_ITEM(this._enumID);
   }
}

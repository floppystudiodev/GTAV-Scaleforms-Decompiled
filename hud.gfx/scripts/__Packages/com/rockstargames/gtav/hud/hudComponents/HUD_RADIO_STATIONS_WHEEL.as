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
   var stationNameTFOutline;
   var artistMCOutline;
   var trackMCOutline;
   var shareTFOutline;
   var sharedTFOutline;
   var blipLayer;
   var blipLayerOutline;
   var stationList;
   var stationRingMC;
   var playingOutlineMC;
   var _HUD;
   var _enumID;
   var baseOffset = 0;
   var bounds = 720;
   var DEFAUL_Z_VALUE = 2;
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
      this.stationDisplayMC = this.CONTENT.attachMovie("shareWindow","shareWindowMC",0,{_x:this.BOUNDING_BOX._width * 0.5,_y:this.BOUNDING_BOX._height * 0.5,_z:this.DEFAUL_Z_VALUE});
      this.stationNameTF = this.stationDisplayMC.stationTF;
      this.artistMC = this.stationDisplayMC.artistMC;
      this.trackMC = this.stationDisplayMC.trackMC;
      this.shareTF = this.stationDisplayMC.shareTF;
      this.sharedTF = this.stationDisplayMC.sharedTF;
      this.stationNameTFOutline = this.stationDisplayMC.stationTFOutline;
      this.artistMCOutline = this.stationDisplayMC.artistMCOutline;
      this.trackMCOutline = this.stationDisplayMC.trackMCOutline;
      this.shareTFOutline = this.stationDisplayMC.shareTFOutline;
      this.sharedTFOutline = this.stationDisplayMC.sharedTFOutline;
      com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.sharedTF,"RADIO_SHARED",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,true);
      com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.sharedTFOutline,"RADIO_SHARED",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,true);
      this.shareTF._visible = this.shareTFOutline._visible = this.blipLayer._visible = this.blipLayerOutline._visible = false;
      this.sharedTF._visible = this.sharedTFOutline._visible = false;
      this.HIDE_CURRENTLY_PLAYING();
      this.stationList = [];
      this.CONTENT._visible = false;
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
      var _loc15_ = 250;
      var _loc4_ = this.stationList.length;
      if(_loc4_ > 0)
      {
         this.clearStations();
         this.stationRingMC = this.CONTENT.createEmptyMovieClip("stationRingMC",1);
         this.stationRingMC._x = this.stationRingMC._y = this.bounds * 0.5;
         this.stationRingMC._z = this.DEFAUL_Z_VALUE;
         this.playingOutlineMC = this.stationRingMC.attachMovie("highlightRing","stationRing",100,{_z:this.DEFAUL_Z_VALUE});
         if(this._HUD.charColourEnum)
         {
            com.rockstargames.ui.utils.Colour.ApplyHudColour(this.playingOutlineMC,this._HUD.charColourEnum);
         }
         var _loc17_ = 0.45 * this.playingOutlineMC._width;
         var _loc9_ = 3.141592653589793 / _loc4_;
         var _loc16_ = Math.sin(_loc9_);
         var _loc8_ = 100;
         var _loc7_ = _loc17_ / _loc16_;
         if(_loc7_ + _loc17_ > _loc15_)
         {
            var _loc18_ = _loc15_ * _loc16_ / (_loc16_ + 1);
            _loc8_ *= _loc18_ / _loc17_;
            _loc7_ = _loc15_ - _loc18_;
            this.playingOutlineMC._xscale = this.playingOutlineMC._yscale = _loc8_;
         }
         _loc9_ *= 2;
         var _loc3_ = 0;
         var _loc2_ = 0;
         while(_loc2_ < _loc4_)
         {
            if(this.stationList[_loc2_] == "MO_RADOFF")
            {
               _loc3_ = 1.5707963267948966 - _loc2_ * _loc9_;
               this.baseOffset = _loc2_ * 360 / _loc4_ - 180;
               break;
            }
            _loc2_ = _loc2_ + 1;
         }
         if(_loc7_ < 140)
         {
            _loc7_ = 140;
         }
         _loc2_ = 0;
         while(_loc2_ < _loc4_)
         {
            var _loc6_ = _loc7_ * Math.cos(_loc3_);
            var _loc5_ = _loc7_ * Math.sin(_loc3_);
            this.stationRingMC.attachMovie(this.stationList[_loc2_],this.stationList[_loc2_],_loc2_ + 2,{_x:_loc6_,_y:_loc5_,_z:this.DEFAUL_Z_VALUE,_xscale:_loc8_,_yscale:_loc8_});
            _loc2_ = _loc2_ + 1;
            _loc3_ += _loc9_;
         }
      }
   }
   function SET_RADIO_STATIONS(params)
   {
      this.stationList = params;
   }
   function SET_ADDITIONAL_RADIO_STATIONS(params)
   {
      this.stationList = this.stationList.concat(params);
   }
   function DRAW_RADIO_STATIONS()
   {
      this.drawStations();
      var _loc2_ = 90;
      this.artistMC.setDelayTimeout(_loc2_);
      this.trackMC.setDelayTimeout(_loc2_);
      this.artistMCOutline.setDelayTimeout(_loc2_);
      this.trackMCOutline.setDelayTimeout(_loc2_);
   }
   function QUICK_SELECT_RADIO_STATION(params)
   {
      this.stationDisplayMC._y = 282;
      this.stationRingMC._y = this.stationDisplayMC._y + this.stationRingMC._height / 2 - 130;
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
         this.stationNameTFOutline.text = this.stationNameTF.text;
         com.rockstargames.ui.game.GameInterface.call("VIBRATE_PAD",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,100,0.08,200);
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
            this.stationNameTFOutline.text = this.stationNameTF.text;
            com.rockstargames.ui.game.GameInterface.call("VIBRATE_PAD",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,100,0.08,200);
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
      this.sharedTF._visible = this.sharedTFOutline._visible = false;
      this.shareTF._visible = this.shareTFOutline._visible = this.blipLayer._visible = this.blipLayerOutline._visible = _loc4_;
      if(_loc3_ != undefined)
      {
         this.artistMC.txtString.text = this.artistMCOutline.txtString.text = !this.m_bQuickSelectMode ? _loc3_ : com.rockstargames.gtav.utils.GTAVUIUtils.trimTextToFit(_loc3_,this.artistMC.txtString);
         this.artistMC._visible = this.artistMCOutline._visible = true;
      }
      if(_loc2_ != undefined)
      {
         this.trackMC.txtString.text = this.trackMCOutline.txtString.text = !this.m_bQuickSelectMode ? _loc2_ : com.rockstargames.gtav.utils.GTAVUIUtils.trimTextToFit(_loc2_,this.trackMC.txtString);
         this.trackMC._visible = this.trackMCOutline._visible = true;
      }
   }
   function SET_AS_SHARED()
   {
      this.sharedTF._visible = this.sharedTFOutline._visible = true;
      this.shareTF._visible = this.shareTFOutline._visible = this.blipLayer._visible = this.blipLayerOutline._visible = false;
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.CONTENT,2,{onComplete:this.hideShared,onCompleteScope:this});
   }
   function hideShared()
   {
      this.sharedTF._visible = this.sharedTFOutline._visible = false;
   }
   function HIDE_CURRENTLY_PLAYING()
   {
      this.artistMC._visible = this.artistMCOutline._visible = false;
      this.trackMC._visible = this.trackMCOutline._visible = false;
   }
   function SHOW()
   {
      if(!this.CONTENT._visible)
      {
         if(this.blipLayer)
         {
            this.blipLayer.removeMovieClip();
         }
         this.blipLayer = this.stationDisplayMC.createEmptyMovieClip("blipLayer",1001);
         if(this.blipLayerOutline)
         {
            this.blipLayerOutline.removeMovieClip();
         }
         this.blipLayerOutline = this.stationDisplayMC.createEmptyMovieClip("blipLayerOutline",1000);
         var _loc6_ = new com.rockstargames.ui.utils.Text();
         _loc6_.setTextWithIcons("RADIO_SHARE",this.blipLayer,this.shareTF,6,16,2,true,true);
         _loc6_.setTextWithIcons("RADIO_SHARE",this.blipLayerOutline,this.shareTFOutline,6,16,2,true,true);
         this.blipLayerOutline._visible = this.blipLayer._visible = this.shareTF._visible;
         var _loc3_ = 2.5;
         com.rockstargames.ui.utils.Colour.Colourise(this.blipLayerOutline,0,0,0,100);
         for(var _loc5_ in this.blipLayerOutline)
         {
            var _loc2_ = this.blipLayerOutline[_loc5_];
            _loc2_._width += _loc3_;
            _loc2_._height += _loc3_;
            _loc2_._x -= 0.5;
         }
         if(this._HUD.NEEDS_BIGGER_HELP_AND_SUBTITLES)
         {
            var _loc4_ = 40;
            this.stationNameTF._height = _loc4_;
            this.stationNameTFOutline._height = _loc4_;
            this.artistMC.txtString._height = _loc4_;
            this.artistMCOutline.txtString._height = _loc4_;
            this.trackMC.txtString._height = _loc4_;
            this.trackMCOutline.txtString._height = _loc4_;
            this.shareTF._height = _loc4_;
            this.shareTFOutline._height = _loc4_;
            this.sharedTF._height = _loc4_;
            this.sharedTFOutline._height = _loc4_;
         }
      }
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

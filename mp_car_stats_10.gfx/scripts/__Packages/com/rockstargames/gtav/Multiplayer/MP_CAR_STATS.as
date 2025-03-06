class com.rockstargames.gtav.Multiplayer.MP_CAR_STATS extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
   var FILE_NAME;
   var CONTENT;
   var loaderObject;
   var playerName;
   var _texture;
   var thisObj;
   function MP_CAR_STATS()
   {
      super();
      this.FILE_NAME = "MP_CAR_STATS_01";
   }
   function INITIALISE(mc, fileName)
   {
      _global.gfxExtensions = true;
      this.FILE_NAME = fileName;
      super.INITIALISE(mc);
      this.CONTENT._alpha = 0;
      this.CONTENT._x = 521;
      this.CONTENT._y = 557;
      this.loaderObject = new Object();
      this.playerName = "";
   }
   function SET_VEHICLE_INFOR_AND_STATS(vehicleInfo, vehicleDetails, logoTXD, logoTexture, statStr1, statStr2, statStr3, statStr4, statVal1, statVal2, statVal3, statVal4)
   {
      this._texture = logoTexture;
      if(logoTXD != "")
      {
         com.rockstargames.ui.game.GameInterface.call("REQUEST_TXD_AND_ADD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.FILE_NAME,logoTXD);
      }
      this.CONTENT.vehicleInfoTF.textAutoSize = "shrink";
      this.CONTENT.vehicleDetailsTF.textAutoSize = "shrink";
      this.CONTENT.vehicleInfoTF.text = vehicleInfo;
      this.CONTENT.vehicleDetailsTF.text = vehicleDetails;
      this.setBars(1,statVal1);
      this.setBars(2,statVal2);
      this.setBars(3,statVal3);
      this.setBars(4,statVal4);
      this.CONTENT.statStrTF1.htmlText = statStr1;
      this.CONTENT.statStrTF2.htmlText = statStr2;
      this.CONTENT.statStrTF3.htmlText = statStr3;
      this.CONTENT.statStrTF4.htmlText = statStr4;
      this.CONTENT.ownerNameTF.htmlText = "";
      this.CONTENT.crewTag._visible = false;
      this.CONTENT._alpha = 100;
   }
   function SET_PLAYER_NAME(str)
   {
      this.playerName = str;
      this.CONTENT.vehicleDetailsTF.text = "";
      this.setCrewTagPosition();
   }
   function SET_CREW_NAME(str)
   {
      this.CONTENT.crewTag.UNPACK_CREW_TAG(str);
      this.CONTENT.crewTag._visible = true;
      this.CONTENT.vehicleDetailsTF.text = "";
      this.setCrewTagPosition();
   }
   function setCrewTagPosition()
   {
      if(this.CONTENT.crewTag._visible)
      {
         this.CONTENT.ownerNameTF._width = 133;
      }
      else
      {
         this.CONTENT.ownerNameTF._width = 184;
      }
      com.rockstargames.gtav.Multiplayer.MP_CAR_STATS.truncate(this.CONTENT.ownerNameTF,this.playerName,"left",0);
      this.CONTENT.crewTag._x = Math.min(this.CONTENT.ownerNameTF._x + this.CONTENT.ownerNameTF.textWidth + 15,148);
   }
   function setBars(barID, percentage)
   {
      var _loc2_ = this.CONTENT["statValMC" + barID];
      var _loc4_ = _loc2_.sect5;
      _loc2_.sect2._visible = false;
      _loc2_.sect3._visible = false;
      _loc2_.sect4._visible = false;
      _loc2_.sect5._visible = false;
      _loc2_.sect1._xscale = 100;
      _loc2_.sect2._xscale = 100;
      _loc2_.sect3._xscale = 100;
      _loc2_.sect4._xscale = 100;
      _loc2_.sect5._xscale = 100;
      var _loc5_ = 20;
      var _loc6_ = percentage % _loc5_;
      if(percentage <= 20)
      {
         _loc2_.sect1._xscale = percentage / _loc5_ * 100;
      }
      if(percentage > 20)
      {
         _loc4_ = _loc2_.sect2;
         _loc2_.sect2._visible = true;
      }
      if(percentage > 40)
      {
         _loc4_ = _loc2_.sect3;
         _loc2_.sect3._visible = true;
      }
      if(percentage > 60)
      {
         _loc4_ = _loc2_.sect4;
         _loc2_.sect4._visible = true;
      }
      if(percentage > 80)
      {
         _loc4_ = _loc2_.sect5;
         _loc2_.sect5._visible = true;
      }
      if(_loc6_ > 0)
      {
         _loc4_._xscale = _loc6_ / _loc5_ * 100;
      }
   }
   function TXD_HAS_LOADED(textureDict, success)
   {
      if(success)
      {
         this.loadTexture(textureDict,this._texture);
      }
   }
   function loadTexture(txd, texture)
   {
      var thisObj = this;
      this.loaderObject._depth = 100;
      this.loaderObject._mc = this.CONTENT.image_placeholderMC;
      this.loaderObject._loader = new MovieClipLoader();
      this.loaderObject._listener = new Object();
      this.loaderObject._loader.addListener(this.loaderObject._listener);
      this.loaderObject._listener.thisObj = thisObj;
      this.loaderObject._listener.onLoadInit = function(target_mc)
      {
         var _loc2_ = this.thisObj.loaderObject;
         _loc2_._loader.removeListener(_loc2_._listener);
         _loc2_._loader = null;
      };
      var _loc3_ = "img://" + txd + "/" + texture;
      this.loaderObject._loader.loadClip(_loc3_,this.loaderObject._mc);
   }
   function debug()
   {
      this.SET_VEHICLE_INFOR_AND_STATS("Vacca","Tracked and Registered","MPCarHUD","Pegassi","Top Speed","Accelrations","Braking","Traction",21,41,61,81);
   }
   static function truncate(tf, txt, autoSize, letterSpacing)
   {
      tf.text = txt;
      if(!isNaN(letterSpacing))
      {
         var _loc3_ = tf.getTextFormat();
         _loc3_.letterSpacing = letterSpacing;
         tf.setTextFormat(_loc3_);
      }
      if(tf.textWidth > tf._width)
      {
         var _loc6_ = tf._width;
         tf.autoSize = autoSize;
         var _loc2_ = txt.length;
         while(_loc2_ > 0)
         {
            tf.text = txt.substring(0,_loc2_) + "...";
            if(!isNaN(letterSpacing))
            {
               _loc3_ = tf.getTextFormat();
               _loc3_.letterSpacing = letterSpacing;
               tf.setTextFormat(_loc3_);
            }
            if(tf._width <= _loc6_)
            {
               break;
            }
            _loc2_ = _loc2_ - 1;
         }
         tf.autoSize = "none";
         tf._width = _loc6_;
      }
   }
}

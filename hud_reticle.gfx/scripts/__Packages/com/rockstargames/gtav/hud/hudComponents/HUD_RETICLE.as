class com.rockstargames.gtav.hud.hudComponents.HUD_RETICLE extends com.rockstargames.ui.hud.HUD_COMPONENT
{
   var DEFAULT_COLOUR;
   var STYLES;
   var CONTENT;
   var reticleMC;
   var hitmarker;
   var homingScopeMC;
   var reticleFrame;
   var hideTextTimeout;
   var FLASH_COLOUR;
   var _enumID;
   var _HUD;
   var weaponID = 0;
   var screenWidth = 1280;
   var screenHeight = 720;
   var FLASH_DURATION = 0.5;
   var hasAccuracyAnim = false;
   var hasReticleData = false;
   var hasCompass = false;
   var IsUsingRemotePlay = false;
   var dotScaler = 100;
   var simpleReticuleBoost = 1;
   var WEAPON_INVALID = 946056827;
   var WEAPON_UNARMED = -318101735;
   var WEAPONTYPE_SMG = 1358501004;
   var WEAPONTYPE_RIFLE = -1105352287;
   var WEAPONTYPE_SHOTGUN = 1234424921;
   var WEAPON_THROWN = 963175564;
   var WEAPON_PISTOL = 453432689;
   var WEAPON_PROGRAMMABLE_AR = -409475165;
   var WEAPON_HEAVY_RPG = 610367993;
   var WEAPON_HEAVY_GRENADE_LAUNCHER = -135852371;
   var WEAPON_TANK = -1073134675;
   var WEAPON_VULKAN_GUNS = -33414211;
   var SIMPLE_RETICLE = 90280964;
   var SIMPLE_MP_RETICLE = 144449218;
   var SNIPER_MAX = -740620376;
   var SNIPER_LARGE = -1013321135;
   var COCKPIT_VIEW = 1931187857;
   var VULKAN_ROCKET = -807018074;
   var VULKAN_ROCKET_COCKPIT_VIEW = -199376390;
   var HOMING_LAUNCHER = 1672152130;
   var WEAPON_BOTTLE = -102323637;
   var WEAPON_GEWEHR = -700798279;
   var ACCURACY_SCALAR_TO_PX = 2.5;
   var reticleChanged = false;
   var DEFAULT_Z_VALUE = 1;
   function HUD_RETICLE()
   {
      super();
      this.DEFAULT_COLOUR = [225,225,225,100];
      var _loc4_ = [194,80,80,100];
      var _loc6_ = [225,225,225,50];
      var _loc5_ = [155,155,155,50];
      var _loc3_ = [80,194,80,100];
      this.STYLES = [this.DEFAULT_COLOUR,_loc4_,_loc6_,_loc5_,_loc3_];
      this.READY(com.rockstargames.gtav.constants.HudComponentConstants.HUD_RETICLE);
   }
   function READY(id)
   {
      super.READY(id);
      this.CONTENT._visible = false;
      this.reticleMC = this.CONTENT.reticleMC;
      this.hitmarker = this.reticleMC.hitmarker;
      this.homingScopeMC = this.CONTENT.HOMING_SCOPE;
      this.homingScopeMC._z = this.DEFAULT_Z_VALUE;
      this.reticleMC.hitmarkerMC._z = this.DEFAULT_Z_VALUE;
      this.reticleMC.hitmarker._z = this.DEFAULT_Z_VALUE;
      this.reticleMC.reticle._z = this.DEFAULT_Z_VALUE;
      this.reticleMC.reticleSniperMC._z = this.DEFAULT_Z_VALUE;
      this.reticleMC.zoomMC.markerMC._z = this.DEFAULT_Z_VALUE;
      this.hitmarker._z = this.DEFAULT_Z_VALUE;
   }
   function LOAD_RETICLE()
   {
      this.CONTENT._visible = false;
   }
   function SET_RETICLE_TYPE_EXTERNAL(weaponID, hasAccuracyAnim, hasReticleData, hasCompass, isSniper)
   {
      this.SET_RETICLE_TYPE([weaponID,hasAccuracyAnim,hasReticleData,hasCompass,isSniper]);
   }
   function SET_RETICLE_TYPE(params)
   {
      this.STOP_FLASHING_RETICLE();
      this.weaponID = params[0];
      this.hasAccuracyAnim = params[1];
      this.hasReticleData = params[2];
      this.hasCompass = params[3];
      var _loc3_ = params[4];
      var _loc2_ = undefined;
      var _loc4_ = 1;
      switch(this.weaponID)
      {
         case this.WEAPON_INVALID:
            _loc2_ = "WEAPON_INVALID";
            break;
         case this.WEAPON_UNARMED:
            _loc2_ = "WEAPON_UNARMED";
            break;
         case this.WEAPONTYPE_SMG:
            this.hasAccuracyAnim = true;
            _loc2_ = "WEAPONTYPE_SMG";
            break;
         case this.WEAPONTYPE_RIFLE:
            this.hasAccuracyAnim = true;
            _loc2_ = "WEAPONTYPE_RIFLE";
            break;
         case this.WEAPONTYPE_SHOTGUN:
            this.hasAccuracyAnim = true;
            _loc2_ = "WEAPONTYPE_SHOTGUN";
            break;
         case this.WEAPON_THROWN:
            _loc2_ = "WEAPON_THROWN";
            break;
         case this.WEAPON_PROGRAMMABLE_AR:
            _loc2_ = "WEAPON_PROGRAMMABLE_AR";
            _loc3_ = true;
            this.hasReticleData = true;
            break;
         case this.WEAPON_HEAVY_RPG:
            _loc2_ = "WEAPON_HEAVY_RPG";
            this.hasAccuracyAnim = true;
            break;
         case this.WEAPON_HEAVY_GRENADE_LAUNCHER:
            _loc2_ = "WEAPON_HEAVY_GRENADE_LAUNCHER";
            break;
         case this.WEAPON_TANK:
            _loc2_ = "WEAPON_TANK";
            break;
         case this.WEAPON_VULKAN_GUNS:
            _loc2_ = "WEAPON_VULKAN_GUNS";
            break;
         case this.SIMPLE_RETICLE:
            _loc2_ = "SIMPLE_RETICLE";
            _loc4_ = this.simpleReticuleBoost;
            break;
         case this.SIMPLE_MP_RETICLE:
            _loc2_ = "SIMPLE_MP_RETICLE";
            _loc4_ = this.simpleReticuleBoost;
            break;
         case this.SNIPER_MAX:
            _loc2_ = "WEAPON_SNIPER_HEAVY";
            _loc3_ = true;
            break;
         case this.SNIPER_LARGE:
            _loc2_ = "WEAPON_SNIPER";
            _loc3_ = true;
            break;
         case this.COCKPIT_VIEW:
            _loc2_ = "COCKPIT_VIEW";
            this.hasCompass = true;
            break;
         case this.VULKAN_ROCKET:
            _loc2_ = "WEAPON_VULKAN_ROCKETS";
            break;
         case this.VULKAN_ROCKET_COCKPIT_VIEW:
            _loc2_ = "VULKAN_ROCKET_COCKPIT_VIEW";
            this.hasCompass = true;
            break;
         case this.HOMING_LAUNCHER:
            _loc2_ = "HOMING_LAUNCHER";
            break;
         case this.WEAPON_PISTOL:
         default:
            _loc2_ = "WEAPON_PISTOL";
            this.weaponID = this.WEAPON_PISTOL;
      }
      this.reticleMC.gotoAndStop(_loc2_);
      if(this.IsUsingRemotePlay)
      {
         this.dotScaler = 150 * _loc4_;
      }
      else
      {
         this.dotScaler = 100 * _loc4_;
      }
      if(_loc2_ == "HOMING_LAUNCHER")
      {
         this.reticleMC.HOMING_SCOPE.reticle._z = this.DEFAULT_Z_VALUE;
         this.reticleMC.HOMING_SCOPE._z = this.DEFAULT_Z_VALUE;
      }
      if(_loc2_ != this.reticleFrame)
      {
         if((_loc2_ == "VULKAN_ROCKET_COCKPIT_VIEW" || _loc2_ == "COCKPIT_VIEW") && this.reticleFrame != "VULKAN_ROCKET_COCKPIT_VIEW" && this.reticleFrame != "COCKPIT_VIEW")
         {
            this.reticleChanged = true;
         }
         this.reticleFrame = _loc2_;
      }
      this.reticleMC.reticle._xscale = this.dotScaler;
      this.reticleMC.reticle._yscale = this.dotScaler;
      this.initSpreadComponents();
      this.reticleMC.hitmarkerMC._z = this.DEFAULT_Z_VALUE;
      this.reticleMC.hitmarker._z = this.DEFAULT_Z_VALUE;
      this.reticleMC.reticle._z = this.DEFAULT_Z_VALUE;
      this.reticleMC.zoomMC.markerMC._z = this.DEFAULT_Z_VALUE;
      this.reticleMC.reticleSniperMC._z = this.DEFAULT_Z_VALUE;
      if(_loc3_)
      {
         this.reticleMC.zoomMC.markerMC._visible = false;
      }
   }
   function initSpreadComponents()
   {
      var _loc2_ = undefined;
      var _loc5_ = 0;
      while(_loc2_ = this.reticleMC.reticle["positionalComponentMC" + _loc5_])
      {
         if(_loc2_.dx0 != undefined)
         {
            break;
         }
         var _loc4_ = _loc2_._x;
         var _loc3_ = _loc2_._y;
         _loc2_.dx0 = _loc2_._x;
         _loc2_.dy0 = _loc2_._y;
         _loc2_.d0 = Math.sqrt(_loc4_ * _loc4_ + _loc3_ * _loc3_);
         _loc5_ = _loc5_ + 1;
      }
   }
   function SET_RETICLE_ACCURACY_EXTERNAL(accuracyScalar)
   {
      this.SET_RETICLE_ACCURACY([accuracyScalar]);
   }
   function SET_RETICLE_ACCURACY(params)
   {
      var _loc8_ = params[0];
      var _loc7_ = _loc8_ * this.ACCURACY_SCALAR_TO_PX;
      var _loc6_ = 0;
      var _loc2_ = undefined;
      while(_loc2_ = this.reticleMC.reticle["positionalComponentMC" + _loc6_])
      {
         var _loc3_ = _loc2_.d0;
         var _loc5_ = _loc3_ + _loc7_;
         var _loc4_ = _loc5_ / _loc3_;
         _loc2_._x = _loc2_.dx0 * _loc4_;
         _loc2_._y = _loc2_.dy0 * _loc4_;
         _loc6_ = _loc6_ + 1;
      }
   }
   function SET_RETICLE_TEXT(params)
   {
      var _loc2_ = params[0];
      this.reticleMC.reticle.nameMC.nameTF.textAutoSize = "shrink";
      this.reticleMC.reticle.nameMC.nameTF.text = _loc2_.toUpperCase();
      if(_loc2_ != "")
      {
         clearTimeout(this.hideTextTimeout);
         var that = this;
         this.hideTextTimeout = setTimeout(function()
         {
            that.SET_RETICLE_TEXT([""]);
         }
         ,1000);
      }
   }
   function SET_SCOPE_LOCK_EXTERNAL(isLocked, lockedStr)
   {
      this.SET_SCOPE_LOCK([isLocked,lockedStr]);
   }
   function SET_SCOPE_LOCK(params)
   {
      if(this.hasReticleData)
      {
         var _loc0_ = null;
         if((_loc0_ = this.weaponID) === this.WEAPON_PROGRAMMABLE_AR)
         {
            var _loc2_ = params[0];
            var _loc3_ = params[1];
            this.reticleMC.reticle.lockedMC.gotoAndStop(int(_loc2_) + 1);
            if(_loc2_)
            {
               this.reticleMC.reticle.lockedMC.lockedTF.text = _loc3_;
            }
         }
      }
   }
   function SET_SCOPE_DIST_EXTERNAL(distStr, feetStr)
   {
      this.SET_SCOPE_DIST([distStr,feetStr]);
   }
   function SET_SCOPE_DIST(params)
   {
      if(this.hasReticleData)
      {
         var _loc0_ = null;
         if((_loc0_ = this.weaponID) === this.WEAPON_PROGRAMMABLE_AR)
         {
            var _loc3_ = params[0];
            var _loc2_ = params[1];
            this.reticleMC.reticle.distMC.distTF.text = _loc3_;
            this.reticleMC.reticle.distMC.feetTF.text = _loc2_;
         }
      }
   }
   function SET_RETICLE_ZOOM_EXTERNAL(zoomLevel)
   {
      this.SET_RETICLE_ZOOM([zoomLevel]);
   }
   function SET_RETICLE_ZOOM(params)
   {
      var _loc3_ = Math.max(0,Math.min(params[0],100));
      var _loc2_ = 0;
      switch(this.weaponID)
      {
         case this.SNIPER_MAX:
            _loc2_ = _loc3_ / 100 * 189;
            this.reticleMC.zoomMC.markerMC._x = _loc2_;
            if(!this.reticleMC.zoomMC.markerMC._visible)
            {
               this.reticleMC.zoomMC.markerMC._visible = true;
            }
            break;
         case this.SNIPER_LARGE:
         case this.WEAPON_PROGRAMMABLE_AR:
            _loc2_ = _loc3_ / 100 * 88;
            this.reticleMC.zoomMC.markerMC._x = _loc2_;
            if(!this.reticleMC.zoomMC.markerMC._visible)
            {
               this.reticleMC.zoomMC.markerMC._visible = true;
            }
      }
   }
   function START_DIM_RETICLE_EXTERNAL(newAlpha)
   {
      this.START_DIM_RETICLE([newAlpha]);
   }
   function START_DIM_RETICLE(params)
   {
      switch(this.weaponID)
      {
         case this.SNIPER_MAX:
         case this.SNIPER_LARGE:
         case this.WEAPON_PROGRAMMABLE_AR:
            break;
         default:
            this.STOP_FLASHING_RETICLE();
            var _loc2_ = params[0];
            this.reticleMC.reticle._alpha = _loc2_;
      }
   }
   function RESET_RETICLE_EXTERNAL()
   {
      this.RESET_RETICLE();
   }
   function RESET_RETICLE()
   {
      this.STOP_FLASHING_RETICLE();
      this.reticleMC.reticle._alpha = this.DEFAULT_COLOUR[3];
   }
   function START_FLASHING_RETICLE_EXTERNAL(r, g, b, a)
   {
      this.START_FLASHING_RETICLE([r,g,b,a]);
   }
   function START_FLASHING_RETICLE(params)
   {
      var _loc3_ = params[0];
      var _loc6_ = params[1];
      var _loc2_ = params[2];
      var _loc4_ = params[3];
      com.rockstargames.ui.utils.Colour.Colourise(this.reticleMC.reticle,_loc3_,_loc6_,_loc2_,_loc4_);
      this.FLASH_COLOUR = [_loc3_,_loc6_,_loc2_,_loc4_];
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.CONTENT,this.FLASH_DURATION,{onComplete:this.flashDefaultColour,onCompleteScope:this});
   }
   function SET_RETICULE_COLOR(params)
   {
      var _loc4_ = params[0];
      var _loc6_ = params[1];
      var _loc3_ = params[2];
      var _loc5_ = params[3];
      com.rockstargames.ui.utils.Colour.Colourise(this.reticleMC.reticle,_loc4_,_loc6_,_loc3_,_loc5_);
   }
   function STOP_FLASHING_RETICLE()
   {
      if(typeof this.reticleMC.reticle == "movieclip")
      {
         this.FLASH_COLOUR = this.DEFAULT_COLOUR;
         com.rockstargames.ui.utils.Colour.Colourise(this.reticleMC.reticle,this.DEFAULT_COLOUR[0],this.DEFAULT_COLOUR[1],this.DEFAULT_COLOUR[2],this.DEFAULT_COLOUR[3]);
      }
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.CONTENT);
   }
   function flashNewColour()
   {
      com.rockstargames.ui.utils.Colour.Colourise(this.reticleMC.reticle,this.FLASH_COLOUR[0],this.FLASH_COLOUR[1],this.FLASH_COLOUR[2],this.FLASH_COLOUR[3]);
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.CONTENT,this.FLASH_DURATION,{onComplete:this.flashDefaultColour,onCompleteScope:this});
   }
   function flashDefaultColour()
   {
      com.rockstargames.ui.utils.Colour.Colourise(this.reticleMC.reticle,this.DEFAULT_COLOUR[0],this.DEFAULT_COLOUR[1],this.DEFAULT_COLOUR[2],this.DEFAULT_COLOUR[3]);
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.CONTENT,this.FLASH_DURATION,{onComplete:this.flashNewColour,onCompleteScope:this});
   }
   function SET_RETICLE_VISIBLE_EXTERNAL(isVisible)
   {
      this.SET_RETICLE_VISIBLE([isVisible]);
   }
   function SET_RETICLE_VISIBLE(params)
   {
      var _loc2_ = params[0];
      this.CONTENT._visible = _loc2_;
      this.hitmarker.gotoAndStop(0);
      this.reticleMC.hitmarkerMC.gotoAndStop(0);
   }
   function SET_RETICLE_POSITION_EXTERNAL(newX, newY, aspectRatioMultiplier)
   {
      this.SET_RETICLE_POSITION([newX,newY,aspectRatioMultiplier]);
   }
   function SET_RETICLE_POSITION(params)
   {
      var _loc6_ = params[0];
      var _loc5_ = params[1];
      var _loc3_ = 1;
      if(params[2] != undefined)
      {
         _loc3_ = params[2];
      }
      var _loc2_ = this.COORDS_TO_SCREEN(_loc6_,_loc5_,_loc3_);
      _loc2_.x -= this.reticleMC._x;
      _loc2_.y -= this.reticleMC._y;
      this.reticleMC.reticle._x = _loc2_.x;
      this.reticleMC.reticle._y = _loc2_.y;
      this.hitmarker._x = _loc2_.x;
      this.hitmarker._y = _loc2_.y;
   }
   function SHOW_HITMARKER_EXTERNAL(hitmarkerFrame)
   {
      this.SHOW_HITMARKER([hitmarkerFrame]);
   }
   function SET_RETICULE_BOOST(params)
   {
      var _loc2_ = params[0];
      this.simpleReticuleBoost = _loc2_;
   }
   function SHOW_HITMARKER(params)
   {
      if(params[0] == 1)
      {
         this.hitmarker.gotoAndPlay("playHitmarkerKill");
      }
      else if(params[0] == 2)
      {
         this.hitmarker.gotoAndPlay("playHitmarkerShot");
      }
   }
   function SHOW_FRIENDLY_FIRE_EXTERNAL(reticleVis)
   {
      this.SHOW_FRIENDLY_FIRE([reticleVis]);
   }
   function SHOW_FRIENDLY_FIRE(params)
   {
      var _loc2_ = params[0];
      if(_loc2_ == true)
      {
         this.reticleMC.reticle._alpha = 50;
         this.reticleMC.zoomMC._alpha = 50;
      }
      else
      {
         this.reticleMC.reticle._alpha = 100;
         this.reticleMC.zoomMC._alpha = 100;
      }
   }
   function SET_RETICLE_STYLE_EXTERNAL(myStyle)
   {
      this.SET_RETICLE_STYLE([myStyle]);
   }
   function SET_RETICLE_STYLE(params)
   {
      var _loc2_ = params[0];
      var _loc3_ = false;
      if(this.reticleMC.reticle != undefined)
      {
         _loc3_ = true;
         com.rockstargames.ui.utils.Colour.Colourise(this.reticleMC.reticle,this.STYLES[_loc2_][0],this.STYLES[_loc2_][1],this.STYLES[_loc2_][2],this.STYLES[_loc2_][3]);
      }
      return _loc3_;
   }
   function SET_RETICLE_LOCKON_TYPE_EXTERNAL(lockOnType)
   {
      this.SET_RETICLE_LOCKON_TYPE([lockOnType]);
   }
   function SET_RETICLE_LOCKON_TYPE(params)
   {
      var _loc3_ = params[0];
      this.reticleMC.reticle._xscale = this.dotScaler;
      this.reticleMC.reticle._yscale = this.dotScaler;
      switch(_loc3_)
      {
         case -1:
         default:
            this.DEFAULT_COLOUR = [255,255,255,100];
            this.STOP_FLASHING_RETICLE();
            this.reticleMC.reticle.gotoAndStop(1);
            com.rockstargames.ui.utils.Colour.Colourise(this.reticleMC.reticle,255,255,255,100);
            break;
         case 0:
            this.DEFAULT_COLOUR = [255,255,255,100];
            this.STOP_FLASHING_RETICLE();
            this.reticleMC.reticle.gotoAndStop(1);
            com.rockstargames.ui.utils.Colour.Colourise(this.reticleMC.reticle,208,255,176,100);
            break;
         case 1:
            this.DEFAULT_COLOUR = [255,255,255,100];
            if(this.weaponID != this.HOMING_LAUNCHER && this.weaponID != this.WEAPON_HEAVY_RPG)
            {
               this.START_FLASHING_RETICLE([255,142,60,100]);
            }
            var _loc2_ = this.dotScaler + 15;
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this.reticleMC.reticle,0.5,{_xscale:_loc2_,_yscale:_loc2_});
            this.reticleMC.reticle.gotoAndStop(1);
            com.rockstargames.ui.utils.Colour.Colourise(this.reticleMC.reticle,255,142,60,100);
            break;
         case 2:
            this.DEFAULT_COLOUR = [255,255,255,100];
            this.STOP_FLASHING_RETICLE();
            _loc2_ = this.dotScaler + 15;
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this.reticleMC.reticle,0.5,{_xscale:_loc2_,_yscale:_loc2_});
            this.reticleMC.reticle.gotoAndStop(2);
            com.rockstargames.ui.utils.Colour.Colourise(this.reticleMC.reticle,255,28,33,100);
            break;
         case 3:
            this.DEFAULT_COLOUR = [255,255,255,100];
            this.STOP_FLASHING_RETICLE();
            this.reticleMC.reticle.gotoAndStop(1);
            com.rockstargames.ui.utils.Colour.Colourise(this.reticleMC.reticle,255,255,255,100);
      }
   }
   function SET_CAM_HEADING_EXTERNAL(a)
   {
      this.SET_CAM_HEADING([a]);
   }
   function SET_CAM_HEADING(params)
   {
      if(this.hasCompass)
      {
         var _loc3_ = params[0];
         var _loc6_ = Math.max(0,Math.min(_loc3_,360));
         var _loc2_ = this.reticleMC.Compass._width * 2;
         var _loc4_ = - _loc6_ / 360 * _loc2_;
         var _loc5_ = _loc4_ % 28;
         this.reticleMC.Compass._x = 14 + _loc5_;
      }
   }
   function SHOW_SNIPER_HIT_EXTERNAL()
   {
      this.SHOW_SNIPER_HIT();
   }
   function SHOW_SNIPER_HIT()
   {
      this.reticleMC.hitmarkerMC.gotoAndPlay("hitmarker");
   }
   function COORDS_TO_SCREEN(posX, posY, aspectRatioMultiplier)
   {
      posX = 0.5 + (posX - 0.5) * aspectRatioMultiplier;
      return new flash.geom.Point(posX * this.screenWidth,posY * this.screenHeight);
   }
   function SET_USING_REMOTE_PLAY(params)
   {
      this.IsUsingRemotePlay = params[0];
   }
   function SET_AIRCRAFT_HUD(params)
   {
      var _loc10_ = params[0];
      var _loc9_ = params[1];
      var _loc6_ = 372 * Math.sin(6.283185307179586 * (- _loc10_));
      var _loc3_ = this.getDialAngle(0,360,_loc9_ + 0.5,true);
      if(_loc3_ > 180)
      {
         _loc3_ -= 360;
      }
      var _loc5_ = this.CONTENT.reticleMC.LAZER_HUD.pitch_and_rollMC.PITCH;
      var _loc4_ = this.CONTENT.reticleMC.LAZER_HUD.pitch_and_rollMC;
      if(this.reticleChanged)
      {
         this.CONTENT.reticleMC.LAZER_HUD.gotoAndPlay(2);
         _loc5_._y += _loc6_;
         _loc4_._rotation = _loc3_;
         this.reticleChanged = false;
      }
      else
      {
         _loc5_._y += 0.4 * (_loc6_ - _loc5_._y);
         var _loc2_ = _loc3_ - _loc4_._rotation;
         if(_loc2_ < -180)
         {
            _loc2_ += 360;
         }
         else if(_loc2_ > 180)
         {
            _loc2_ -= 360;
         }
         if(_loc2_ < -90 || _loc2_ > 90)
         {
            _loc4_._rotation = _loc3_;
         }
         else
         {
            _loc4_._rotation += 0.4 * _loc2_;
         }
      }
      var _loc11_ = params[2];
      var _loc12_ = params[3];
      var _loc8_ = 280;
      this.CONTENT.reticleMC.LAZER_HUD.AltitudeScale._y = _loc11_ * 2 * _loc8_;
      this.CONTENT.reticleMC.LAZER_HUD.AirSpeedScale._y = _loc12_ * 2 * _loc8_;
   }
   function OVERRIDE_HOMING_SCOPE(params)
   {
      this.homingScopeMC = this.CONTENT.reticleMC.HOMING_SCOPE;
      var _loc2_ = params[0];
      var _loc3_ = params[1];
      this.homingScopeMC._xscale = _loc3_ * 100;
      this.homingScopeMC._yscale = _loc2_ * 100;
      this.homingScopeMC._x = 0;
      this.homingScopeMC._y = 0;
   }
   function percFromRad(input)
   {
      var _loc1_ = (input + 3.141592653589793) / 6.283185307179586;
      return _loc1_;
   }
   function getDialAngle(minRot, maxRot, scale, isClockwise)
   {
      scale *= 100;
      if(isClockwise == undefined)
      {
         isClockwise = true;
      }
      var _loc4_ = -1;
      var _loc3_ = -1;
      var _loc1_ = minRot;
      var _loc2_ = maxRot;
      if(!isClockwise)
      {
         _loc1_ = maxRot;
         _loc2_ = minRot;
      }
      if(_loc1_ < 0 && _loc2_ < 0)
      {
         _loc3_ = Math.abs(_loc1_) - Math.abs(_loc2_);
         _loc4_ = minRot + _loc3_ / 100 * scale;
      }
      if(_loc1_ < 0 && _loc2_ >= 0)
      {
         _loc3_ = Math.abs(_loc1_) + _loc2_;
         _loc4_ = minRot + _loc3_ / 100 * scale;
      }
      if(_loc1_ >= 0 && _loc2_ >= 0)
      {
         _loc3_ = _loc2_ - _loc1_;
         _loc4_ = _loc1_ + _loc3_ / 100 * scale;
      }
      return _loc4_;
   }
   function REMOVE()
   {
      this._HUD.REMOVE_HUD_ITEM(this._enumID);
   }
}

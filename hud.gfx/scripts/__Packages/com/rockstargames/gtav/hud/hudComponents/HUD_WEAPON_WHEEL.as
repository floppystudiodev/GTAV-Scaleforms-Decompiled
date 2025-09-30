class com.rockstargames.gtav.hud.hudComponents.HUD_WEAPON_WHEEL extends com.rockstargames.ui.hud.HUD_COMPONENT
{
   var BOUNDING_BOX;
   var CONTENT;
   var TIMELINE;
   var _HUD;
   var _alpha;
   var b3DTest;
   var bFiniteRotation;
   var enable3D;
   var maxRotation;
   var tweenDuration;
   static var NO_TINT = new flash.geom.ColorTransform();
   static var ARMOR_PIERCING_TINT = new flash.geom.ColorTransform(0,0,0,1,26,0,232,0);
   static var EXPLOSIVE_TINT = new flash.geom.ColorTransform(0,0,0,1,255,170,0,0);
   static var FMJ_TINT = new flash.geom.ColorTransform(0,0,0,1,148,0,246,0);
   static var HOLLOW_POINT_TINT = new flash.geom.ColorTransform(0,0,0,1,0,179,52,0);
   static var INCENDIARY_TINT = new flash.geom.ColorTransform(0,0,0,1,231,0,0,0);
   static var TRACER_TINT = new flash.geom.ColorTransform(0,0,0,0.7,255,255,255,0);
   static var AMMO_TINTS = [com.rockstargames.gtav.hud.hudComponents.HUD_WEAPON_WHEEL.NO_TINT,com.rockstargames.gtav.hud.hudComponents.HUD_WEAPON_WHEEL.ARMOR_PIERCING_TINT,com.rockstargames.gtav.hud.hudComponents.HUD_WEAPON_WHEEL.EXPLOSIVE_TINT,com.rockstargames.gtav.hud.hudComponents.HUD_WEAPON_WHEEL.FMJ_TINT,com.rockstargames.gtav.hud.hudComponents.HUD_WEAPON_WHEEL.HOLLOW_POINT_TINT,com.rockstargames.gtav.hud.hudComponents.HUD_WEAPON_WHEEL.INCENDIARY_TINT,com.rockstargames.gtav.hud.hudComponents.HUD_WEAPON_WHEEL.TRACER_TINT];
   var HUD_WEAPON_ICON_FADE_TIME = 400;
   var WEAPON_NAME_SCROLL_DELAY = 120;
   var ARG_WEAPON_HASH = 2;
   var ARG_WEAPON_NAME = 8;
   var ARG_WEAPON_EQUIPPED = 9;
   var weaponHash = 0;
   var weaponTypeIndex = 0;
   var oldweaponTypeIndex = -1;
   var pAngle = 0;
   var slotList = new Array();
   var slotIndexList = new Array();
   var canCycle = false;
   var _isInCar = false;
   function HUD_WEAPON_WHEEL()
   {
      super();
      this.FADE_DURATION = this.HUD_WEAPON_ICON_FADE_TIME;
      this.ON_SCREEN_DURATION = 5000;
      this.slotList = [];
      this.slotIndexList = [];
      this.b3DTest = 2;
   }
   function INITIALISE(mc)
   {
      this.TIMELINE = this;
      this.CONTENT = this.TIMELINE.CONTENT;
      this.BOUNDING_BOX = this.TIMELINE.BOUNDING_BOX;
      this.BOUNDING_BOX._visible = false;
      this.CONTENT.wheelMC.arrowsMC._visible = this.CONTENT.wheelMC.arrowsMCOutline._visible = false;
      this.CONTENT.parachuteMC._visible = false;
      _global.gfxExtensions = true;
      this.CONTENT.wheelMC.bgBGMC._visible = false;
      var _loc3_ = 2;
      var _loc4_ = 3;
      this.CONTENT.wheelMC._z = _loc3_;
      this.CONTENT.wheelMC.bgBGMC._z = _loc4_;
      this.CONTENT.parachuteMC._z = _loc3_;
      this.CONTENT.wheelMC.arrowsMC._z = _loc3_;
      this.CONTENT.WEAPON_IN_CAR._z = _loc3_;
      this.CONTENT.wheelMC.attachMovie("SLOT_WEAPONS_0","wT0",this.CONTENT.wheelMC.getNextHighestDepth(),{_x:0,_y:-170,_z:_loc3_});
      this.CONTENT.wheelMC.attachMovie("SLOT_WEAPONS_1","wT1",this.CONTENT.wheelMC.getNextHighestDepth(),{_x:116,_y:-112,_z:_loc3_});
      this.CONTENT.wheelMC.attachMovie("SLOT_WEAPONS_2","wT2",this.CONTENT.wheelMC.getNextHighestDepth(),{_x:162,_y:0,_z:_loc3_});
      this.CONTENT.wheelMC.attachMovie("SLOT_WEAPONS_3","wT3",this.CONTENT.wheelMC.getNextHighestDepth(),{_x:116,_y:112,_z:_loc3_});
      this.CONTENT.wheelMC.attachMovie("SLOT_WEAPONS_4","wT4",this.CONTENT.wheelMC.getNextHighestDepth(),{_x:0,_y:162,_z:_loc3_});
      this.CONTENT.wheelMC.attachMovie("SLOT_WEAPONS_5","wT5",this.CONTENT.wheelMC.getNextHighestDepth(),{_x:-116,_y:112,_z:_loc3_});
      this.CONTENT.wheelMC.attachMovie("SLOT_WEAPONS_6","wT6",this.CONTENT.wheelMC.getNextHighestDepth(),{_x:-162,_y:0,_z:_loc3_});
      this.CONTENT.wheelMC.attachMovie("SLOT_WEAPONS_7","wT7",this.CONTENT.wheelMC.getNextHighestDepth(),{_x:-116,_y:-112,_z:_loc3_});
      this.CONTENT.WEAPON_IN_CAR.attachMovie("MASTER_WEAPONS","wT8",this.CONTENT.WEAPON_IN_CAR.getNextHighestDepth(),{_z:_loc3_});
      this.CONTENT.wheelMC.wT0.attachMovie("AMMO_MASTER","ammoMC",this.CONTENT.wheelMC.wT0.getNextHighestDepth(),{_x:-2,_y:34,_z:_loc3_});
      this.CONTENT.wheelMC.wT1.attachMovie("AMMO_MASTER","ammoMC",this.CONTENT.wheelMC.wT1.getNextHighestDepth(),{_x:20,_y:37,_z:_loc3_});
      this.CONTENT.wheelMC.wT2.attachMovie("AMMO_MASTER","ammoMC",this.CONTENT.wheelMC.wT2.getNextHighestDepth(),{_x:-9,_y:46,_z:_loc3_});
      this.CONTENT.wheelMC.wT3.attachMovie("AMMO_MASTER","ammoMC",this.CONTENT.wheelMC.wT3.getNextHighestDepth(),{_x:-15,_y:35,_z:_loc3_});
      this.CONTENT.wheelMC.wT4.attachMovie("AMMO_MASTER","ammoMC",this.CONTENT.wheelMC.wT4.getNextHighestDepth(),{_x:-5,_y:52,_z:_loc3_});
      this.CONTENT.wheelMC.wT5.attachMovie("AMMO_MASTER","ammoMC",this.CONTENT.wheelMC.wT5.getNextHighestDepth(),{_x:12,_y:35,_z:_loc3_});
      this.CONTENT.wheelMC.wT6.attachMovie("AMMO_MASTER","ammoMC",this.CONTENT.wheelMC.wT6.getNextHighestDepth(),{_x:-3,_y:46,_z:_loc3_});
      this.CONTENT.wheelMC.wT7.attachMovie("AMMO_MASTER","ammoMC",this.CONTENT.wheelMC.wT7.getNextHighestDepth(),{_x:-12,_y:37,_z:_loc3_});
      this.CONTENT.WEAPON_IN_CAR.wT8.attachMovie("AMMO_MASTER","ammoMC",this.CONTENT.WEAPON_IN_CAR.wT8.getNextHighestDepth(),{_y:65,_z:_loc3_});
      this.SET_WHEEL_IN_CAR_MODE([false]);
   }
   function dbg(str)
   {
      com.rockstargames.ui.utils.Debug.log("SCALEFORM | " + str);
   }
   function UPDATE_DEBUG_3D_SETTINGS(params)
   {
      this.enable3D = true;
      this.CONTENT._perspfov = params[0];
      this.CONTENT._x = params[1];
      this.CONTENT._y = params[2];
      this.CONTENT._z = params[3];
      this.CONTENT.wheelMC._xrotation = params[4];
      this.CONTENT.wheelMC._yrotation = params[5];
      this.maxRotation = params[6];
      this.tweenDuration = params[7];
      this.CONTENT.wheelMC.bgBGMC._z = params[8];
      this.CONTENT.wheelMC.bgBGMC._visible = params[9] != undefined ? params[9] : true;
      this.bFiniteRotation = params[10];
   }
   function READY(id)
   {
      super.READY(id);
   }
   function SET_INPUT_EVENT(params)
   {
      var _loc2_ = params[0];
      switch(_loc2_)
      {
         case com.rockstargames.ui.game.GamePadConstants.DPADLEFT:
            this.cycleWeapons(-1);
            break;
         case com.rockstargames.ui.game.GamePadConstants.DPADRIGHT:
            this.cycleWeapons(1);
         default:
            return;
      }
   }
   function SET_PARACHUTE_IS_VISIBLE(params)
   {
      this.CONTENT.parachuteMC._visible = params[0];
      this.setSpecialAmmoMC(this.CONTENT.parachuteMC,params[1]);
   }
   function setSpecialAmmoMC(ammoMC, num)
   {
      ammoMC.numTF.text = ammoMC.numTFStroke.text = num;
      ammoMC.numTF._visible = ammoMC.numTFStroke._visible = num > 1;
   }
   function SET_ATTACHMENT_LABELS(params)
   {
      var _loc4_ = params[0];
      var _loc2_ = this.CONTENT.wheelMC.attachmentMC.attachmentsTF;
      var _loc3_ = this.CONTENT.wheelMC.attachmentMC.attachmentsTFOutline;
      _loc2_.htmlText = _loc3_.htmlText = _loc4_;
      _loc2_._visible = _loc3_._visible = true;
      _loc2_._alpha = _loc3_._alpha = 0;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2_,0.2,{_alpha:100,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_OUT});
      com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc3_,0.35,{_alpha:100,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_OUT});
   }
   function setWeaponLabel(weaponData)
   {
      var _loc4_ = !weaponData[this.ARG_WEAPON_HASH] ? "" : weaponData[this.ARG_WEAPON_NAME];
      var _loc3_ = this.CONTENT.wheelMC.weaponTextLabel;
      _loc3_.resetDelay();
      _loc3_.setDelayTimeout(this.WEAPON_NAME_SCROLL_DELAY);
      _loc3_.txtString.text = _loc4_;
      var _loc2_ = this.CONTENT.wheelMC.weaponTextLabelOutline;
      _loc2_.resetDelay();
      _loc2_.setDelayTimeout(this.WEAPON_NAME_SCROLL_DELAY);
      _loc2_.txtString.text = _loc4_;
   }
   function setWeaponPaging(pageIndex, pageMax)
   {
      this.CONTENT.wheelMC.arrowsMC.countTF.text = this.CONTENT.wheelMC.arrowsMCOutline.countTF.text = pageIndex;
      this.CONTENT.wheelMC.arrowsMC.maxTF.text = this.CONTENT.wheelMC.arrowsMCOutline.maxTF.text = pageMax;
      this.CONTENT.wheelMC.arrowsMC._visible = this.CONTENT.wheelMC.arrowsMCOutline._visible = pageMax > 1;
   }
   function setWeaponLabelAndPage()
   {
      var _loc2_ = this.slotList[this.weaponTypeIndex];
      var _loc3_;
      var _loc4_;
      if(_loc2_ != undefined)
      {
         _loc3_ = this.slotIndexList[this.weaponTypeIndex].index;
         _loc4_ = _loc2_[_loc3_];
         this.setWeaponLabel(_loc4_.data);
         this.setWeaponPaging(_loc3_ + 1,_loc2_.length);
      }
      else
      {
         this.hideArrows();
      }
      this.highlightWeapon();
   }
   function highlightWeapon()
   {
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < 8)
      {
         _loc3_ = this.CONTENT.wheelMC["s" + _loc2_ + "MC"];
         this.setSlotHighlight(_loc2_,_loc3_,_loc2_ == this.weaponTypeIndex);
         _loc2_ = _loc2_ + 1;
      }
   }
   function setSlotHighlight(i, slotMC, bHighlight)
   {
      if(bHighlight)
      {
         slotMC.bgMC._visible = false;
         slotMC.gradientBGMC._visible = true;
         com.rockstargames.ui.utils.Colour.ApplyHudColour(slotMC.gradientBGMC,this._HUD.charColourEnum);
      }
      else
      {
         slotMC.gradientBGMC._visible = false;
         slotMC.bgMC._visible = true;
      }
      var _loc5_;
      var _loc8_;
      var _loc10_;
      var _loc9_;
      var _loc12_;
      var _loc11_;
      var _loc4_;
      var _loc6_;
      var _loc20_;
      if(this.enable3D)
      {
         _loc5_ = 0.7853981633974483 * i - 1.5707963267948966;
         if(this.b3DTest == 1)
         {
            _loc8_ = !bHighlight ? 158 : 164;
            _loc10_ = Math.cos(_loc5_) * _loc8_;
            _loc9_ = Math.sin(_loc5_) * _loc8_;
            _loc12_ = !bHighlight ? 100 : 125;
            _loc11_ = !bHighlight ? 100 : 125;
            if(Math.abs(_loc10_ - slotMC._x) > 1 || Math.abs(_loc9_ - slotMC._y) > 1)
            {
               com.rockstargames.ui.tweenStar.TweenStarLite.to(slotMC,0.05,{_x:_loc10_,_y:_loc9_,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_OUT});
               com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT.wheelMC["wT" + i],0.05,{_xscale:_loc12_,_yscale:_loc11_,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_OUT});
            }
         }
         else if(this.b3DTest == 2)
         {
            if(bHighlight)
            {
               _loc4_ = 0;
               _loc6_ = 0;
               if(this.bFiniteRotation)
               {
                  _loc6_ = (- Math.sin(_loc5_)) * this.maxRotation;
                  _loc4_ = Math.cos(_loc5_) * this.maxRotation;
               }
               else
               {
                  _loc20_ = 0.7853981633974483 * i - 1.5707963267948966;
                  if(i > 0 && i < 4)
                  {
                     _loc4_ = this.maxRotation;
                  }
                  else if(i > 4 && i < 8)
                  {
                     _loc4_ = - this.maxRotation;
                  }
                  else
                  {
                     _loc6_ = i != 0 ? - this.maxRotation : this.maxRotation;
                  }
               }
               com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT.wheelMC,this.tweenDuration,{_yrotation:_loc4_,_xrotation:_loc6_});
            }
         }
      }
   }
   function SET_PLAYER_WEAPON_WHEEL(params)
   {
      var _loc2_ = params[0];
      var _loc5_ = params[1];
      var _loc3_ = params[this.ARG_WEAPON_HASH];
      var _loc7_ = params[3];
      var _loc6_;
      if(_loc3_ != com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_INVALID)
      {
         this._HUD.SET_WEAPON_WHEEL_ACTIVE(true);
         _loc6_ = this.slotList[_loc2_];
         if(_loc6_ == undefined)
         {
            this.slotList[_loc2_] = [];
         }
         this.slotList[_loc2_][_loc5_] = {data:params,id:_loc3_};
         if(_loc7_)
         {
            this.slotIndexList[_loc2_] = {index:_loc5_,id:_loc3_};
         }
      }
   }
   function loadWeapon(weaponData, slotTypeIndex)
   {
      var _loc4_ = weaponData[this.ARG_WEAPON_EQUIPPED];
      var _loc5_ = !this._isInCar ? this.CONTENT.wheelMC["s" + slotTypeIndex + "MC"] : this.CONTENT.WEAPON_IN_CAR;
      _loc5_.outlineMC._visible = !_loc4_;
      _loc5_.outlineHighlightMC._visible = _loc4_;
      if(_loc4_ && this._HUD.charColourEnum)
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc5_.outlineHighlightMC,this._HUD.charColourEnum);
      }
      var _loc7_ = weaponData[this.ARG_WEAPON_HASH];
      var _loc6_ = weaponData[4];
      var _loc9_ = weaponData[5];
      var _loc10_ = weaponData[6];
      var _loc8_ = true;
      if(weaponData[7] != undefined)
      {
         _loc8_ = weaponData[7];
      }
      var _loc3_ = !this._isInCar ? this.CONTENT.wheelMC["wT" + slotTypeIndex] : this.CONTENT.WEAPON_IN_CAR.wT8;
      _loc3_._alpha = !_loc8_ ? 30 : 100;
      var _loc12_ = _loc3_.ammoMC;
      _loc3_.gotoAndStop("INT" + _loc7_);
      if(_loc6_ != undefined && _loc9_ != undefined)
      {
         _loc12_.SET_AMMO_COUNT([_loc6_,_loc9_,_loc10_,_loc7_]);
      }
      var _loc11_;
      if(_loc3_.magazine)
      {
         _loc11_ = Number(weaponData[10]) || 0;
         _loc3_.magazine.transform.colorTransform = com.rockstargames.gtav.hud.hudComponents.HUD_WEAPON_WHEEL.AMMO_TINTS[_loc11_];
      }
   }
   function cycleWeapons(dir)
   {
      var _loc4_;
      var _loc3_;
      var _loc6_;
      var _loc2_;
      var _loc5_;
      if(this.canCycle)
      {
         _loc4_ = this.slotList[this.weaponTypeIndex];
         if(_loc4_ != undefined)
         {
            _loc3_ = _loc4_.length;
            if(_loc3_ > 1)
            {
               _loc6_ = this.slotIndexList[this.weaponTypeIndex].index;
               _loc2_ = _loc6_;
               if(dir > 0)
               {
                  _loc2_ + 1 <= _loc3_ - 1 ? _loc2_++ : (_loc2_ = 0);
               }
               else if(dir < 0)
               {
                  _loc2_ - 1 >= 0 ? _loc2_-- : (_loc2_ = _loc3_ - 1);
               }
               _loc5_ = _loc4_[_loc2_];
               this.loadWeapon(_loc5_.data,this.weaponTypeIndex);
               this.setWeaponLabel(_loc5_.data);
               this.setWeaponPaging(_loc2_ + 1,_loc3_);
               this.slotIndexList[this.weaponTypeIndex].index = _loc2_;
               this.setHudWeaponWheelHash();
               com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"DPAD_WEAPON_SCROLL","HUD_FRONTEND_DEFAULT_SOUNDSET");
               com.rockstargames.ui.game.GameInterface.call("VIBRATE_PAD",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,100,0.08,200);
            }
            else
            {
               this.hideArrows();
            }
         }
      }
      com.rockstargames.ui.game.GameInterface.call("SET_WEAPON_WHEEL_SLOT_SELECTION",com.rockstargames.ui.game.GameInterface.HUD_TYPE,this.weaponTypeIndex,this.weaponHash);
   }
   function TOGGLE_POINTER_AND_WEAPON_NAME_VISIBILITY(params)
   {
      this.CONTENT.wheelMC.arrowsMC._visible = this.CONTENT.wheelMC.arrowsMCOutline._visible = false;
      var _loc4_ = this.slotList[this.weaponTypeIndex];
      var _loc6_;
      if(_loc4_ != undefined)
      {
         _loc6_ = _loc4_.length;
         if(_loc6_ > 1)
         {
            this.CONTENT.wheelMC.arrowsMC._visible = this.CONTENT.wheelMC.arrowsMCOutline._visible = params[0];
         }
      }
      this.CONTENT.wheelMC.weaponTextLabel._visible = this.CONTENT.wheelMC.weaponTextLabelOutline._visible = params[0];
      this.CONTENT.wheelMC.attachmentMC.attachmentsTF._visible = this.CONTENT.wheelMC.attachmentMC.attachmentsTFOutline._visible = !this._isInCar && params[0];
      var _loc2_;
      var _loc3_;
      if(params[0] == false)
      {
         _loc2_ = 0;
         while(_loc2_ < 8)
         {
            _loc3_ = this.CONTENT.wheelMC["s" + _loc2_ + "MC"];
            this.setSlotHighlight(_loc2_,_loc3_,false);
            _loc2_ = _loc2_ + 1;
         }
      }
   }
   function SET_POINTER(params)
   {
      var _loc3_ = params[0];
      var _loc4_ = params[1];
      this.pAngle = _loc3_;
      var _loc2_;
      if(_loc4_)
      {
         this.pAngle = 45 * _loc3_;
         this.weaponTypeIndex = _loc3_;
      }
      else
      {
         _loc2_ = this.pAngle + 25.5;
         while(_loc2_ > 360)
         {
            _loc2_ -= 360;
         }
         this.weaponTypeIndex = int(_loc2_ / 45);
      }
      var _loc5_;
      var _loc6_;
      if(_loc4_ && this.weaponTypeIndex == 8)
      {
         com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"DPAD_WEAPON_SCROLL","HUD_FRONTEND_DEFAULT_SOUNDSET");
      }
      else
      {
         if(this.oldweaponTypeIndex != this.weaponTypeIndex)
         {
            this.setHudWeaponWheelHash();
            this.CONTENT.wheelMC.attachmentMC.attachmentsTF._visible = this.CONTENT.wheelMC.attachmentMC.attachmentsTFOutline._visible = false;
            this.highlightWeapon();
            this.setWeaponLabel(this.getCurrentWeaponData().data);
            _loc5_ = this.slotList[this.weaponTypeIndex];
            if(_loc5_ != undefined)
            {
               _loc6_ = this.slotIndexList[this.weaponTypeIndex].index;
               this.setWeaponPaging(_loc6_ + 1,_loc5_.length);
               com.rockstargames.ui.game.GameInterface.call("VIBRATE_PAD",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,100,0.08,200);
            }
            else
            {
               this.CONTENT.wheelMC.arrowsMC._visible = this.CONTENT.wheelMC.arrowsMCOutline._visible = false;
               com.rockstargames.ui.game.GameInterface.call("VIBRATE_PAD",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,100,0.04,200);
            }
            com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"DPAD_WEAPON_SCROLL","HUD_FRONTEND_DEFAULT_SOUNDSET");
         }
         this.oldweaponTypeIndex = this.weaponTypeIndex;
      }
   }
   function getScreenCoords(x, y)
   {
      var _loc1_ = new flash.geom.Point(x,y);
      _loc1_.x = x / 1280;
      _loc1_.y = y / 720;
      return _loc1_;
   }
   function setHudWeaponWheelHash()
   {
      var _loc3_ = com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_INVALID;
      var _loc2_ = this.getCurrentWeaponData();
      if(_loc2_ != undefined)
      {
         _loc3_ = _loc2_.data[this.ARG_WEAPON_HASH];
      }
      if(_loc2_.data[7] != undefined)
      {
         this._HUD.SET_CURRENT_WEAPON_WHEEL_HASH(_loc3_,_loc2_.data[7]);
      }
      else
      {
         this._HUD.SET_CURRENT_WEAPON_WHEEL_HASH(_loc3_,true);
      }
      this.weaponHash = _loc3_;
      var _loc4_ = this.CONTENT.wheelMC.attachmentMC.attachmentsTF;
      var _loc5_ = this.CONTENT.wheelMC.attachmentMC.attachmentsTFOutline;
      _loc4_._visible = _loc5_._visible = false;
      _loc4_._alpha = _loc5_._alpha = 0;
      _loc4_._text = _loc5_._text = "";
      if(!this._isInCar)
      {
         com.rockstargames.ui.game.GameInterface.call("UPDATE_WEAPON_ATTACHMENT_FROM_SLOT",com.rockstargames.ui.game.GameInterface.HUD_TYPE,this.weaponHash);
      }
   }
   function getCurrentWeaponData()
   {
      var _loc3_ = this.slotList[this.weaponTypeIndex];
      var _loc2_ = this.slotIndexList[this.weaponTypeIndex].index;
      return _loc3_[_loc2_];
   }
   function SHOW()
   {
      this.canCycle = false;
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.wheelMC.arrowsMC.arrowLeftTF,this._HUD.charColourEnum);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.wheelMC.arrowsMC.arrowRightTF,this._HUD.charColourEnum);
      this.CONTENT.wheelMC.attachmentMC.attachmentsTF._visible = this.CONTENT.wheelMC.attachmentMC.attachmentsTFOutline._visible = false;
      var _loc2_ = 0;
      var _loc4_;
      var _loc6_;
      var _loc3_;
      var _loc7_;
      var _loc8_;
      var _loc5_;
      while(_loc2_ < 9)
      {
         _loc4_ = this.slotIndexList[_loc2_];
         if(_loc4_ != undefined)
         {
            _loc6_ = _loc4_.index;
            _loc3_ = this.slotList[_loc2_][_loc6_].data;
            _loc7_ = _loc3_[0];
            _loc8_ = _loc3_[3];
            if(_loc8_)
            {
               this.loadWeapon(_loc3_,_loc7_);
            }
         }
         else
         {
            _loc5_ = this.CONTENT.wheelMC["s" + _loc2_ + "MC"];
            _loc5_.outlineMC._visible = true;
            _loc5_.outlineHighlightMC._visible = false;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.SHOW_ALL();
   }
   function START_CROSSFADE(params)
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT,params[0],{_alpha:params[1],begin:this._alpha,onComplete:this.fadeComplete,onCompleteScope:this});
   }
   function fadeComplete()
   {
      com.rockstargames.ui.game.GameInterface.call("WEAPON_WHEEL_FADE_COMPLETE",com.rockstargames.ui.game.GameInterface.HUD_TYPE);
   }
   function SHOW_ALL()
   {
      if(this.CONTENT._alpha != 100)
      {
         this.CONTENT._alpha = 100;
      }
      this.setWeaponLabelAndPage();
      this.canCycle = true;
   }
   function CLEAR_PLAYER_WEAPON_WHEEL(params)
   {
      this.slotList = [];
      this.slotIndexList = [];
      var _loc2_ = 0;
      while(_loc2_ < 8)
      {
         this.CONTENT.wheelMC["wT" + _loc2_].gotoAndStop(1);
         this.CONTENT.wheelMC["wT" + _loc2_].ammoMC.SET_AMMO_COUNT([-1,-1,-1,-98]);
         _loc2_ = _loc2_ + 1;
      }
      this.CONTENT.WEAPON_IN_CAR.wT8.gotoAndStop(1);
      this.CONTENT.WEAPON_IN_CAR.wT8.ammoMC.SET_AMMO_COUNT([-1,-1,-1,-98]);
   }
   function UNLOAD_WEAPON_WHEEL()
   {
      this.canCycle = false;
      this.CONTENT._alpha = 0;
      this.REMOVE();
   }
   function REMOVE()
   {
      this.CLEAR_PLAYER_WEAPON_WHEEL();
      this._HUD.SET_WEAPON_WHEEL_ACTIVE(false);
      this._HUD.REMOVE_HUD_ITEM(com.rockstargames.gtav.constants.HudComponentConstants.HUD_WEAPON_WHEEL);
   }
   function SET_WHEEL_IN_CAR_MODE(params)
   {
      var _loc3_;
      this._isInCar = params[0];
      var _loc2_ = 0;
      while(_loc2_ < 8)
      {
         _loc3_ = this.CONTENT.wheelMC["s" + _loc2_ + "MC"];
         _loc3_._visible = !this._isInCar;
         _loc2_ = _loc2_ + 1;
      }
      this.CONTENT.wheelMC.rings._visible = !this._isInCar;
      this.CONTENT.WEAPON_IN_CAR._visible = this._isInCar;
      this.CONTENT.parachuteMC._xscale = this.CONTENT.parachuteMC._yscale = !this._isInCar ? 100 : 75;
      this.CONTENT.wheelMC.bgBGMC._visible = !this._isInCar && this.enable3D;
      if(this._isInCar)
      {
         this.CONTENT.parachuteMC._x = this.CONTENT.WEAPON_IN_CAR._x;
         this.CONTENT.parachuteMC._y = 36;
         this.CONTENT.wheelMC.attachmentMC.attachmentsTF._visible = this.CONTENT.wheelMC.attachmentMC.attachmentsTFOutline._visible = false;
      }
      else
      {
         this.CONTENT.parachuteMC._x = 170;
         this.CONTENT.parachuteMC._y = 215;
      }
   }
   function hideArrows()
   {
      this.CONTENT.wheelMC.arrowsMC._visible = this.CONTENT.wheelMC.arrowsMCOutline._visible = false;
   }
}

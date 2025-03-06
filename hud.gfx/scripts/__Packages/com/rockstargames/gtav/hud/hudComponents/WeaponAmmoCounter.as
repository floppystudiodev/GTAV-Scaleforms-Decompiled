class com.rockstargames.gtav.hud.hudComponents.WeaponAmmoCounter extends MovieClip
{
   var ammoIcon;
   var ammoTF;
   var clipTF;
   var ammoCenterTF;
   var ammoStrokeTF;
   var clipStrokeTF;
   var ammoCenterStrokeTF;
   var currAmmoType;
   function WeaponAmmoCounter()
   {
      super();
      this.ammoIcon._visible = false;
   }
   function SET_AMMO_COUNT(params)
   {
      var _loc3_ = params[3];
      switch(_loc3_)
      {
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_STUNGUN:
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_UNARMED:
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_WRENCH:
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_SHOVEL:
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_NIGHTSTICK:
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_LASSO:
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_KNIFE:
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_HAMMER:
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_CROWBAR:
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_BAT:
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_GOLFCLUB:
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_FIRE_EXTINGUISHER:
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_JERRY_CAN:
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_BOTTLE:
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_DAGGER:
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_HATCHET:
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_KNUCKLE:
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_MACHETE:
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_FLASHLIGHT:
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_SWITCHBLADE:
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_POOLCUE:
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_BATTLEAXE:
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_STONE_HATCHET:
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_HAZARDCAN:
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_FERTILIZERCAN:
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_CANDY_CANE:
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_HACKINGDEVICE:
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_STUNROD:
            this.ammoTF.text = "";
            this.clipTF.text = "";
            this.ammoCenterTF.text = "";
            this.ammoIcon._visible = false;
            break;
         default:
            var _loc2_ = String(params[0]);
            var _loc5_ = String(params[1]);
            var _loc6_ = params[2];
            var _loc7_ = params[4];
            if(_loc6_ <= 1)
            {
               this.clipTF.text = "";
            }
            else
            {
               this.clipTF.text = "/ " + _loc5_;
            }
            if(_loc2_ == "-1")
            {
               if(_loc5_ == "-1")
               {
                  this.clipTF.text = "";
               }
               _loc2_ = "";
            }
            if(_loc2_ == "-2")
            {
               _loc2_ = "<";
               if(_loc5_ == "-1")
               {
                  this.clipTF.text = "";
               }
            }
            if(_loc3_ == com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_HEAVY_MINIGUN)
            {
               this.clipTF.text = "";
            }
            if(_loc3_ == com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_RAYMINIGUN)
            {
               this.clipTF.text = "";
            }
            if(_loc3_ == com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_RAYCARBINE)
            {
               this.clipTF.text = "";
            }
            this.adjustAmmo(this.clipTF.text == "",_loc2_,_loc7_);
      }
      this.ammoStrokeTF.text = this.ammoTF.text;
      this.clipStrokeTF.text = this.clipTF.text;
      this.ammoCenterStrokeTF.text = this.ammoCenterTF.text;
   }
   function adjustAmmo(isCentered, ammoStr, ammoType)
   {
      if(this.currAmmoType != ammoType)
      {
         this.currAmmoType = ammoType;
         this.ammoIcon.gotoAndStop(1);
         this.ammoIcon.gotoAndStop("AMMO" + ammoType);
         this.ammoIcon._visible = this.ammoIcon._currentframe != 1;
      }
      if(isCentered)
      {
         this.ammoTF.text = "";
         this.ammoCenterTF.text = ammoStr;
         this.ammoIcon._x = 0.5 * (this.ammoCenterTF._width - this.ammoCenterTF.textWidth) + this.ammoCenterTF._x - this.ammoIcon._width - 6;
      }
      else
      {
         this.ammoTF.text = ammoStr;
         this.ammoCenterTF.text = "";
         this.ammoIcon._x = this.ammoTF._x + this.ammoTF._width - this.ammoTF.textWidth - this.ammoIcon._width - 6;
      }
   }
}

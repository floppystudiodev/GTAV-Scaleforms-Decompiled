class com.rockstargames.gtav.levelDesign.ARENA_GUN_CAM extends com.rockstargames.gtav.levelDesign.TURRET_CAM
{
   var wpnSelect;
   var CONTENT;
   var wpnMG;
   var wpnMissile;
   var wpnMissilePilot;
   var fovMC;
   function ARENA_GUN_CAM()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.wpnSelect = this.CONTENT.wpnSelect;
      this.wpnMG = this.wpnSelect.wpnMG;
      this.wpnMissile = this.wpnSelect.wpnMissile;
      this.wpnMissilePilot = this.wpnSelect.wpnMissilePilot;
   }
   function SET_WEAPON_TYPE(weaponType)
   {
      this.wpnSelect.gotoAndStop(weaponType);
   }
   function SET_WEAPON_VALUES(machineGunVal, missileVal, pilotMissileVal)
   {
      this.wpnSelect.wpnMG.gotoAndStop(machineGunVal);
      this.wpnSelect.wpnMissile.gotoAndStop(missileVal);
      this.wpnSelect.wpnMissilePilot.gotoAndStop(pilotMissileVal);
   }
   function SET_ZOOM_VISIBLE(isVisible)
   {
      this.fovMC._visible = isVisible;
   }
}

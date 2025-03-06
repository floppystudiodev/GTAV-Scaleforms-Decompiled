class com.rockstargames.gtav.hud.hudComponents.HUD_DRUGS_PURSE extends com.rockstargames.ui.hud.HUD_COMPONENT
{
   var CONTENT;
   var _enumID;
   var _HUD;
   function HUD_DRUGS_PURSE()
   {
      super();
   }
   function SET_DRUG_AMOUNT_AND_TYPE(params)
   {
      var _loc2_ = params[0];
      var _loc3_ = params[1];
      this.CONTENT.drugsTF.text = _loc3_;
      this.CONTENT.iconMC.gotoAndStop(_loc2_ + 1);
      this.CONTENT._alpha = 100;
   }
   function REMOVE_DRUG_PURSE()
   {
      this._HUD.REMOVE_HUD_ITEM(this._enumID);
   }
}

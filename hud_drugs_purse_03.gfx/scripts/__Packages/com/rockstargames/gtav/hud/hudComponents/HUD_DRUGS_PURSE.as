class com.rockstargames.gtav.hud.hudComponents.HUD_DRUGS_PURSE extends com.rockstargames.ui.hud.HUD_COMPONENT
{
   var CONTENT;
   var _enumID;
   function HUD_DRUGS_PURSE()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.READY();
   }
   function READY(id)
   {
      super.READY(id);
      this.CONTENT._alpha = 0;
   }
   function SET_DRUG_AMOUNT_AND_TYPE(params)
   {
      var _loc2_ = params[0];
      var _loc3_ = params[1];
      this.CONTENT.drugsTF.text = _loc3_;
      this.CONTENT.iconMC.gotoAndPlay(_loc2_ + 1);
      this.CONTENT._alpha = 100;
   }
   function REMOVE_DRUG_PURSE()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.CONTENT);
      com.rockstargames.ui.game.GameInterface.call("REQUEST_REMOVAL",com.rockstargames.ui.game.GameInterface.HUD_TYPE,this._enumID);
   }
}

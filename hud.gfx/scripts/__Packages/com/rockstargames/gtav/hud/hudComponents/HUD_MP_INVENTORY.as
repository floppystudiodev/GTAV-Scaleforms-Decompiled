class com.rockstargames.gtav.hud.hudComponents.HUD_MP_INVENTORY extends com.rockstargames.ui.hud.HUD_COMPONENT
{
   var BOUNDING_BOX;
   var CONTENT;
   var TIMELINE;
   var _HUD;
   var _enumID;
   function HUD_MP_INVENTORY()
   {
      super();
   }
   function INITIALISE(mc)
   {
      this.TIMELINE = this;
      this.CONTENT = this.TIMELINE.CONTENT;
      this.BOUNDING_BOX = this.TIMELINE.BOUNDING_BOX;
      this.BOUNDING_BOX._visible = false;
   }
   function SHOW_MP_INVENTORY_ITEM_WITH_TEXT(params)
   {
      var _loc4_ = params[0];
      var _loc2_;
      if(params[1] != undefined)
      {
         _loc2_ = params[1];
         this.CONTENT.inventoryTF.text = _loc2_;
      }
      this.CONTENT.gotoAndStop(_loc4_ - 2);
      this.CONTENT._alpha = 100;
   }
   function SHOW_MP_INVENTORY_ITEM(params)
   {
      this.SHOW_MP_INVENTORY_ITEM_WITH_TEXT(params);
   }
   function REMOVE_MP_INVENTORY_ITEM()
   {
      this._HUD.REMOVE_HUD_ITEM(this._enumID);
   }
}

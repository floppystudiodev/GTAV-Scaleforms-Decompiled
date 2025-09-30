class com.rockstargames.gtav.pc.PCButtonBase
{
   var args;
   var id;
   var mc;
   var type;
   var _active = true;
   var _highlight = false;
   function PCButtonBase()
   {
   }
   function init(_mc, _type, _args)
   {
      this.mc = _mc;
      this.type = _type;
      var _loc3_ = String(_mc).split(".").slice(3);
      var _loc2_ = _loc3_.join("_");
      this.id = _loc2_ + this.type;
      if(_args != undefined)
      {
         this.args = _args;
      }
   }
   function set highlight(h)
   {
      this._highlight = h;
      if(this.mc.highlightMC != undefined)
      {
         if(this.active)
         {
            this.mc.highlightMC.gotoAndStop(!h ? "off" : "over");
         }
      }
   }
   function get highlight()
   {
      return this._highlight;
   }
   function set active(a)
   {
      this._active = a;
      if(this.mc.highlightMC != undefined)
      {
         if(a)
         {
            this.mc.highlightMC.gotoAndStop("off");
         }
         else
         {
            this.mc.highlightMC.gotoAndStop("inactive");
         }
      }
   }
   function get active()
   {
      return this._active;
   }
}

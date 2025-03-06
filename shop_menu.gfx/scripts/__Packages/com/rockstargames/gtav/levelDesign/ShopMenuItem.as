class com.rockstargames.gtav.levelDesign.ShopMenuItem extends com.rockstargames.ui.components.GUIMenuItem
{
   var newMC;
   var boughtMC;
   var wearingMC;
   var itemTextRight;
   var itemTextLeft;
   var backgroundMC;
   var overText = 0;
   var offText = 14474460;
   var inactiveText = 14474460;
   var isActive = true;
   function ShopMenuItem()
   {
      super();
   }
   function set data(_d)
   {
      this._data = _d;
      this.isActive = !Boolean(this._data[0]);
      var _loc3_ = this._data[1];
      var _loc2_ = this.data[2];
      this.newMC._visible = _loc3_;
      this.boughtMC._visible = !this.isActive;
      this.wearingMC._visible = _loc2_;
      if(_loc2_)
      {
         this.boughtMC._visible = false;
         this.itemTextRight.text = "";
      }
      else if(this.isActive)
      {
         this.itemTextRight.text = "$" + this._data[3];
         this.itemTextRight.autoFit = true;
      }
      else
      {
         this.itemTextRight.text = "";
      }
      this.highlighted = this._highlighted;
      this.itemTextLeft.text = this._data[4];
      this.itemTextLeft.autoSize = "left";
      this.newMC._x = this.itemTextLeft._x + this.itemTextLeft._width + 10;
   }
   function set highlighted(_h)
   {
      this.isActive = !Boolean(this._data[0]);
      if(_h)
      {
         this.itemTextLeft.textColor = this.itemTextRight.textColor = this.overText;
         this.itemTextLeft._alpha = this.itemTextRight._alpha = 100;
         if(this.isActive)
         {
            this.backgroundMC.gotoAndStop(2);
         }
         else
         {
            this.backgroundMC.gotoAndStop(3);
         }
         this.boughtMC.gotoAndStop(2);
         this.wearingMC.gotoAndStop(2);
         this.newMC.gotoAndStop(2);
      }
      else
      {
         this.itemTextLeft.textColor = this.itemTextRight.textColor = this.offText;
         if(this.isActive)
         {
            this.itemTextLeft._alpha = this.itemTextRight._alpha = 100;
         }
         else
         {
            this.itemTextLeft._alpha = 50;
            this.itemTextRight._alpha = 50;
         }
         this.boughtMC.gotoAndStop(1);
         this.wearingMC.gotoAndStop(1);
         this.newMC.gotoAndStop(1);
         this.backgroundMC.gotoAndStop(1);
      }
      this._highlighted = _h;
   }
}

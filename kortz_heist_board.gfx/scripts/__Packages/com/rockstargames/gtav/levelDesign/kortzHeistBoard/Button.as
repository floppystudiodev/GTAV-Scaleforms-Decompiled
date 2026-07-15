class com.rockstargames.gtav.levelDesign.kortzHeistBoard.Button
{
   var _enabled;
   var _storedEnabledState;
   var bottom;
   var depth;
   var id;
   var left;
   var right;
   var top;
   var view;
   static var GREY = new flash.geom.ColorTransform(0,0,0,1,0,0,0,0);
   static var RED = new flash.geom.ColorTransform(0,0,0,1,204,0,0,0);
   function Button(id, view, label, isStringLiteral)
   {
      this.id = id;
      this.view = view;
      this.depth = id;
      this.setLabel(label,isStringLiteral);
      this.updateBounds();
      this.forceEnabled(true);
      view.selected.transform.colorTransform = com.rockstargames.gtav.levelDesign.kortzHeistBoard.Button.RED;
      view.selected._visible = false;
   }
   function setLabel(label, isStringLiteral)
   {
      if(this.view.label && label)
      {
         this.view.label.textAutoSize = "shrink";
         if(isStringLiteral === true)
         {
            this.view.label.text = label;
         }
         else
         {
            com.rockstargames.gtav.levelDesign.KORTZ_HEIST_BOARD.setLocalisedText(this.view.label,label);
         }
      }
   }
   function updateBounds()
   {
      var _loc3_ = !this.view.bounds ? this.view.getBounds(_root) : this.view.bounds.getBounds(_root);
      this.left = _loc3_.xMin;
      this.right = _loc3_.xMax;
      this.top = _loc3_.yMin;
      this.bottom = _loc3_.yMax;
   }
   function set selected(isSelected)
   {
      this.view.selected._visible = isSelected;
   }
   function set selectedIsGreyedOut(isGreyedOut)
   {
      this.view.selected.transform.colorTransform = !isGreyedOut ? com.rockstargames.gtav.levelDesign.kortzHeistBoard.Button.RED : com.rockstargames.gtav.levelDesign.kortzHeistBoard.Button.GREY;
   }
   function set isGreyedOut(isGreyedOut)
   {
      var _loc2_ = new flash.geom.ColorTransform();
      if(isGreyedOut)
      {
         _loc2_.rgb = 10066329;
         this.view.label.textColor = 10066329;
      }
      else
      {
         this.view.label.textColor = 6791801;
      }
      this.view.ring.transform.colorTransform = _loc2_;
   }
   function get enabled()
   {
      return this._enabled;
   }
   function set enabled(isEnabled)
   {
      if(isEnabled)
      {
         this._enabled = this._storedEnabledState;
      }
      else
      {
         this._storedEnabledState = this._enabled;
         this._enabled = false;
      }
   }
   function forceEnabled(isEnabled)
   {
      this._enabled = isEnabled;
      this._storedEnabledState = isEnabled;
   }
}

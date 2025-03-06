class com.rockstargames.gtav.levelDesign.casinoHeistBoardPrep.Button
{
   var id;
   var view;
   var depth;
   var left;
   var right;
   var top;
   var bottom;
   var _enabled;
   var _storedEnabledState;
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
      view.selected.transform.colorTransform = com.rockstargames.gtav.levelDesign.casinoHeistBoardPrep.Button.RED;
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
            com.rockstargames.gtav.levelDesign.CASINO_HEIST_BOARD_PREP.setLocalisedText(this.view.label,label);
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
      this.view.selected.transform.colorTransform = !isGreyedOut ? com.rockstargames.gtav.levelDesign.casinoHeistBoardPrep.Button.RED : com.rockstargames.gtav.levelDesign.casinoHeistBoardPrep.Button.GREY;
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

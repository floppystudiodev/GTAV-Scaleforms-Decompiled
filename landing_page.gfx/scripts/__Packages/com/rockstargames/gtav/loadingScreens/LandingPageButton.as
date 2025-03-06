class com.rockstargames.gtav.loadingScreens.LandingPageButton extends MovieClip
{
   var _buttonId;
   var label;
   var bg;
   var _greyColourHex;
   var _greyColourAlpha;
   var _mouseCatcher;
   function LandingPageButton()
   {
      super();
   }
   function init(id, data, greyColour)
   {
      this._buttonId = id;
      this.label.autoSize = "left";
      this.label.htmlText = data.toUpperCase();
      this.bg._width = this.label.textWidth + 32;
      this._greyColourHex = com.rockstargames.ui.utils.Colour.RGBToHex(greyColour.r,greyColour.g,greyColour.b);
      this._greyColourAlpha = greyColour.a;
      this._mouseCatcher = com.rockstargames.ui.mouse.MouseBtn(this.attachMovie("MouseCatcherMC","mouseCatcher",this.getNextHighestDepth(),{_width:this.bg._width}));
      this._mouseCatcher.setupGenericMouseInterface(id,undefined);
   }
   function get buttonId()
   {
      return this._buttonId;
   }
   function setHighlight(value)
   {
      if(value)
      {
         this.label.textColor = 16777215;
         this.label._alpha = 100;
      }
      else
      {
         this.label.textColor = this._greyColourHex;
         this.label._alpha = this._greyColourAlpha;
      }
   }
}

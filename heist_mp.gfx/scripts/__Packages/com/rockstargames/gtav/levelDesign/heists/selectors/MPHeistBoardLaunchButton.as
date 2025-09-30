class com.rockstargames.gtav.levelDesign.heists.selectors.MPHeistBoardLaunchButton extends com.rockstargames.ui.components.GUIMenuItem
{
   var _visible;
   var _x;
   var _xscale;
   var _y;
   var _yscale;
   var launchButtonFrameMC;
   var launchTF;
   var isVisible = false;
   var enabled = false;
   function MPHeistBoardLaunchButton()
   {
      super();
      this._visible = false;
      com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.launchTF,com.rockstargames.gtav.levelDesign.heists.HeistColours.BLUE);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.launchButtonFrameMC,com.rockstargames.gtav.levelDesign.heists.HeistColours.BLUE);
   }
   function set data(_d)
   {
      this._data = _d;
      this.isVisible = this._data[2];
      if(this.isVisible == undefined)
      {
         this.isVisible == false;
      }
      this._visible = this.isVisible;
   }
   function repositionLaunchButton(_numPlayers)
   {
      if(_numPlayers == 7)
      {
         this.launchButtonFrameMC._xscale = 75;
         this.launchButtonFrameMC._yscale = 75;
         this._xscale = 100;
         this._yscale = 100;
         this._x = 396;
         this._y = 98 + 60 * _numPlayers;
      }
      else if(_numPlayers == 8)
      {
         this.launchButtonFrameMC._xscale = 55;
         this.launchButtonFrameMC._yscale = 60;
         this._xscale = 86;
         this._yscale = 86;
         this._x = 308;
         this._y = 98 + 60 * _numPlayers;
      }
      else
      {
         this.launchButtonFrameMC._xscale = 100;
         this.launchButtonFrameMC._yscale = 100;
         this._xscale = 100;
         this._yscale = 100;
         this._x = 470;
         this._y = 106 + 60 * _numPlayers;
      }
   }
   function enableLaunchButton(_enabled)
   {
      this.enabled = _enabled;
   }
   function set labels(_l)
   {
      this.launchTF.htmlText = _l[1];
      this.launchTF.textAutoSize = "shrink";
      this.highlighted(false);
   }
   function setColour(hudColour)
   {
      com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.launchTF,hudColour);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.launchButtonFrameMC,hudColour);
   }
   function set highlighted(_h)
   {
      this._highlighted = _h;
      com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.launchTF,!_h ? com.rockstargames.gtav.levelDesign.heists.HeistColours.BLUE : com.rockstargames.gtav.levelDesign.heists.HeistColours.GREEN);
      if(_h == false)
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.launchButtonFrameMC,com.rockstargames.gtav.levelDesign.heists.HeistColours.BLUE);
      }
      else
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.launchButtonFrameMC,com.rockstargames.gtav.levelDesign.heists.HeistColours.GREEN);
      }
   }
}

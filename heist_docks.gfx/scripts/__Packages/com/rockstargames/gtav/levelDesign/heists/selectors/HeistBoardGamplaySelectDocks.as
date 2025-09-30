class com.rockstargames.gtav.levelDesign.heists.selectors.HeistBoardGamplaySelectDocks extends com.rockstargames.gtav.levelDesign.heists.selectors.HeistBoardGamplaySelect
{
   var __get__data;
   var _data;
   var _highlighted;
   var gameplayMC;
   var isAnimating;
   function HeistBoardGamplaySelectDocks()
   {
      super();
   }
   function set data(_d)
   {
      this._data = _d;
      this.gameplayMC.gotoAndStop(this.data[2]);
      this.gameplayMC.tintMC.gotoAndStop(1);
   }
   function set highlighted(_h)
   {
      this.isAnimating = false;
      this.gameplayMC.tintMC.gotoAndStop(!_h ? 1 : 2);
      this._highlighted = _h;
   }
}

class com.rockstargames.gtav.ng.Replay.COL_TYPE_TEXT_PLACEMENT extends com.rockstargames.gtav.ng.Replay.ReplayBaseItemIMG
{
   var APP_DATA;
   var bgMC;
   var hudColourBlack;
   var myHeight;
   var BLACK_ALPHA = 70;
   function COL_TYPE_TEXT_PLACEMENT()
   {
      super();
      this.myHeight = 430;
      com.rockstargames.ui.utils.Colour.Colourise(this.bgMC,this.hudColourBlack.r,this.hudColourBlack.g,this.hudColourBlack.b,this.BLACK_ALPHA);
   }
   function set data(_d)
   {
      super.data = _d;
      this.APP_DATA = _d[0];
      if(_d[1] != undefined)
      {
         this.loadComponent(_d[1],_d[2],_d[3]);
      }
   }
   function set highlighted(_h)
   {
   }
}

class com.rockstargames.gtav.ng.Replay.COL_TYPE_BASIC_PAGE extends com.rockstargames.gtav.ng.Replay.ReplayBaseItem
{
   var APP_DATA;
   var BLACK_ALPHA;
   var bgMC;
   var blipLayer;
   var hudColourBlack;
   var labelMC;
   var myHeight;
   function COL_TYPE_BASIC_PAGE()
   {
      super();
      this.myHeight = 430;
      com.rockstargames.ui.utils.Colour.Colourise(this.bgMC,this.hudColourBlack.r,this.hudColourBlack.g,this.hudColourBlack.b,this.BLACK_ALPHA);
   }
   function set data(_d)
   {
      super.data = _d;
      this.APP_DATA = _d[0];
      var _loc4_ = _d[2];
      this.clearBlipLayer();
      var _loc5_ = new com.rockstargames.ui.utils.Text();
      _loc5_.setTextWithIcons(_loc4_,this.blipLayer,this.labelMC.bodyTF,0,13,4,false);
      this.labelMC.titleTF.htmlText = _d[1];
      this.labelMC.titleTF.textAutoSize = "shrink";
   }
   function set highlighted(_h)
   {
   }
   function clearBlipLayer()
   {
      if(this.blipLayer != undefined)
      {
         this.blipLayer.removeMovieClip();
      }
      this.blipLayer = this.labelMC.createEmptyMovieClip("blipLayer",1000,{_x:this.labelMC.bodyTF._x,_y:this.labelMC.bodyTF._y});
   }
}

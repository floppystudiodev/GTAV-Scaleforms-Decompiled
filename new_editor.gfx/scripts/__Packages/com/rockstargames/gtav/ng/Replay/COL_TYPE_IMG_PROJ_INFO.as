class com.rockstargames.gtav.ng.Replay.COL_TYPE_IMG_PROJ_INFO extends com.rockstargames.gtav.ng.Replay.ReplayBaseItem
{
   var APP_DATA;
   var bgMC;
   var bgMCLower;
   var hudColourBlack;
   var labelMC;
   var myHeight;
   function COL_TYPE_IMG_PROJ_INFO()
   {
      super();
      this.myHeight = 322;
      com.rockstargames.ui.utils.Colour.Colourise(this.bgMC,this.hudColourBlack.r,this.hudColourBlack.g,this.hudColourBlack.b,this.BLACK_ALPHA);
      com.rockstargames.ui.utils.Colour.Colourise(this.bgMCLower,this.hudColourBlack.r,this.hudColourBlack.g,this.hudColourBlack.b,this.BLACK_ALPHA);
   }
   function set data(_d)
   {
      super.data = _d;
      this.APP_DATA = _d[0];
      this.clearIfUndefinied(this.labelMC.row_1_col_1_TF,_d[1]);
      this.clearIfUndefinied(this.labelMC.row_1_col_2_TF,_d[2]);
      this.clearIfUndefinied(this.labelMC.row_2_col_1_TF,_d[3]);
   }
   function set highlighted(_h)
   {
   }
}

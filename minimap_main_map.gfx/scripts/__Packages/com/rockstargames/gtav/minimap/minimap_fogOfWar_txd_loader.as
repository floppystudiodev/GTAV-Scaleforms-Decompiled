class com.rockstargames.gtav.minimap.minimap_fogOfWar_txd_loader extends MovieClip
{
   var TXDmc;
   var txd_loader;
   var x_size;
   var y_size;
   function minimap_fogOfWar_txd_loader()
   {
      super();
   }
   function SET_BITMAP_FOG_ON(txd, xpos, ypos, xsize, ysize)
   {
      this.TXDmc = this.createEmptyMovieClip(txd,this.getNextHighestDepth(),{_x:0,y:0});
      this.x_size = xsize;
      this.y_size = ysize;
      this.LOADCLIP(txd,this.TXDmc);
   }
   function LOADCLIP(textureDict, targetMC)
   {
      this.txd_loader = new MovieClipLoader();
      this.txd_loader.addListener(this);
      var _loc2_ = "img://" + textureDict + "/" + textureDict;
      this.txd_loader.loadClip(_loc2_,targetMC);
   }
   function onLoadInit(targetMC)
   {
      targetMC._width = this.x_size;
      targetMC._height = this.y_size;
      this.txd_loader.removeListener(this);
      this.txd_loader = null;
   }
}

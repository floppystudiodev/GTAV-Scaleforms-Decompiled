class com.rockstargames.gtav.FrontendGen9.components.MainImageSeries extends com.rockstargames.gtav.FrontendGen9.components.MainImage
{
   var _imageMask;
   var itemHeight;
   var itemWidth;
   function MainImageSeries()
   {
      super();
      this.itemHeight = 423;
      this._imageMask.clear();
      this._imageMask.beginFill(0);
      this._imageMask.lineTo(this.itemWidth,0);
      this._imageMask.lineTo(this.itemWidth,this.itemHeight);
      this._imageMask.lineTo(0,this.itemHeight);
      this._imageMask.lineTo(0,0);
      this._imageMask.endFill();
      this._imageMask._visible = false;
   }
}

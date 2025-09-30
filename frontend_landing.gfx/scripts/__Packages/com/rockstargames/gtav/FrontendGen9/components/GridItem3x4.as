class com.rockstargames.gtav.FrontendGen9.components.GridItem3x4 extends com.rockstargames.gtav.FrontendGen9.components.GridItem
{
   var _spacerSize;
   var itemHeight;
   var itemWidth;
   var rearrangeContent;
   function GridItem3x4()
   {
      super();
      this.itemWidth = this.itemWidth * 3 + this._spacerSize * 2;
      this.itemHeight = this.itemHeight * 4 + this._spacerSize * 3;
      this.rearrangeContent();
   }
}

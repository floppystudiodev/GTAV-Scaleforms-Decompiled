class com.rockstargames.gtav.FrontendGen9.components.GridItem2x2 extends com.rockstargames.gtav.FrontendGen9.components.GridItem
{
   var _spacerSize;
   var itemHeight;
   var itemWidth;
   var rearrangeContent;
   function GridItem2x2()
   {
      super();
      this.itemWidth = this.itemWidth * 2 + this._spacerSize;
      this.itemHeight = this.itemHeight * 2 + this._spacerSize;
      this.rearrangeContent();
   }
}

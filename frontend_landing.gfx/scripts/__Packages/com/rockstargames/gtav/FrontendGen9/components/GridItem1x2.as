class com.rockstargames.gtav.FrontendGen9.components.GridItem1x2 extends com.rockstargames.gtav.FrontendGen9.components.GridItem
{
   var _spacerSize;
   var _titleText;
   var attachMovie;
   var itemHeight;
   var rearrangeContent;
   function GridItem1x2()
   {
      super();
      this._titleText = com.rockstargames.gtav.FrontendGen9.components.Text(this.attachMovie("titleSmall","title",100));
      this.itemHeight = this.itemHeight * 2 + this._spacerSize;
      this.rearrangeContent();
   }
}

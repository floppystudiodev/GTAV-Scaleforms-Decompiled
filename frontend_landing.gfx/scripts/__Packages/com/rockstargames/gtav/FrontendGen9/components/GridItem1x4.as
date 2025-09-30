class com.rockstargames.gtav.FrontendGen9.components.GridItem1x4 extends com.rockstargames.gtav.FrontendGen9.components.GridItem
{
   var _spacerSize;
   var _textAnimationDistance;
   var _titleText;
   var attachMovie;
   var itemHeight;
   var rearrangeContent;
   function GridItem1x4()
   {
      super();
      this._titleText = com.rockstargames.gtav.FrontendGen9.components.Text(this.attachMovie("titleSmall","title",100));
      this._textAnimationDistance = 40;
      this.itemHeight = this.itemHeight * 4 + this._spacerSize * 3;
      this.rearrangeContent();
   }
}

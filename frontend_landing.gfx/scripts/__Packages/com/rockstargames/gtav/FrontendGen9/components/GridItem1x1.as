class com.rockstargames.gtav.FrontendGen9.components.GridItem1x1 extends com.rockstargames.gtav.FrontendGen9.components.GridItem
{
   var _titleText;
   var attachMovie;
   function GridItem1x1()
   {
      super();
      this._titleText = com.rockstargames.gtav.FrontendGen9.components.Text(this.attachMovie("titleSmall","title",100));
      this._titleText.textTF._x = 2.6667;
      this._titleText.textTF._y = -1;
      this._textScale = 65;
      this._textAnimationDistance = 0;
      this.rearrangeContent();
   }
}

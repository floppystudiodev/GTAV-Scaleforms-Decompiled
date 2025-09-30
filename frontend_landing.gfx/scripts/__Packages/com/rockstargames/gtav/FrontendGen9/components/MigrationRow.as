class com.rockstargames.gtav.FrontendGen9.components.MigrationRow extends MovieClip
{
   var _leftText;
   var _rightText;
   var itemWidth = 428;
   function MigrationRow()
   {
      super();
      this._leftText = com.rockstargames.gtav.FrontendGen9.components.Text(this.attachMovie("migrationLeftText","migrationLeftText",this.getNextHighestDepth()));
      this._rightText = com.rockstargames.gtav.FrontendGen9.components.Text(this.attachMovie("migrationRightText","migrationRightText",this.getNextHighestDepth(),{_x:this.itemWidth}));
   }
   function SET_ROW_TEXT(leftStr, rightStr, isRichText)
   {
      this._leftText.SET_TEXT(leftStr,isRichText);
      this._rightText.SET_TEXT(rightStr,isRichText);
   }
}

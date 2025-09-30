class com.rockstargames.gtav.FrontendGen9.components.GridItem2x4 extends com.rockstargames.gtav.FrontendGen9.components.GridItem
{
   var _description;
   var _initialTitlePosition;
   var _spacerSize;
   var _titleText;
   var attachMovie;
   var itemHeight;
   var itemWidth;
   var rearrangeContent;
   function GridItem2x4()
   {
      super();
      this.itemWidth = this.itemWidth * 2 + this._spacerSize;
      this.itemHeight = this.itemHeight * 4 + this._spacerSize * 3;
      this.rearrangeContent();
      this._description = com.rockstargames.gtav.FrontendGen9.components.Text(this.attachMovie("mainFeatureDescription","mainFeatureDescription",130,{_x:15,_y:205,_visible:false}));
      this._description._alpha = 0;
      this._initialTitlePosition.x = this._titleText._x = this._description._x;
   }
}

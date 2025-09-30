class com.rockstargames.gtav.FrontendGen9.components.SummaryItem extends MovieClip
{
   var _description;
   var _line;
   var _price;
   var _titleText;
   var _textScale = 65;
   function SummaryItem()
   {
      super();
      this._titleText = com.rockstargames.gtav.FrontendGen9.components.Text(this.attachMovie("title","title",this.getNextHighestDepth()));
      this._description = com.rockstargames.gtav.FrontendGen9.components.Text(this.attachMovie("summaryDescription","description",this.getNextHighestDepth(),{_y:27}));
      this._price = com.rockstargames.gtav.FrontendGen9.components.Price(this.attachMovie("summaryPrice","summaryPrice",this.getNextHighestDepth(),{_x:447}));
      this._line = this.attachMovie("summaryLine","summaryLine",this.getNextHighestDepth(),{_y:50});
      this._titleText._xscale = this._textScale;
      this._titleText._yscale = this._textScale;
      if(com.rockstargames.gtav.FrontendGen9.components.Text.isAsian)
      {
         this._description._y = 30;
      }
   }
   function SET_SUMMARY_ITEM_DETAILS(title, description, price, isRichText)
   {
      this._titleText.SET_TEXT(title,isRichText);
      this._description._fontStyle = com.rockstargames.gtav.FrontendGen9.components.Text.FONT_STYLE_CONDENSED_NOT_GAMERNAME;
      this._description._pointSize = 18;
      this._description.SET_TEXT(description,isRichText);
      this._price.SET_TEXT(price,isRichText);
   }
   function ANIMATE_IN(sequenceIndex)
   {
      var _loc2_ = 0.367;
      var _loc3_ = 0.1 * sequenceIndex;
      this._alpha = 0;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this,_loc2_,{_alpha:100,delay:_loc3_});
   }
}

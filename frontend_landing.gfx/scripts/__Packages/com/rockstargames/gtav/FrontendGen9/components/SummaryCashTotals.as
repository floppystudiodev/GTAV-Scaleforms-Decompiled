class com.rockstargames.gtav.FrontendGen9.components.SummaryCashTotals extends MovieClip
{
   var _price;
   var _titleText;
   var _textScale = 65;
   function SummaryCashTotals()
   {
      super();
      this._titleText = com.rockstargames.gtav.FrontendGen9.components.Text(this.attachMovie("title","title",this.getNextHighestDepth(),{_y:-7}));
      this._price = com.rockstargames.gtav.FrontendGen9.components.Price(this.attachMovie("summaryPrice","summaryPrice",this.getNextHighestDepth(),{_x:447}));
      this._titleText._xscale = this._textScale;
      this._titleText._yscale = this._textScale;
   }
   function SET_SUMMARY_CASH_TOTALS(title, price, isRichText)
   {
      this._titleText.SET_TEXT(title,isRichText);
      this._price._pointSize = 20;
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

class com.rockstargames.gtav.FrontendGen9.components.MainFeature extends com.rockstargames.gtav.FrontendGen9.components.BaseItem
{
   var _alpha;
   var _description;
   var _price;
   var _statBar1;
   var _statBar2;
   var _statBar3;
   var _statBar4;
   var _statBar5;
   var _sticker;
   var _titleText;
   var attachMovie;
   var getNextHighestDepth;
   var itemHeight = 1152;
   var itemWidth = 555;
   var _textScale = 85;
   function MainFeature()
   {
      super();
      this._sticker = com.rockstargames.gtav.FrontendGen9.components.Sticker(this.attachMovie("sticker","sticker",90,{_visible:false}));
      this._price = com.rockstargames.gtav.FrontendGen9.components.Price(this.attachMovie("mainFeaturePrice","mainFeaturePrice",100));
      this._titleText = com.rockstargames.gtav.FrontendGen9.components.Text(this.attachMovie("title","title",110,{_y:39,_x:1.3333}));
      this._description = com.rockstargames.gtav.FrontendGen9.components.Text(this.attachMovie("mainFeatureDescription","mainFeatureDescription",120,{_y:80}));
      this._titleText._xscale = this._textScale;
      this._titleText._yscale = this._textScale;
   }
   function SET_FEATURE_ITEM_DETAILS(titleStr, descStr, tagTxd, tagTexture, price, isRichText)
   {
      this._titleText.SET_TEXT(titleStr);
      this._description.SET_TEXT(descStr,isRichText);
      if(price != undefined)
      {
         this._price.SET_TEXT(price,true);
      }
      if(com.rockstargames.gtav.FrontendGen9.components.Text.isAsian)
      {
         this._titleText.resizeAsianText();
      }
   }
   function SET_FEATURE_ITEM_DETAILS_RICHTEXT(titleStr, descStr, tagTxd, tagTexture, price)
   {
      this.SET_FEATURE_ITEM_DETAILS(titleStr,descStr,tagTxd,tagTexture,price,true);
   }
   function SET_FEATURE_ITEM_STATS(stat1Title, stat2Title, stat3Title, stat4Title, stat5Title, stat1, stat2, stat3, stat4, stat5)
   {
      var _loc2_ = 240;
      if(stat5 >= 0)
      {
         this._statBar5 = com.rockstargames.gtav.FrontendGen9.components.StatBar(this.attachMovie("statBar","statBar5",this.getNextHighestDepth(),{_y:300}));
         this._statBar5.SET_STATS(stat5Title,stat5);
         _loc2_ = 220;
      }
      this._statBar1 = com.rockstargames.gtav.FrontendGen9.components.StatBar(this.attachMovie("statBar","statBar1",this.getNextHighestDepth(),{_y:_loc2_}));
      this._statBar2 = com.rockstargames.gtav.FrontendGen9.components.StatBar(this.attachMovie("statBar","statBar2",this.getNextHighestDepth(),{_y:_loc2_ + 20}));
      this._statBar3 = com.rockstargames.gtav.FrontendGen9.components.StatBar(this.attachMovie("statBar","statBar3",this.getNextHighestDepth(),{_y:_loc2_ + 40}));
      this._statBar4 = com.rockstargames.gtav.FrontendGen9.components.StatBar(this.attachMovie("statBar","statBar4",this.getNextHighestDepth(),{_y:_loc2_ + 60}));
      this._statBar1.SET_STATS(stat1Title,stat1);
      this._statBar2.SET_STATS(stat2Title,stat2);
      this._statBar3.SET_STATS(stat3Title,stat3);
      this._statBar4.SET_STATS(stat4Title,stat4);
   }
   function CLEAR_STATS()
   {
      this._statBar1.removeMovieClip();
      this._statBar2.removeMovieClip();
      this._statBar3.removeMovieClip();
      this._statBar4.removeMovieClip();
      this._statBar5.removeMovieClip();
   }
   function ADD_STICKER(id, str)
   {
      this._sticker.SET_TYPE_AND_TEXT(id,str);
      this._sticker._visible = true;
      this._price._visible = false;
   }
   function REMOVE_STICKER()
   {
      this._sticker._visible = false;
      this._price._visible = true;
   }
   function ANIMATE_IN(sequenceIndex)
   {
      var _loc2_ = 0.367;
      var _loc3_ = 0.1 * sequenceIndex;
      this._alpha = 0;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this,_loc2_,{_alpha:100,delay:_loc3_});
   }
   function ANIMATE_OUT(sequenceIndex)
   {
      var _loc2_ = 0.367;
      var _loc3_ = 0.1 * sequenceIndex;
      this._alpha = 100;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this,_loc2_,{_alpha:0,delay:_loc3_});
   }
}

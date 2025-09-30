class com.rockstargames.gtav.FrontendGen9.components.MainFeatureCareer extends com.rockstargames.gtav.FrontendGen9.components.MainFeature
{
   var _description;
   var _price;
   var _titleText;
   var attachMovie;
   function MainFeatureCareer()
   {
      super();
   }
   function SET_FEATURE_ITEM_DETAILS(titleStr, descStr, tagTxd, tagTexture, price, isRichText)
   {
      this._description.removeMovieClip();
      this._description = com.rockstargames.gtav.FrontendGen9.components.Text(this.attachMovie("mainFeatureDescriptionCareer","mainFeatureDescriptionCareer",120,{_y:80}));
      this._description._pointSize = 20;
      this._description._fontStyle = 6;
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
}

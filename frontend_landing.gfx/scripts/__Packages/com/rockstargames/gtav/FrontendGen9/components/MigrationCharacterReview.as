class com.rockstargames.gtav.FrontendGen9.components.MigrationCharacterReview extends com.rockstargames.gtav.FrontendGen9.components.BaseItem
{
   var _description;
   var _logo;
   var _profile1;
   var _profile2;
   var _strap;
   var _tabItems;
   var _titleText;
   var attachMovie;
   var getNextHighestDepth;
   var itemHeight = 1152;
   var itemWidth = 450;
   var _textScale = 85;
   var _yOffset = 46.6666;
   var _spacer = 13.33333;
   function MigrationCharacterReview()
   {
      super();
      this._tabItems = [];
      this._titleText = com.rockstargames.gtav.FrontendGen9.components.Text(this.attachMovie("title","title",this.getNextHighestDepth(),{_y:this._yOffset}));
      this._description = com.rockstargames.gtav.FrontendGen9.components.Text(this.attachMovie("mainFeatureDescription","dscription",this.getNextHighestDepth(),{_y:32.6666 + this._yOffset}));
      this._profile1 = com.rockstargames.gtav.FrontendGen9.components.MigrationProfile(this.attachMovie("migrationProfile","migrationProfile1",this.getNextHighestDepth(),{_x:18,_y:this._yOffset}));
      this._profile1._index = 0;
      this._profile2 = com.rockstargames.gtav.FrontendGen9.components.MigrationProfile(this.attachMovie("migrationProfile","migrationProfile2",this.getNextHighestDepth(),{_x:18,_y:this._yOffset}));
      this._profile2._index = 1;
      this._strap = com.rockstargames.gtav.FrontendGen9.components.Text(this.attachMovie("mainFeatureDescription","strapline",this.getNextHighestDepth(),{_x:1,_y:this._yOffset}));
      this._logo = com.rockstargames.gtav.FrontendGen9.components.Image(this.attachMovie("logoImage","logo",this.getNextHighestDepth(),{_x:982,_y:341,_height:169,_width:169}));
      this._titleText._xscale = this._textScale;
      this._titleText._yscale = this._textScale;
      this.rearrange();
   }
   function SET_ITEM_DETAILS(titleStr, descStr, strapLine, tagTxd, tagTexture, isRichText)
   {
      this._titleText.SET_TEXT(titleStr);
      this._description.SET_TEXT(descStr,isRichText);
      this._strap.SET_TEXT(strapLine,isRichText);
      this._logo.SET_IMAGE(tagTxd,tagTexture);
      this.rearrange();
   }
   function SET_PROFILE_INFO(profileID, profileName, rp, headshotTexture, rank)
   {
      var _loc2_;
      if(profileID == 1)
      {
         _loc2_ = this._profile2;
      }
      else
      {
         _loc2_ = this._profile1;
      }
      _loc2_.SET_PROFILE_INFO(profileName,rp,headshotTexture,-1);
   }
   function SET_STATE(profileID, state)
   {
      var _loc2_;
      if(profileID == 1)
      {
         _loc2_ = this._profile2;
      }
      else
      {
         _loc2_ = this._profile1;
      }
      _loc2_.SET_STATE(state);
   }
   function rearrange()
   {
      var _loc2_ = this._description._y + this._description.getTextHeight();
      this._profile1._y = _loc2_ + 43.3333;
      this._profile2._y = this._profile1._y + 79.33333;
      this._strap._y = this._profile2._y + 54 + this._spacer;
   }
}

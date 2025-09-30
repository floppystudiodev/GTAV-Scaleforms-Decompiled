class com.rockstargames.gtav.FrontendGen9.components.Migration extends com.rockstargames.gtav.FrontendGen9.components.MigrationSaveGame
{
   var _bank;
   var _blackBackground;
   var _line1;
   var _line2;
   var _outline;
   var _profile1;
   var _profile2;
   var attachMovie;
   var getNextHighestDepth;
   var itemHeight = 1152;
   var itemWidth = 450;
   var _yOffset = 46.6666;
   function Migration()
   {
      super();
      this._line1 = this.attachMovie("summaryLine","summaryLine1",this.getNextHighestDepth(),{_x:13.3333,_y:297 + this._yOffset,_width:424,_alpha:50});
      this._profile1 = com.rockstargames.gtav.FrontendGen9.components.MigrationProfile(this.attachMovie("migrationProfile","migrationProfile1",this.getNextHighestDepth(),{_x:13.3333,_y:310 + this._yOffset}));
      this._profile1._index = 0;
      this._profile1.blackBackground._visible = false;
      this._line2 = this.attachMovie("summaryLine","summaryLine2",this.getNextHighestDepth(),{_x:13.3333,_y:365 + this._yOffset,_width:424,_alpha:50,_visible:false});
      this._profile2 = com.rockstargames.gtav.FrontendGen9.components.MigrationProfile(this.attachMovie("migrationProfile","migrationProfile2",this.getNextHighestDepth(),{_x:13.3333,_y:375 + this._yOffset,_visible:false}));
      this._profile2._index = 1;
      this._profile2.blackBackground._visible = false;
      this._blackBackground._height = 149;
      this._outline._height = 149;
      this._bank._visible = false;
      this.rearrange();
   }
   function SET_PROFILE_INFO(profileID, profileName, rp, headshotTexture, rank)
   {
      var _loc2_;
      if(profileID == 1)
      {
         _loc2_ = this._profile2;
         this._line2._visible = true;
         this._profile2._visible = true;
         this._blackBackground._height = 217;
         this._outline._height = 217;
      }
      else
      {
         _loc2_ = this._profile1;
         this._blackBackground._height = 149;
         this._outline._height = 149;
      }
      _loc2_.SET_PROFILE_INFO(profileName,rp,headshotTexture,rank);
      this.rearrange();
   }
   function rearrange()
   {
      super.rearrange();
      this._line1._y = this._blackBackground._y + 77.3333;
      this._profile1._y = this._line1._y + this._spacer;
      this._line2._y = this._line1._y + 68;
      this._profile2._y = this._line2._y + this._spacer;
   }
}

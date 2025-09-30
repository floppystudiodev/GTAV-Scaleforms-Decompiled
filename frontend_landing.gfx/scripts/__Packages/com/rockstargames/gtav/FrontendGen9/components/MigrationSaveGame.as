class com.rockstargames.gtav.FrontendGen9.components.MigrationSaveGame extends com.rockstargames.gtav.FrontendGen9.components.BaseItem
{
   var _bank;
   var _blackBackground;
   var _date;
   var _description;
   var _gamerSlot1;
   var _gamerSlot2;
   var _logo;
   var _missions;
   var _outline;
   var _tabItems;
   var _titleText;
   var attachMovie;
   var getNextHighestDepth;
   var _yOffset = 53.3333;
   var _spacer = 13.33333;
   var _textScale = 85;
   function MigrationSaveGame()
   {
      super();
      this._tabItems = [];
      this._blackBackground = this.attachMovie("blackBackground","blackBackground",this.getNextHighestDepth(),{_y:200 + this._yOffset,_width:454,_height:101.6667});
      this._outline = this.attachMovie("highlight","highlight",this.getNextHighestDepth(),{_x:-4,_y:200 + this._yOffset,_height:101.6667,_width:458});
      this._titleText = com.rockstargames.gtav.FrontendGen9.components.Text(this.attachMovie("title","title",this.getNextHighestDepth(),{_y:this._yOffset}));
      this._description = com.rockstargames.gtav.FrontendGen9.components.Text(this.attachMovie("mainFeatureDescription","mainFeatureDescription",this.getNextHighestDepth(),{_y:32.6666 + this._yOffset}));
      this._gamerSlot1 = com.rockstargames.gtav.FrontendGen9.components.TabItem(this.attachMovie("tabItem","gamernameTabItem1",this.getNextHighestDepth(),{_y:140 + this._yOffset,_visible:false}));
      this._gamerSlot2 = com.rockstargames.gtav.FrontendGen9.components.TabItem(this.attachMovie("tabItem","gamernameTabItem2",this.getNextHighestDepth(),{_y:140 + this._yOffset,_visible:false}));
      this._gamerSlot1._index = 0;
      this._tabItems.push(this._gamerSlot1);
      this._gamerSlot2._index = 1;
      this._tabItems.push(this._gamerSlot2);
      this._date = com.rockstargames.gtav.FrontendGen9.components.MigrationRow(this.attachMovie("MigrationRow","migrationRowDate",this.getNextHighestDepth(),{_x:13.3333,_y:220 + this._yOffset}));
      this._missions = com.rockstargames.gtav.FrontendGen9.components.MigrationRow(this.attachMovie("MigrationRow","migrationRowMissions",this.getNextHighestDepth(),{_x:13.3333,_y:245 + this._yOffset}));
      this._bank = com.rockstargames.gtav.FrontendGen9.components.MigrationRow(this.attachMovie("MigrationRow","migrationRowBank",this.getNextHighestDepth(),{_x:13.3333,_y:270 + this._yOffset}));
      this._logo = com.rockstargames.gtav.FrontendGen9.components.Image(this.attachMovie("logoImage","logo",this.getNextHighestDepth(),{_x:988,_y:341,_height:169,_width:169}));
      this._titleText._xscale = this._textScale;
      this._titleText._yscale = this._textScale;
      this.rearrange();
   }
   function SET_ITEM_DETAILS(titleStr, descStr, tagTxd, tagTexture, isRichText)
   {
      this._titleText.SET_TEXT(titleStr);
      this._description.SET_TEXT(descStr,isRichText);
      this._logo.SET_IMAGE(tagTxd,tagTexture);
      this.rearrange();
   }
   function SET_ITEM_INFO(row1Label, row1Value, row2Label, row2Value, row3Label, row3Value, row4Label, row4Value)
   {
      this._date.SET_ROW_TEXT(row1Label,row1Value,true);
      this._missions.SET_ROW_TEXT(row2Label,row2Value,true);
      this._bank.SET_ROW_TEXT(row3Label,row3Value,true);
      this.rearrange();
   }
   function SET_ACCOUNT_NAME(whichAcc, name)
   {
      var _loc2_ = com.rockstargames.gtav.FrontendGen9.components.TabItem(this._tabItems[whichAcc]);
      _loc2_.SET_TITLE(name);
      _loc2_._visible = true;
      this._gamerSlot2._x = this._gamerSlot1._x + this._gamerSlot1._width;
      this.rearrange();
   }
   function SET_TAB_STATE(whichTab, state, enabled)
   {
      this.UNHIGHLIGHT_ALL_TABS();
      var _loc2_ = com.rockstargames.gtav.FrontendGen9.components.TabItem(this._tabItems[whichTab]);
      _loc2_.SET_STATE(state);
   }
   function UNHIGHLIGHT_ALL_TABS()
   {
      var _loc3_;
      var _loc2_ = 0;
      while(_loc2_ < this._tabItems.length)
      {
         _loc3_ = com.rockstargames.gtav.FrontendGen9.components.TabItem(this._tabItems[_loc2_]);
         _loc3_.SET_STATE(0);
         _loc2_ = _loc2_ + 1;
      }
   }
   function rearrange()
   {
      var _loc2_ = this._description._y + this._description.getTextHeight();
      this._gamerSlot1._y = _loc2_ + 12;
      this._gamerSlot2._y = this._gamerSlot1._y;
      this._blackBackground._y = this._gamerSlot1._y + this._gamerSlot1._height + 9.3333;
      this._outline._y = this._blackBackground._y;
      this._date._y = this._blackBackground._y + this._spacer + 3.666666667;
      this._missions._y = this._date._y + this._spacer + this._spacer - 1;
      this._bank._y = this._missions._y + this._spacer + this._spacer - 1;
   }
}

class com.rockstargames.gtav.FrontendGen9.components.MigrationProfile extends com.rockstargames.gtav.FrontendGen9.components.BaseItem
{
   var MOUSE_EVT;
   var _headshot;
   var _highlight;
   var _hover;
   var _profileName;
   var _rankIcon;
   var _rp;
   var attachMovie;
   var blackBackground;
   var getNextHighestDepth;
   var hitArea;
   var _isLit = false;
   var itemWidth = 414;
   var _index = -1;
   var myBtnType = 3;
   var SF_BASE_CLASS_MOUSE = 10;
   function MigrationProfile()
   {
      super();
      this.blackBackground = this.attachMovie("blackBackground","blackBackground",this.getNextHighestDepth(),{_x:-18,_y:-10,_width:448,_height:64});
      this._profileName = com.rockstargames.gtav.FrontendGen9.components.Text(this.attachMovie("migrationLeftText","profileName",this.getNextHighestDepth(),{_x:55,_y:-1}));
      this._rp = com.rockstargames.gtav.FrontendGen9.components.Text(this.attachMovie("migrationLeftText","rpText",this.getNextHighestDepth(),{_x:55,_y:28}));
      this._headshot = com.rockstargames.gtav.FrontendGen9.components.Image(this.attachMovie("gridImage","headsshot",this.getNextHighestDepth(),{_height:44,_width:44}));
      this._headshot.setSize(44,44);
      this._rankIcon = com.rockstargames.gtav.FrontendGen9.components.MigrationRankIcon(this.attachMovie("migrationRankIcon","migrationRankIcon",this.getNextHighestDepth(),{_x:381,_y:-4}));
      this._highlight = this.attachMovie("highlight","highlight",this.getNextHighestDepth(),{_x:-18,_y:-14,_height:70,_width:450,_visible:false});
      this.MOUSE_EVT = new com.rockstargames.ui.mouse.MOUSE_EVENTS();
      this.MOUSE_EVT.UI_MOVIE = 5;
      this.MOUSE_EVT.INTERFACE_TYPE = this.SF_BASE_CLASS_MOUSE;
      this.hitArea = this.blackBackground;
      this._hover._height = this._highlight._height;
      this._hover._width = this._highlight._width;
   }
   function SET_PROFILE_INFO(profileName, rp, headshotTexture, rank)
   {
      this._profileName.SET_TEXT(profileName,false);
      this._rp.SET_TEXT(rp,true);
      this._headshot.SET_IMAGE(headshotTexture,headshotTexture);
      this._rankIcon.SET_RANK(rank);
   }
   function setHighlight(isLit)
   {
      this._isLit = isLit;
      this._highlight._visible = isLit;
   }
   function SET_STATE(state)
   {
      if(state == 0)
      {
         this.setHighlight(false);
      }
      if(state == 1)
      {
         this.setHighlight(true);
      }
   }
   function onRelease()
   {
      this.sendMouseEvent(com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_RELEASE);
   }
   function sendMouseEvent(evt)
   {
      this.MOUSE_EVT.triggerEvent([this.myBtnType,evt,this._index]);
   }
}

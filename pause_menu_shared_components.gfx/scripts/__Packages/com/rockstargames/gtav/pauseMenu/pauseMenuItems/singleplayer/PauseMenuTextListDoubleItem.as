class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuTextListDoubleItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuTextListItem
{
   var __set__uniqueID;
   var _data;
   var bgMC;
   var blipLayer;
   var index;
   var initialIndex;
   var isSelectable;
   var itemTextLeft;
   var labelMC;
   var menuID;
   var type;
   function PauseMenuTextListDoubleItem()
   {
      super();
   }
   function PauseMenuTextListItem()
   {
      super();
   }
   function set data(_d)
   {
      this.index = _d[0];
      this.menuID = _d[1];
      this.uniqueID = _d[2];
      this.type = _d[3];
      this.initialIndex = _d[4];
      this.isSelectable = _d[5];
      if(_d.length >= 7)
      {
         this._data = _d.slice(6);
      }
      this.bgMC._visible = false;
      if(this.blipLayer != undefined)
      {
         this.blipLayer.removeMovieClip();
      }
      this.blipLayer = this.labelMC.createEmptyMovieClip("blipLayer",1000);
      this.itemTextLeft.autoSize = true;
      var _loc3_ = new com.rockstargames.ui.utils.Text();
      _loc3_.setTextWithIcons(this._data[0],this.blipLayer,this.itemTextLeft,0,13,4.5,false);
      this.snapBGGrid(this.bgMC);
   }
   function snapBGGrid(bgMC)
   {
      var _loc4_ = Math.ceil(this.itemTextLeft.textHeight / 27);
      var _loc3_ = this.itemTextLeft._height;
      var _loc2_ = this.itemTextLeft._y * 2 + _loc3_;
      bgMC._height = _loc2_;
   }
}

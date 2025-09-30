class com.rockstargames.gtav.levelDesign.arcadeManagement.screens.CabinetsScreen extends com.rockstargames.gtav.levelDesign.arcadeManagement.screens.Screen
{
   var _buttons;
   var app;
   var cabinetViews;
   var cursor;
   var delegate;
   var numCabinets;
   var persistentContent;
   var scrollContent;
   var scroller;
   var view;
   static var NUM_CABINET_COLS = 3;
   static var CABINET_COL_WIDTH = 291;
   static var CABINET_ROW_HEIGHT = 530;
   static var CABINET_X_OFFSET = 25;
   static var CABINET_Y_OFFSET = 365;
   function CabinetsScreen(app, viewContainer, cursor, persistentContent, overlay)
   {
      super(app,viewContainer,cursor,persistentContent,overlay,"cabinetsScreen");
      this.init();
   }
   function init()
   {
      super.init();
      this.initNavPanel();
      this.initInfoPanel();
      this.cabinetViews = [];
      this.numCabinets = 0;
      this.update(true);
      this.updateInfoPanel();
      var _loc4_ = this.delegate(this,this.updateButtons);
      var _loc3_ = this.app.displayConfig.actualWidth * this.app.displayConfig.safeRight - this.view.scrollbar._width;
      if(_loc3_ < this.view.scrollbar._x)
      {
         this.view.scrollbar._x = _loc3_;
      }
      this.scroller = new com.rockstargames.gtav.levelDesign.arcadeManagement.Scroller(this.view.scrollContent,this.view.scrollContentMask,this.view.scrollbar.handle,this.view.scrollbar.track,_loc4_,this.app.CABINETS_SCREEN);
      this.app.setArcadeImageVisibility(true);
      this.app.setArcadeImageScrollPosition(this.view.scrollContent._y);
      this.persistentContent.setBackgroundImage("default");
   }
   function initNavPanel()
   {
      var _loc2_ = this.view.scrollContent.cabinetsButton;
      var _loc3_ = this.view.scrollContent.upgradesButton;
      _loc2_.label.tf.autoSize = "left";
      com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT.setSpacedTextField(_loc2_.label.tf,"AMN_CABINETS",1,true,false);
      _loc3_.label.tf.autoSize = "left";
      com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT.setSpacedTextField(_loc3_.label.tf,"AMN_UPGRADES",1,true,false);
      var _loc7_ = Math.max(_loc2_.label._width,_loc3_.label._width);
      var _loc4_ = 2 * _loc2_.label._x + _loc7_;
      var _loc5_ = _loc4_ - 2 * _loc2_.bgOn.centre._x;
      var _loc6_ = _loc4_ - _loc2_.bgOn.right._width;
      _loc2_.label._x = 0.5 * (_loc4_ - _loc2_.label._width);
      _loc2_.bgOn.centre._width = _loc5_;
      _loc2_.bgOff.centre._width = _loc5_;
      _loc2_.bgOn.right._x = _loc6_;
      _loc2_.bgOff.right._x = _loc6_;
      _loc3_.label._x = 0.5 * (_loc4_ - _loc3_.label._width);
      _loc3_.bgOn.centre._width = _loc5_;
      _loc3_.bgOff.centre._width = _loc5_;
      _loc3_.bgOn.right._x = _loc6_;
      _loc3_.bgOff.right._x = _loc6_;
      _loc3_._x = _loc2_._x + _loc4_ + 10;
      this._buttons.push(new com.rockstargames.gtav.levelDesign.arcadeManagement.Button(com.rockstargames.gtav.levelDesign.arcadeManagement.ButtonIDs.CABINETS_BUTTON,_loc2_));
      this._buttons.push(new com.rockstargames.gtav.levelDesign.arcadeManagement.Button(com.rockstargames.gtav.levelDesign.arcadeManagement.ButtonIDs.UPGRADES_BUTTON,_loc3_));
      _loc2_.bgOff._visible = false;
      this.updateNavButtons(com.rockstargames.gtav.levelDesign.arcadeManagement.ButtonIDs.CABINETS_BUTTON);
   }
   function initInfoPanel()
   {
      var _loc2_ = this.view.scrollContent.infoPanel;
      _loc2_.gamertaglabel.text = com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT.setLocalisedText(_loc2_.gamertaglabel,"AMN_OWNER").toUpperCase();
      _loc2_.locationLabel.text = com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT.setLocalisedText(_loc2_.locationLabel,"AMN_LOCN").toUpperCase();
      _loc2_.earningsLabel.text = com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT.setLocalisedText(_loc2_.earningsLabel,"AMN_EARN").toUpperCase();
      if(this.app.displayConfig.isAsian)
      {
         com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT.resizeAsianText(_loc2_.earningsLabel);
      }
      _loc2_.earnings._x = _loc2_.earningsLabel._x + _loc2_.earningsLabel.textWidth + 10;
   }
   function updateInfoPanel()
   {
      var _loc2_ = this.view.scrollContent.infoPanel;
      _loc2_.gamertag.text = this.app.gamername;
      _loc2_.location.text = this.app.location;
      _loc2_.earnings.text = "$" + com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT.formatNumber(this.app.totalEarnings);
      if(this.app.displayConfig.isAsian)
      {
         com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT.resizeAsianText(_loc2_.earnings);
      }
   }
   function update(forceRender)
   {
      var _loc3_ = 0;
      var _loc5_ = this.app.cabinets.length;
      var _loc2_;
      var _loc4_;
      while(_loc3_ < _loc5_)
      {
         _loc2_ = this.app.cabinets[_loc3_];
         if(forceRender || _loc2_.isDirty)
         {
            _loc4_ = this.getCabinetView(_loc2_.id);
            _loc2_.render(_loc4_,this.app.imageManager,forceRender,this.app.displayConfig.isAsian);
         }
         _loc3_ = _loc3_ + 1;
      }
      this.scroller.update();
   }
   function getCabinetView(id)
   {
      return this.cabinetViews["_" + id].view || this.addCabinet(id);
   }
   function addCabinet(id)
   {
      var _loc3_ = this.view.scrollContent.attachMovie("cabinet","cabinet" + id,this.view.scrollContent.getNextHighestDepth());
      var _loc7_ = this.numCabinets % com.rockstargames.gtav.levelDesign.arcadeManagement.screens.CabinetsScreen.NUM_CABINET_COLS;
      var _loc5_ = Math.floor(this.numCabinets / com.rockstargames.gtav.levelDesign.arcadeManagement.screens.CabinetsScreen.NUM_CABINET_COLS);
      _loc3_._x = _loc7_ * com.rockstargames.gtav.levelDesign.arcadeManagement.screens.CabinetsScreen.CABINET_COL_WIDTH + com.rockstargames.gtav.levelDesign.arcadeManagement.screens.CabinetsScreen.CABINET_X_OFFSET;
      _loc3_._y = _loc5_ * com.rockstargames.gtav.levelDesign.arcadeManagement.screens.CabinetsScreen.CABINET_ROW_HEIGHT + com.rockstargames.gtav.levelDesign.arcadeManagement.screens.CabinetsScreen.CABINET_Y_OFFSET;
      var _loc4_ = new com.rockstargames.gtav.levelDesign.arcadeManagement.Button(id,_loc3_.costButton);
      _loc4_.setBoundsExtents(this.view.scrollContentMask.getBounds(_root));
      this._buttons.push(_loc4_);
      this.cabinetViews["_" + id] = _loc3_;
      this.numCabinets = this.numCabinets + 1;
      this.view.scrollContent.panelBackground._height = _loc3_._y + com.rockstargames.gtav.levelDesign.arcadeManagement.screens.CabinetsScreen.CABINET_ROW_HEIGHT + 20 - this.view.scrollContent.panelBackground._y;
      this.updateButtons();
      return _loc3_;
   }
   function handleJoystickInput(isLeftStick, x, y, isMouseWheel)
   {
      if(!isLeftStick)
      {
         this.scroller.scrollBy(y,isMouseWheel);
         this.updateButtons();
      }
   }
   function updateButtons()
   {
      var _loc2_ = 0;
      var _loc4_ = this._buttons.length;
      var _loc3_;
      while(_loc2_ < _loc4_)
      {
         _loc3_ = this._buttons[_loc2_];
         _loc3_.updateBounds();
         _loc2_ = _loc2_ + 1;
      }
      this.cursor.setTargetRects(this._buttons);
      this.app.setArcadeImageScrollPosition(this.view.scrollContent._y);
   }
   function updateNavButtons(targetID)
   {
      var _loc2_ = this.view.scrollContent.upgradesButton;
      if(targetID == com.rockstargames.gtav.levelDesign.arcadeManagement.ButtonIDs.UPGRADES_BUTTON)
      {
         _loc2_.bgOn._visible = true;
         _loc2_.label.transform.colorTransform = new flash.geom.ColorTransform(1,1,1,1,0,0,0,0);
      }
      else
      {
         _loc2_.bgOn._visible = false;
         _loc2_.label.transform.colorTransform = new flash.geom.ColorTransform(0,0,0,1,0,0,0,0);
      }
   }
   function dispose()
   {
      this.scroller.dispose();
      this.scroller = null;
      this.cabinetViews = null;
      this.scrollContent = null;
      super.dispose();
   }
}

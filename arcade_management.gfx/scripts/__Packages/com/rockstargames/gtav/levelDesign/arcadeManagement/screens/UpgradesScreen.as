class com.rockstargames.gtav.levelDesign.arcadeManagement.screens.UpgradesScreen extends com.rockstargames.gtav.levelDesign.arcadeManagement.screens.Screen
{
   var _buttons;
   var app;
   var cursor;
   var numUpgrades;
   var scrollContent;
   var upgradeViews;
   var view;
   static var NAV_BUTTON_LEFT = 480;
   static var NUM_UPGRADE_COLS = 2;
   static var UPGRADE_COL_WIDTH = 436;
   static var UPGRADE_ROW_HEIGHT = 460;
   static var UPGRADE_X_OFFSET = 25;
   static var UPGRADE_Y_OFFSET = 365;
   function UpgradesScreen(app, viewContainer, cursor, persistentContent, overlay)
   {
      super(app,viewContainer,cursor,persistentContent,overlay,"upgradesScreen");
      this.init();
   }
   function init()
   {
      super.init();
      this.initNavPanel();
      this.initInfoPanel();
      this.upgradeViews = [];
      this.numUpgrades = 0;
      this.update(true);
      this.updateInfoPanel();
      this.app.setArcadeImageVisibility(true);
      this.app.setArcadeImageScrollPosition(this.view.scrollContent._y);
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
      _loc3_.bgOff._visible = false;
      this.updateNavButtons(com.rockstargames.gtav.levelDesign.arcadeManagement.ButtonIDs.UPGRADES_BUTTON);
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
      var _loc5_ = this.app.upgrades.length;
      var _loc2_;
      var _loc4_;
      while(_loc3_ < _loc5_)
      {
         _loc2_ = this.app.upgrades[_loc3_];
         if(forceRender || _loc2_.isDirty)
         {
            _loc4_ = this.getUpgradeView(_loc2_.id);
            _loc2_.render(_loc4_,this.app.imageManager,forceRender,this.app.displayConfig.isAsian);
         }
         _loc3_ = _loc3_ + 1;
      }
      this.updateButtons();
   }
   function getUpgradeView(id)
   {
      return this.upgradeViews["_" + id] || this.addUpgrade(id);
   }
   function addUpgrade(id)
   {
      var _loc3_ = this.view.scrollContent.attachMovie("upgrade","upgrade" + id,this.view.scrollContent.getNextHighestDepth());
      var _loc7_ = this.numUpgrades % com.rockstargames.gtav.levelDesign.arcadeManagement.screens.UpgradesScreen.NUM_UPGRADE_COLS;
      var _loc5_ = Math.floor(this.numUpgrades / com.rockstargames.gtav.levelDesign.arcadeManagement.screens.UpgradesScreen.NUM_UPGRADE_COLS);
      _loc3_._x = _loc7_ * com.rockstargames.gtav.levelDesign.arcadeManagement.screens.UpgradesScreen.UPGRADE_COL_WIDTH + com.rockstargames.gtav.levelDesign.arcadeManagement.screens.UpgradesScreen.UPGRADE_X_OFFSET;
      _loc3_._y = _loc5_ * com.rockstargames.gtav.levelDesign.arcadeManagement.screens.UpgradesScreen.UPGRADE_ROW_HEIGHT + com.rockstargames.gtav.levelDesign.arcadeManagement.screens.UpgradesScreen.UPGRADE_Y_OFFSET;
      var _loc4_ = new com.rockstargames.gtav.levelDesign.arcadeManagement.Button(id,_loc3_.purchaseButton);
      _loc4_.setBoundsExtents(this.view.scrollContentMask.getBounds(_root));
      this._buttons.push(_loc4_);
      com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT.setSpacedTextField(_loc3_.owned,"AMN_OWNED",3,true,false);
      if(this.app.displayConfig.isAsian)
      {
         com.rockstargames.gtav.levelDesign.ARCADE_MANAGEMENT.resizeAsianText(_loc3_.owned);
      }
      this.upgradeViews["_" + id] = _loc3_;
      this.numUpgrades = this.numUpgrades + 1;
      this.view.scrollContent.panelBackground._height = 393;
      this.updateButtons();
      return _loc3_;
   }
   function updateButtons()
   {
      var _loc3_ = 0;
      var _loc4_ = this._buttons.length;
      var _loc2_;
      while(_loc3_ < _loc4_)
      {
         _loc2_ = this._buttons[_loc3_];
         _loc2_.enabled = _loc2_.view._visible;
         _loc2_.updateBounds();
         _loc3_ = _loc3_ + 1;
      }
      this.cursor.setTargetRects(this._buttons);
      this.app.setArcadeImageScrollPosition(this.view.scrollContent._y);
   }
   function updateNavButtons(targetID)
   {
      var _loc2_ = this.view.scrollContent.cabinetsButton;
      if(targetID == com.rockstargames.gtav.levelDesign.arcadeManagement.ButtonIDs.CABINETS_BUTTON)
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
      this.upgradeViews = null;
      this.scrollContent = null;
      super.dispose();
   }
}

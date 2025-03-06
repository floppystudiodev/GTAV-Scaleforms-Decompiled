class com.rockstargames.gtav.levelDesign.islandHeistBoard.screens.MainScreen extends com.rockstargames.gtav.levelDesign.islandHeistBoard.screens.Screen
{
   var tabGroup;
   var view;
   var heistData;
   var colourScheme;
   var list;
   var details;
   var app;
   var playerList;
   var map;
   var mainPayout;
   var subPayout;
   var hardModeWarning;
   var launchButton;
   var _buttons;
   var cursor;
   function MainScreen(app, viewContainer, cursor, overlay, heistData, colourScheme)
   {
      super(app,viewContainer,cursor,overlay,heistData,colourScheme,"mainScreen");
      this.init();
   }
   function init()
   {
      super.init();
      this.tabGroup = new com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.TabGroup(this.view.tabGroup,this.heistData.tabLabels,this.heistData.tabsLocked,this.heistData.initialView,this.colourScheme);
      this.list = new com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.List(this.view.lists.listA,this.view.lists.listB,this.heistData,this.colourScheme);
      this.details = new com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Details(this.view.details,this.app.imageManager,this.colourScheme);
      this.playerList = new com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.PlayerList(this.view.playerList,this.heistData,this.colourScheme);
      this.map = new com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Map(this.view.map,this.heistData,this.colourScheme);
      this.mainPayout = new com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Payout(this.view.mainPayout,this.heistData.mainPayoutLabel,"IHB_MAIN_PAYOUT",this.heistData.mainPayout,this.heistData.payoutsVisible,this.colourScheme);
      this.subPayout = new com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Payout(this.view.subPayout,this.heistData.subPayoutLabel,"IHB_SUB_PAYOUT",this.heistData.subPayout,this.heistData.payoutsVisible,this.colourScheme);
      this.hardModeWarning = new com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.HardModeWarning(this.view.hardModeWarning,this.heistData.isHardMode,this.view.hardModeWarning._y,this.view.launchButton._y,this.colourScheme);
      this.view.bezelReveal.transform.colorTransform = this.colourScheme.dark;
      this.view.bezel.transform.colorTransform = this.colourScheme.mid;
      this.view.background.transform.colorTransform = this.colourScheme.dark;
      this.launchButton = new com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Button(com.rockstargames.gtav.levelDesign.islandHeistBoard.data.ButtonIDs.LAUNCH,this.view.launchButton,this.colourScheme);
      this._buttons = this.list.getListItems().concat(this.launchButton);
      this.app.updateButtons(0);
      var _loc4_ = 0.5 * (this._buttons[0].left + this._buttons[0].right);
      var _loc3_ = 0.5 * (this._buttons[0].top + this._buttons[0].bottom);
      this.cursor.moveTo(_loc4_,_loc3_,true);
   }
   function handleButtonInput(inputID)
   {
      var _loc5_ = false;
      var _loc7_ = false;
      switch(inputID)
      {
         case com.rockstargames.gtav.levelDesign.ISLAND_HEIST_BOARD.ACCEPT:
            _loc5_ = this.list.showItems(this.tabGroup.getActiveTabIndex(),this.cursor.getTargetIDUnderCursor(),false);
            break;
         case com.rockstargames.gtav.levelDesign.ISLAND_HEIST_BOARD.CANCEL:
            _loc5_ = this.list.showItems(this.tabGroup.getActiveTabIndex(),this.cursor.getTargetIDUnderCursor(),true);
            break;
         case com.rockstargames.gtav.levelDesign.ISLAND_HEIST_BOARD.LB:
            _loc5_ = _loc7_ = this.tabGroup.prevTab();
            if(_loc5_)
            {
               this.list.showItems(this.tabGroup.getActiveTabIndex(),0,false);
            }
            break;
         case com.rockstargames.gtav.levelDesign.ISLAND_HEIST_BOARD.RB:
            _loc5_ = _loc7_ = this.tabGroup.nextTab();
            if(_loc5_)
            {
               this.list.showItems(this.tabGroup.getActiveTabIndex(),0,false);
            }
      }
      if(_loc5_)
      {
         var _loc8_ = this.tabGroup.getActiveTabIndex();
         var _loc6_ = this.heistData.getHistoryID(_loc8_,this.list.getCurrentItemID());
         this._buttons = this.list.getListItems().concat(this.launchButton);
         var _loc4_ = 0;
         var _loc2_ = 0;
         while(_loc2_ < this._buttons.length)
         {
            var _loc3_ = this._buttons[_loc2_];
            if(_loc3_.enabled)
            {
               _loc4_ = _loc2_;
               break;
            }
            _loc2_ = _loc2_ + 1;
         }
         if(inputID == com.rockstargames.gtav.levelDesign.ISLAND_HEIST_BOARD.CANCEL)
         {
            _loc2_ = 0;
            while(_loc2_ < this._buttons.length)
            {
               _loc3_ = this._buttons[_loc2_];
               if(_loc3_.id == _loc6_)
               {
                  _loc4_ = _loc2_;
                  break;
               }
               _loc2_ = _loc2_ + 1;
            }
         }
         if(_loc8_ != com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.TabGroup.FINALE)
         {
            this.playerList.setVisible(false);
         }
         this.app.updateButtons(_loc4_);
         this.updateLaunchButton();
      }
      if(_loc7_ || _loc5_)
      {
         this.onTargetChange(this.cursor.getTargetIDUnderCursor());
      }
   }
   function setCurrentSelection(itemID)
   {
      if(itemID == com.rockstargames.gtav.levelDesign.islandHeistBoard.data.ButtonIDs.LAUNCH)
      {
         this.tabGroup.setTab(com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.TabGroup.FINALE);
         this.app.imageManager.clearImageQueue();
         this.details.cancelDeferredPopulate();
         this.list.showItems(com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.TabGroup.FINALE,0,false);
         this._buttons = this.list.getListItems().concat(this.launchButton);
         this.updateLaunchButton();
         var _loc5_ = 0;
         var _loc2_ = 0;
         while(_loc2_ < this._buttons.length)
         {
            var _loc4_ = this._buttons[_loc2_];
            if(_loc4_.enabled && _loc4_.id == itemID)
            {
               _loc5_ = _loc2_;
               break;
            }
            _loc2_ = _loc2_ + 1;
         }
         this.app.updateButtons(_loc5_);
         this.onTargetChange(this.cursor.getTargetIDUnderCursor());
         return undefined;
      }
      _loc2_ = 0;
      while(_loc2_ < this._buttons.length)
      {
         if(this._buttons[_loc2_].id == itemID)
         {
            this.cursor.moveToRect(itemID);
            return undefined;
         }
         _loc2_ = _loc2_ + 1;
      }
      var _loc6_ = undefined;
      if(this.heistData.getSetupItem(com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.TabGroup.INTEL,itemID) != null)
      {
         _loc6_ = com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.TabGroup.INTEL;
      }
      else if(this.heistData.getSetupItem(com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.TabGroup.PREP,itemID) != null)
      {
         _loc6_ = com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.TabGroup.PREP;
      }
      else if(this.heistData.getFinaleItem(itemID) != null)
      {
         _loc6_ = com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.TabGroup.FINALE;
      }
      if(_loc6_ != undefined)
      {
         this.tabGroup.setTab(_loc6_);
         if(_loc6_ != com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.TabGroup.FINALE)
         {
            this.playerList.setVisible(false);
         }
         var _loc7_ = this.heistData.getParentID(_loc6_,itemID);
         this.list.showItems(_loc6_,_loc7_,false);
         this._buttons = this.list.getListItems().concat(this.launchButton);
         _loc5_ = 0;
         _loc2_ = 0;
         while(_loc2_ < this._buttons.length)
         {
            _loc4_ = this._buttons[_loc2_];
            if(_loc4_.enabled && _loc4_.id == itemID)
            {
               _loc5_ = _loc2_;
               break;
            }
            _loc2_ = _loc2_ + 1;
         }
         this.app.updateButtons(_loc5_);
         this.updateLaunchButton();
         this.onTargetChange(this.cursor.getTargetIDUnderCursor());
      }
   }
   function showTipText(text)
   {
      this.details.showTipText(text);
   }
   function hideTipText()
   {
      this.details.hideTipText();
   }
   function updateSetupItem(itemID, numComplete)
   {
      this.list.updateSetupItem(itemID,numComplete);
   }
   function updateFinaleItem(itemID, isSelected)
   {
      this.list.updateFinaleItem(itemID,isSelected);
      super.onTargetChange(this.cursor.getTargetIDUnderCursor());
   }
   function updateListAfterRemoval(itemID, parentID)
   {
      var _loc5_ = this.list.getCurrentItemID();
      if(_loc5_ == itemID || _loc5_ == parentID)
      {
         this.list.showItemsAfterRemoval(this.tabGroup.getActiveTabIndex(),parentID);
         this._buttons = this.list.getListItems().concat(this.launchButton);
         var _loc4_ = 0;
         var _loc2_ = 0;
         while(_loc2_ < this._buttons.length)
         {
            var _loc3_ = this._buttons[_loc2_];
            if(_loc3_.enabled)
            {
               _loc4_ = _loc2_;
               break;
            }
            _loc2_ = _loc2_ + 1;
         }
         this.app.updateButtons(_loc4_);
      }
   }
   function updateCrew()
   {
      if(this.tabGroup.getActiveTabIndex() == com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.TabGroup.FINALE && this.list.getCurrentItemID() == this.heistData.crewCutID)
      {
         this.list.updateCrew();
         var _loc6_ = this.cursor.getTargetIDUnderCursor();
         var _loc5_ = false;
         var _loc4_ = -1;
         var _loc2_ = undefined;
         var _loc3_ = 0;
         while(_loc3_ < this._buttons.length)
         {
            _loc2_ = this._buttons[_loc3_];
            this.cursor.setRectEnabled(_loc2_.id,_loc2_.enabled);
            if(_loc2_.id == _loc6_ && !_loc2_.enabled)
            {
               _loc5_ = true;
            }
            if(_loc2_.enabled && _loc4_ == -1)
            {
               _loc4_ = _loc3_;
            }
            _loc3_ = _loc3_ + 1;
         }
         if(_loc5_)
         {
            _loc2_ = this._buttons[_loc4_];
            var _loc8_ = 0.5 * (_loc2_.left + _loc2_.right);
            var _loc7_ = 0.5 * (_loc2_.top + _loc2_.bottom);
            this.cursor.moveTo(_loc8_,_loc7_,true);
         }
      }
      this.playerList.update(this.heistData.crew);
   }
   function updateLaunchButton()
   {
      var _loc2_ = false;
      if(this.tabGroup.getActiveTabIndex() == com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.TabGroup.FINALE)
      {
         _loc2_ = this.heistData.launchButtonEnabled && this.list.getCurrentItemID() != this.heistData.crewCutID;
         this.launchButton.view._alpha = !_loc2_ ? 50 : 100;
      }
      else
      {
         this.launchButton.view._alpha = 0;
      }
      this.launchButton.setLabel(this.heistData.launchButtonLabel,true);
      if(this.launchButton.enabled != _loc2_)
      {
         this.cursor.setRectEnabled(this.launchButton.id,_loc2_);
         this.launchButton.enabled = _loc2_;
         this.launchButton.setState(false);
      }
      this.hardModeWarning.setYPosition(this.launchButton.view._alpha != 0);
   }
   function updateMap()
   {
      this.map.setView(this.heistData.mapView);
   }
   function setCrewCutsVisible(isVisible)
   {
      this.list.setCrewCutsVisible(isVisible);
      this.playerList.setVisible(isVisible);
      this.cursor.setRectEnabled(this.heistData.crewCutID,isVisible);
   }
   function onTargetChange(targetID)
   {
      super.onTargetChange(targetID);
      var _loc4_ = this.tabGroup.getActiveTabIndex();
      var _loc3_ = this.heistData.getSetupItem(_loc4_,targetID) || this.heistData.getFinaleItem(targetID);
      var _loc6_ = this.heistData.getSetupItem(_loc4_,_loc3_.parentID) || this.heistData.getFinaleItem(_loc3_.parentID);
      if(_loc3_)
      {
         this.updateDetails(_loc3_);
      }
      this.updateLaunchButton();
      this.map.update(_loc3_,_loc6_);
      this.heistData.setHistoryID(_loc4_,this.list.getCurrentItemID(),targetID);
   }
   function updateDetails(item)
   {
      var _loc4_ = this.tabGroup.getActiveTabIndex();
      var _loc2_ = this.list.getCurrentItemID();
      if(_loc4_ == com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.TabGroup.FINALE && _loc2_ == 0)
      {
         this.details.deferredPopulate(this.details.populateHidden);
      }
      else if(_loc4_ == com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.TabGroup.FINALE && _loc2_ == this.heistData.crewCutID)
      {
         this.details.deferredPopulate(this.details.populateHidden);
      }
      else if(_loc4_ == com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.TabGroup.FINALE && _loc2_ == this.heistData.supportCrewID)
      {
         this.details.deferredPopulate(item.description,item.texture,com.rockstargames.gtav.levelDesign.islandHeistBoard.data.FinaleItem(item).cost,this.details.populatePrice);
      }
      else
      {
         this.details.deferredPopulate(item.description,item.texture,this.details.populateImage);
      }
   }
   function dispose()
   {
      this.tabGroup.dispose();
      this.tabGroup = null;
      this.list.dispose();
      this.list = null;
      this.map.dispose();
      this.map = null;
      this.details.dispose();
      this.details = null;
      this.playerList.dispose();
      this.playerList = null;
      this.launchButton = null;
      this.mainPayout = null;
      this.subPayout = null;
      this.hardModeWarning.dispose();
      this.hardModeWarning = null;
      super.dispose();
   }
}

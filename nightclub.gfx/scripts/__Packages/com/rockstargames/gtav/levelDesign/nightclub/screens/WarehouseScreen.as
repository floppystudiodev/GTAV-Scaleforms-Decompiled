class com.rockstargames.gtav.levelDesign.nightclub.screens.WarehouseScreen extends com.rockstargames.gtav.levelDesign.nightclub.screens.Screen
{
   var persistentContent;
   var assignmentButtons;
   var view;
   var _buttons;
   var technicianButtons;
   var app;
   var overlay;
   var cursor;
   static var selectedTechnicianIndex = 0;
   function WarehouseScreen(app, viewContainer, cursor, persistentContent, overlay)
   {
      super(app,viewContainer,cursor,persistentContent,overlay,"warehouseScreen");
      this.init();
   }
   function init()
   {
      super.init();
      this.persistentContent.updateNav(3);
      this.persistentContent.setPopularityMeterVisible(false);
      this.persistentContent.resetPopularityMeter();
      this.assignmentButtons = [];
      var _loc4_ = 0;
      while(_loc4_ < com.rockstargames.gtav.levelDesign.NIGHTCLUB.NUM_STOCK_TYPES)
      {
         var _loc3_ = this.view["assignmentButton" + _loc4_];
         _loc3_.label.verticalAlign = "center";
         var _loc5_ = new com.rockstargames.gtav.levelDesign.nightclub.Button(com.rockstargames.gtav.levelDesign.nightclub.ButtonIDs["ASSIGNMENT_" + _loc4_],_loc3_,"CLUB_STOCK" + _loc4_,false);
         this.assignmentButtons.push(_loc5_);
         this._buttons.push(_loc5_);
         _loc4_ = _loc4_ + 1;
      }
      this.technicianButtons = [];
      _loc4_ = 0;
      while(_loc4_ < com.rockstargames.gtav.levelDesign.NIGHTCLUB.NUM_TECHNICIANS)
      {
         _loc3_ = this.view["technicianButton" + _loc4_];
         _loc3_.selection._visible = false;
         _loc3_.headshot.gotoAndStop(_loc4_ + 1);
         _loc3_.sale.label.textAutoSize = "shrink";
         com.rockstargames.gtav.levelDesign.NIGHTCLUB.setLocalisedText(_loc3_.sale.label,"WEB_VEHICLE_SALE");
         _loc5_ = new com.rockstargames.gtav.levelDesign.nightclub.Button(com.rockstargames.gtav.levelDesign.nightclub.ButtonIDs["TECHNICIAN_" + _loc4_],_loc3_,"CLUB_HIRE",false);
         this.technicianButtons.push(_loc5_);
         this._buttons.push(_loc5_);
         _loc4_ = _loc4_ + 1;
      }
      this.selectTechnician(com.rockstargames.gtav.levelDesign.nightclub.screens.WarehouseScreen.selectedTechnicianIndex);
      this.view.description.verticalAlign = "center";
      com.rockstargames.gtav.levelDesign.NIGHTCLUB.setLocalisedText(this.view.title,"CLUB_TECHTITLE");
      com.rockstargames.gtav.levelDesign.NIGHTCLUB.setLocalisedText(this.view.description,"CLUB_TECHDESC");
      com.rockstargames.gtav.levelDesign.NIGHTCLUB.setLocalisedText(this.view.assignedTechniciansLabel,"CLUB_TECHASSN");
      com.rockstargames.gtav.levelDesign.NIGHTCLUB.setLocalisedText(this.view.availableGoodsLabel,"CLUB_GOODSAVAIL");
      com.rockstargames.gtav.levelDesign.NIGHTCLUB.setLocalisedText(this.view.goodsAccruedLabel,"CLUB_GOODSACCR");
      com.rockstargames.gtav.levelDesign.NIGHTCLUB.setLocalisedText(this.view.goodsSoldLabel,"CLUB_GOODSSOLD");
      this.update();
   }
   function update()
   {
      this.updateAssignmentButtons();
      this.updateAssignmentCount();
      this.updateStats();
   }
   function handleButtonInput(inputID)
   {
      switch(inputID)
      {
         case com.rockstargames.gtav.levelDesign.NIGHTCLUB.ACCEPT:
            this.handleAcceptButton(this.app.GET_CURRENT_SELECTION());
            break;
         case com.rockstargames.gtav.levelDesign.NIGHTCLUB.CANCEL:
            break;
         case com.rockstargames.gtav.levelDesign.NIGHTCLUB.LB:
            if(!this.overlay.isShowing)
            {
               this.app.showScreen(this.app.DJ_SCREEN);
            }
            break;
         case com.rockstargames.gtav.levelDesign.NIGHTCLUB.RB:
            if(!this.overlay.isShowing)
            {
               this.app.showScreen(this.app.SELL_SCREEN);
            }
      }
   }
   function handleAcceptButton(id)
   {
      this.checkNavigationButtons(id);
   }
   function selectTechnician(index)
   {
      this.technicianButtons[com.rockstargames.gtav.levelDesign.nightclub.screens.WarehouseScreen.selectedTechnicianIndex].view.gotoAndStop("off");
      this.technicianButtons[com.rockstargames.gtav.levelDesign.nightclub.screens.WarehouseScreen.selectedTechnicianIndex].view.selection._visible = false;
      this.technicianButtons[com.rockstargames.gtav.levelDesign.nightclub.screens.WarehouseScreen.selectedTechnicianIndex].view.active._visible = false;
      com.rockstargames.gtav.levelDesign.nightclub.screens.WarehouseScreen.selectedTechnicianIndex = index;
      this.technicianButtons[com.rockstargames.gtav.levelDesign.nightclub.screens.WarehouseScreen.selectedTechnicianIndex].view.gotoAndStop("on");
      if(this.app.technicians[com.rockstargames.gtav.levelDesign.nightclub.screens.WarehouseScreen.selectedTechnicianIndex].isAvailable)
      {
         this.technicianButtons[com.rockstargames.gtav.levelDesign.nightclub.screens.WarehouseScreen.selectedTechnicianIndex].view.selection._visible = true;
         this.technicianButtons[com.rockstargames.gtav.levelDesign.nightclub.screens.WarehouseScreen.selectedTechnicianIndex].view.active._visible = true;
      }
      this.cursor.setTargetRects(this._buttons);
      this.updateAssignmentButtons();
   }
   function updateAssignmentButtons()
   {
      var _loc9_ = this.app.technicians[com.rockstargames.gtav.levelDesign.nightclub.screens.WarehouseScreen.selectedTechnicianIndex];
      var _loc4_ = 0;
      while(_loc4_ < com.rockstargames.gtav.levelDesign.NIGHTCLUB.NUM_STOCK_TYPES)
      {
         var _loc6_ = this.app.assignments[_loc4_];
         var _loc3_ = this.assignmentButtons[_loc4_].view;
         _loc3_._alpha = !(_loc6_.available && _loc9_.isAvailable) ? 50 : 100;
         _loc3_.tick._visible = false;
         _loc3_.active._visible = false;
         _loc3_.activeAtCapacity._visible = false;
         _loc3_.exclamation._visible = _loc6_.isAtCapacity;
         _loc3_.padlock._visible = !_loc6_.available && !_loc6_.isAtCapacity;
         _loc4_ = _loc4_ + 1;
      }
      var _loc7_ = false;
      _loc4_ = 0;
      while(_loc4_ < com.rockstargames.gtav.levelDesign.NIGHTCLUB.NUM_TECHNICIANS)
      {
         var _loc2_ = this.app.technicians[_loc4_];
         _loc3_ = this.technicianButtons[_loc4_].view;
         var _loc8_ = _loc2_.assignmentIndex;
         var _loc5_ = this.app.assignments[_loc8_].isAtCapacity;
         _loc3_.active._visible = _loc4_ == com.rockstargames.gtav.levelDesign.nightclub.screens.WarehouseScreen.selectedTechnicianIndex && !_loc5_;
         _loc3_.activeAtCapacity._visible = _loc4_ == com.rockstargames.gtav.levelDesign.nightclub.screens.WarehouseScreen.selectedTechnicianIndex && _loc5_;
         _loc3_.tick._visible = _loc2_.isAvailable && _loc2_.isAssigned && _loc4_ != com.rockstargames.gtav.levelDesign.nightclub.screens.WarehouseScreen.selectedTechnicianIndex && !_loc5_;
         _loc3_.exclamation._visible = _loc4_ != com.rockstargames.gtav.levelDesign.nightclub.screens.WarehouseScreen.selectedTechnicianIndex && _loc5_;
         _loc3_.headshot._alpha = !_loc2_.isAvailable ? 50 : 100;
         _loc3_.label._visible = !_loc2_.isAvailable && !_loc7_;
         _loc3_.padlock._visible = !_loc2_.isAvailable && _loc7_;
         _loc3_.sale._visible = !_loc7_ && _loc2_.isOnSale;
         _loc7_ = _loc7_ || !_loc2_.isAvailable;
         if(_loc2_.isAssigned)
         {
            _loc3_ = this.assignmentButtons[_loc8_].view;
            if(_loc4_ == com.rockstargames.gtav.levelDesign.nightclub.screens.WarehouseScreen.selectedTechnicianIndex)
            {
               _loc3_.tick._visible = false;
               _loc3_.active._visible = !_loc5_;
               _loc3_.activeAtCapacity._visible = _loc5_;
               _loc3_.padlock._visible = false;
               _loc3_.exclamation._visible = false;
            }
            else
            {
               _loc3_.tick._visible = !_loc3_.padlock._visible && !_loc3_.exclamation._visible;
               _loc3_._alpha = 50;
            }
         }
         _loc4_ = _loc4_ + 1;
      }
   }
   function updateAssignmentCount()
   {
      var _loc4_ = 0;
      var _loc3_ = 0;
      var _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.NIGHTCLUB.NUM_TECHNICIANS)
      {
         if(this.app.technicians[_loc2_].isAvailable)
         {
            _loc3_ = _loc3_ + 1;
            if(this.app.technicians[_loc2_].isAssigned)
            {
               _loc4_ = _loc4_ + 1;
            }
         }
         _loc2_ = _loc2_ + 1;
      }
      this.view.assignedTechnicians.text = _loc4_ + "/" + _loc3_;
      this.view.availableTechnicians.text = _loc3_ - _loc4_ + "/" + _loc3_;
   }
   function updateStats()
   {
      this.view.unitsAvailable.text = this.app.unitsAvailable + "/" + com.rockstargames.gtav.levelDesign.NIGHTCLUB.NUM_STOCK_TYPES;
      this.view.unitsAccrued.text = this.app.unitsAccrued;
      this.view.unitsSold.text = this.app.unitsSold;
   }
   function dispose()
   {
      this.technicianButtons = null;
      this.assignmentButtons = null;
      super.dispose();
   }
}

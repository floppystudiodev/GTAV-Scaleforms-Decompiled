class com.rockstargames.gtav.levelDesign.hangarCargo.OverviewScreen extends com.rockstargames.gtav.levelDesign.hangarCargo.Screen
{
   var view;
   var statsPanel;
   var graphPanel;
   var totalStockPanel;
   var organisationsPanel;
   var cursor;
   var _buttons;
   var app;
   var overlay;
   function OverviewScreen(app, viewContainer, cursor, overlay)
   {
      super(app,viewContainer,cursor,overlay,"overviewScreen");
      this.init();
   }
   function init()
   {
      super.init();
      this.view.overviewTab.gotoAndStop("on");
      this.statsPanel = new com.rockstargames.gtav.levelDesign.hangarCargo.StatsPanel(this.view.statsPanel);
      this.graphPanel = new com.rockstargames.gtav.levelDesign.hangarCargo.GraphPanel(this.view.graphPanel);
      this.totalStockPanel = new com.rockstargames.gtav.levelDesign.hangarCargo.TotalStockPanel(this.view.totalStockPanel);
      this.organisationsPanel = new com.rockstargames.gtav.levelDesign.hangarCargo.OrganisationsPanel(this.view.organisationsPanel);
      this.updateStats();
      this.updateCargos();
      this.updateOrganisations();
      this.cursor.setChangeListener(this.delegate(this,this.onTargetChange));
   }
   function get buttons()
   {
      return this._buttons.concat(this.graphPanel.buttons).concat(this.organisationsPanel.buttons);
   }
   function handleButtonInput(inputID)
   {
      switch(inputID)
      {
         case com.rockstargames.gtav.levelDesign.HANGAR_CARGO.ACCEPT:
            this.handleAcceptButton(this.app.GET_CURRENT_SELECTION());
            break;
         case com.rockstargames.gtav.levelDesign.HANGAR_CARGO.CANCEL:
         case com.rockstargames.gtav.levelDesign.HANGAR_CARGO.LB:
            break;
         case com.rockstargames.gtav.levelDesign.HANGAR_CARGO.RB:
            if(!this.overlay.isShowing)
            {
               this.app.showScreen(this.app.STEAL_SCREEN);
            }
      }
   }
   function handleAcceptButton(id)
   {
      switch(id)
      {
         case com.rockstargames.gtav.levelDesign.HANGAR_CARGO.OVERVIEW_TAB:
            this.app.showScreen(this.app.OVERVIEW_SCREEN);
            break;
         case com.rockstargames.gtav.levelDesign.HANGAR_CARGO.STEAL_TAB:
            this.app.showScreen(this.app.STEAL_SCREEN);
            break;
         case com.rockstargames.gtav.levelDesign.HANGAR_CARGO.SELL_TAB:
            this.app.showScreen(this.app.SELL_SCREEN);
      }
   }
   function updateStats()
   {
      if(this.app.organisationName != undefined)
      {
         this.statsPanel.update(this.app.organisationName,this.app.stealsCompleted,this.app.stealSuccessRate,this.app.salesCompleted,this.app.salesSuccessRate,this.app.rivalCratesStolen,this.app.saleEarnings,this.app.bonusEarnings);
      }
      if(this.app.filledSpace != undefined && this.app.totalSpace != undefined)
      {
         this.totalStockPanel.update(this.app.filledSpace,this.app.totalSpace);
      }
   }
   function updateCargos()
   {
      var _loc3_ = 0;
      var _loc4_ = this.app.cargos.length;
      while(_loc3_ < _loc4_)
      {
         var _loc2_ = this.app.cargos[_loc3_];
         var _loc5_ = 100 * _loc2_.currentStockLevel / _loc2_.totalStockLevel;
         this.graphPanel.update(_loc2_.type,_loc5_);
         _loc3_ = _loc3_ + 1;
      }
      if(!this.overlay.isShowing)
      {
         this.cursor.setTargetRects(this.buttons);
      }
   }
   function updateOrganisations()
   {
      this.organisationsPanel.update(this.app.organisations);
      if(!this.overlay.isShowing)
      {
         this.cursor.setTargetRects(this.buttons);
      }
   }
   function dispose()
   {
      this.statsPanel.dispose();
      this.graphPanel.dispose();
      this.totalStockPanel.dispose();
      this.organisationsPanel.dispose();
      this.statsPanel = null;
      this.graphPanel = null;
      this.totalStockPanel = null;
      this.organisationsPanel = null;
      super.dispose();
   }
   function onTargetChange(targetID)
   {
      this.graphPanel.updateSelectedButton(targetID);
      this.organisationsPanel.updateSelectedButton(targetID);
      this.overlay.updateSelectedButton(targetID);
      var _loc2_ = 0;
      var _loc4_ = this._buttons.length;
      while(_loc2_ < _loc4_)
      {
         var _loc3_ = this._buttons[_loc2_];
         _loc3_.view.gotoAndStop(_loc3_.id != targetID ? "off" : "on");
         _loc2_ = _loc2_ + 1;
      }
      this.view.overviewTab.gotoAndStop("on");
      if(!this.overlay.isShowing)
      {
         _loc2_ = 0;
         while(_loc2_ < com.rockstargames.gtav.levelDesign.hangarCargo.OrganisationsPanel.MAX_ORGANISATIONS)
         {
            if(targetID == com.rockstargames.gtav.levelDesign.HANGAR_CARGO["ORGANISATION_" + _loc2_])
            {
               this.organisationsPanel.showOrganisationMembers(_loc2_);
               return undefined;
            }
            _loc2_ = _loc2_ + 1;
         }
      }
      this.organisationsPanel.hideOrganisationMembers();
   }
}

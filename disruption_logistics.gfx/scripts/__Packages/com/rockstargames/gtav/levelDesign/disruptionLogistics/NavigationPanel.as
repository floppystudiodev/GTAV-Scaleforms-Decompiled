class com.rockstargames.gtav.levelDesign.disruptionLogistics.NavigationPanel
{
   var view;
   var setupButton;
   var resupplyButton;
   var researchButton;
   var sellButton;
   var staffButton;
   var upgradesButton;
   var shutDownButton;
   var restartButton;
   static var BUTTON_TOP = 310;
   static var BUTTON_SPACING = 45;
   static var TXD = "UA_GENERIC";
   function NavigationPanel(view)
   {
      this.view = view;
      view._visible = false;
      this.initButtons();
   }
   function setInfo(app)
   {
      app.imageManager.addImage(com.rockstargames.gtav.levelDesign.disruptionLogistics.NavigationPanel.TXD,app.txd,this.view.image);
      com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.truncate(this.view.name,app.bunkerName,"left");
      this.view.location.text = app.bunkerLocation;
      com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.setLocalisedText(this.view.locationLabel,"UA_LOCATION");
   }
   function initButtons()
   {
      this.setupButton = new com.rockstargames.gtav.levelDesign.disruptionLogistics.Button(com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.NAV_SETUP,this.view.setupButton,"UA_SETUP",false);
      this.resupplyButton = new com.rockstargames.gtav.levelDesign.disruptionLogistics.Button(com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.NAV_RESUPPLY,this.view.resupplyButton,"UA_RESUPPLY",false);
      this.researchButton = new com.rockstargames.gtav.levelDesign.disruptionLogistics.Button(com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.NAV_RESEARCH,this.view.researchButton,"UA_RESEARCH",false);
      this.sellButton = new com.rockstargames.gtav.levelDesign.disruptionLogistics.Button(com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.NAV_SELL,this.view.sellButton,"UA_SELL",false);
      this.staffButton = new com.rockstargames.gtav.levelDesign.disruptionLogistics.Button(com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.NAV_STAFF,this.view.staffButton,"UA_STAFF",false);
      this.upgradesButton = new com.rockstargames.gtav.levelDesign.disruptionLogistics.Button(com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.NAV_UPGRADES,this.view.upgradesButton,"UA_UPGRADES",false);
      this.shutDownButton = new com.rockstargames.gtav.levelDesign.disruptionLogistics.Button(com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.NAV_SHUT_DOWN,this.view.shutDownButton,"UA_SHUTDOWN",false);
      this.restartButton = new com.rockstargames.gtav.levelDesign.disruptionLogistics.Button(com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.NAV_RESTART,this.view.restartButton,"UA_RESTART",false);
   }
   function setButtonStates(setup, resupply, research, staff, upgrades, shutDown, restart, sell)
   {
      var _loc2_ = this.updateButton(this.setupButton,setup,com.rockstargames.gtav.levelDesign.disruptionLogistics.NavigationPanel.BUTTON_TOP);
      _loc2_ = this.updateButton(this.resupplyButton,resupply,_loc2_);
      _loc2_ = this.updateButton(this.researchButton,research,_loc2_);
      _loc2_ = this.updateButton(this.sellButton,sell,_loc2_);
      _loc2_ = this.updateButton(this.staffButton,staff,_loc2_);
      _loc2_ = this.updateButton(this.upgradesButton,upgrades,_loc2_);
      _loc2_ = this.updateButton(this.shutDownButton,shutDown,_loc2_);
      this.updateButton(this.restartButton,restart,_loc2_);
   }
   function updateButton(button, state, y)
   {
      button.state = state;
      button.view._y = y;
      button.updateBounds();
      if(state != com.rockstargames.gtav.levelDesign.disruptionLogistics.Button.HIDDEN)
      {
         y += com.rockstargames.gtav.levelDesign.disruptionLogistics.NavigationPanel.BUTTON_SPACING;
      }
      return y;
   }
   function get buttons()
   {
      var _loc2_ = [];
      if(this.view._visible)
      {
         if(this.setupButton.isActive)
         {
            _loc2_.push(this.setupButton);
         }
         if(this.resupplyButton.isActive)
         {
            _loc2_.push(this.resupplyButton);
         }
         if(this.researchButton.isActive)
         {
            _loc2_.push(this.researchButton);
         }
         if(this.sellButton.isActive)
         {
            _loc2_.push(this.sellButton);
         }
         if(this.staffButton.isActive)
         {
            _loc2_.push(this.staffButton);
         }
         if(this.upgradesButton.isActive)
         {
            _loc2_.push(this.upgradesButton);
         }
         if(this.shutDownButton.isActive)
         {
            _loc2_.push(this.shutDownButton);
         }
         if(this.restartButton.isActive)
         {
            _loc2_.push(this.restartButton);
         }
      }
      return _loc2_;
   }
   function show()
   {
      this.view._visible = true;
   }
   function hide()
   {
      this.view._visible = false;
   }
}

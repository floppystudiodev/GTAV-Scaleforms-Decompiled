class com.rockstargames.gtav.levelDesign.nightclub.screens.NightclubScreen extends com.rockstargames.gtav.levelDesign.nightclub.screens.Screen
{
   var _buttons;
   var app;
   var checkNavigationButtons;
   var lineGraph;
   var lineGraphSFXPlayed;
   var manageClubButton;
   var overlay;
   var persistentContent;
   var view;
   static var CUSTOMER_LEVELS = [111,91,71,51];
   function NightclubScreen(app, viewContainer, cursor, persistentContent, overlay)
   {
      super(app,viewContainer,cursor,persistentContent,overlay,"nightclubScreen");
      this.init();
   }
   function init()
   {
      super.init();
      this.persistentContent.updateNav(1);
      this.persistentContent.updatePopularityMeter();
      this.persistentContent.setPopularityMeterVisible(true);
      this.lineGraph = new com.rockstargames.gtav.levelDesign.nightclub.LineGraph(this.view.lineGraph);
      this.lineGraphSFXPlayed = false;
      this.view.manageClubButton.label.verticalAlign = "center";
      this.view.manageClubButton.label.textAutoSize = "shrink";
      this.manageClubButton = new com.rockstargames.gtav.levelDesign.nightclub.Button(com.rockstargames.gtav.levelDesign.nightclub.ButtonIDs.MANAGE_CLUB,this.view.manageClubButton,"CLUB_MANAGE",false);
      this._buttons.push(this.manageClubButton);
      com.rockstargames.gtav.levelDesign.NIGHTCLUB.setLocalisedText(this.view.currCustomersLabel,"CLUB_CURRCUST");
      com.rockstargames.gtav.levelDesign.NIGHTCLUB.setLocalisedText(this.view.avgCustomersLabel,"CLUB_AVGCUST");
      com.rockstargames.gtav.levelDesign.NIGHTCLUB.setLocalisedText(this.view.dailyIncomeLabel,"CLUB_INCOME");
      com.rockstargames.gtav.levelDesign.NIGHTCLUB.setLocalisedText(this.view.safeCapacityLabel,"CLUB_SAFECAP");
      com.rockstargames.gtav.levelDesign.NIGHTCLUB.setLocalisedText(this.view.vipLabel,"CLUB_VIP");
      this.update();
   }
   function update()
   {
      this.view.currCustomers.text = com.rockstargames.gtav.levelDesign.NIGHTCLUB.formatNumber(this.app.currentCustomers);
      var _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.nightclub.screens.NightclubScreen.CUSTOMER_LEVELS.length)
      {
         if(this.app.averageCustomers >= com.rockstargames.gtav.levelDesign.nightclub.screens.NightclubScreen.CUSTOMER_LEVELS[_loc2_])
         {
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      com.rockstargames.gtav.levelDesign.NIGHTCLUB.setLocalisedText(this.view.avgCustomers,"CLUB_CUSTLEV_" + _loc2_);
      this.view.dailyIncome.text = "$" + com.rockstargames.gtav.levelDesign.NIGHTCLUB.formatNumber(this.app.dailyIncome);
      this.view.safeCapacity.text = "$" + com.rockstargames.gtav.levelDesign.NIGHTCLUB.formatNumber(this.app.safeCurrent) + " / " + "$" + com.rockstargames.gtav.levelDesign.NIGHTCLUB.formatNumber(this.app.safeCapacity);
      this.view.vip.text = com.rockstargames.gtav.levelDesign.NIGHTCLUB.formatNumber(this.app.vipAppearances);
      this.lineGraph.setValues(this.app.dayGraphValues,this.app.dayGraphMax);
      if(!this.lineGraphSFXPlayed)
      {
         com.rockstargames.gtav.levelDesign.NIGHTCLUB.playSound("Show_Overview_Menu","GTAO_SMG_Hangar_Computer_Sounds");
         this.lineGraphSFXPlayed = true;
      }
      if(this.app.managementCooldown == 0)
      {
         com.rockstargames.gtav.levelDesign.NIGHTCLUB.setLocalisedText(this.view.manageClubButton.label,"CLUB_MANAGE");
      }
      else
      {
         this.view.manageClubButton.label.text = com.rockstargames.gtav.levelDesign.NIGHTCLUB.setLocalisedText(this.view.manageClubButton.label,"CLUB_MANAGE") + "\n" + com.rockstargames.gtav.levelDesign.NIGHTCLUB.formatTime(this.app.managementCooldown);
      }
   }
   function handleButtonInput(inputID)
   {
      switch(inputID)
      {
         case com.rockstargames.gtav.levelDesign.NIGHTCLUB.ACCEPT:
            this.handleAcceptButton(this.app.GET_CURRENT_SELECTION());
            break;
         case com.rockstargames.gtav.levelDesign.NIGHTCLUB.LB:
            if(!this.overlay.isShowing)
            {
               this.app.showScreen(this.app.HOME_SCREEN);
            }
            break;
         case com.rockstargames.gtav.levelDesign.NIGHTCLUB.RB:
            if(!this.overlay.isShowing)
            {
               this.app.showScreen(this.app.DJ_SCREEN);
            }
         case com.rockstargames.gtav.levelDesign.NIGHTCLUB.CANCEL:
         default:
            return;
      }
   }
   function handleAcceptButton(id)
   {
      this.checkNavigationButtons(id);
   }
   function dispose()
   {
      this.lineGraph.dispose();
      this.lineGraph = null;
      this.manageClubButton = null;
      super.dispose();
   }
}

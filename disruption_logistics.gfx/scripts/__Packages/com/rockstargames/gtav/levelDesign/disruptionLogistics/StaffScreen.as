class com.rockstargames.gtav.levelDesign.disruptionLogistics.StaffScreen extends com.rockstargames.gtav.levelDesign.disruptionLogistics.Screen
{
   var _buttons;
   var app;
   var staff1Button;
   var staff2Button;
   var staff3Button;
   var view;
   static var TXD = "UA_GENERIC";
   static var IMAGES = ["UA_STAFF_MFG","UA_STAFF_RSCH","UA_STAFF_BOTH"];
   function StaffScreen(app, viewContainer, cursor)
   {
      super(app,viewContainer,cursor,"staffScreen");
      this.init();
   }
   function init()
   {
      super.init();
      this.staff1Button = new com.rockstargames.gtav.levelDesign.disruptionLogistics.Button(com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.STAFF_MANUFACTURING,this.view.staff1Button,"UA_STAFF_MFG",false);
      this.staff2Button = new com.rockstargames.gtav.levelDesign.disruptionLogistics.Button(com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.STAFF_RESEARCH,this.view.staff2Button,"UA_STAFF_RSCH",false);
      this.staff3Button = new com.rockstargames.gtav.levelDesign.disruptionLogistics.Button(com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.STAFF_BOTH,this.view.staff3Button,"UA_STAFF_BOTH",false);
      this._buttons = [this.staff1Button,this.staff2Button,this.staff3Button];
      com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.setLocalisedText(this.view.title,"UA_STAFF_TITLE");
      this.updateStaffButtonState(this.app.staffDistribution);
   }
   function updateStats()
   {
      super.updateStats();
      this.updateStaffButtonState(this.app.staffDistribution);
   }
   function handleButtonInput(inputID)
   {
      switch(inputID)
      {
         case com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.ACCEPT:
         case com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.LEFT_MOUSE:
            this.handleAcceptInput(inputID);
         default:
            return;
      }
   }
   function handleAcceptInput(inputID)
   {
      switch(this.app.GET_CURRENT_SELECTION())
      {
         case com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.STAFF_MANUFACTURING:
            com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.playSound("Click_Generic");
            break;
         case com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.STAFF_RESEARCH:
            com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.playSound("Click_Generic");
            break;
         case com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.STAFF_BOTH:
            com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.playSound("Click_Generic");
         default:
            return;
      }
   }
   function updateStaffButtonState(currState)
   {
      this.app.staffDistribution = currState;
      this.view.staff1Button.gotoAndStop(currState != 0 ? "off" : "on");
      this.view.staff2Button.gotoAndStop(currState != 1 ? "off" : "on");
      this.view.staff3Button.gotoAndStop(currState != 2 ? "off" : "on");
      this.app.imageManager.addImage(com.rockstargames.gtav.levelDesign.disruptionLogistics.StaffScreen.TXD,com.rockstargames.gtav.levelDesign.disruptionLogistics.StaffScreen.IMAGES[currState],this.view.image);
   }
}

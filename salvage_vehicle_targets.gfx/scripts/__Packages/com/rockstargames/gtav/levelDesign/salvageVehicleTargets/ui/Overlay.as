class com.rockstargames.gtav.levelDesign.salvageVehicleTargets.ui.Overlay
{
   var app;
   var view;
   var cursor;
   var acceptButton;
   var cancelButton;
   var CENTRE = 960;
   function Overlay(app, view, cursor)
   {
      this.app = app;
      this.view = view;
      this.cursor = cursor;
      this.init();
      this.hide();
   }
   function init()
   {
      this.acceptButton = new com.rockstargames.gtav.levelDesign.salvageVehicleTargets.navigation.OverlayButton(com.rockstargames.gtav.levelDesign.salvageVehicleTargets.navigation.ButtonIDs.OVERLAY_ACCEPT,this.view.acceptButton);
      this.cursor.addTarget(this.acceptButton);
      this.cancelButton = new com.rockstargames.gtav.levelDesign.salvageVehicleTargets.navigation.OverlayButton(com.rockstargames.gtav.levelDesign.salvageVehicleTargets.navigation.ButtonIDs.OVERLAY_CANCEL,this.view.cancelButton);
      this.cursor.addTarget(this.cancelButton);
      this.cursor.addListener(com.rockstargames.gtav.levelDesign.SALVAGE_VEHICLE_TARGETS.delegate(this,this.onTargetChange));
      this.view.acceptButton.label.autoSize = "left";
      com.rockstargames.gtav.levelDesign.SALVAGE_VEHICLE_TARGETS.setLocalisedText(this.view.acceptButton.label,"SVT_CONFIRM");
      this.view.acceptButton.background._width = this.view.acceptButton.label._width + 50;
      this.view.acceptButton._x = this.CENTRE - 12.5 - this.view.acceptButton._width;
      this.view.cancelButton.label.autoSize = "left";
      com.rockstargames.gtav.levelDesign.SALVAGE_VEHICLE_TARGETS.setLocalisedText(this.view.cancelButton.label,"SVT_CANCEL");
      this.view.cancelButton.background._width = this.view.cancelButton.label._width + 50;
      this.view.cancelButton._x = this.CENTRE + 12.5;
      this.view.message.verticalAlign = "center";
   }
   function show(message, showCancelButton, isWarning)
   {
      this.view.message.text = message;
      this.view.icon.gotoAndStop(!isWarning ? "normal" : "warning");
      var _loc3_ = this.view.message.getExactCharBoundaries(0);
      this.view.icon._x = this.view.message._x + _loc3_.left - this.view.icon._width - 15;
      this.view.icon._y = this.view.message.numLines != 2 ? 677 : 655;
      com.rockstargames.gtav.levelDesign.SALVAGE_VEHICLE_TARGETS.setLocalisedText(this.view.acceptButton.label,!showCancelButton ? "SVT_OK" : "SVT_CONFIRM");
      this.view.acceptButton.background._width = this.view.acceptButton.label._width + 50;
      this.view.acceptButton._x = !showCancelButton ? this.CENTRE - 0.5 * this.view.acceptButton.background._width : this.CENTRE - 12.5 - this.view.acceptButton._width;
      this.acceptButton.enabled = true;
      this.view.background.gotoAndStop(!isWarning ? "normal" : "warning");
      this.cancelButton.enabled = showCancelButton;
      this.view.cancelButton._visible = showCancelButton;
      this.cursor.snapToTarget(this.acceptButton);
      this.view._visible = true;
   }
   function hide()
   {
      this.acceptButton.enabled = false;
      this.cancelButton.enabled = false;
      this.view._visible = false;
   }
   function get isShowing()
   {
      return this.view._visible;
   }
   function onTargetChange(target)
   {
      this.acceptButton.setState(target == this.acceptButton);
      this.cancelButton.setState(target == this.cancelButton);
   }
}

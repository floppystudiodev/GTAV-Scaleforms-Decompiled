class com.rockstargames.gtav.web.warstock.TruckPopup
{
   var buttons;
   var view;
   function TruckPopup(view, w, h)
   {
      this.view = view;
      view.panel.okButton.onColour = 16777215;
      view.panel.okButton.offColour = 16777215;
      view.panel.cancelButton.onColour = 16777215;
      view.panel.cancelButton.offColour = 16777215;
      this.buttons = [view.panel.okButton.btnTxt,view.panel.cancelButton.btnTxt];
      view.bg._width = w;
      view.bg._height = h;
      view.panel._x = 0.5 * w;
      view.panel._y = 0.5 * h - 48;
      this.setLocalisedText(view.panel.okButton.btnTxt,"CANDC_TRUCK_OK");
      this.setLocalisedText(view.panel.cancelButton.btnTxt,"CANDC_TRUCK_CANCEL");
      view.panel.okButton.btnTxt.textAutoSize = "shrink";
      view.panel.cancelButton.btnTxt.textAutoSize = "shrink";
   }
   function show(message)
   {
      this.setLocalisedText(this.view.panel.message,message);
      this.view.panel.okButton.disabled = false;
      this.view.panel.cancelButton.disabled = false;
      this.view._visible = true;
   }
   function hide()
   {
      this.view.panel.okButton.disabled = true;
      this.view.panel.cancelButton.disabled = true;
      this.view._visible = false;
   }
   function get isShowing()
   {
      return this.view._visible;
   }
   function dispose()
   {
      this.view = null;
      this.buttons = null;
   }
   function setLocalisedText(textField, label)
   {
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,label,textField,textField.html);
   }
}

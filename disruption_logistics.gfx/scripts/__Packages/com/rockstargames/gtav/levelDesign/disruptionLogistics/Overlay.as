class com.rockstargames.gtav.levelDesign.disruptionLogistics.Overlay
{
   var view;
   var acceptButton;
   var cancelButton;
   static var MIN_BUTTON_WIDTH = 60;
   static var BUTTON_PADDING = 40;
   static var BUTTON_SPACING = 20;
   static var BUTTON_NORMAL_Y = 382;
   static var MESSAGE_NORMAL_Y = 282;
   static var BUTTON_IMAGE_Y = 518;
   static var MESSAGE_IMAGE_Y = 412;
   static var CENTRE_X = 640;
   static var TXD = "UA_GENERIC";
   function Overlay(view)
   {
      this.view = view;
      view._visible = false;
      view.message.verticalAlign = "center";
      this.initButtons();
   }
   function initButtons()
   {
      this.acceptButton = new com.rockstargames.gtav.levelDesign.disruptionLogistics.Button(com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.OVERLAY_ACCEPT,this.view.acceptButton);
      this.cancelButton = new com.rockstargames.gtav.levelDesign.disruptionLogistics.Button(com.rockstargames.gtav.levelDesign.DISRUPTION_LOGISTICS.OVERLAY_CANCEL,this.view.cancelButton);
      this.view.cencelButton.gotoAndStop(1);
      this.view.acceptButton.gotoAndStop(3);
      this.acceptButton.view.label.textAutoSize = "shrink";
      this.cancelButton.view.label.textAutoSize = "shrink";
      this.view.message.textAutoSize = "shrink";
   }
   function show(message, acceptButtonLabel, cancelButtonLabel, title, image, imageManager)
   {
      if(image && image.length > 0)
      {
         this.view.gotoAndStop("image");
         imageManager.addImage(com.rockstargames.gtav.levelDesign.disruptionLogistics.Overlay.TXD,image,this.view.image);
         this.view.title.textAutoSize = "shrink";
         this.view.title.text = title;
         this.view.message.textAutoSize = "shrink";
         this.view.message.text = message;
         this.view.message._y = com.rockstargames.gtav.levelDesign.disruptionLogistics.Overlay.MESSAGE_IMAGE_Y;
         this.acceptButton.view._y = com.rockstargames.gtav.levelDesign.disruptionLogistics.Overlay.BUTTON_IMAGE_Y;
         this.cancelButton.view._y = com.rockstargames.gtav.levelDesign.disruptionLogistics.Overlay.BUTTON_IMAGE_Y;
      }
      else
      {
         this.view.gotoAndStop("normal");
         this.view.message.text = message;
         this.view.message._y = com.rockstargames.gtav.levelDesign.disruptionLogistics.Overlay.MESSAGE_NORMAL_Y;
         this.acceptButton.view._y = com.rockstargames.gtav.levelDesign.disruptionLogistics.Overlay.BUTTON_NORMAL_Y;
         this.cancelButton.view._y = com.rockstargames.gtav.levelDesign.disruptionLogistics.Overlay.BUTTON_NORMAL_Y;
      }
      if(acceptButtonLabel && acceptButtonLabel.length > 0)
      {
         this.acceptButton.view.label.text = acceptButtonLabel;
         this.acceptButton.view._visible = true;
      }
      else
      {
         this.acceptButton.view._visible = false;
      }
      if(cancelButtonLabel && cancelButtonLabel.length > 0)
      {
         this.cancelButton.view.label.text = cancelButtonLabel;
         this.cancelButton.view._visible = true;
      }
      else
      {
         this.cancelButton.view._visible = false;
      }
      if(this.acceptButton.view._visible ^ this.cancelButton.view._visible)
      {
         this.acceptButton.view._x = com.rockstargames.gtav.levelDesign.disruptionLogistics.Overlay.CENTRE_X - 0.5 * this.acceptButton.view._width;
         this.cancelButton.view._x = com.rockstargames.gtav.levelDesign.disruptionLogistics.Overlay.CENTRE_X - 0.5 * this.cancelButton.view._width;
      }
      else if(this.acceptButton.view._visible && this.cancelButton.view._visible)
      {
         this.cancelButton.view._x = com.rockstargames.gtav.levelDesign.disruptionLogistics.Overlay.CENTRE_X - this.cancelButton.view._width - com.rockstargames.gtav.levelDesign.disruptionLogistics.Overlay.BUTTON_SPACING;
         this.acceptButton.view._x = com.rockstargames.gtav.levelDesign.disruptionLogistics.Overlay.CENTRE_X + com.rockstargames.gtav.levelDesign.disruptionLogistics.Overlay.BUTTON_SPACING;
      }
      this.acceptButton.updateBounds();
      this.cancelButton.updateBounds();
      this.view._visible = true;
   }
   function hide()
   {
      this.view._visible = false;
   }
   function get buttons()
   {
      var _loc2_ = [];
      if(this.view._visible)
      {
         if(this.acceptButton.view._visible)
         {
            _loc2_.push(this.acceptButton);
         }
         if(this.cancelButton.view._visible)
         {
            _loc2_.push(this.cancelButton);
         }
      }
      return _loc2_;
   }
   function get isShowing()
   {
      return this.view._visible;
   }
}

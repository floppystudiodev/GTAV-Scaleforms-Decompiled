class com.rockstargames.gtav.levelDesign.securoserv.PurchaseOutcomeOverlay
{
   var view;
   var acceptButtonID;
   var cancelButtonID;
   var _controls;
   function PurchaseOutcomeOverlay(view, acceptButtonID, cancelButtonID)
   {
      this.view = view;
      this.acceptButtonID = acceptButtonID;
      this.cancelButtonID = cancelButtonID;
      view._visible = false;
      this._controls = [];
   }
   function show(titleLabel, messageLabel, acceptButtonLabel, cancelButtonLabel, success)
   {
      this.view.title.text = titleLabel;
      this.view.message.text = messageLabel;
      this.view.titleBG.gotoAndStop(!success ? "failure" : "success");
      this._controls.length = 0;
      var _loc3_ = undefined;
      if(acceptButtonLabel && acceptButtonLabel.length > 0)
      {
         var _loc2_ = new com.rockstargames.gtav.levelDesign.securoserv.StretchButton(this.acceptButtonID,this.view.acceptButton,acceptButtonLabel,undefined,undefined,true);
         this._controls.push(_loc2_);
         this.view.acceptButton._visible = true;
      }
      else
      {
         this.view.acceptButton._visible = false;
         _loc3_ = this.view.cancelButton;
      }
      if(cancelButtonLabel && cancelButtonLabel.length > 0)
      {
         var _loc4_ = new com.rockstargames.gtav.levelDesign.securoserv.StretchButton(this.cancelButtonID,this.view.cancelButton,cancelButtonLabel,undefined,undefined,true);
         this._controls.push(_loc4_);
         this.view.cancelButton._visible = true;
      }
      else
      {
         this.view.cancelButton._visible = false;
         _loc3_ = this.view.acceptButton;
      }
      if(this.view.acceptButton._visible ^ this.view.cancelButton._visible)
      {
         _loc3_._x = this.view.titleBG._x + 0.5 * (this.view.titleBG._width - _loc3_._width);
         this.view._visible = true;
      }
      else if(this.view.acceptButton._visible && this.view.cancelButton._visible)
      {
         this.view.cancelButton._x = this.view.titleBG._x + 20;
         this.view.acceptButton._x = this.view.titleBG._x + this.view.titleBG._width - 20 - this.view.acceptButton._width;
         this.view._visible = true;
      }
      else
      {
         this.view.cancelButton._visible = true;
      }
      if(_loc2_)
      {
         _loc2_.updateBounds();
      }
      if(_loc4_)
      {
         _loc4_.updateBounds();
      }
      this.view._visible = true;
   }
   function hide()
   {
      this.view._visible = false;
      this._controls.length = 0;
   }
   function get controls()
   {
      return this._controls;
   }
   function get isShowing()
   {
      return this.view._visible;
   }
}

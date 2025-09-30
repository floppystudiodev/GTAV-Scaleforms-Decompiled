class com.rockstargames.gtav.levelDesign.securoserv.WarehouseOverlay
{
   var _controls;
   var view;
   function WarehouseOverlay(view)
   {
      this.view = view;
      view._visible = false;
      this._controls = [];
   }
   function show(titleLabel, messageLabel, acceptButtonLabel, cancelButtonLabel, success)
   {
      this.view.title.text = titleLabel;
      this.view.message.text = messageLabel;
      this._controls.length = 0;
      var _loc3_;
      var _loc2_;
      if(acceptButtonLabel && acceptButtonLabel.length > 0)
      {
         _loc2_ = new com.rockstargames.gtav.levelDesign.securoserv.StretchButton(com.rockstargames.gtav.levelDesign.securoserv.WarehouseScreen.OVERLAY_ACCEPT,this.view.acceptButton,acceptButtonLabel,undefined,undefined,true);
         this._controls.push(_loc2_);
         this.view.acceptButton._visible = true;
      }
      else
      {
         this.view.acceptButton._visible = false;
         _loc3_ = this.view.cancelButton;
      }
      var _loc4_;
      if(cancelButtonLabel && cancelButtonLabel.length > 0)
      {
         _loc4_ = new com.rockstargames.gtav.levelDesign.securoserv.StretchButton(com.rockstargames.gtav.levelDesign.securoserv.WarehouseScreen.OVERLAY_CANCEL,this.view.cancelButton,cancelButtonLabel,undefined,undefined,true);
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
         _loc3_._x = this.view.bg._x + 0.5 * (this.view.bg._width - _loc3_._width);
         this.view._visible = true;
      }
      else if(this.view.acceptButton._visible && this.view.cancelButton._visible)
      {
         this.view.cancelButton._x = this.view.bg._x + 20;
         this.view.acceptButton._x = this.view.bg._x + this.view.bg._width - 20 - this.view.acceptButton._width;
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

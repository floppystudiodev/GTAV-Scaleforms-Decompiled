class com.rockstargames.gtav.levelDesign.covertOps.Overlay
{
   var _controls;
   var acceptButtonID;
   var cancelButtonID;
   var view;
   function Overlay(view, acceptButtonID, cancelButtonID, isAsian)
   {
      this.view = view;
      this.acceptButtonID = acceptButtonID;
      this.cancelButtonID = cancelButtonID;
      view.message.verticalAlign = "center";
      var _loc3_;
      if(isAsian)
      {
         _loc3_ = view.message.getNewTextFormat();
         _loc3_.leading = 3;
         view.message.setNewTextFormat(_loc3_);
      }
      view._visible = false;
      this._controls = [];
   }
   function show(titleLabel, message, acceptButtonLabel, cancelButtonLabel)
   {
      this.view.title.text = titleLabel;
      this._controls.length = 0;
      var _loc3_;
      var _loc2_;
      if(acceptButtonLabel && acceptButtonLabel.length > 0)
      {
         _loc2_ = new com.rockstargames.gtav.levelDesign.covertOps.StretchButton(this.acceptButtonID,this.view.acceptButton,acceptButtonLabel,undefined,undefined,true);
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
         _loc4_ = new com.rockstargames.gtav.levelDesign.covertOps.StretchButton(this.cancelButtonID,this.view.cancelButton,cancelButtonLabel,undefined,undefined,true);
         this._controls.push(_loc4_);
         this.view.cancelButton._visible = true;
      }
      else
      {
         this.view.cancelButton._visible = false;
         _loc3_ = this.view.acceptButton;
      }
      this.view.message.text = message;
      var _loc5_;
      if(this.view.acceptButton._visible ^ this.view.cancelButton._visible)
      {
         _loc3_._x = this.view.titleBG._x + 0.5 * (this.view.titleBG._width - _loc3_._width);
         this.view._visible = true;
      }
      else if(this.view.acceptButton._visible && this.view.cancelButton._visible)
      {
         _loc5_ = this.view.titleBG._x + 0.5 * this.view.titleBG._width;
         this.view.cancelButton._x = _loc5_ - this.view.cancelButton._width - 20;
         this.view.acceptButton._x = _loc5_ + 20;
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

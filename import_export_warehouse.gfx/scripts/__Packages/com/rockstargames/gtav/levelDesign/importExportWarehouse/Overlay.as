class com.rockstargames.gtav.levelDesign.importExportWarehouse.Overlay
{
   var _controls;
   var acceptID;
   var cancelID;
   var view;
   function Overlay(view, acceptID, cancelID)
   {
      this.view = view;
      this.acceptID = acceptID;
      this.cancelID = cancelID;
      view._visible = false;
      view.message.verticalAlign = "center";
      this._controls = [];
   }
   function show(title, message, acceptButtonLabel, cancelButtonLabel)
   {
      this.view.title.text = title;
      this.view.message.text = message;
      this._controls.length = 0;
      var _loc4_;
      var _loc3_;
      if(acceptButtonLabel && acceptButtonLabel.length > 0)
      {
         _loc3_ = new com.rockstargames.gtav.levelDesign.importExportWarehouse.Button(this.acceptID,this.view.acceptButton);
         this.view.acceptButton.label.text = acceptButtonLabel;
         this._controls.push(_loc3_);
         this.view.acceptButton._visible = true;
      }
      else
      {
         this.view.acceptButton._visible = false;
         this.view.acceptButton.label.text = "";
         _loc4_ = this.view.cancelButton;
      }
      var _loc5_;
      if(cancelButtonLabel && cancelButtonLabel.length > 0)
      {
         _loc5_ = new com.rockstargames.gtav.levelDesign.importExportWarehouse.Button(this.cancelID,this.view.cancelButton);
         this.view.cancelButton.label.text = cancelButtonLabel;
         this._controls.push(_loc5_);
         this.view.cancelButton._visible = true;
      }
      else
      {
         this.view.cancelButton._visible = false;
         this.view.cancelButton.label.text = "";
         _loc4_ = this.view.acceptButton;
      }
      var _loc6_ = Math.max(60,Math.max(this.view.acceptButton.label.textWidth,this.view.cancelButton.label.textWidth)) + 40;
      this.view.acceptButton.label._width = this.view.acceptButton.bg._width = _loc6_;
      this.view.cancelButton.label._width = this.view.cancelButton.bg._width = _loc6_;
      var _loc2_ = this.view.message._x + 0.5 * this.view.message._width;
      if(this.view.acceptButton._visible ^ this.view.cancelButton._visible)
      {
         _loc4_._x = _loc2_ - 0.5 * _loc4_._width;
         this.view._visible = true;
      }
      else if(this.view.acceptButton._visible && this.view.cancelButton._visible)
      {
         this.view.cancelButton._x = _loc2_ - this.view.cancelButton._width - 20;
         this.view.acceptButton._x = _loc2_ + 20;
         this.view._visible = true;
      }
      else
      {
         this.view.cancelButton._visible = true;
      }
      if(_loc3_)
      {
         _loc3_.updateBounds();
      }
      if(_loc5_)
      {
         _loc5_.updateBounds();
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

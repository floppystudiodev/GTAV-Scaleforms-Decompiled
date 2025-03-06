class com.rockstargames.gtav.levelDesign.arcadeManagement.PersistentContent
{
   var app;
   var view;
   var _buttons;
   var currBackgroundImage;
   static var TXD = "ARCADE_MGMT";
   function PersistentContent(app, view)
   {
      this.app = app;
      this.view = view;
      this._buttons = [];
   }
   function setBackgroundImage(id)
   {
      if(id != this.currBackgroundImage)
      {
         this.currBackgroundImage = id;
         this.app.imageManager.addImage(com.rockstargames.gtav.levelDesign.arcadeManagement.PersistentContent.TXD,id + "_BG",this.view.backgroundImage);
      }
   }
   function get buttons()
   {
      return this._buttons;
   }
}

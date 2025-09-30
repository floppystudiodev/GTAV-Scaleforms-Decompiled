class com.rockstargames.gtav.FrontendGen9.progressHub.ui.Sticker extends MovieClip
{
   var background;
   var stickerIcon;
   var textField;
   var iconWidth = 36;
   var padding = 9;
   function Sticker()
   {
      super();
   }
   function setStatus(status)
   {
      switch(status)
      {
         case 0:
            this.stickerIcon.gotoAndStop(1);
            this.textField.text = "";
            this.background._alpha = 0;
            this.resizeBackground(false);
            break;
         case 1:
            this.stickerIcon.gotoAndStop(1);
            this.setText("PHUB_READY_TO_CLAIM",0);
            this.background._alpha = 100;
            this.setColor(16562480);
            this.resizeBackground(false);
            break;
         case 2:
            this.stickerIcon.gotoAndStop(2);
            this.setText("PHUB_CLAIMED",0);
            this.background._alpha = 100;
            this.setColor(16777215);
            this.resizeBackground(true);
            break;
         case 3:
            this.stickerIcon.gotoAndStop(3);
            this.textField.text = "";
            this.background._alpha = 0;
            break;
         case 4:
            this.stickerIcon.gotoAndStop(2);
            this.setText("PHUB_COMPLETE",0);
            this.background._alpha = 100;
            this.setColor(16777215);
            this.resizeBackground(true);
            break;
         case 5:
            this.stickerIcon.gotoAndStop(3);
            this.setText("PHUB_LOCKED",16777215);
            this.background._alpha = 100;
            this.setColor(6710886);
            this.resizeBackground(true);
         default:
            return;
      }
   }
   function setText(newText, newTextColor)
   {
      com.rockstargames.gtav.FrontendGen9.PROGRESS_HUB.setLocalisedText(this.textField,newText);
      this.textField.verticalAlign = "center";
      this.textField.autoSize = "left";
      this.textField.textColor = newTextColor;
   }
   function setColor(newColor)
   {
      var _loc3_ = new flash.geom.Transform(this.background);
      var _loc2_ = new flash.geom.ColorTransform();
      _loc2_.rgb = newColor;
      _loc3_.colorTransform = _loc2_;
   }
   function resizeBackground(showIcon)
   {
      if(showIcon)
      {
         this.textField._x = this.padding / 2 + this.stickerIcon._width;
         this.background._width = this.stickerIcon._width + this.textField.textWidth + this.padding * 2;
      }
      else
      {
         this.textField._x = this.padding - 2;
         this.background._width = this.textField.textWidth + this.padding * 2;
      }
   }
}

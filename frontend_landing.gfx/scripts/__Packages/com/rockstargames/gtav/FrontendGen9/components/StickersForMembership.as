class com.rockstargames.gtav.FrontendGen9.components.StickersForMembership extends com.rockstargames.gtav.FrontendGen9.components.Sticker
{
   var stickerBG;
   var stickerBGCircle;
   var stickerIcon;
   var stickerTF;
   function StickersForMembership()
   {
      super();
   }
   function setupSticker(id, data, str)
   {
      switch(data.type)
      {
         case com.rockstargames.gtav.FrontendGen9.components.StickerTypeData.ICON_TYPE:
            this.stickerTF._visible = false;
            this.stickerBG._visible = false;
            this.stickerIcon.gotoAndStop(data.iconID);
            this.stickerIcon._visible = true;
            this.stickerBGCircle._visible = true;
            break;
         case com.rockstargames.gtav.FrontendGen9.components.StickerTypeData.ICON_AND_TEXT_TYPE:
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,str,this.stickerTF,true);
            this.stickerIcon._x = 2 + this.stickerIcon._width / 2;
            this.stickerTF._x = this.stickerIcon._x + this.stickerIcon._width / 2 + 2;
            this.stickerBG._width = this.stickerTF.textWidth + this.padding * 2 + this.stickerIcon._width;
            this.stickerIcon.gotoAndStop(data.iconID);
            this.stickerBGCircle._visible = false;
            this.stickerTF._visible = true;
            this.stickerBG._visible = true;
            this.stickerIcon._visible = true;
            break;
         case com.rockstargames.gtav.FrontendGen9.components.StickerTypeData.TEXT_TYPE:
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,str,this.stickerTF,true);
            this.stickerTF._x = this.padding - 2;
            this.stickerBG._width = this.stickerTF.textWidth + this.padding * 2;
            this.stickerIcon._visible = false;
            this.stickerBGCircle._visible = false;
            this.stickerTF._visible = true;
            this.stickerBG._visible = true;
         default:
            return;
      }
   }
}

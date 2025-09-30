class com.rockstargames.gtav.levelDesign.WarningScreenListItem extends MovieClip
{
   var BackgroundMC;
   var ListItemTextTF;
   function WarningScreenListItem()
   {
      super();
      this.ListItemTextTF._visible = false;
      this.BackgroundMC._visible = false;
      this.INITIALISE();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
   }
   function getActive()
   {
      return this.BackgroundMC._visible;
   }
   function setActive(_bActive)
   {
      this.BackgroundMC._visible = _bActive;
      this.ListItemTextTF.textColor = !_bActive ? 4294967295 : 4278190080;
   }
   function setText(_text)
   {
      this.ListItemTextTF.text = _text;
      this.ListItemTextTF._visible = true;
      this.ListItemTextTF.textColor = 4294967295;
   }
   function getText()
   {
      return this.ListItemTextTF.text;
   }
   function getEnabled()
   {
      return this.ListItemTextTF._visible;
   }
   function reset()
   {
      this.ListItemTextTF.text = "";
      this.ListItemTextTF._visible = false;
      this.BackgroundMC._visible = false;
   }
   function debug()
   {
      this.setText("TEST OPTION");
      this.setActive(false);
   }
}

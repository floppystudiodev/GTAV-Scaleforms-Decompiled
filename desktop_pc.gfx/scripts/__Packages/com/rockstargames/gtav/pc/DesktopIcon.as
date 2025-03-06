class com.rockstargames.gtav.pc.DesktopIcon extends com.rockstargames.gtav.pc.PCButtonBase
{
   var data;
   var index;
   var mc;
   function DesktopIcon()
   {
      super();
   }
   function init(_mc, enum, args, _i, lbl)
   {
      super.init(_mc,enum,args);
      this.data = com.rockstargames.gtav.constants.PCAppLUT.lookUp(enum);
      this.index = _i;
      this.mc.iconsMC.gotoAndStop(this.data[1]);
      this.mc.labelTF.text = lbl;
      this.mc.labelTF.autoSize = true;
      this.mc.labelTF.wordWrap = true;
      this.mc.labelTF.multiline = true;
   }
}

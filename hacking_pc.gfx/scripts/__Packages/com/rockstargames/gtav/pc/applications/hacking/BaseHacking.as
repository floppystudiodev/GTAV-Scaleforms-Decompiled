class com.rockstargames.gtav.pc.applications.hacking.BaseHacking extends com.rockstargames.gtav.pc.applications.App_Base
{
   var hackingRef;
   var lives = 7;
   var gameSpeed = 1;
   function BaseHacking()
   {
      super();
   }
   function setupButton(mc, id, depth)
   {
      var _loc2_ = new com.rockstargames.gtav.pc.PCButtonBase();
      _loc2_.init(mc,id,{depth:depth});
      this.hackingRef.ADD_BUTTONS(_loc2_);
      return _loc2_;
   }
   function setupIcon(mc, fr, label)
   {
      mc.iconsMC.gotoAndStop(fr);
      if(label != undefined)
      {
         mc.labelTF.text = label;
      }
      mc.labelTF.autoSize = true;
      mc.labelTF.wordWrap = true;
      mc.labelTF.multiline = true;
   }
   function getRndNumber()
   {
      var _loc1_ = Math.floor(Math.random() * 99);
      if(_loc1_ < 10)
      {
         return String("0" + _loc1_);
      }
      return String(_loc1_);
   }
   function setInputEvent(direction)
   {
   }
}

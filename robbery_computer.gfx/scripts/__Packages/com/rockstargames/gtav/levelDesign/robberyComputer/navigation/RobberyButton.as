class com.rockstargames.gtav.levelDesign.robberyComputer.navigation.RobberyButton extends com.rockstargames.gtav.levelDesign.robberyComputer.navigation.Target
{
   var view;
   function RobberyButton(id, view)
   {
      super();
      var _loc5_ = view.hitArea.getBounds(_root);
      this.init(id,_loc5_.xMin,_loc5_.xMax,_loc5_.yMin,_loc5_.yMax);
      this.view = view;
      view.reward.verticalAlign = "center";
      view.payment.verticalAlign = "center";
      view.special.label.autoSize = "left";
      view.special.label.verticalAlign = "center";
      com.rockstargames.gtav.levelDesign.ROBBERY_COMPUTER.setLocalisedText(view.special.label,"ROBBERY_CMP_HV");
      view.special.background._width = view.special.label._width + 36;
   }
   function setState(isOn)
   {
      this.view.focus._visible = isOn;
   }
   function set infoVisible(isVisible)
   {
      this.view.info._visible = isVisible;
      this.view.image._visible = !isVisible;
   }
   function dispose()
   {
      this.view = null;
   }
}

class com.rockstargames.gtav.Multiplayer.powerplay.ScoreRingIcon extends com.rockstargames.gtav.Multiplayer.powerplay.GenericIcon
{
   var icon;
   var meterContainer;
   var ring;
   var view;
   function ScoreRingIcon(type, container)
   {
      super(type,container);
   }
   function initView(type, container)
   {
      super.initView(type,container);
      this.ring = this.view.attachMovie("ring","ring",this.view.getNextHighestDepth());
      this.icon.label.textAutoSize = "shrink";
      this.icon.label.verticalAlign = "center";
      var _loc3_ = this.meterContainer.attachMovie("meter","meterBG",this.meterContainer.getNextHighestDepth());
      _loc3_._alpha = 0;
      this.meterContainer._width = this.ring._width - 2;
      this.meterContainer._height = this.ring._height - 2;
   }
   function activate()
   {
      super.activate();
      this.ring._alpha = 100;
   }
   function deactivate()
   {
      super.deactivate();
      this.ring._alpha = 50;
   }
   function setScore(score, colourTransform)
   {
      this.icon.label.text = score;
      var _loc2_ = new flash.geom.ColorTransform();
      if(colourTransform != undefined)
      {
         _loc2_.rgb = colourTransform.rgb;
      }
      else
      {
         _loc2_.rgb = com.rockstargames.gtav.Multiplayer.powerplay.GenericIcon.BLANK_COLOUR_TRANSFORM.rgb;
      }
      this.ring.transform.colorTransform = _loc2_;
   }
}

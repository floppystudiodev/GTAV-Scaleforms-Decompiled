class com.rockstargames.gtav.levelDesign.musicStudioMonitor.Meter
{
   var view;
   var leftValue;
   var rightValue;
   var noiseSamplePoint;
   var noiseDifferentialSamplePoint;
   static var METER_BITMAP_WIDTH = 18;
   static var METER_BITMAP_HEIGHT = 151;
   static var DAMPING = 0.96;
   static var NOISE_SAMPLE_STEP = 0.04;
   static var NOISE_DIFFERENTIAL_SAMPLE_STEP = 0.05;
   static var NOISE_SCALAR = 3;
   static var NOISE_DIFFERENTIAL_SCALAR = 0.2;
   static var MATRIX = new flash.geom.Matrix();
   static var BITMAP_DATA = flash.display.BitmapData.loadBitmap("meter");
   function Meter(view)
   {
      this.view = view;
      this.leftValue = 0;
      this.rightValue = 0;
      this.noiseSamplePoint = Math.random();
      this.noiseDifferentialSamplePoint = Math.random();
   }
   function update(noise)
   {
      var _loc3_ = Math.abs(noise.getValue(this.noiseSamplePoint));
      this.noiseSamplePoint += com.rockstargames.gtav.levelDesign.musicStudioMonitor.Meter.NOISE_SAMPLE_STEP;
      var _loc2_ = noise.getValue(this.noiseDifferentialSamplePoint);
      this.noiseDifferentialSamplePoint += com.rockstargames.gtav.levelDesign.musicStudioMonitor.Meter.NOISE_DIFFERENTIAL_SAMPLE_STEP;
      this.leftValue = _loc3_ * com.rockstargames.gtav.levelDesign.musicStudioMonitor.Meter.NOISE_SCALAR - _loc2_ * com.rockstargames.gtav.levelDesign.musicStudioMonitor.Meter.NOISE_DIFFERENTIAL_SCALAR;
      this.rightValue = _loc3_ * com.rockstargames.gtav.levelDesign.musicStudioMonitor.Meter.NOISE_SCALAR + _loc2_ * com.rockstargames.gtav.levelDesign.musicStudioMonitor.Meter.NOISE_DIFFERENTIAL_SCALAR;
      this.drawMeterSide(this.view.left,this.leftValue);
      this.drawMeterSide(this.view.right,this.rightValue);
   }
   function damp()
   {
      this.leftValue *= com.rockstargames.gtav.levelDesign.musicStudioMonitor.Meter.DAMPING;
      this.rightValue *= com.rockstargames.gtav.levelDesign.musicStudioMonitor.Meter.DAMPING;
      this.drawMeterSide(this.view.left,this.leftValue);
      this.drawMeterSide(this.view.right,this.rightValue);
   }
   function drawMeterSide(meter, value)
   {
      value = this.clamp(value,0,1);
      var _loc3_ = com.rockstargames.gtav.levelDesign.musicStudioMonitor.Meter.METER_BITMAP_HEIGHT * (1 - value);
      meter.clear();
      meter.beginBitmapFill(com.rockstargames.gtav.levelDesign.musicStudioMonitor.Meter.BITMAP_DATA,com.rockstargames.gtav.levelDesign.musicStudioMonitor.Meter.MATRIX,false,true);
      meter.moveTo(0,_loc3_);
      meter.lineTo(com.rockstargames.gtav.levelDesign.musicStudioMonitor.Meter.METER_BITMAP_WIDTH,_loc3_);
      meter.lineTo(com.rockstargames.gtav.levelDesign.musicStudioMonitor.Meter.METER_BITMAP_WIDTH,com.rockstargames.gtav.levelDesign.musicStudioMonitor.Meter.METER_BITMAP_HEIGHT);
      meter.lineTo(0,com.rockstargames.gtav.levelDesign.musicStudioMonitor.Meter.METER_BITMAP_HEIGHT);
      meter.lineTo(0,_loc3_);
      meter.endFill();
   }
   function clamp(value, min, max)
   {
      return value >= min ? (value <= max ? value : max) : min;
   }
}

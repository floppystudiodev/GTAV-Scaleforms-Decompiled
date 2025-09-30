class com.rockstargames.gtav.levelDesign.STRENGTH_TEST_SCORE extends com.rockstargames.ui.core.BaseScreenLayout
{
   var BOUNDING_BOX;
   var CONTENT;
   var TIMELINE;
   var _name;
   var highScore;
   var score;
   function STRENGTH_TEST_SCORE()
   {
      super();
      _global.gfxExtensions = true;
      this._name = "STRENGTH_TEST_SCORE";
   }
   function initialise(mc)
   {
      this.TIMELINE = mc;
      this.BOUNDING_BOX = this.TIMELINE.attachMovie("BOUNDING_BOX","BOUNDING_BOX",this.TIMELINE.getNextHighestDepth());
      this.BOUNDING_BOX._visible = false;
      this.CONTENT = this.TIMELINE.attachMovie("CONTENT","CONTENT",this.TIMELINE.getNextHighestDepth());
      this.score = new com.rockstargames.gtav.levelDesign.strengthTestScore.Score(this.CONTENT.score);
      this.highScore = new com.rockstargames.gtav.levelDesign.strengthTestScore.Score(this.CONTENT.highScore);
      this.SET_INSTANT_SCORE(0);
      this.SET_INSTANT_HIGH_SCORE(0);
   }
   function SET_SCORE(value, countUpDuration, holdDuration, countDownDuration)
   {
      this.score.setScore(value,countUpDuration,holdDuration,countDownDuration);
   }
   function SET_INSTANT_SCORE(value)
   {
      this.score.setInstantScore(value);
   }
   function SET_HIGH_SCORE(value, countUpDuration, holdDuration, countDownDuration)
   {
      this.highScore.setScore(value,countUpDuration,holdDuration,countDownDuration);
   }
   function SET_INSTANT_HIGH_SCORE(value)
   {
      this.highScore.setInstantScore(value);
   }
}

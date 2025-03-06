class com.rockstargames.gtav.levelDesign.celebration.CelebrationSequenceBG extends com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence
{
   var stepsContainer;
   function CelebrationSequenceBG(container, bgColour, displayConfig, sfxId, movieId, movieIdBit)
   {
      super(container,bgColour,displayConfig,sfxId,movieId,movieIdBit);
   }
   function init(container, sfxId)
   {
      super.init(container,sfxId);
      this.stepsContainer._visible = false;
   }
}

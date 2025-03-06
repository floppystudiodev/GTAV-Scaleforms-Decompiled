class com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequenceBG extends com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence
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

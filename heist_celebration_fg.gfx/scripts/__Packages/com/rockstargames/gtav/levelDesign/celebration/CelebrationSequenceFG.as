class com.rockstargames.gtav.levelDesign.celebration.CelebrationSequenceFG extends com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence
{
   var backgroundContainer;
   var DEFAULT_TEXT_ALPHA = 40;
   function CelebrationSequenceFG(container, bgColour, displayConfig, sfxId, movieId, movieIdBit)
   {
      super(container,bgColour,displayConfig,sfxId,movieId,movieIdBit);
   }
   function init(container, sfxId)
   {
      super.init(container,sfxId);
      this.backgroundContainer._visible = false;
   }
   function addBackground(alpha)
   {
   }
   function setGlobalFlag(id)
   {
   }
   function playSound(soundName, libName)
   {
   }
}

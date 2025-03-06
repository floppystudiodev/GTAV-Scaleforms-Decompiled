class com.rockstargames.gtav.levelDesign.celebration.CelebrationSequenceCutout extends com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence
{
   var backgroundContainer;
   var DEFAULT_GRAPHICS_VISIBILITY = false;
   var USE_COLOUR = false;
   var IS_CUTOUT = true;
   function CelebrationSequenceCutout(container, bgColour, displayConfig, sfxId, movieId, movieIdBit)
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

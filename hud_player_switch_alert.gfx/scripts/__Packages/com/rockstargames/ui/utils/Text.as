class com.rockstargames.ui.utils.Text
{
   function Text()
   {
   }
   function setTextWithIcons(textLabel, movieClipToAttachBlips, txtField, fontStyle, pointSize, leading, centerAligned)
   {
      com.rockstargames.ui.game.GameInterface.call("SET_FORMATTED_TEXT_WITH_ICONS",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,textLabel,movieClipToAttachBlips,txtField,fontStyle,pointSize,leading,centerAligned);
   }
}

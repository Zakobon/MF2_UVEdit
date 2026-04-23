# MF2_UVEdit
Tool for editing Monster Rancher 2's MMX/MMJ files's UVs

  UVEdit helps you modify the primitive data in a monster's model files and is meant to be used in addition to other tools like TIMBuild, PSXPrev, Gimp and Blender to allow greater options in creating modded monsters to use ingame. 

This is still very early in developement, so forgive the cluttered UI. Redoing it will take quite a while and I'd rather focus of implementing missing features for now.

It's still pretty untested, so remember to SAVE often by exporting your work.



== Important ==


  Bug Reporting: If you come run into any bugs or issues with the exported files, SAVE those files and send them to me so I can inspect what went wrong. 
I might even be able to fix the file for you. You can me [@Zakobon] in the Monster Rancher Chat Discord[https://discord.gg/r-monsterrancher-chat-221369172234469376]. 
I'm typically in the More Monsters thread of the mods-dev-research channel.



**(Features)**

== Textures .TEX ==
  +Basic repositioning of pixel's data (x/y)
 
  +Importing TEX AND individual TIM files (TEX files are just multiple TIMs shoved together)

  +Changing bit modes(4-bit, 8-bit) and CLUT table xy positioning
 
  +Semi-transparency toggling (applies to the entire TIM file/rectangle, not individual pixels)
 
  +Creating new "blank" TIMs to add to TEX files

  +Exporting TEX files newly built from what TIMs you import/create


  -Cannot change the width or height of any imported textures
  -[Note]: You'll need to delete the imported original and create a new blank TIM to replace it
 
  -No changing individual pixel or CLUT data (the displayed image)
  -[Note]: Use TIMBuild for that, blank TIMs are meant to be overwritten using that

  -Viewing actual TIM image not implemented yet. (need to find a way to prevent it from lagging the whole program)

== Models .MM0(MMX/MMJ) ==

  +Basic UV positioning and editing (x/y, scale, rotation)

  +Box Select to select a group or precise Primitive Select to add/remove from you selection
  
  +Semi-transparency toggling for individual primitives (primitives are basically polygons)
    -[Note]: This must be toggled on for both the model AND the texture underneath for transparency
  
  +Changing bit modes(4-bit, 8-bit) and CLUT table xy reading
    -[Note]: Yes, you do have to have both the texture and primitives set to the same bit mode
  
  +Revert edits of selected primitives to how they were when first imported
  
  +Primitive Edit Templates. Create templates from current edit highlight.
	+Use to apply the same exact changes repeatedly to new selections 
  
  +Exporting as a new MM0 file, with new name
  
   or    
  
  +Selectively applying the edited/imput file edits to the various _X variants found in the input directory
	  -[Note]: The selected files have to actually exist in the imported file's directory

  +Vertex changes are applied on export aswell, if you somehow manage to do that outside this tool
  
  +Exporting as a PSX TMD, for whatever reason...

  
  -No individual editing of the vertices in a primitive, it's the whole primive or nothing
  
  -Vertex and Normal editing are not available (Maybe in the far future)
 
  -No automatic folding or unfolding of selected textures (next update, hopefully)
    
== Tips ==

You can revert any selected primitives back to their imported state with the "Revert Edits" button. It's quick and can be done whenever and affects individual primitives, not the entire group you had originally edited. If you spot a primitive that was accidently grabbed and warped beyond recognition from wayyy back when you started, just select it and revert. (There is no "Revert: Revert Edits" button, maybe in a future update?)

Create a backup folder dedicated to the orginal, unedited files. Being able to quickly locate and double check the unedited files will save you so much time in the long run.

Don't be afraid to rename your files to keep things tidy. The file names only have to match the originals when loading ingame. This tool only cares about the extension (.mmx/.mmj,.tex and .tim)

I typically run the game while working on this. I directly import from Steam's /mf2/.../mon files and then mass export edits directly to that same folder. The game only reads those files during loading screens,
so I just bounce back and forth between Town and the Ranch to quickly check edits. 

The More Monsters mod has a great setting that varyies each monster's ingame size. Sub-Species or Random. 
If you go [random monster sizes: enabled, minimum size: 100%, maximum size: 250%], you'll have a larger model to zoom in on while checking things ingame. It makes a difference.

The MM0 group export works by checking the last 5 characters of the file name for matches[a,b,d,i,p,v], so you could technically mass export changes of one subspecies to another by renaming the edited file, then importing it back into the tool.

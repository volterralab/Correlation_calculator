
newImage("HyperStack", "32-bit composite-mode label", 300, 400, 2, 3, 200);


Stack.getDimensions(width, height, channels, slices, frames) ;
setBatchMode(true);

run("Add Specified Noise...", "standard=500"); /// seems to handle hyperstacks properly without the need to loop for each slice.
/*
for (f=0; f<frames; f++) {
showProgress (f/frames);
for (c=0; c<channels; c++) {
for (s=0; s<slices; s++) {

Stack.setPosition(c, s, f) ;
print ("Working on ", c, s, f) ;

//run("Next Slice [>]");
run("Add Specified Noise...", "standard=500");
}
}
}
*/
setBatchMode(false);

//frames=200;
width=200;
height=200;
frames=400;

run("Size...", "width="+width+" height="+height+" depth="+slices+" time="+frames+ " constrain average interpolation=Bilinear");
//run("Brightness/Contrast...");
run("Next Slice [>]");
run("Enhance Contrast", "saturated=0.35");
makeRectangle(27, 12, 12, 11);
roiManager("Add");
makeRectangle(43, 41, 16, 11);
roiManager("Add");
makeRectangle(27, 73, 24, 13);
roiManager("Add");

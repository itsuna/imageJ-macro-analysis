// Written by itsuna on May 25th, 2017

s = selectionType();

if (s == -1)
{
	exit("There is no selection...");
}
else
{
	run("Clear Results");
	Dialog.create("Set scale");
	Dialog.addString("Distance in pixels: ", "320");
	Dialog.addString("Known distance: ", "6000");
	Dialog.addString("Pixel aspect ratio: ", "nm");
	Dialog.show();
	pixel = parseFloat(Dialog.getString());
	dist = parseFloat(Dialog.getString());
	unit = Dialog.getString();
	pixelDist = dist / pixel;
	print("pixel: " + pixel);
	print("dist: " + dist);
	print("unit: " + unit);
	print("dist/pixel: " + pixelDist);
	row = 0;
	for (i = 0; i < roiManager("count"); i++)
	{
		roiManager("select", i);
		getSelectionCoordinates(xPoints, yPoints);
		name = getInfo("selection.name");
		print(name);
		print("xPointsNum: " + xPoints.length + "    yPointsNum: " + yPoints.length);
		for (j = 0; j < xPoints.length; j++)
		{
			setResult("Name", row, name);
			setResult("X (" + unit + ")", row, xPoints[j] * pixelDist);
			setResult("Y (" + unit + ")", row, yPoints[j] * pixelDist);
			row++;
		}
	}
	setOption("ShowRowNumbers", false);
	updateResults();
}
print("Finished!");

//Import the gears library
use <ParametricHerringboneGears.scad>

motorShaftDiameter = 5;

/*translate([65, 0, 0]) {
    gearsbyteethanddistance(13, 130, d=80, which=1, shaftDiameter=motorShaftDiameter, hubWallThickness = 7.5, hubThickness=6, setscrewHeadDiameter = 5.5, setscrewShaftDiameter=3, setscrewOffset = 2, captiveNutDiameter = 5.5, captiveNutHeight = 2.5);
}*/

render(convexity = 2) difference() {
render(convexity = 2) difference() {
    cylinder(h=14.8, d=170, $fn=128);
    translate([0, 0, -0.1]) {
        gearsbyteethanddistance(130, 13, d=80, which=1, shaftDiameter=motorShaftDiameter, hubWallThickness = 7.5, hubThickness=6, setscrewHeadDiameter = 5.5, setscrewShaftDiameter=3, setscrewOffset = 2, captiveNutDiameter = 5.5, captiveNutHeight = 2.5);
    }
}
cube([30, 30, 30], center=true);
}
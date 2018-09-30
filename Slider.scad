use <Schnellwechselplattenhalter.scad>;
use <Belt-Stamp.scad>;

module slider() {
    difference() {
        union() {
            difference() {
            translate([0, 49.82, 8]) rotate([0, 0, 90]) Rahmen();
                translate([-40, 89, -1]) cube([80, 40, 40]);
            }
            for (i=[0, 1]) {
                translate([-73/2+i*58, 0, 0]) cube([15, 89, 20.8]);
            }
            translate([-73/2, 0, 0]) cube([73, 89, 8]);
        }
        translate([0, 7.3, -1]) rotate([0, 0, 30]) cylinder(d=6.3, h=9.05, $fn=6);
        translate([16.5, 4.3, -1]) cylinder(d=6.3, h=9.05, $fn=6);
        for (i=[0, 1]) {
            translate([-74/2+i*(74-6.5), -0.5, 8]) cube([7, 90, 20.8]);
            translate([-74/2-10.7+i*(74-6.5), -0.5, 25]) rotate([0, 45, 0]) cube([20, 90, 20]);
        }
        translate([-3.2, -1, -1]) cube([6.4, 91, 8.63]);
        translate([-3.2, 81.5, -1]) cube([6.4, 30, 50]);
        translate([-9, 81.5, 16]) cube([18, 30, 50]);
        translate([0, 81.5-0.3, 8]) rotate([0, -90, 90]) belt_stamp(6.4);
        translate([0, 17, 0]) belt_clamp_stamp();
        translate([0, 81.5, 14.25]) rotate([-90, 0, 0]) belt_clamp_stamp();
        for (i=[-1, 1]) {
            translate([i*(6.4/2+0.5+6/2), 17, 0]) cylinder(d=3.23, h=50, $fn=32);
            translate([i*(6.4/2+0.5+6/2), 17, 13-2.8]) cylinder(d=6.3, h=50, $fn=6);
            translate([i*(6.4/2+0.5+6/2), 81.5-7.6, 14.25]) rotate([-90, 0, 0]) cylinder(d=3.23, h=50, $fn=32);
            translate([i*(6.4/2+0.5+6/2), 81.5-7.6, 14.25]) rotate([-90, 30, 0]) cylinder(d=6.3, h=2.6, $fn=6);
            translate([i*(6.4/2+0.5+6/2), 81.5-7.6+2.6/2, 14.25+20+1.5
            ]) cube([5.46, 2.6, 40], center=true);
        }
        for (i=[0, 60]) {
            for (j=[0, 1]) {
                translate([-30, 6.5 + j * 16 + i, -1]) cylinder(d=6.25, h=50, $fn=32);
                translate([-30, 6.5 + j * 16 + i, 4]) cylinder(d=10.7, h=50, $fn=32);
            }
        }
        for (i=[0, 30, 60]) {
            hull() {
                for (k=[0, 1]) {
                    translate([28.5+k*3, 6.5 + 8 + i, -1]) cylinder(d=6, h=50, $fn=32);
                }
            }
            for (j=[0, 1]) {
                hull() {
                    for (k=[0, 1]) {
                        translate([28.5+k*3, 6.5 + j * 16 + i, -1]) cylinder(d=6.25, h=50, $fn=32);
                    }
                }
                hull() {
                    for (k=[0, 1]) {
                        translate([28.5+k*3, 6.5 + j * 16 + i, 4]) cylinder(d=10.7, h=50, $fn=32);
                    }
                }
            }
        }
    }
}

module belt_clamp(use_stamp=false) {
    difference() {
        hull() {
            for (i=[-1, 1]) {
                translate([i*(6.4/2+0.5+6/2), 0, 0]) cylinder(d=8, h=7.5, $fn=32);
                for (j=[-1, 1]) {
                    translate([i*6.4/2, j*4.25, 0]) cylinder(d=4, h=7.5, $fn=16);
                }
            }
        }
        if (use_stamp) {
            translate([0, 9.3, 8]) rotate([0, 180, 90]) belt_stamp(6.4);
        } else {
            translate([0, 3.25, 4.5]) difference() {
                translate([-6.4/2, 0, 0]) cube([6.4, 6, 6]);
                translate([-6.4/2, 0, 0]) rotate([0, 90, 0]) cylinder(d=6, h=6.4, $fn=32);
            }
        }
        for (i=[-1, 1]) {
            translate([i*(6.4/2+0.5+6/2), 0, -1]) cylinder(d=3.23, h=10, $fn=32);
            translate([i*(6.4/2+0.5+6/2), 0, -1]) cylinder(d=6, h=4, $fn=32);
        }
    }
}

module belt_clamp_stamp() {
    hull() {
            for (i=[-1, 1]) {
                translate([i*(6.4/2+0.5+6/2), 0, 0]) cylinder(d=8.6, h=7.5, $fn=32);
                for (j=[-1, 1]) {
                    translate([i*6.4/2, j*4.25, 0]) cylinder(d=4.6, h=7.5, $fn=16);
                }
            }
        }
}

module bearing() {
    difference() {
        translate([-26, -29/2, 0]) cube([26, 29, 16]);
        translate([9.5-26, -0.5-29/2, 7]) rotate([-90, 0, 0]) cylinder(d=10.2, h=31, $fn=64);
        for (i=[0, 1]) {
            translate([- 6.5, (29-16)/2 + 16 * i - 29/2, -1]) cylinder(d=6, h=18, $fn=32);
        }
        translate([-36, -31/2, -15]) cube([20, 31, 20]);
    }
}

module rail() {
    translate([-20, 0, -18]) cube([40, 200, 5.5]);
    for (i=[-1, 1]) {
        translate([i*20, 0, -9]) rotate([-90, 0, 0]) cylinder(d=10, h=200, $fn=64);
    }
}

color("SlateGray") rail();
for(i=[-1, 1]) {
    for(j=[0, 1]) {
        color("DimGray") translate([i * (-16.5-20), 29/2 + j * 60, -16]) rotate([0, 0, (i+1)*90]) bearing();
    }
}
color("DimGray") translate([16.5+20, 29/2+ 30, -16]) bearing();
color("red") translate([0, 100, -5]) cube([6, 200, 0.63], center=true);
color("red") translate([0, 100, 7.43]) cube([6, 200, 0.63], center=true);
slider();
color("green") translate([0, 17, 0]) belt_clamp(true);
color("green") translate([0, 82+7, 14.25]) rotate([90, 180, 0]) belt_clamp(false);
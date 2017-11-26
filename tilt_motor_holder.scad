module tilt_motor_holder(with_motor=true) {
    profilbreite = 19.82;
    nutbreite = 5;
    nuttiefe = 6;
    schraubendurchmesser = 5;
    schraubenkopfdurchmesser = 8.5;
    schraubenkopfhoehe = 5;
    difference() {
        union() {
            translate([0, 0, 160]) rotate([90, 0, 0]) cylinder(d=11, h=12, $fn=32);
            for(j=[-1, 1]) translate([j*100, -10-55/2, 10]) rotate([90, 0, 0]) for(i=[0, 90, 180, 270]) rotate([0, 0, i]) translate([profilbreite/2-nuttiefe, -nutbreite/2, 0]) cube([nuttiefe, nutbreite, 4]);
            translate([-100-profilbreite/2, -10, 0]) cube([200+profilbreite, 10, profilbreite]);
            for(j=[-1, 1]) hull() {
                translate([j*100, 0, profilbreite]) rotate([90, 0, 0]) cylinder(d=profilbreite, h=10, $fn=32);
                translate([0, 0, 160]) rotate([90, 0, 0]) cylinder(d=profilbreite, h=10, $fn=32);
            }
            if(with_motor) {
                for(i=[-1, 1]) for(j=[-1, 1]) {
                    hull() for(k=[-1, 1]) rotate([90, 0, 0]) translate([i*15.5, 100+7*k+j*15.5, -0]) cylinder(d=10, h=10, $fn=32);
                }
                translate([-50, -10, 75]) cube([100, 10, 19]);
                translate([-30, -10, 75+31]) cube([60, 10, 19]);
            }
            for(i=[-1, 1]) translate([i*100, -55/4-10, 10]) cube([profilbreite, 55/2, profilbreite], center=true);
        }
        translate([0, -4.8, 160]) rotate([90, 0, 0]) cylinder(d=8.2, h=14, $fn=32);
        translate([0, 1, 160]) rotate([90, 30, 0]) cylinder(d=14.9, h=5.7, $fn=6);
        for(i=[-1, 1]) {
            rotate([90, 0, 0]) translate([i*100, 10, -0.1]) {
                translate([0, 0, schraubenkopfhoehe+0.75]) cylinder(d=schraubendurchmesser, h=50, $fn=32);
                cylinder(d=schraubenkopfdurchmesser, h=schraubenkopfhoehe+0.6, $fn=32);
            }
        }
        if(with_motor) {
            for(i=[-1, 1]) for(j=[-1, 1]) {
                hull() for(k=[-1, 1]) rotate([90, 0, 0]) translate([i*15.5, 100+7*k+j*15.5, -1]) cylinder(d=3.3, h=5, $fn=32);
                hull() for(k=[-1, 1]) rotate([90, 0, 0]) translate([i*15.5, 100+7*k+j*15.5, 3]) cylinder(d=7.8, h=50, $fn=32);
            }
            translate([0, 1, 100]) rotate([90, 0, 0]) cylinder(d=25.5, h=17, $fn=64);
        }
    }
}

rotate([-90, 0, 0]) tilt_motor_holder(true);
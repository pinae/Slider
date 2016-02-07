b = 67.7;
l = 67.7;
h = 6.3;
t = 7.8;
x = 41.4 + 0.2;
y = 41.4 + 0.2;
dx = 13.15;
dy = 13.15;
vs = (x-34.6)/2;
vv = (y-34.5)/2;
dicke = 5;
profilabstand = 60;
profilbreite = 19.82;
spannerD = 25;
spannerOffset = 5;
M3SchraubenkopfH = 3;
M3SchraubenkopfD = 5.5;
M3Schraube = 3;
M3MutterH = 2.4;
M3MutterD = 6.2;
M5SchraubenkopfH = 5.5;
M5SchraubenkopfD = 8.5;
M5Schraube = 5;

module Platte() {
    color("SteelBlue") {
        polyhedron(points=[
            [x/2, y/2, 0],
            [x/2, -y/2, 0],
            [-x/2, y/2, 0],
            [-x/2, -y/2, 0],
            [x/2-vs, y/2, t],
            [x/2-vs, -y/2, t],
            [-x/2+vs, y/2, t],
            [-x/2+vs, -y/2, t]
            ], faces=[
            [0, 2, 3, 1],
            [0, 1, 5, 4],
            [2, 6, 7, 3],
            [1, 3, 7, 5],
            [2, 0, 4, 6],
            [4, 5, 7, 6]
            ]);
    }
}

module Rahmen() {
    difference() {
        translate([-max(b, profilabstand+2*profilbreite)/2, -l/2, 0]) {
            cube([max(b, profilabstand+2*profilbreite), l, t+dicke]);
        }
        translate([0, 0, dicke]) {
            Platte();
        }
        difference() {
            translate([-max(b, profilabstand+2*profilbreite)/2-0.1, -y/2, dicke]) {
                cube([67, y, t+0.1]);
            }
            translate([-3*spannerD/2-spannerOffset-3, -spannerD/2-4, dicke]) {
                cylinder(h=t/2-0.1, d=M3SchraubenkopfD, $fn=16);
            }
        }
        for(i=[profilabstand/2+profilbreite/2, -profilabstand/2-profilbreite/2]) {
            for(j=[-1,1]) {
                translate([i, j*26, 0]) {
                    cylinder(h=t+dicke+0.1, d=M5Schraube, $fn=16);
                    translate([0, 0, t+dicke-M5SchraubenkopfH]) {
                        cylinder(h=M5SchraubenkopfH+0.1, d=M5SchraubenkopfD, $fn=16);
                    }
                }
            }
        }
        translate([-3*spannerD/2-spannerOffset, 0, 0]) {
            cylinder(h=t+dicke+0.1, d=M3Schraube, $fn=16);
            cylinder(h=M3MutterH, d=M3MutterD, $fn=6);
            translate([-3, -spannerD/2-4, 0]) {
                cylinder(h=t+dicke+0.1, d=M3Schraube, $fn=16);
                rotate([0, 0, 30]) cylinder(h=M3MutterH, d=M3MutterD, $fn=6);
            }
        }
        translate([-3*spannerD/2-spannerOffset-9, -spannerD/2-8, dicke]) {
            rotate([0, 0, 45]) {
                cube([10, 10, 10]);
            }
        }
    }
}

module Spanner() {
    difference() {
        union() {
            difference() {
                translate([spannerOffset, 0, 0]) {
                    cylinder(h=t-0.1, d1=spannerD, d2=spannerD+2*vs, $fn=64);
                }
                translate([spannerD/2, -spannerD/2, 0]) {
                    cylinder(h=t, d=spannerD, $fn=32);
                }
                translate([0, -spannerD/2, 0]) {
                    cylinder(h=t, d=spannerD, $fn=32);
                }
            }
            cylinder(h=t/2-0.05, d1=spannerD, d2=spannerD-2, $fn=32);
            translate([0, 0, t/2-0.05]) {
                cylinder(h=t/2-0.05, d1=spannerD-2, d2=spannerD, $fn=32);
            }
            rotate([0, 0, 45]) {
                translate([-25, -4.5, 0]) {
                    cube([25, 8, t/2-1.5]);
                    translate([0, 4, 0]) {
                        cylinder(h=t, d=8, $fn=32);
                    }
                }
            }
        }
        translate([0, 0, t-0.1-M3SchraubenkopfH]) {
            cylinder(h=M3SchraubenkopfH+0.1, d=M3SchraubenkopfD, $fn=16);
        }
        cylinder(h=t, d=M3Schraube, $fn=16);
        translate([5, spannerD/2-2, 0]) {
            translate([0, 0, t-0.1-M3SchraubenkopfH]) {
                cylinder(h=M3SchraubenkopfH+0.1, d=M3SchraubenkopfD, $fn=16);
            }
            translate([0, 0, t/2-0.1]) {
                cylinder(h=t/2+0.2, d=4, $fn=16);
            }
            cylinder(h=t, d=M3Schraube-0.2, $fn=16);
            translate([0, 0, t/2-0.05]) {
                rotate([90, 0, -90]) {
                    cylinder(h=15, d=3, $fn=16);
                }
            }   
        }
    }
}

Rahmen();
//translate([0, 0, dicke]) Platte();
translate([-3*spannerD/2-0.5, 0, dicke]) color("Red") Spanner();
//Spanner();
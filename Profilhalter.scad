profilabstand = 60;
dicke = 12;
profilbreite = 19.82;
nutbreite = 5;
nuttiefe = 6;
schraubendurchmesser = 5;
schraubenkopfdurchmesser = 8.5;
schraubenkopfhoehe = 5;
winkellochoffset = 48;

module halter() {
    difference() {
        union() {
            translate([-profilbreite/2+2, -profilbreite/2, 0]) {
                cube([2*profilbreite+profilabstand-4, profilbreite, dicke]);
            }
            for(i=[-profilbreite/2+2,3*profilbreite/2+profilabstand-2]) {
                for(j=[-profilbreite/2+2, profilbreite/2-2]) {
                    translate([i, j, 0]) {
                        cylinder(r=2, h=dicke, $fn=16);
                    }
                }
            }
            translate([-profilbreite/2, -profilbreite/2+2, 0]) {
                cube([2*profilbreite+profilabstand, profilbreite-4, dicke]);
            }
            for(j=[0, profilabstand+profilbreite]) {
                translate([j, 0, 0]) {
                    for(i=[0, 90, 180, 270]) {
                        rotate([0, 0, i]) {
                            translate([profilbreite/2-nuttiefe, -nutbreite/2, dicke]) {
                                cube([nuttiefe, nutbreite, 4]);
                            }
                        }
                    }
                }
            }
            translate([(profilabstand+profilbreite)/2, winkellochoffset, 0]) {
                cylinder(d=16, h=dicke, $fn=32);
            }
            translate([(profilabstand+profilbreite)/2, 2*winkellochoffset, 0]) {
                cylinder(d=16, h=dicke, $fn=32);
            }
            for(i=[-1, 1]) {
                translate([i*46.1+(profilabstand+profilbreite)/2, profilbreite/2-3.7, 0]) {
                    rotate([0, 0, i*45+90]) {
                        translate([0, -4.4, 0]) {
                            cube([62, 8.8, dicke]);
                        }
                    }
                }
            }
            for(i=[-1, 1]) {
                translate([i*45.7+(profilabstand+profilbreite)/2, profilbreite/2-3.25, 0]) {
                    rotate([0, 0, i*25.2+90]) {
                        translate([0, -4.4, 0]) {
                            cube([102, 8.8, dicke]);
                        }
                    }
                }
                
            }
            translate([-4.4+(profilabstand+profilbreite)/2, winkellochoffset, 0]) {
                cube([8.8, 50, dicke]);
            }
        }
        for(i=[0, profilabstand+profilbreite]) {
            translate([i, 0, -0.1]) {
                cylinder(d=schraubendurchmesser, h=dicke+0.2, $fn=16);
                cylinder(d=schraubenkopfdurchmesser, h=schraubenkopfhoehe+0.6, $fn=16);
            }
        }
        for(i=[0, winkellochoffset, 2*winkellochoffset]) {
            translate([(profilabstand+profilbreite)/2, i, -0.1]) {
                cylinder(d=schraubendurchmesser, h=dicke+0.2, $fn=16);
                translate([0, 0, dicke-schraubenkopfhoehe-0.5]) {
                    cylinder(d=schraubenkopfdurchmesser, h=schraubenkopfhoehe+0.7, $fn=16);
                }
            }
        }
    }
}

translate([-(profilabstand+profilbreite)/2, profilbreite/2, 0]) halter();

/*for(i=[0, 180]) {
    rotate([0, 0, i]) {
        translate([-(profilabstand+profilbreite)/2, profilbreite/2+2, 0]) {
            halter();
        }
    }
}*/
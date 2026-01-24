// ==============================
// Word Clock Snap-Fit Frame
// ==============================

include <word_clock_stencil.scad>;

// ------------------------------
// Parameters
// ------------------------------
frame_thickness   = 3;      // Frame wall thickness
frame_depth       = 12;     // Total depth of frame
lip_depth         = 2;      // Diffuser retention depth
lip_width         = 2;      // Diffuser ledge width

snap_count_long   = 4;
snap_count_short  = 3;

snap_width        = 8;
snap_height       = 6;
snap_thickness    = 1.4;
snap_offset       = 3;      // Distance from edge
snap_angle        = 15;     // Snap lead-in angle

clearance         = 0.25;   // Print tolerance

// ------------------------------
// Derived
// ------------------------------
inner_w = width;
inner_h = height;

outer_w = inner_w + frame_thickness * 2;
outer_h = inner_h + frame_thickness * 2;

// ==============================
// Frame body
// ==============================
difference() {
    // Outer frame
    cube([outer_w, outer_h, frame_depth]);

    // Inner cutout
    translate([
        frame_thickness,
        frame_thickness,
        0
    ])
    cube([
        inner_w,
        inner_h,
        frame_depth
    ]);

    // Diffuser recess
    translate([
        frame_thickness - lip_width,
        frame_thickness - lip_width,
        frame_depth - lip_depth
    ])
    cube([
        inner_w + lip_width * 2,
        inner_h + lip_width * 2,
        lip_depth + 0.01
    ]);
}

// ==============================
// Snap tabs
// ==============================

// Long sides
for (i = [1 : snap_count_long]) {
    x = frame_thickness + i * inner_w / (snap_count_long + 1) - snap_width / 2;

    // Bottom
    snap_tab(x, -snap_thickness, 0);

    // Top
    mirror([0,1,0])
        translate([0, -outer_h, 0])
            snap_tab(x, -snap_thickness, 0);
}

// Short sides
for (i = [1 : snap_count_short]) {
    y = frame_thickness + i * inner_h / (snap_count_short + 1) - snap_width / 2;

    // Left
    rotate([0,0,90])
        snap_tab(y, -snap_thickness, 0);

    // Right
    mirror([1,0,0])
        rotate([0,0,90])
            translate([-outer_w, 0, 0])
                snap_tab(y, -snap_thickness, 0);
}

// ==============================
// Snap tab module
// ==============================
module snap_tab(x, y, z) {
    translate([x, y, frame_depth - snap_height - snap_offset])
    difference() {
        cube([snap_width, snap_thickness, snap_height]);

        // Angled lead-in
        translate([-1, -1, snap_height - 2])
        rotate([snap_angle,0,0])
        cube([snap_width + 2, snap_thickness + 2, 5]);
    }
}

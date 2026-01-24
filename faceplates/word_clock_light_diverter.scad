// Word Clock Light Diverter
// Uses existing stencil letters for perfect alignment

include <word_clock_stencil.scad>;

// ==============================
// Parameters
// ==============================
wall_thickness = 1.2;     // Thickness of dividers (mm)
wall_height    = 15;      // Height of light walls (mm)
back_thickness = 2;       // Back plate thickness (mm)
clearance      = 0.15;    // Print tolerance

// ==============================
// Derived values (from stencil)
// ==============================
inner_width  = width;
inner_height = height;

// ==============================
// Main assembly
// ==============================
difference() {
    // Outer solid
    cube([
        inner_width,
        inner_height,
        wall_height + back_thickness
    ]);

    // Hollow interior
    translate([
        wall_thickness,
        wall_thickness,
        back_thickness
    ])
    cube([
        inner_width  - 2 * wall_thickness,
        inner_height - 2 * wall_thickness,
        wall_height + 1
    ]);

    // Remove letter openings (reuse stencil exactly)
    translate([0, 0, -1])
        linear_extrude(height = back_thickness + 2)
            projection(cut = true)
                import("word_clock_stencil.scad");
}

// ==============================
// Vertical grid walls (columns)
// ==============================
for (c = [1 : cols - 1]) {
    translate([
        c * cell_w - wall_thickness / 2,
        0,
        back_thickness
    ])
    cube([
        wall_thickness,
        inner_height,
        wall_height
    ]);
}

// ==============================
// Horizontal grid walls (rows)
// ==============================
for (r = [1 : rows - 1]) {
    translate([
        0,
        r * cell_h - wall_thickness / 2,
        back_thickness
    ])
    cube([
        inner_width,
        wall_thickness,
        wall_height
    ]);
}

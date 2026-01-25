// Word Clock LED Back Panel
// Dimensions based on word_clock_stencil.scad

// --- Dimensions from Stencil Source ---
width = 175;           // [cite: 1]
height = 130;          // [cite: 2]
border_lr = 50;        // 
border_tb = 20;        // 
cols = 11;             // 
rows = 10;             // 

// --- Back Panel Settings ---
panel_thickness = 3.0; // Thickness of the plate
tolerance = 0.6;       // Slightly smaller than frame interior for fit
wire_hole_r = 1.5;     // Radius for LED wire pilot holes
power_exit_r = 4.0;    // Large hole for USB/Power cable

// --- Calculated Values ---
outer_w = width + (border_lr * 2) - (tolerance * 2); [cite: 4]
outer_h = height + (border_tb * 2) - (tolerance * 2); [cite: 4]
cell_w = width / cols; [cite: 5]
cell_h = height / rows; [cite: 5]

difference() {
    // 1. The Main Plate
    cube([outer_w, outer_h, panel_thickness]);

    // 2. LED Wire Pilot Holes (Aligned to letter centers)
    // These holes allow you to pass LED wires to the back or 
    // simply act as visual markers for gluing LED strips.
    translate([border_lr - tolerance, border_tb - tolerance, 0]) {
        for (r = [0 : rows - 1]) {
            for (c = [0 : cols - 1]) {
                translate([
                    c * cell_w + cell_w / 2, 
                    height - (r * cell_h + cell_h / 2), 
                    -1
                ])
                cylinder(h = panel_thickness + 2, r = wire_hole_r, $fn=20);
            }
        }
    }

    // 3. Power Cable Exit Hole
    // Placed in the bottom-right border area
    translate([outer_w - 20, 20, -1])
        cylinder(h = panel_thickness + 2, r = power_exit_r, $fn=30);
}
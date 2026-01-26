// Word Clock LED Back Panel - Simplified Version
// Matches width=175, height=130, borders 50/20

// --- Dimensions from Stencil Source ---
width = 175;           // 
height = 130;          // [cite: 2]
border_lr = 25;        // [cite: 3]
border_tb = 8.2;        // [cite: 3]

// --- Panel Settings ---
panel_thickness = 2;   // Set to 2mm as requested
tolerance = 0.5;       // Space for fit within the snap frame
power_exit_r = 4.5;    // Hole for the power/USB cable

// --- Calculated Outer Dimensions ---
// Formula based on inner size + borders [cite: 4]
outer_w = width + (border_lr * 2) - (tolerance * 2);
outer_h = height + (border_tb * 2) - (tolerance * 2);

difference() {
    // 1. The Main Solid Plate
    cube([outer_w, outer_h, panel_thickness]);

    // 2. Power Cable Exit (Bottom Right Corner)
    // Positioned in the border area to avoid the baffle grid
    translate([outer_w - 20, 20, -1])
        cylinder(h = panel_thickness + 2, r = power_exit_r, $fn=30);
}
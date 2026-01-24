
// Word Clock Stencil
// Dimensions: 5 x 7.25 inches, 11 x 10 grid
// Units: millimeters

inch = 25.4;
//width = 5 * inch;
//height = 7.25 * inch;
width = 18.15;
height = 13;
thickness = 2;

cols = 11;
rows = 10;

cell_w = width / cols;
cell_h = height / rows;

letters = [
["I", "T", "M", "I", "S", "E", "N", "A", "M", "P", "M"],
["A", "D", "Q", "U", "A", "R", "T", "E", "R", "E", "L"],
["T", "W", "E", "N", "T", "Y", "F", "I", "V", "E", "S"],
["H", "A", "L", "F", "O", "T", "E", "N", "H", "T", "O"],
["P", "A", "S", "T", "N", "R", "U", "N", "I", "N", "E"],
["O", "N", "E", "S", "I", "X", "T", "H", "R", "E", "E"],
["F", "O", "U", "R", "F", "I", "V", "E", "T", "W", "O"],
["E", "I", "G", "H", "T", "E", "L", "E", "V", "E", "N"],
["S", "E", "V", "E", "N", "T", "W", "E", "L", "V", "E"],
["T", "E", "N", "S", "E", "O", "C", "L", "O", "C", "K"]
];

difference() {
    // Base plate
    cube([width, height, thickness]);
  
    // Letter cutouts
    for (r = [0:rows-1]) {
        for (c = [0:cols-1]) {
            translate([
                c * cell_w + cell_w/2,
                height - (r * cell_h + cell_h/2),
                -1
            ])
            linear_extrude(height = thickness + 2)
                text(
                    letters[r][c],
                    size = min(cell_w, cell_h) * 0.6,
                    halign = "center",
                    valign = "center",
//                    font = "Liberation Sans:style=Bold"
                    font = "Stencil:style=Regular"
                );
        }
    }
}

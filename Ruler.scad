DEFAULT_WIDTH = 10;
DEFAULT_SLOT_DEPTH = 0.1;
DEFAULT_THICKNESS = 1;

module Ruler2D(length, width = DEFAULT_WIDTH, slotWidth = DEFAULT_SLOT_DEPTH)
{
    slotdepthSmall  = width * 0.2;
    slotdepthMedium = width * 0.4;
    slotdepthLarge  = width * 0.6;

    difference()
    {
        square([length, width]);

        color("red")
        for (i = [1 : length - 1])
        {
            translate([i - slotWidth / 2, 0])
            if (i % 10 == 0)
            {
                square([slotWidth, slotdepthLarge]);
            }
            else if (i % 5 == 0)
            {
                square([slotWidth, slotdepthMedium]);
            }
            else
            {
                square([slotWidth, slotdepthSmall]);
            }
        }
    }
}

module Ruler2DX(length, width = DEFAULT_WIDTH, slotWidth = DEFAULT_SLOT_DEPTH)
{
    Ruler2D(length, width, slotWidth);
}

module Ruler2DY(length, width = DEFAULT_WIDTH, slotWidth = DEFAULT_SLOT_DEPTH)
{
    rotate([180, 0, 90])
    Ruler2D(length, width, slotWidth);
}

module Ruler3D(length, width = DEFAULT_WIDTH, slotWidth = DEFAULT_SLOT_DEPTH, thickness = DEFAULT_THICKNESS)
{
    linear_extrude(thickness)
    Ruler2D(length, width);
}

module Ruler3DX(length, width = DEFAULT_WIDTH, slotWidth = DEFAULT_SLOT_DEPTH, thickness = DEFAULT_THICKNESS)
{
    Ruler3D(length, width, slotWidth, thickness);
}

module Ruler3DY(length, width = DEFAULT_WIDTH, slotWidth = DEFAULT_SLOT_DEPTH, thickness = DEFAULT_THICKNESS)
{
    rotate([180, 0, 90])
    translate([0, 0, -thickness])
    Ruler3D(length, width, slotWidth, thickness);
}

module Ruler3DZ(length, width = DEFAULT_WIDTH, slotWidth = DEFAULT_SLOT_DEPTH, thickness = DEFAULT_THICKNESS)
{
    rotate([0, 270, 0])
    Ruler3D(length, width, slotWidth, thickness);
}

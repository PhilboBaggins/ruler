MAIN_SRC_FILE := Ruler.scad

ALL_EXPORTS := \
	exports/ruler-2d-x-300.dxf \
	exports/ruler-2d-x-300.svg \
	exports/ruler-2d-x-300.png \
	exports/ruler-2d-y-300.dxf \
	exports/ruler-2d-y-300.svg \
	exports/ruler-2d-y-300.png \
	exports/ruler-3d-x-300.stl \
	exports/ruler-3d-x-300.png \
	exports/ruler-3d-y-300.stl \
	exports/ruler-3d-y-300.png \
	exports/ruler-3d-z-300.stl \
	exports/ruler-3d-z-300.png \

.PHONY: all clean

all: ${ALL_EXPORTS}

exports/ruler-2d-x-300.dxf exports/ruler-2d-x-300.svg: exports/ruler-2d-x-300.scad ${MAIN_SRC_FILE}
	openscad -o $@ $<

exports/ruler-2d-y-300.dxf exports/ruler-2d-y-300.svg: exports/ruler-2d-y-300.scad ${MAIN_SRC_FILE}
	openscad -o $@ $<

exports/ruler-2d-x-300.png exports/ruler-2d-y-300.png: exports/ruler-2d-x-300.svg exports/ruler-2d-y-300.svg
	convert $< $@

exports/ruler-3d-x-300.stl exports/ruler-3d-x-300.png: exports/ruler-3d-x-300.scad ${MAIN_SRC_FILE}
	openscad -o $@ $<

exports/ruler-3d-y-300.stl exports/ruler-3d-y-300.png: exports/ruler-3d-y-300.scad ${MAIN_SRC_FILE}
	openscad -o $@ $<

exports/ruler-3d-z-300.stl exports/ruler-3d-z-300.png: exports/ruler-3d-z-300.scad ${MAIN_SRC_FILE}
	openscad -o $@ $<

clean:
	rm -f ${ALL_EXPORTS}

; image2pattern
;

    .module patternTable
    .area   _CODE

_patternTable::

    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0xaa, 0x55, 0xaa, 0x55, 0xaa, 0x55, 0xaa, 0x55
    .db     0xaa, 0x55, 0xaa, 0x55, 0xaa, 0x55, 0xaa, 0x55
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0xaa, 0x55, 0xaa, 0x55, 0xaa, 0x55, 0xaa, 0x55
    .db     0xaa, 0x55, 0xaa, 0x55, 0xaa, 0x55, 0xaa, 0x55
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x03, 0x0c, 0x10, 0x20, 0x23, 0x4c, 0x50
    .db     0x00, 0xe0, 0x18, 0x04, 0x02, 0xe2, 0x19, 0x05
    .db     0x00, 0x00, 0x03, 0x0c, 0x10, 0x20, 0x40, 0x40
    .db     0x00, 0x00, 0xe0, 0x18, 0x04, 0x02, 0x01, 0x01
    .db     0x00, 0x00, 0x00, 0x07, 0x18, 0x20, 0x20, 0x40
    .db     0x00, 0x00, 0x00, 0xf0, 0x0c, 0x02, 0x02, 0x01
    .db     0x00, 0x00, 0x00, 0x00, 0x07, 0x18, 0x20, 0x40
    .db     0x00, 0x00, 0x00, 0x00, 0xf0, 0x0c, 0x02, 0x01
    .db     0x00, 0x03, 0x0f, 0x1f, 0x3f, 0x3f, 0x7f, 0x7f
    .db     0x00, 0xe0, 0xf8, 0xfc, 0xfe, 0xfe, 0xff, 0xff
    .db     0x00, 0x00, 0x03, 0x0f, 0x1f, 0x3f, 0x7f, 0x7f
    .db     0x00, 0x00, 0xe0, 0xf8, 0xfc, 0xfe, 0xff, 0xff
    .db     0x00, 0x00, 0x00, 0x07, 0x1f, 0x3f, 0x3f, 0x7f
    .db     0x00, 0x00, 0x00, 0xf0, 0xfc, 0xfe, 0xfe, 0xff
    .db     0x00, 0x00, 0x00, 0x00, 0x07, 0x1f, 0x3f, 0x7f
    .db     0x00, 0x00, 0x00, 0x00, 0xf0, 0xfc, 0xfe, 0xff
    .db     0x60, 0x60, 0x40, 0x40, 0x20, 0x10, 0x0c, 0x03
    .db     0x03, 0x03, 0x01, 0x01, 0x02, 0x04, 0x18, 0xe0
    .db     0x43, 0x4c, 0x50, 0x20, 0x10, 0x0c, 0x03, 0x00
    .db     0xe1, 0x19, 0x05, 0x02, 0x04, 0x18, 0xe0, 0x00
    .db     0x40, 0x47, 0x38, 0x20, 0x18, 0x07, 0x00, 0x00
    .db     0x01, 0xf1, 0x0e, 0x02, 0x0c, 0xf0, 0x00, 0x00
    .db     0x40, 0x40, 0x20, 0x18, 0x07, 0x00, 0x00, 0x00
    .db     0x01, 0x01, 0x02, 0x0c, 0xf0, 0x00, 0x00, 0x00
    .db     0x7f, 0x7f, 0x7f, 0x7f, 0x3f, 0x1f, 0x0f, 0x03
    .db     0xff, 0xff, 0xff, 0xff, 0xfe, 0xfc, 0xf8, 0xe0
    .db     0x7f, 0x7f, 0x7f, 0x3f, 0x1f, 0x0f, 0x03, 0x00
    .db     0xff, 0xff, 0xff, 0xfe, 0xfc, 0xf8, 0xe0, 0x00
    .db     0x7f, 0x7f, 0x3f, 0x3f, 0x1f, 0x07, 0x00, 0x00
    .db     0xff, 0xff, 0xfe, 0xfe, 0xfc, 0xf0, 0x00, 0x00
    .db     0x7f, 0x7f, 0x3f, 0x1f, 0x07, 0x00, 0x00, 0x00
    .db     0xff, 0xff, 0xfe, 0xfc, 0xf0, 0x00, 0x00, 0x00
    .db     0x00, 0x43, 0x2c, 0x10, 0x20, 0x20, 0x40, 0x40
    .db     0x00, 0xe1, 0x1a, 0x04, 0x02, 0x02, 0x01, 0x01
    .db     0x00, 0x43, 0x2c, 0x10, 0x20, 0x20, 0x40, 0x40
    .db     0x00, 0xe1, 0x1a, 0x04, 0x02, 0x02, 0x01, 0x01
    .db     0x00, 0x43, 0x2c, 0x10, 0x20, 0x20, 0x40, 0x40
    .db     0x00, 0xe1, 0x1a, 0x04, 0x02, 0x02, 0x01, 0x01
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x43, 0x2f, 0x1f, 0x3f, 0x3f, 0x7f, 0x7f
    .db     0x00, 0xe1, 0xfa, 0xfc, 0xfe, 0xfe, 0xff, 0xff
    .db     0x00, 0x43, 0x2f, 0x1f, 0x3f, 0x3f, 0x7f, 0x7f
    .db     0x00, 0xe1, 0xfa, 0xfc, 0xfe, 0xfe, 0xff, 0xff
    .db     0x00, 0x43, 0x2f, 0x1f, 0x3f, 0x3f, 0x7f, 0x7f
    .db     0x00, 0xe1, 0xfa, 0xfc, 0xfe, 0xfe, 0xff, 0xff
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x40, 0x40, 0x20, 0x20, 0x10, 0x10, 0x3b, 0x44
    .db     0x01, 0x01, 0x02, 0x02, 0x04, 0x04, 0x6e, 0x91
    .db     0x40, 0x40, 0x20, 0x20, 0x10, 0x10, 0x36, 0x49
    .db     0x01, 0x01, 0x02, 0x02, 0x04, 0x04, 0xde, 0x25
    .db     0x40, 0x40, 0x20, 0x20, 0x10, 0x10, 0x3d, 0x52
    .db     0x01, 0x01, 0x02, 0x02, 0x04, 0x04, 0xb6, 0x49
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x7f, 0x7f, 0x3f, 0x3f, 0x1f, 0x1f, 0x3f, 0x44
    .db     0xff, 0xff, 0xfe, 0xfe, 0xfc, 0xfc, 0xfe, 0x91
    .db     0x7f, 0x7f, 0x3f, 0x3f, 0x1f, 0x1f, 0x3f, 0x49
    .db     0xff, 0xff, 0xfe, 0xfe, 0xfc, 0xfc, 0xfe, 0x25
    .db     0x7f, 0x7f, 0x3f, 0x3f, 0x1f, 0x1f, 0x3f, 0x52
    .db     0xff, 0xff, 0xfe, 0xfe, 0xfc, 0xfc, 0xfe, 0x49
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x43, 0x2c, 0x10, 0x20, 0x20, 0x40, 0x40
    .db     0x00, 0xe1, 0x1a, 0x04, 0x02, 0x02, 0x01, 0x01
    .db     0x00, 0x43, 0x2c, 0x10, 0x20, 0x20, 0x40, 0x40
    .db     0x00, 0xe1, 0x1a, 0x04, 0x02, 0x02, 0x01, 0x01
    .db     0x00, 0x43, 0x2c, 0x10, 0x20, 0x20, 0x40, 0x40
    .db     0x00, 0xe1, 0x1a, 0x04, 0x02, 0x02, 0x01, 0x01
    .db     0x00, 0x43, 0x2c, 0x10, 0x20, 0x20, 0x3b, 0x44
    .db     0x00, 0xe1, 0x1a, 0x04, 0x02, 0x02, 0x6e, 0x91
    .db     0x00, 0x43, 0x2c, 0x10, 0x3b, 0x44, 0x00, 0x00
    .db     0x00, 0xe1, 0x1a, 0x04, 0x6e, 0x91, 0x00, 0x00
    .db     0x00, 0x43, 0x3b, 0x44, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0xe1, 0x6e, 0x91, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x40, 0x40, 0x20, 0x20, 0x3b, 0x44, 0x00, 0x00
    .db     0x01, 0x01, 0x02, 0x02, 0x6e, 0x91, 0x00, 0x00
    .db     0x40, 0x40, 0x3b, 0x44, 0x00, 0x00, 0x00, 0x00
    .db     0x01, 0x01, 0x6e, 0x91, 0x00, 0x00, 0x00, 0x00
    .db     0x3b, 0x44, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x6e, 0x91, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x43, 0x2f, 0x1f, 0x3f, 0x3f, 0x7f, 0x7f
    .db     0x00, 0xe1, 0xfa, 0xfc, 0xfe, 0xfe, 0xff, 0xff
    .db     0x00, 0x43, 0x2f, 0x1f, 0x3f, 0x3f, 0x7f, 0x7f
    .db     0x00, 0xe1, 0xfa, 0xfc, 0xfe, 0xfe, 0xff, 0xff
    .db     0x00, 0x43, 0x2f, 0x1f, 0x3f, 0x3f, 0x7f, 0x7f
    .db     0x00, 0xe1, 0xfa, 0xfc, 0xfe, 0xfe, 0xff, 0xff
    .db     0x00, 0x43, 0x2f, 0x1f, 0x3f, 0x3f, 0x3f, 0x44
    .db     0x00, 0xe1, 0xfa, 0xfc, 0xfe, 0xfe, 0xfe, 0x91
    .db     0x00, 0x43, 0x2f, 0x1f, 0x3f, 0x44, 0x00, 0x00
    .db     0x00, 0xe1, 0xfa, 0xfc, 0xfe, 0x91, 0x00, 0x00
    .db     0x00, 0x43, 0x3f, 0x44, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0xe1, 0xfe, 0x91, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x7f, 0x7f, 0x3f, 0x3f, 0x3f, 0x44, 0x00, 0x00
    .db     0xff, 0xff, 0xfe, 0xfe, 0xfe, 0x91, 0x00, 0x00
    .db     0x7f, 0x7f, 0x3f, 0x44, 0x00, 0x00, 0x00, 0x00
    .db     0xff, 0xff, 0xfe, 0x91, 0x00, 0x00, 0x00, 0x00
    .db     0x3f, 0x44, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0xfe, 0x91, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x0f, 0x08, 0x08, 0x0b
    .db     0x00, 0x00, 0x00, 0x00, 0xef, 0x01, 0x01, 0xe1
    .db     0x00, 0x00, 0x00, 0x00, 0xef, 0x08, 0x08, 0x0b
    .db     0x00, 0x00, 0x00, 0x00, 0xef, 0x20, 0x20, 0xaf
    .db     0x00, 0x00, 0x00, 0x00, 0xef, 0x21, 0x21, 0xe1
    .db     0x00, 0x00, 0x00, 0x00, 0xe0, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x0f, 0x01, 0x01, 0x01
    .db     0x00, 0x00, 0x00, 0x00, 0xe1, 0x01, 0x01, 0x01
    .db     0x00, 0x00, 0x00, 0x00, 0x0f, 0x08, 0x09, 0x09
    .db     0x00, 0x00, 0x00, 0x00, 0xef, 0x20, 0x28, 0x2b
    .db     0x00, 0x00, 0x00, 0x00, 0xe0, 0x00, 0x00, 0xe0
    .db     0x00, 0x00, 0x00, 0x00, 0x08, 0x08, 0x08, 0x08
    .db     0x00, 0x00, 0x00, 0x00, 0x2f, 0x20, 0x20, 0x2f
    .db     0x00, 0x00, 0x00, 0x00, 0xe0, 0x20, 0x20, 0xe0
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x0f, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x21, 0x21, 0xe1, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x08, 0x08, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x01, 0x21, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x09, 0x09, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x28, 0x28, 0x2f, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0xe0, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x08, 0x08, 0x0f, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x28, 0x28, 0xe8, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x10, 0x10, 0x10, 0x10, 0x00, 0x10, 0x10, 0x00
    .db     0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x44, 0xfe, 0x44, 0x44, 0x44, 0xfe, 0x44, 0x00
    .db     0xfe, 0x90, 0x90, 0x10, 0x12, 0x12, 0xfe, 0x00
    .db     0x82, 0x04, 0x08, 0x10, 0x20, 0x40, 0x82, 0x00
    .db     0xfe, 0x40, 0x20, 0x92, 0x88, 0x84, 0xf2, 0x00
    .db     0x10, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x38, 0x20, 0x20, 0x20, 0x20, 0x20, 0x38, 0x00
    .db     0x38, 0x08, 0x08, 0x08, 0x08, 0x08, 0x38, 0x00
    .db     0x92, 0x54, 0x38, 0x10, 0x38, 0x54, 0x92, 0x00
    .db     0x10, 0x10, 0x10, 0xfe, 0x10, 0x10, 0x10, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x10, 0x00
    .db     0x00, 0x00, 0x00, 0xfe, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00
    .db     0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x00
    .db     0xfe, 0x86, 0x8a, 0x92, 0xa2, 0xc2, 0xfe, 0x00
    .db     0x38, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x00
    .db     0xfe, 0x02, 0x02, 0xfe, 0x80, 0x80, 0xfe, 0x00
    .db     0xfe, 0x02, 0x02, 0xfe, 0x02, 0x02, 0xfe, 0x00
    .db     0x82, 0x82, 0x82, 0xfe, 0x02, 0x02, 0x02, 0x00
    .db     0xfe, 0x80, 0x80, 0xfe, 0x02, 0x02, 0xfe, 0x00
    .db     0xfe, 0x80, 0x80, 0xfe, 0x82, 0x82, 0xfe, 0x00
    .db     0xfe, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x00
    .db     0xfe, 0x82, 0x82, 0xfe, 0x82, 0x82, 0xfe, 0x00
    .db     0xfe, 0x82, 0x82, 0xfe, 0x02, 0x02, 0xfe, 0x00
    .db     0x00, 0x00, 0x10, 0x00, 0x10, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x10, 0x00, 0x10, 0x10, 0x00, 0x00
    .db     0x06, 0x18, 0x60, 0x80, 0x60, 0x18, 0x06, 0x00
    .db     0x00, 0x00, 0xfe, 0x00, 0xfe, 0x00, 0x00, 0x00
    .db     0xc0, 0x30, 0x0c, 0x02, 0x0c, 0x30, 0xc0, 0x00
    .db     0xfe, 0x82, 0x82, 0x1e, 0x00, 0x10, 0x10, 0x00
    .db     0xfe, 0x82, 0x82, 0x92, 0x80, 0x80, 0xfe, 0x00
    .db     0xfe, 0x82, 0x82, 0xba, 0x82, 0x82, 0x82, 0x00
    .db     0xfe, 0x02, 0x82, 0xbe, 0x82, 0x82, 0xbe, 0x00
    .db     0xfe, 0x80, 0x80, 0x80, 0x80, 0x80, 0xfe, 0x00
    .db     0xfe, 0x02, 0x82, 0x82, 0x82, 0x82, 0xbe, 0x00
    .db     0xfe, 0x00, 0x80, 0xbe, 0x80, 0x80, 0xfe, 0x00
    .db     0xfe, 0x00, 0x80, 0xbe, 0x80, 0x80, 0x80, 0x00
    .db     0xfe, 0x80, 0x80, 0x9e, 0x82, 0x82, 0xfa, 0x00
    .db     0x82, 0x82, 0x82, 0xfe, 0x82, 0x82, 0x82, 0x00
    .db     0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x00
    .db     0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0xfe, 0x00
    .db     0x82, 0x84, 0x88, 0x90, 0x88, 0x84, 0x82, 0x00
    .db     0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0xfe, 0x00
    .db     0xfe, 0x82, 0x92, 0x92, 0x92, 0x92, 0x92, 0x00
    .db     0xbe, 0x82, 0x82, 0x82, 0x82, 0x82, 0x82, 0x00
    .db     0xfe, 0x82, 0x82, 0x82, 0x82, 0x82, 0xfe, 0x00
    .db     0xfe, 0x02, 0x02, 0xfe, 0x80, 0x80, 0x80, 0x00
    .db     0xfe, 0x82, 0x82, 0x82, 0x82, 0x80, 0xfa, 0x00
    .db     0xfe, 0x02, 0x02, 0xfe, 0x80, 0x82, 0x82, 0x00
    .db     0xfe, 0x80, 0x80, 0xbe, 0x02, 0x02, 0xfe, 0x00
    .db     0xfe, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x00
    .db     0x82, 0x82, 0x82, 0x82, 0x82, 0x82, 0xfe, 0x00
    .db     0x82, 0x82, 0x44, 0x44, 0x28, 0x28, 0x10, 0x00
    .db     0x92, 0x92, 0x92, 0x92, 0x92, 0x82, 0xfe, 0x00
    .db     0x82, 0x44, 0x28, 0x10, 0x28, 0x44, 0x82, 0x00
    .db     0x82, 0x82, 0x82, 0xfa, 0x02, 0x02, 0xfe, 0x00
    .db     0xfe, 0x00, 0x08, 0x10, 0x20, 0x00, 0xfe, 0x00
    .db     0x38, 0x20, 0x20, 0x20, 0x20, 0x20, 0x38, 0x00
    .db     0x80, 0x40, 0x20, 0x10, 0x08, 0x04, 0x02, 0x00
    .db     0x38, 0x08, 0x08, 0x08, 0x08, 0x08, 0x38, 0x00
    .db     0x10, 0x28, 0x44, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0xfe, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00


; image2pattern
;

    .module lineTable
    .area   _CODE

_lineTable::

    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x08, 0x08, 0x08, 0x08, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x08, 0x08, 0x08, 0x08
    .db     0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08
    .db     0x00, 0x00, 0x00, 0x00, 0xf0, 0x00, 0x00, 0x00
    .db     0x08, 0x08, 0x08, 0x08, 0xf8, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0xf8, 0x08, 0x08, 0x08
    .db     0x08, 0x08, 0x08, 0x08, 0xf8, 0x08, 0x08, 0x08
    .db     0x00, 0x00, 0x00, 0x00, 0x0f, 0x00, 0x00, 0x00
    .db     0x08, 0x08, 0x08, 0x08, 0x0f, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x0f, 0x08, 0x08, 0x08
    .db     0x08, 0x08, 0x08, 0x08, 0x0f, 0x08, 0x08, 0x08
    .db     0x00, 0x00, 0x00, 0x00, 0xff, 0x00, 0x00, 0x00
    .db     0x08, 0x08, 0x08, 0x08, 0xff, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0xff, 0x08, 0x08, 0x08
    .db     0x08, 0x08, 0x08, 0x08, 0xff, 0x08, 0x08, 0x08
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x40
    .db     0x00, 0x00, 0x00, 0x00, 0x80, 0x40, 0x20, 0x10
    .db     0x00, 0x00, 0x80, 0x40, 0x20, 0x10, 0x08, 0x04
    .db     0x80, 0x40, 0x20, 0x10, 0x08, 0x04, 0x02, 0x01
    .db     0x20, 0x10, 0x08, 0x04, 0x02, 0x01, 0x00, 0x00
    .db     0x08, 0x04, 0x02, 0x01, 0x00, 0x00, 0x00, 0x00
    .db     0x02, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
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
    .db     0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80
    .db     0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x00
    .db     0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x00, 0x00
    .db     0x01, 0x02, 0x04, 0x08, 0x10, 0x00, 0x00, 0x00
    .db     0x01, 0x02, 0x04, 0x08, 0x00, 0x00, 0x00, 0x00
    .db     0x01, 0x02, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x01, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x80
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x40, 0x80
    .db     0x00, 0x00, 0x00, 0x00, 0x10, 0x20, 0x40, 0x80
    .db     0x00, 0x00, 0x00, 0x08, 0x10, 0x20, 0x40, 0x80
    .db     0x00, 0x00, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80
    .db     0x00, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80
    .db     0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80
    .db     0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80
    .db     0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80
    .db     0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80
    .db     0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80
    .db     0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80
    .db     0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80
    .db     0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x80, 0x40, 0x00, 0x00
    .db     0x00, 0x00, 0x80, 0x40, 0x20, 0x00, 0x00, 0x00
    .db     0x80, 0x40, 0x20, 0x10, 0x00, 0x00, 0x00, 0x00
    .db     0x20, 0x10, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x08, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80
    .db     0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0xc0, 0x00
    .db     0x01, 0x02, 0x04, 0x08, 0x90, 0x60, 0x00, 0x00
    .db     0x01, 0x02, 0x84, 0x48, 0x30, 0x00, 0x00, 0x00
    .db     0x81, 0x42, 0x24, 0x18, 0x00, 0x00, 0x00, 0x00
    .db     0x21, 0x12, 0x0c, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x09, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x80
    .db     0x00, 0x00, 0x00, 0x00, 0x80, 0x40, 0x40, 0x80
    .db     0x00, 0x00, 0x80, 0x40, 0x20, 0x20, 0x40, 0x80
    .db     0x80, 0x40, 0x20, 0x10, 0x10, 0x20, 0x40, 0x80
    .db     0x20, 0x10, 0x08, 0x08, 0x10, 0x20, 0x40, 0x80
    .db     0x08, 0x04, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80
    .db     0x02, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80
    .db     0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80
    .db     0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0xc0, 0x80
    .db     0x01, 0x02, 0x04, 0x08, 0x90, 0x60, 0x40, 0x80
    .db     0x01, 0x02, 0x84, 0x48, 0x30, 0x20, 0x40, 0x80
    .db     0x81, 0x42, 0x24, 0x18, 0x10, 0x20, 0x40, 0x80
    .db     0x21, 0x12, 0x0c, 0x08, 0x10, 0x20, 0x40, 0x80
    .db     0x09, 0x06, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80
    .db     0x03, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x10
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x08, 0x04
    .db     0x00, 0x00, 0x00, 0x00, 0x08, 0x04, 0x02, 0x01
    .db     0x00, 0x00, 0x00, 0x04, 0x02, 0x01, 0x00, 0x00
    .db     0x00, 0x00, 0x02, 0x01, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80
    .db     0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x40
    .db     0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x20, 0x10
    .db     0x01, 0x02, 0x04, 0x08, 0x10, 0x10, 0x08, 0x04
    .db     0x01, 0x02, 0x04, 0x08, 0x08, 0x04, 0x02, 0x01
    .db     0x01, 0x02, 0x04, 0x04, 0x02, 0x01, 0x00, 0x00
    .db     0x01, 0x02, 0x02, 0x01, 0x00, 0x00, 0x00, 0x00
    .db     0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xc0
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x60, 0x90
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x48, 0x84
    .db     0x00, 0x00, 0x00, 0x00, 0x18, 0x24, 0x42, 0x81
    .db     0x00, 0x00, 0x00, 0x0c, 0x12, 0x21, 0x40, 0x80
    .db     0x00, 0x00, 0x06, 0x09, 0x10, 0x20, 0x40, 0x80
    .db     0x00, 0x03, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80
    .db     0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80
    .db     0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0xc0
    .db     0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x60, 0x90
    .db     0x01, 0x02, 0x04, 0x08, 0x10, 0x30, 0x48, 0x84
    .db     0x01, 0x02, 0x04, 0x08, 0x18, 0x24, 0x42, 0x81
    .db     0x01, 0x02, 0x04, 0x0c, 0x12, 0x21, 0x40, 0x80
    .db     0x01, 0x02, 0x06, 0x09, 0x10, 0x20, 0x40, 0x80
    .db     0x01, 0x03, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x40
    .db     0x00, 0x00, 0x00, 0x00, 0x80, 0x40, 0x20, 0x10
    .db     0x00, 0x00, 0x80, 0x40, 0x20, 0x10, 0x08, 0x04
    .db     0x80, 0x40, 0x20, 0x10, 0x08, 0x04, 0x02, 0x01
    .db     0x20, 0x10, 0x08, 0x04, 0x02, 0x01, 0x00, 0x00
    .db     0x08, 0x04, 0x02, 0x01, 0x00, 0x00, 0x00, 0x00
    .db     0x02, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80
    .db     0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0xc0, 0x40
    .db     0x01, 0x02, 0x04, 0x08, 0x90, 0x60, 0x20, 0x10
    .db     0x01, 0x02, 0x84, 0x48, 0x30, 0x10, 0x08, 0x04
    .db     0x81, 0x42, 0x24, 0x18, 0x08, 0x04, 0x02, 0x01
    .db     0x21, 0x12, 0x0c, 0x04, 0x02, 0x01, 0x00, 0x00
    .db     0x09, 0x06, 0x02, 0x01, 0x00, 0x00, 0x00, 0x00
    .db     0x03, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0xc0
    .db     0x00, 0x00, 0x00, 0x00, 0x80, 0x40, 0x60, 0x90
    .db     0x00, 0x00, 0x80, 0x40, 0x20, 0x30, 0x48, 0x84
    .db     0x80, 0x40, 0x20, 0x10, 0x18, 0x24, 0x42, 0x81
    .db     0x20, 0x10, 0x08, 0x0c, 0x12, 0x21, 0x40, 0x80
    .db     0x08, 0x04, 0x06, 0x09, 0x10, 0x20, 0x40, 0x80
    .db     0x02, 0x03, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80
    .db     0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80
    .db     0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0xc0, 0xc0
    .db     0x01, 0x02, 0x04, 0x08, 0x90, 0x60, 0x60, 0x90
    .db     0x01, 0x02, 0x84, 0x48, 0x30, 0x30, 0x48, 0x84
    .db     0x81, 0x42, 0x24, 0x18, 0x18, 0x24, 0x42, 0x81
    .db     0x21, 0x12, 0x0c, 0x0c, 0x12, 0x21, 0x40, 0x80
    .db     0x09, 0x06, 0x06, 0x09, 0x10, 0x20, 0x40, 0x80
    .db     0x03, 0x03, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x08, 0x08, 0x08, 0x08, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x08, 0x08, 0x08, 0x08
    .db     0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08
    .db     0x00, 0x00, 0x00, 0x00, 0xf0, 0x00, 0x00, 0x00
    .db     0x08, 0x08, 0x08, 0x08, 0xf8, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0xf8, 0x08, 0x08, 0x08
    .db     0x08, 0x08, 0x08, 0x08, 0xf8, 0x08, 0x08, 0x08
    .db     0x00, 0x00, 0x00, 0x00, 0x0f, 0x00, 0x00, 0x00
    .db     0x08, 0x08, 0x08, 0x08, 0x0f, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x0f, 0x08, 0x08, 0x08
    .db     0x08, 0x08, 0x08, 0x08, 0x0f, 0x08, 0x08, 0x08
    .db     0x00, 0x00, 0x00, 0x00, 0xff, 0x00, 0x00, 0x00
    .db     0x08, 0x08, 0x08, 0x08, 0xff, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0xff, 0x08, 0x08, 0x08
    .db     0x08, 0x08, 0x08, 0x08, 0xff, 0x08, 0x08, 0x08
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x02
    .db     0x00, 0x00, 0x00, 0x00, 0x01, 0x02, 0x04, 0x08
    .db     0x00, 0x00, 0x01, 0x02, 0x04, 0x08, 0x10, 0x20
    .db     0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80
    .db     0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x00, 0x00
    .db     0x10, 0x20, 0x40, 0x80, 0x00, 0x00, 0x00, 0x00
    .db     0x40, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
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
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x01, 0x02, 0x00, 0x00
    .db     0x00, 0x00, 0x01, 0x02, 0x04, 0x00, 0x00, 0x00
    .db     0x01, 0x02, 0x04, 0x08, 0x00, 0x00, 0x00, 0x00
    .db     0x04, 0x08, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x10, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x08
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x10, 0x20
    .db     0x00, 0x00, 0x00, 0x00, 0x10, 0x20, 0x40, 0x80
    .db     0x00, 0x00, 0x00, 0x20, 0x40, 0x80, 0x00, 0x00
    .db     0x00, 0x00, 0x40, 0x80, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x02
    .db     0x00, 0x00, 0x00, 0x00, 0x01, 0x02, 0x04, 0x08
    .db     0x00, 0x00, 0x01, 0x02, 0x04, 0x08, 0x10, 0x20
    .db     0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80
    .db     0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x00, 0x00
    .db     0x10, 0x20, 0x40, 0x80, 0x00, 0x00, 0x00, 0x00
    .db     0x40, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x80, 0x40, 0x20, 0x10, 0x08, 0x04, 0x02, 0x01
    .db     0x80, 0x40, 0x20, 0x10, 0x08, 0x04, 0x02, 0x00
    .db     0x80, 0x40, 0x20, 0x10, 0x08, 0x04, 0x00, 0x00
    .db     0x80, 0x40, 0x20, 0x10, 0x08, 0x00, 0x00, 0x00
    .db     0x80, 0x40, 0x20, 0x10, 0x00, 0x00, 0x00, 0x00
    .db     0x80, 0x40, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x80, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x80, 0x40, 0x20, 0x10, 0x08, 0x04, 0x02, 0x01
    .db     0x80, 0x40, 0x20, 0x10, 0x08, 0x04, 0x03, 0x00
    .db     0x80, 0x40, 0x20, 0x10, 0x09, 0x06, 0x00, 0x00
    .db     0x80, 0x40, 0x21, 0x12, 0x0c, 0x00, 0x00, 0x00
    .db     0x81, 0x42, 0x24, 0x18, 0x00, 0x00, 0x00, 0x00
    .db     0x84, 0x48, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x90, 0x60, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x80, 0x40, 0x20, 0x10, 0x08, 0x04, 0x02, 0x01
    .db     0x80, 0x40, 0x20, 0x10, 0x08, 0x04, 0x02, 0x02
    .db     0x80, 0x40, 0x20, 0x10, 0x08, 0x04, 0x04, 0x08
    .db     0x80, 0x40, 0x20, 0x10, 0x08, 0x08, 0x10, 0x20
    .db     0x80, 0x40, 0x20, 0x10, 0x10, 0x20, 0x40, 0x80
    .db     0x80, 0x40, 0x20, 0x20, 0x40, 0x80, 0x00, 0x00
    .db     0x80, 0x40, 0x40, 0x80, 0x00, 0x00, 0x00, 0x00
    .db     0x80, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x80, 0x40, 0x20, 0x10, 0x08, 0x04, 0x02, 0x01
    .db     0x80, 0x40, 0x20, 0x10, 0x08, 0x04, 0x03, 0x02
    .db     0x80, 0x40, 0x20, 0x10, 0x09, 0x06, 0x04, 0x08
    .db     0x80, 0x40, 0x21, 0x12, 0x0c, 0x08, 0x10, 0x20
    .db     0x81, 0x42, 0x24, 0x18, 0x10, 0x20, 0x40, 0x80
    .db     0x84, 0x48, 0x30, 0x20, 0x40, 0x80, 0x00, 0x00
    .db     0x90, 0x60, 0x40, 0x80, 0x00, 0x00, 0x00, 0x00
    .db     0xc0, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x01
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x02, 0x01
    .db     0x00, 0x00, 0x00, 0x00, 0x08, 0x04, 0x02, 0x01
    .db     0x00, 0x00, 0x00, 0x10, 0x08, 0x04, 0x02, 0x01
    .db     0x00, 0x00, 0x20, 0x10, 0x08, 0x04, 0x02, 0x01
    .db     0x00, 0x40, 0x20, 0x10, 0x08, 0x04, 0x02, 0x01
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01
    .db     0x00, 0x00, 0x00, 0x00, 0x01, 0x02, 0x02, 0x01
    .db     0x00, 0x00, 0x01, 0x02, 0x04, 0x04, 0x02, 0x01
    .db     0x01, 0x02, 0x04, 0x08, 0x08, 0x04, 0x02, 0x01
    .db     0x04, 0x08, 0x10, 0x10, 0x08, 0x04, 0x02, 0x01
    .db     0x10, 0x20, 0x20, 0x10, 0x08, 0x04, 0x02, 0x01
    .db     0x40, 0x40, 0x20, 0x10, 0x08, 0x04, 0x02, 0x01
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x09
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x0c, 0x12, 0x21
    .db     0x00, 0x00, 0x00, 0x00, 0x18, 0x24, 0x42, 0x81
    .db     0x00, 0x00, 0x00, 0x30, 0x48, 0x84, 0x02, 0x01
    .db     0x00, 0x00, 0x60, 0x90, 0x08, 0x04, 0x02, 0x01
    .db     0x00, 0xc0, 0x20, 0x10, 0x08, 0x04, 0x02, 0x01
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .db     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x03
    .db     0x00, 0x00, 0x00, 0x00, 0x01, 0x02, 0x06, 0x09
    .db     0x00, 0x00, 0x01, 0x02, 0x04, 0x0c, 0x12, 0x21
    .db     0x01, 0x02, 0x04, 0x08, 0x18, 0x24, 0x42, 0x81
    .db     0x04, 0x08, 0x10, 0x30, 0x48, 0x84, 0x02, 0x01
    .db     0x10, 0x20, 0x60, 0x90, 0x08, 0x04, 0x02, 0x01
    .db     0x40, 0xc0, 0x20, 0x10, 0x08, 0x04, 0x02, 0x01
    .db     0x80, 0x40, 0x20, 0x10, 0x08, 0x04, 0x02, 0x01
    .db     0x80, 0x40, 0x20, 0x10, 0x08, 0x04, 0x02, 0x01
    .db     0x80, 0x40, 0x20, 0x10, 0x08, 0x04, 0x02, 0x01
    .db     0x80, 0x40, 0x20, 0x10, 0x08, 0x04, 0x02, 0x01
    .db     0x80, 0x40, 0x20, 0x10, 0x08, 0x04, 0x02, 0x01
    .db     0x80, 0x40, 0x20, 0x10, 0x08, 0x04, 0x02, 0x01
    .db     0x80, 0x40, 0x20, 0x10, 0x08, 0x04, 0x02, 0x01
    .db     0x80, 0x40, 0x20, 0x10, 0x08, 0x04, 0x02, 0x01
    .db     0x80, 0x40, 0x20, 0x10, 0x08, 0x04, 0x02, 0x01
    .db     0x80, 0x40, 0x20, 0x10, 0x08, 0x04, 0x03, 0x01
    .db     0x80, 0x40, 0x20, 0x10, 0x09, 0x06, 0x02, 0x01
    .db     0x80, 0x40, 0x21, 0x12, 0x0c, 0x04, 0x02, 0x01
    .db     0x81, 0x42, 0x24, 0x18, 0x08, 0x04, 0x02, 0x01
    .db     0x84, 0x48, 0x30, 0x10, 0x08, 0x04, 0x02, 0x01
    .db     0x90, 0x60, 0x20, 0x10, 0x08, 0x04, 0x02, 0x01
    .db     0xc0, 0x40, 0x20, 0x10, 0x08, 0x04, 0x02, 0x01
    .db     0x80, 0x40, 0x20, 0x10, 0x08, 0x04, 0x02, 0x01
    .db     0x80, 0x40, 0x20, 0x10, 0x08, 0x04, 0x02, 0x03
    .db     0x80, 0x40, 0x20, 0x10, 0x08, 0x04, 0x06, 0x09
    .db     0x80, 0x40, 0x20, 0x10, 0x08, 0x0c, 0x12, 0x21
    .db     0x80, 0x40, 0x20, 0x10, 0x18, 0x24, 0x42, 0x81
    .db     0x80, 0x40, 0x20, 0x30, 0x48, 0x84, 0x02, 0x01
    .db     0x80, 0x40, 0x60, 0x90, 0x08, 0x04, 0x02, 0x01
    .db     0x80, 0xc0, 0x20, 0x10, 0x08, 0x04, 0x02, 0x01
    .db     0x80, 0x40, 0x20, 0x10, 0x08, 0x04, 0x02, 0x01
    .db     0x80, 0x40, 0x20, 0x10, 0x08, 0x04, 0x03, 0x03
    .db     0x80, 0x40, 0x20, 0x10, 0x09, 0x06, 0x06, 0x09
    .db     0x80, 0x40, 0x21, 0x12, 0x0c, 0x0c, 0x12, 0x21
    .db     0x81, 0x42, 0x24, 0x18, 0x18, 0x24, 0x42, 0x81
    .db     0x84, 0x48, 0x30, 0x30, 0x48, 0x84, 0x02, 0x01
    .db     0x90, 0x60, 0x60, 0x90, 0x08, 0x04, 0x02, 0x01
    .db     0xc0, 0xc0, 0x20, 0x10, 0x08, 0x04, 0x02, 0x01


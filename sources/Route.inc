; Route.inc : 経路
;


; マクロの定義
;

; 経路
ROUTE_NULL                      =   0x00
ROUTE_SIZE_X                    =   0x10
ROUTE_SIZE_Y                    =   0x10
ROUTE_UP_BIT                    =   0x00
ROUTE_UP                        =   (1 << ROUTE_UP_BIT)
ROUTE_DOWN_BIT                  =   0x01
ROUTE_DOWN                      =   (1 << ROUTE_DOWN_BIT)
ROUTE_LEFT_BIT                  =   0x02
ROUTE_LEFT                      =   (1 << ROUTE_LEFT_BIT)
ROUTE_RIGHT_BIT                 =   0x03
ROUTE_RIGHT                     =   (1 << ROUTE_RIGHT_BIT)

; パターン
ROUTE_PATTERN_SIZE_X            =   0x40
ROUTE_PATTERN_SIZE_Y            =   0x40
ROUTE_PATTERN_VIEW_X            =   0x18
ROUTE_PATTERN_VIEW_Y            =   0x18

; 外部関数宣言
;

    .globl  _RouteInitialize
    .globl  _RouteUpdate
    .globl  _RouteRender
    .globl  _RouteTransfer
    .globl  _RouteSetPosition
    .globl  _RouteGetPath
    .globl  _RouteGetPathCount
    .globl  _RouteIsPath
    .globl  _RouteTurn
    .globl  _RouteMoveToPoint
    .globl  _RouteMoveFromPoint

; 外部変数宣言
;

    .globl  _route

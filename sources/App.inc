; App.inc : アプリケーション
;


; マクロの定義
;

; ビデオ
APP_COLOR_TABLE                 =   0x2000
APP_PATTERN_NAME_TABLE          =   0x2800
APP_PATTERN_GENERATOR_TABLE     =   0x0000
APP_SPRITE_ATTRIBUTE_TABLE      =   0x1b00
APP_SPRITE_GENERATOR_TABLE      =   0x3800

; アプリケーション
APP_STATE                       =   0x00
APP_FRAME                       =   0x01
APP_SCORE_10000000              =   0x02
APP_SCORE_01000000              =   0x03
APP_SCORE_00100000              =   0x04
APP_SCORE_00010000              =   0x05
APP_SCORE_00001000              =   0x06
APP_SCORE_00000100              =   0x07
APP_SCORE_00000010              =   0x08
APP_SCORE_00000001              =   0x09
APP_LENGTH                      =   0x0a

; 状態
APP_STATE_NULL                  =   0x00
APP_STATE_TITLE_INITIALIZE      =   0x01
APP_STATE_TITLE_UPDATE          =   0x02
APP_STATE_GAME_INITIALIZE       =   0x03
APP_STATE_GAME_UPDATE           =   0x04

; フレーム
APP_FRAME_NULL                  =   0x00

; スコア
APP_SCORE_NULL                  =   0x00
APP_SCORE_LENGTH                =   0x08

; 外部関数宣言
;

    .globl  _AppInitialize
    .globl  _AppUpdate
    .globl  _AppNull
    .globl  _AppGetScore
    .globl  _AppRecordScore

; 外部変数宣言
;

; 状態
    .globl  _app
    
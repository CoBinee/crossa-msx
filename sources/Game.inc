; Game.inc : ゲーム
;


; マクロの定義
;

; スプライト
GAME_SPRITE_NULL                =   0x00
GAME_SPRITE_PLAYER_0            =   0x10
GAME_SPRITE_PLAYER_1            =   0x44
GAME_SPRITE_ENEMY_0             =   0x14
GAME_SPRITE_ENEMY_1             =   0x48
GAME_SPRITE_ANNOUNCE            =   0x00

; ゲーム
GAME_PROC_L                     =   0x00
GAME_PROC_H                     =   0x01
GAME_STATE                      =   0x02
GAME_FLAG                       =   0x03
GAME_FRAME                      =   0x04
GAME_COUNT                      =   0x05
GAME_COLOR                      =   0x06
GAME_ANIMATION                  =   0x07
GAME_DELTA                      =   0x08
GAME_TIME_SECOND_10             =   0x09
GAME_TIME_SECOND_01             =   0x0a
GAME_TIME_FRAME                 =   0x0b
GAME_SCORE_10000000             =   0x0c
GAME_SCORE_01000000             =   0x0d
GAME_SCORE_00100000             =   0x0e
GAME_SCORE_00010000             =   0x0f
GAME_SCORE_00001000             =   0x10
GAME_SCORE_00000100             =   0x11
GAME_SCORE_00000010             =   0x12
GAME_SCORE_00000001             =   0x13
GAME_COMBO_10                   =   0x14
GAME_COMBO_01                   =   0x15
GAME_COMBO_MAXIMUM_10           =   0x16
GAME_COMBO_MAXIMUM_01           =   0x17
GAME_MONSTER_RED                =   0x18
GAME_MONSTER_GREEN              =   0x19
GAME_MONSTER_BLUE               =   0x1a
GAME_MONSTER_YELLOW             =   0x1b
GAME_LENGTH                     =   0x1c

; 処理
GAME_PROC_NULL                  =   0x00

; 状態
GAME_STATE_NULL                 =   0x00
GAME_STATE_IDLE                 =   0x10
GAME_STATE_START                =   0x20
GAME_STATE_PLAY                 =   0x30
GAME_STATE_OVER                 =   0x40
GAME_STATE_CLEAR                =   0x50

; フラグ
GAME_FLAG_NULL                  =   0x00

; フレーム
GAME_FRAME_NULL                 =   0x00

; カウント
GAME_COUNT_NULL                 =   0x00

; 色
GAME_COLOR_NULL                 =   0x00
GAME_COLOR_RED                  =   0x00
GAME_COLOR_GREEN                =   0x01
GAME_COLOR_BLUE                 =   0x02
GAME_COLOR_YELLOW               =   0x03

; アニメーション
GAME_ANIMATION_NULL             =   0x00

; 経過時間
GAME_DELTA_NULL                 =   0x00
GAME_DELTA_HIT                  =   0x0c

; タイム
GAME_TIME_NULL                  =   0x00

; スコア
GAME_SCORE_NULL                 =   0x00
GAME_SCORE_LENGTH               =   0x08

; コンボ
GAME_COMBO_NULL                 =   0x00
GAME_COMBO_LENGTH               =   0x02

; モンスター
GAME_MONSTER_NULL               =   0x00
GAME_MONSTER_LENGTH             =   0x04

; アナウンス
GAME_ANNOUNCE_START             =   0x00
GAME_ANNOUNCE_TIMEUP            =   0x01

; 外部関数宣言
;

    .globl  _GameInitialize
    .globl  _GameUpdate
    .globl  _GameGetColor
    .globl  _GameGetAnimationColor
    .globl  _GameIsDelta
    .globl  _GameAddScore
    .globl  _GameGetCombo
    
; 外部変数宣言
;

    .globl  _game

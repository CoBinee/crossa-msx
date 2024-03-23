; App.s : アプリケーション
;


; モジュール宣言
;
    .module App

; 参照ファイル
;
    .include    "bios.inc"
    .include    "vdp.inc"
    .include    "System.inc"
    .include	"App.inc"
    .include    "Title.inc"
    .include    "Game.inc"

; 外部変数宣言
;
    .globl  _patternTable
    .globl  _lineTable
    

; CODE 領域
;
    .area   _CODE

; アプリケーションを初期化する
;
_AppInitialize::
    
    ; レジスタの保存
    
    ; 画面表示の停止
    call    DISSCR
    
    ; ビデオの設定
    ld      hl, #videoScreen1
    ld      de, #_videoRegister
    ld      bc, #0x08
    ldir
    
    ; 割り込みの禁止
    di
    
    ; VDP ポートの取得
    ld      a, (_videoPort + 1)
    ld      c, a
    
    ; スプライトジェネレータの転送
    inc     c
    ld      a, #<APP_SPRITE_GENERATOR_TABLE
    out     (c), a
    ld      a, #(>APP_SPRITE_GENERATOR_TABLE | 0b01000000)
    out     (c), a
    dec     c
    ld      hl, #(_patternTable + 0x0000)
    ld      d, #0x08
10$:
    ld      e, #0x10
11$:
    push    de
    ld      b, #0x08
    otir
    ld      de, #0x78
    add     hl, de
    ld      b, #0x08
    otir
    ld      de, #0x80
    or      a
    sbc     hl, de
    pop     de
    dec     e
    jr      nz, 11$
    ld      a, #0x80
    add     a, l
    ld      l, a
    ld      a, h
    adc     a, #0x00
    ld      h, a
    dec     d
    jr      nz, 10$
    
    ; パターンジェネレータの転送
    ld      hl, #(_patternTable + 0x0800)
    ld      de, #(APP_PATTERN_GENERATOR_TABLE + 0x0000)
    ld      bc, #0x0200
    call    LDIRVM
    ld      hl, #(_patternTable + 0x0800)
    ld      de, #(APP_PATTERN_GENERATOR_TABLE + 0x0800)
    ld      bc, #0x0200
    call    LDIRVM
    ld      hl, #(_lineTable + 0x0000)
    ld      de, #(APP_PATTERN_GENERATOR_TABLE + 0x0300)
    ld      bc, #0x0500
    call    LDIRVM
    ld      hl, #(_lineTable + 0x0500)
    ld      de, #(APP_PATTERN_GENERATOR_TABLE + 0x0b00)
    ld      bc, #0x0500
    call    LDIRVM

    ; カラーテーブルの転送
    ld      hl, #(APP_COLOR_TABLE + 0x0000)
    ld      a, #((VDP_COLOR_WHITE << 4) | VDP_COLOR_BLACK)
    ld      bc, #(0x0040 * 0x0004 * 0x0004)
    call    FILVRM
    ld      hl, #(APP_COLOR_TABLE + 0x000c)
    ld      a, #((VDP_COLOR_DARK_RED << 4) | VDP_COLOR_BLACK)
    ld      bc, #0x0014
    call    FILVRM
    ld      hl, #(APP_COLOR_TABLE + 0x004c)
    ld      a, #((VDP_COLOR_MEDIUM_RED << 4) | VDP_COLOR_BLACK)
    ld      bc, #0x0014
    call    FILVRM
    ld      hl, #(APP_COLOR_TABLE + 0x008c)
    ld      a, #((VDP_COLOR_LIGHT_RED << 4) | VDP_COLOR_BLACK)
    ld      bc, #0x0014
    call    FILVRM
    ld      hl, #(APP_COLOR_TABLE + 0x00cc)
    ld      a, #((VDP_COLOR_MEDIUM_RED << 4) | VDP_COLOR_BLACK)
    ld      bc, #0x0014
    call    FILVRM
    ld      hl, #(APP_COLOR_TABLE + 0x010c)
    ld      a, #((VDP_COLOR_DARK_GREEN << 4) | VDP_COLOR_BLACK)
    ld      bc, #0x0014
    call    FILVRM
    ld      hl, #(APP_COLOR_TABLE + 0x014c)
    ld      a, #((VDP_COLOR_MEDIUM_GREEN << 4) | VDP_COLOR_BLACK)
    ld      bc, #0x0014
    call    FILVRM
    ld      hl, #(APP_COLOR_TABLE + 0x018c)
    ld      a, #((VDP_COLOR_LIGHT_GREEN << 4) | VDP_COLOR_BLACK)
    ld      bc, #0x0014
    call    FILVRM
    ld      hl, #(APP_COLOR_TABLE + 0x01cc)
    ld      a, #((VDP_COLOR_MEDIUM_GREEN << 4) | VDP_COLOR_BLACK)
    ld      bc, #0x0014
    call    FILVRM
    ld      hl, #(APP_COLOR_TABLE + 0x020c)
    ld      a, #((VDP_COLOR_DARK_BLUE << 4) | VDP_COLOR_BLACK)
    ld      bc, #0x0014
    call    FILVRM
    ld      hl, #(APP_COLOR_TABLE + 0x024c)
    ld      a, #((VDP_COLOR_LIGHT_BLUE << 4) | VDP_COLOR_BLACK)
    ld      bc, #0x0014
    call    FILVRM
    ld      hl, #(APP_COLOR_TABLE + 0x028c)
    ld      a, #((VDP_COLOR_CYAN << 4) | VDP_COLOR_BLACK)
    ld      bc, #0x0014
    call    FILVRM
    ld      hl, #(APP_COLOR_TABLE + 0x02cc)
    ld      a, #((VDP_COLOR_LIGHT_BLUE << 4) | VDP_COLOR_BLACK)
    ld      bc, #0x0014
    call    FILVRM
    ld      hl, #(APP_COLOR_TABLE + 0x030c)
    ld      a, #((VDP_COLOR_DARK_YELLOW << 4) | VDP_COLOR_BLACK)
    ld      bc, #0x0014
    call    FILVRM
    ld      hl, #(APP_COLOR_TABLE + 0x034c)
    ld      a, #((VDP_COLOR_LIGHT_YELLOW << 4) | VDP_COLOR_BLACK)
    ld      bc, #0x0014
    call    FILVRM
    ld      hl, #(APP_COLOR_TABLE + 0x038c)
    ld      a, #((VDP_COLOR_GRAY << 4) | VDP_COLOR_BLACK)
    ld      bc, #0x0014
    call    FILVRM
    ld      hl, #(APP_COLOR_TABLE + 0x03cc)
    ld      a, #((VDP_COLOR_LIGHT_YELLOW << 4) | VDP_COLOR_BLACK)
    ld      bc, #0x0014
    call    FILVRM

    ; パターンネームの初期化
    ld      hl, #APP_PATTERN_NAME_TABLE
    xor     a
    ld      bc, #0x0300
    call    FILVRM
    
    ; 割り込み禁止の解除
    ei

    ; アプリケーションの初期化
    ld      hl, #appDefault
    ld      de, #_app
    ld      bc, #APP_LENGTH
    ldir
    
    ; 状態の初期化
    ld      a, #APP_STATE_TITLE_INITIALIZE
    ld      (_app + APP_STATE), a
    
    ; レジスタの復帰
    
    ; 終了
    ret

; アプリケーションを更新する
;
_AppUpdate::
    
    ; レジスタの保存

    ; 状態別の処理
    ld      hl, #10$
    push    hl
    ld      a, (_app + APP_STATE)
    add     a, a
    ld      e, a
    ld      d, #0x00
    ld      hl, #appProc
    add     hl, de
    ld      e, (hl)
    inc     hl
    ld      d, (hl)
    ex      de, hl
    jp      (hl)
;   pop     hl
10$:

    ; 乱数を混ぜる
    call    _SystemGetRandom

;   ; デバッグ表示
;   ld      hl, #(_debug + DEBUG_7)
;   inc     (hl)
;   call    AppPrintDebug

    ; 更新の終了
90$:

    ; レジスタの復帰
    
    ; 終了
    ret

; 処理なし
;
_AppNull::

    ; レジスタの保存
    
    ; レジスタの復帰
    
    ; 終了
    ret

; スコアを取得する
;
_AppGetScore::

    ; レジスタの保存

    ; de > スコア

    ; スコアの取得
    ld      de, #(_app + APP_SCORE_10000000)

    ; レジスタの復帰

    ; 終了
    ret

; スコアを更新する
;
_AppRecordScore::

    ; レジスタの保存
    push    hl
    push    bc
    push    de

    ; de < スコア
    ; cf > 1 = スコア更新

    ; スコアの更新
    ld      hl, #(_app + APP_SCORE_10000000)
    ld      bc, #(((APP_SCORE_LENGTH - 0x01) << 8) | 0x00)
10$:
    ld      a, (de)
    cp      (hl)
    jr      c, 18$
    jr      nz, 11$
    inc     hl
    inc     de
    inc     c
    djnz    10$
    ld      a, (de)
    cp      (hl)
    jr      c, 18$
    jr      z, 18$
11$:
    ld      b, #0x00
    or      a
    sbc     hl, bc
    ex      de, hl
    or      a
    sbc     hl, bc
    ld      bc, #(APP_SCORE_LENGTH)
    ldir
    scf
    jr      19$
18$:
    or      a
;   jr      19$
19$:

    ; レジスタの復帰
    pop     de
    pop     bc
    pop     hl

    ; 終了
    ret

; デバッグ情報を表示する
;
AppPrintDebug:

    ; レジスタの保存

    ; デバッグ数値の表示
    ld      de, #(_patternName + 0x02e0)
    ld      hl, #appDebugStringNumber
    call    70$
    ld      hl, #_debug
    ld      b, #DEBUG_SIZE
10$:
    ld      a, (hl)
    call    80$
    inc     hl
    djnz    10$
    jr      90$

    ; 文字列の表示
70$:
    ld      a, (hl)
    sub     #0x20
    ret     c
    ld      (de), a
    inc     hl
    inc     de
    jr      70$

    ; 16 進数の表示
80$:
    push    af
    rrca
    rrca
    rrca
    rrca
    call    81$
    pop     af
    call    81$
    ret
81$:
    and     #0x0f
    cp      #0x0a
    jr      c, 82$
    add     a, #0x07
82$:
    add     a, #0x10
    ld      (de), a
    inc     de
    ret

    ; デバッグ表示の完了
90$:

    ; レジスタの復帰

    ; 終了
    ret

; 定数の定義
;

; VDP レジスタ値（スクリーン１）
;
videoScreen1:

    .db     0b00000000
    .db     0b10100010
    .db     APP_PATTERN_NAME_TABLE >> 10
    .db     APP_COLOR_TABLE >> 6
    .db     APP_PATTERN_GENERATOR_TABLE >> 11
    .db     APP_SPRITE_ATTRIBUTE_TABLE >> 7
    .db     APP_SPRITE_GENERATOR_TABLE >> 11
    .db     0b00000111

; 状態別の処理
;
appProc:
    
    .dw     _AppNull
    .dw     _TitleInitialize
    .dw     _TitleUpdate
    .dw     _GameInitialize
    .dw     _GameUpdate

; アプリケーションの初期値
;
appDefault:

    .db     APP_STATE_NULL
    .db     APP_FRAME_NULL
    .db     0 ; APP_SCORE_NULL
    .db     0 ; APP_SCORE_NULL
    .db     0 ; APP_SCORE_NULL
    .db     0 ; APP_SCORE_NULL
    .db     5 ; APP_SCORE_NULL
    .db     0 ; APP_SCORE_NULL
    .db     0 ; APP_SCORE_NULL
    .db     0 ; APP_SCORE_NULL

; デバッグ
;
appDebugStringNumber:

    .ascii  "DBG="
    .db     0x00


; DATA 領域
;
    .area   _DATA

; 変数の定義
;

; アプリケーション
;
_app::

    .ds     APP_LENGTH


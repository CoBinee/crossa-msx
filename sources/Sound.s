; Sound.s : サウンド
;


; モジュール宣言
;
    .module Sound

; 参照ファイル
;
    .include    "bios.inc"
    .include    "System.inc"
    .include	"Sound.inc"

; 外部変数宣言
;

; マクロの定義
;


; CODE 領域
;
    .area   _CODE

; BGM を再生する
;
_SoundPlayBgm::

    ; レジスタの保存
    push    hl
    push    bc
    push    de

    ; a < BGM

    ; 現在再生している BGM の取得
    ld      bc, (_soundChannel + SOUND_CHANNEL_A + SOUND_CHANNEL_HEAD)

    ; サウンドの再生
    add     a, a
    ld      e, a
    add     a, a
    add     a, e
    ld      e, a
    ld      d, #0x00
    ld      hl, #soundBgm
    add     hl, de
    ld      e, (hl)
    inc     hl
    ld      d, (hl)
    inc     hl
    ld      a, e
    cp      c
    jr      nz, 10$
    ld      a, d
    cp      b
    jr      z, 19$
10$:
    ld      (_soundChannel + SOUND_CHANNEL_A + SOUND_CHANNEL_REQUEST), de
    ld      e, (hl)
    inc     hl
    ld      d, (hl)
    inc     hl
    ld      (_soundChannel + SOUND_CHANNEL_B + SOUND_CHANNEL_REQUEST), de
    ld      e, (hl)
    inc     hl
    ld      d, (hl)
;   inc     hl
    ld      (_soundChannel + SOUND_CHANNEL_C + SOUND_CHANNEL_REQUEST), de
19$:

    ; レジスタの復帰
    pop     de
    pop     bc
    pop     hl

    ; 終了
    ret

; SE を再生する
;
_SoundPlaySe::

    ; レジスタの保存
    push    hl
    push    de

    ; a < SE

    ; サウンドの再生
    add     a, a
    ld      e, a
    ld      d, #0x00
    ld      hl, #soundSe
    add     hl, de
    ld      e, (hl)
    inc     hl
    ld      d, (hl)
;   inc     hl
    ld      (_soundChannel + SOUND_CHANNEL_D + SOUND_CHANNEL_REQUEST), de

    ; レジスタの復帰
    pop     de
    pop     hl

    ; 終了
    ret

; サウンドを停止する
;
_SoundStop::

    ; レジスタの保存

    ; サウンドの停止
    call    _SystemStopSound

    ; レジスタの復帰

    ; 終了
    ret

; BGM が再生中かどうかを判定する
;
_SoundIsPlayBgm::

    ; レジスタの保存
    push    hl

    ; cf > 0/1 = 停止/再生中

    ; サウンドの監視
    ld      hl, (_soundChannel + SOUND_CHANNEL_A + SOUND_CHANNEL_REQUEST)
    ld      a, h
    or      l
    jr      nz, 10$
    ld      hl, (_soundChannel + SOUND_CHANNEL_A + SOUND_CHANNEL_PLAY)
    ld      a, h
    or      l
    jr      nz, 10$
    or      a
    jr      19$
10$:
    scf
19$:

    ; レジスタの復帰
    pop     hl

    ; 終了
    ret

; SE が再生中かどうかを判定する
;
_SoundIsPlaySe::

    ; レジスタの保存
    push    hl

    ; cf > 0/1 = 停止/再生中

    ; サウンドの監視
    ld      hl, (_soundChannel + SOUND_CHANNEL_D + SOUND_CHANNEL_REQUEST)
    ld      a, h
    or      l
    jr      nz, 10$
    ld      hl, (_soundChannel + SOUND_CHANNEL_D + SOUND_CHANNEL_PLAY)
    ld      a, h
    or      l
    jr      nz, 10$
    or      a
    jr      19$
10$:
    scf
19$:

    ; レジスタの復帰
    pop     hl

    ; 終了
    ret

; 定数の定義
;

; 共通
;
soundNull:

    .ascii  "T1@0"
    .db     0x00

; BGM
;
soundBgm:

    .dw     soundNull, soundNull, soundNull
    .dw     soundBgmTitle_A, soundBgmTitle_B, soundBgmTitle_C
    .dw     soundBgmPlay_A, soundBgmPlay_B, soundNull
    .dw     soundBgmTimeup_A, soundBgmTimeup_B, soundBgmTimeup_C
    .dw     soundBgmResult_A, soundBgmResult_B, soundNull

; タイトル
soundBgmTitle_A:

    .ascii  "T2@0V15,4"
    .ascii  "L3O6C5O5FO6C6C4C1CO5B-O6CD"
    .ascii  "L3O6C5O5FO6C6C4C1CO5B-O6CD"
    .ascii  "L3O6C4O5F1FB-O6CDC4O5F1FB-O6CD"
    .ascii  "L3O3O6C4O5F1FB-O6CDC4O5A1O6CD4O5B1O6D"
    .ascii  "L9O6ER7"
    .ascii  "L9O6E"
    .db     0x00

soundBgmTitle_B:

    .ascii  "T2@0V13,4"
    .ascii  "L1O4A6A3AAAAA6B-6"
    .ascii  "L1O4A6A3AAAAA6B-6"
    .ascii  "L1O4A6B-3B-B-B-B-A6B-3B-B-B-B-"
    .ascii  "L1O4A6B-3B-B-B-B-A3AAAAB3BBBB"
    .ascii  "L1O5E4O4AO5E3E4O4AO5E3E4O4AO5E3E4O4AO5E3"
    .ascii  "L9O5A"
    .db     0x00

soundBgmTitle_C:

    .ascii  "T2@0V13,4"
    .ascii  "L3O4F9RDCO3B-"
    .ascii  "L3O4F9RDCO3B-"
    .ascii  "L3O4F6DCO3B-O4F6DCO3B-"
    .ascii  "L3O4F6DCO3B-O4F8"
    .ascii  "L1O5C+4O4C+O5C+5RO4C+O5C+5RO4C+O5C+5RO4C+O5"
    .ascii  "L7O5C+R3R"
    .db     0x00

; プレイ
soundBgmPlay_A:

    .ascii  "T2@0V15,4"
    .ascii  "L3O4D5D5FDDFF+GG+AG+F5D"
    .ascii  "L3O4A5ABO5CDEFECDO4BO5CO4A5A"
    .ascii  "L3O4D5D5FD5FF+GG+AG+F5D"
    .ascii  "L3O4E5B5BO5CO4BAGEF+D+EEE5"
    .ascii  "L3O5D5F+DF5DF+DFDF+DDD5"
    .ascii  "L3O5D5F+DF5DF+DFDF+DDD5"
    .ascii  "L3O5F+5F+5DF5F+DD-CO4BO5CD-D-5"
    .ascii  "L3O5F+5F+5DF5F+DD-CO4BO5CD-D5"
    .db     0xff

soundBgmPlay_B:

    .ascii  "T2@0V13,4"
    .ascii  "L3O3DDDDDDDDDDDDDDDD"
    .ascii  "L3O3EEEEEEEEEEG+G+AAAA"
    .ascii  "L3O3DDDDDDDDDDDDDDDD"
    .ascii  "L3O3E5EF+GABO4CO3BGAF+EEEE"
    .ascii  "L3O3DDD-D-CCO2BBB-B-AAA-GF+5"
    .ascii  "L3O3DDD-D-CCO2BBB-B-AAA-GF+5"
    .ascii  "L3O4DDD-D-CCO3BBB-B-AAA-GF+5"
    .ascii  "L3O3DDD-D-CCO2BBB-B-AAA-GF+5"
    .db     0xff
    
; タイムアップ
soundBgmTimeup_A:

    .ascii  "T2@0V15,4"
    .ascii  "O5C4O4G1O5C3D4O4A1O5D3E4E1E3E8R7"
    .db     0x00

soundBgmTimeup_B:

    .ascii  "T2@0V15,4"
    .ascii  "O4G4E1G3A4F+1A3B4B1B3B8R7"
    .db     0x00

soundBgmTimeup_C:

    .ascii  "T2@0V15,4"
    .ascii  "O3E4C1E3F+4D1F+3G+8R5R7"
    .db     0x00

; 結果
soundBgmResult_A:

    .ascii  "T2@0V15,4"
    .ascii  "L3O5F+5F+5E5F+RF+G5G5F+GR"
    .ascii  "L3O5GA5A5AARAG5G5GGR"
    .ascii  "L3O5GF+5F+5EF+RF+G5G5F+GR"
    .ascii  "L3O5GA5A5GGRF+RR5R7"
    .db     0x00

soundBgmResult_B:

    .ascii  "T2@0V13,4"
    .ascii  "L3O4R7A5R5R7RAR5"
    .ascii  "L9RR"
    .ascii  "L3O4R7RAR5R7RAR5"
    .ascii  "L9RR"
    .db     0x00

; SE
;
soundSe:

    .dw     soundNull
    .dw     soundSeBoot
    .dw     soundSeClick
    .dw     soundSeHit

; ブート
soundSeBoot:

    .ascii  "T2@0V15L3O6BO5BR9"
    .db     0x00

; クリック
soundSeClick:

    .ascii  "T2@0V15O4B0"
    .db     0x00

; ヒット
soundSeHit:

    .ascii  "T1@0V15,3L0O3AO4C+FGO3ABO4C+D+EFGAA+BO5CC+DD+EFF+GG+ABO6C+D+FGAO7CEG-B-"
    .db     0x00


; DATA 領域
;
    .area   _DATA

; 変数の定義
;

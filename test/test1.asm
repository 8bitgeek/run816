; da65 V2.16 - Ubuntu 2.16-2
; Created:    2020-09-18 13:53:51
; Input file: ./test1
; Page:       1


        .setcpu "6502"

L021D           := $021D
L0229           := $0229
L0253           := $0253
L0272           := $0272
L02B1           := $02B1
L02D0           := $02D0
L02DC           := $02DC
L02F2           := $02F2
L0336           := $0336
L033F           := $033F
L0355           := $0355
L03AB           := $03AB
L03B2           := $03B2
L03B6           := $03B6
L03BA           := $03BA
L03C1           := $03C1
L03C4           := $03C4
L03D7           := $03D7
L03E3           := $03E3
L03EE           := $03EE
L0400           := $0400
L040C           := $040C
L044A           := $044A
L0454           := $0454
L0462           := $0462
L046C           := $046C
L0477           := $0477
L048F           := $048F
L049C           := $049C
L04A9           := $04A9
L04DC           := $04DC
L0561           := $0561
L05AA           := $05AA
L05D1           := $05D1
L05D7           := $05D7
L06FB           := $06FB
L075B           := $075B
L0765           := $0765
L0772           := $0772
L0778           := $0778
L077F           := $077F
L0796           := $0796
L07A2           := $07A2
L07A9           := $07A9
L07B6           := $07B6
L07C3           := $07C3
L083E           := $083E
L0845           := $0845
L0853           := $0853
L0858           := $0858
L085D           := $085D
L0862           := $0862
L086D           := $086D
L087B           := $087B
L0892           := $0892
L08AE           := $08AE
L0905           := $0905
L0908           := $0908
L093C           := $093C
L0960           := $0960
L096D           := $096D
L09B4           := $09B4
L09BF           := $09BF
L09EC           := $09EC
L09FB           := $09FB
L0A2E           := $0A2E
L0A37           := $0A37
L0A4B           := $0A4B
L0A4D           := $0A4D
L0A65           := $0A65
L0A7F           := $0A7F
L0A97           := $0A97
L0AA0           := $0AA0
L0AB6           := $0AB6
L0AE0           := $0AE0
L0AEF           := $0AEF
L0B64           := $0B64
L0B8D           := $0B8D
L0CF5           := $0CF5
L0CFC           := $0CFC
        ora     ($D8,x)
        ldx     #$FF
        txs
        lda     #$F0
        ldx     #$FF
        sta     $00
        stx     $01
        jsr     L0B8D
        jsr     L021D
        jsr     L077F
        pha
        jsr     L0796
        pla
        jmp     LFFF1

        ldy     #$00
        beq     LF4FF
        lda     #$29
        ldx     #$02
        jmp     L0CFC

LF4FF:  rts

        jsr     L0A4D
        jmp     L0253

LF506:  ldy     #$04
        jsr     L086D
        sta     $04
        stx     $05
        .byte   $1A
        bne     LF513
        inx
LF513:  ldy     #$03
        jsr     L0A97
        lda     $04
        ldx     $05
        jsr     L0A4D
        ldy     #$04
        ldx     #$00
        lda     ($00),y
        ldy     #$00
        jsr     L0A7F
        ldy     #$01
        jsr     L086D
        sta     $04
        stx     $05
        jsr     L07A2
        ldy     #$00
        jsr     L0A97
        lda     $04
        ldx     $05
        stx     $10
        ora     $10
        bne     LF506
        jsr     L0858
        rts

        jsr     L0A4D
        jmp     L02B1

LF54F:  ldy     #$05
        jsr     L086D
        sta     $04
        stx     $05
        .byte   $1A
        bne     LF55C
        inx
LF55C:  ldy     #$04
        jsr     L0A97
        lda     $04
        ldx     $05
        jsr     L0A4D
        ldy     #$05
        jsr     L086D
        sta     $04
        stx     $05
        .byte   $1A
        bne     LF575
        inx
LF575:  ldy     #$04
        jsr     L0A97
        lda     $04
        ldx     $05
        ldy     #$00
        jsr     L0862
        ldy     #$00
        jsr     L0A7F
        ldy     #$01
        jsr     L086D
        sta     $04
        stx     $05
        jsr     L07A2
        ldy     #$00
        jsr     L0A97
        lda     $04
        ldx     $05
        stx     $10
        ora     $10
        bne     LF54F
        jsr     L085D
        rts

        jsr     L07A9
        ldx     #$00
        lda     #$00
        ldy     #$02
        jsr     L0A97
        ldy     #$03
        jsr     L086D
        cpx     #$FF
        bne     LF5BE
        cmp     #$FF
LF5BE:  jsr     L0960
        beq     LF5C6
        jmp     L02F2

LF5C6:  jmp     L0336

        ldy     #$03
        jsr     L086D
        ldy     #$00
        jsr     L0A97
        lda     #$B0
        ldx     #$0B
        jsr     L0A4D
        ldy     #$03
        jsr     L086D
        jsr     L0A4D
        ldy     #$05
        jsr     L086D
        ldy     #$00
        jsr     L0862
        jsr     L0A4D
        ldy     #$06
        jsr     L09FB
        ldy     #$03
        jsr     L086D
        sta     $04
        stx     $05
        .byte   $1A
        bne     LF601
        inx
LF601:  ldy     #$02
        jsr     L0A97
        lda     $04
        ldx     $05
        jmp     L02DC

        ldx     #$00
        lda     #$00
        ldy     #$02
        jsr     L0A97
        ldy     #$03
        jsr     L086D
        cpx     #$00
        bne     LF621
        cmp     #$FF
LF621:  jsr     L0960
        beq     LF629
        jmp     L0355

LF629:  jmp     L03AB

        lda     #$29
        ldx     #$0D
        jsr     L0A4D
        lda     #$AA
        jsr     L0A37
        ldx     #$20
        lda     #$00
        jsr     L0229
        lda     #$29
        ldx     #$2D
        jsr     L0A4D
        lda     #$29
        ldx     #$0D
        jsr     L0A4D
        ldx     #$20
        lda     #$00
        jsr     L0272
        lda     #$29
        ldx     #$0D
        jsr     L0A4D
        lda     #$29
        ldx     #$2D
        jsr     L0A4D
        ldx     #$20
        lda     #$00
        jsr     L0272
        ldy     #$03
        jsr     L086D
        sta     $04
        stx     $05
        .byte   $1A
        bne     LF676
        inx
LF676:  ldy     #$02
        jsr     L0A97
        lda     $04
        ldx     $05
        jmp     L033F

        ldx     #$00
        lda     #$00
        jmp     L03B2

        jsr     L0853
        rts

        ldy     #$00
        lda     ($16),y
        inc     $16
        bne     LF697
        inc     $17
LF697:  rts

        lda     $4D34
        sta     $4D2F
        jsr     L0462
        lda     #$2F
        ldx     #$4D
        jsr     L0A4D
        jsr     L0A2E
        jmp     L0CF5

        lda     $14
        sec
        sbc     #$02
        sta     $14
        bcs     LF6B9
        dec     $15
LF6B9:  rts

        lda     $4D39
        bne     LF6D0
        jsr     L0400
        jmp     L0778

        lda     $4D39
        bne     LF6D0
        jsr     L0400
        jmp     L0772

LF6D0:  jsr     L0400
        sta     $02
        stx     $03
        jsr     L03D7
        ldy     #$01
        lda     ($14),y
        tax
        dey
        lda     ($14),y
        rts

        ldy     #$00
        sty     $08
        sty     $09
LF6E9:  lda     ($16),y
        sec
        sbc     #$30
        bcc     LF71C
        cmp     #$0A
        bcs     LF71C
        jsr     L03BA
        pha
        lda     $08
        ldx     $09
        asl     $08
        rol     $09
        asl     $08
        rol     $09
        adc     $08
        sta     $08
        txa
        adc     $09
        sta     $09
        asl     $08
        rol     $09
        pla
        adc     $08
        sta     $08
        bcc     LF6E9
        inc     $09
        bcs     LF6E9
LF71C:  lda     $08
        ldx     $09
        rts

        ldy     $4D3B
        inc     $4D3B
        sta     $4D3C,y
        rts

        lda     #$3C
        ldx     #$4D
        clc
        adc     $4D3B
        bcc     LF736
        inx
LF736:  jmp     L0A4D

        lda     $18
        ldx     $19
        jmp     L0A4D

LF740:  jsr     L03C1
        inc     $4D35
        bne     LF740
        inc     $4D36
        bne     LF740
        rts

        jsr     L0462
        lda     $4D50
        ldx     $4D51
        jsr     L0A4D
        lda     $4D52
        ldx     $4D53
        jsr     L0A4D
        jmp     L0CF5

        sty     $08
        jsr     L087B
        jsr     L0454
        lda     $08
        jmp     L08AE

        sty     $08
        jsr     L087B
        jsr     L0454
        lda     $08
        jmp     L0905

        pha
        ldy     #$05
LF783:  lda     $14,y
        sta     $4D29,y
        dey
        bpl     LF783
        pla
        sta     $14
        stx     $15
        jsr     L083E
        sta     $16
        stx     $17
        jsr     L083E
        sta     $18
        stx     $19
        lda     #$00
        tay
        sta     ($18),y
        iny
        sta     ($18),y
        iny
        lda     ($18),y
        sta     $0CF6
        iny
        lda     ($18),y
        sta     $0CF7
        lda     $16
        sta     $08
        lda     $17
        sta     $09
        ldy     #$00
LF7BD:  lda     ($16),y
        beq     LF7CC
        cmp     #$25
        beq     LF7CC
        iny
        bne     LF7BD
        inc     $17
        bne     LF7BD
LF7CC:  tya
        clc
        adc     $16
        sta     $16
        bcc     LF7D6
        inc     $17
LF7D6:  sec
        sbc     $08
        sta     $0A
        lda     $17
        sbc     $09
        sta     $0B
        ora     $0A
        beq     LF80A
        jsr     L07B6
        ldy     #$05
        lda     $19
        sta     ($00),y
        dey
        lda     $18
        sta     ($00),y
        dey
        lda     $09
        sta     ($00),y
        dey
        lda     $08
        sta     ($00),y
        dey
        lda     $0B
        sta     ($00),y
        dey
        lda     $0A
        sta     ($00),y
        jsr     L0CF5
LF80A:  jsr     L03B6
        tax
        bne     LF81B
        ldx     #$05
LF812:  lda     $4D29,x
        sta     $14,x
        dex
        bpl     LF812
        rts

LF81B:  cmp     #$25
        bne     LF828
        lda     ($16),y
        cmp     #$25
        bne     LF82E
        jsr     L03BA
LF828:  jsr     L03C4
        jmp     L04DC

LF82E:  lda     #$00
        ldx     #$0B
LF832:  sta     $4D30,x
        dex
        bpl     LF832
        lda     ($16),y
        cmp     #$2D
        bne     LF843
        stx     $4D30
        beq     LF85C
LF843:  cmp     #$2B
        bne     LF84C
        stx     $4D31
        beq     LF85C
LF84C:  cmp     #$20
        bne     LF855
        stx     $4D32
        beq     LF85C
LF855:  cmp     #$23
        bne     LF862
        stx     $4D33
LF85C:  jsr     L03BA
        jmp     L0561

LF862:  ldx     #$20
        cmp     #$30
        bne     LF86E
        tax
        jsr     L03BA
        lda     ($16),y
LF86E:  stx     $4D34
        cmp     #$2A
        bne     LF87E
        jsr     L03BA
        jsr     L0400
        jmp     L05AA

LF87E:  jsr     L040C
        sta     $4D35
        stx     $4D36
        sty     $4D37
        sty     $4D38
        lda     ($16),y
        cmp     #$2E
        bne     LF8AE
        jsr     L03BA
        lda     ($16),y
        cmp     #$2A
        bne     LF8A5
        jsr     L03BA
        jsr     L0400
        jmp     L05D1

LF8A5:  jsr     L040C
        sta     $4D37
        stx     $4D38
LF8AE:  lda     ($16),y
        cmp     #$7A
        beq     LF8CD
        cmp     #$68
        beq     LF8CD
        cmp     #$74
        beq     LF8CD
        cmp     #$6A
        beq     LF8C8
        cmp     #$4C
        beq     LF8C8
        cmp     #$6C
        bne     LF8D3
LF8C8:  lda     #$FF
        sta     $4D39
LF8CD:  jsr     L03BA
        jmp     L05D7

LF8D3:  sty     $4D3B
        ldx     #$3C
        stx     $4D50
        ldx     #$4D
        stx     $4D51
        jsr     L03BA
        cmp     #$63
        bne     LF8F5
        jsr     L0400
        sta     $4D3C
        lda     #$00
        sta     $4D3D
        jmp     L06FB

LF8F5:  cmp     #$64
        beq     LF8FD
        cmp     #$69
        bne     LF92A
LF8FD:  ldx     #$00
        lda     $4D32
        beq     LF906
        ldx     #$20
LF906:  lda     $4D31
        beq     LF90D
        ldx     #$2B
LF90D:  stx     $4D3A
        jsr     L03EE
        ldy     $03
        bmi     LF922
        ldy     $4D3A
        beq     LF922
        sty     $4D3C
        inc     $4D3B
LF922:  ldy     #$0A
        jsr     L048F
        jmp     L06FB

LF92A:  cmp     #$6E
        bne     LF943
        jsr     L0400
        sta     $08
        stx     $09
        ldy     #$00
        lda     ($18),y
        sta     ($08),y
        iny
        lda     ($18),y
        sta     ($08),y
        jmp     L04DC

LF943:  cmp     #$6F
        bne     LF96E
        jsr     L03EE
        ldy     $4D33
        beq     LF966
        pha
        stx     $10
        ora     $10
        ora     $02
        ora     $03
        ora     $4D37
        ora     $4D38
        beq     LF966
        lda     #$30
        jsr     L044A
        pla
LF966:  ldy     #$08
        jsr     L048F
        jmp     L06FB

LF96E:  cmp     #$70
        bne     LF97F
        ldx     #$00
        stx     $4D39
        inx
        stx     $4D33
        lda     #$78
        bne     LF9A6
LF97F:  cmp     #$73
        bne     LF98F
        jsr     L0400
        sta     $4D50
        stx     $4D51
        jmp     L06FB

LF98F:  cmp     #$75
        bne     LF99E
        jsr     L03E3
        ldy     #$0A
        jsr     L049C
        jmp     L06FB

LF99E:  cmp     #$78
        beq     LF9A6
        cmp     #$58
        bne     LF9CF
LF9A6:  pha
        lda     $4D33
        beq     LF9B6
        lda     #$30
        jsr     L044A
        lda     #$58
        jsr     L044A
LF9B6:  jsr     L03E3
        ldy     #$10
        jsr     L049C
        pla
        cmp     #$78
        bne     LF9CC
        lda     $4D50
        ldx     $4D51
        jsr     L0AB6
LF9CC:  jmp     L06FB

LF9CF:  jmp     L04DC

        lda     $4D50
        ldx     $4D51
        jsr     L0AA0
        sta     $4D52
        stx     $4D53
        lda     $4D37
        ora     $4D38
        beq     LF9FE
        ldx     $4D37
        cpx     $4D52
        lda     $4D38
        tay
        sbc     $4D53
        bcs     LF9FE
        stx     $4D52
        sty     $4D53
LF9FE:  sec
        lda     $4D35
        sbc     $4D52
        tax
        lda     $4D36
        sbc     $4D53
        bcs     LFA11
        lda     #$00
        tax
LFA11:  eor     #$FF
        sta     $4D36
        txa
        eor     #$FF
        sta     $4D35
        lda     $4D30
        bne     LFA24
        jsr     L046C
LFA24:  jsr     L0477
        lda     $4D30
        beq     LFA2F
        jsr     L046C
LFA2F:  jmp     L04DC

        sta     $4D54
        lda     #$00
        sta     $4D55
        rts

        iny
        pha
        clc
        tya
        adc     $00
        sta     $00
        bcc     LFA47
        inc     $01
LFA47:  pla
        rts

        ldy     #$FF
        cpx     #$80
        bcs     LFA51
        ldy     #$00
LFA51:  sty     $02
        sty     $03
        rts

        lda     $0CF8
        ldx     $0CF9
        jsr     L0A4D
        lda     $0CFA
        ldx     $0CFB
        jsr     L0A4D
        ldy     #$04
        jmp     L02D0

        ldy     #$00
        beq     LFA78
        lda     #$D7
        ldx     #$0C
        jmp     L0CFC

LFA78:  rts

        sec
        sbc     #$01
        bcs     LFA7F
        dex
LFA7F:  rts

        lda     $00
        sec
        sbc     #$04
        sta     $00
        bcc     LFA8A
        rts

LFA8A:  dec     $01
        rts

        lda     $00
        sec
        sbc     #$06
        sta     $00
        bcc     LFA97
        rts

LFA97:  dec     $01
        rts

        sta     $4D56
        sta     $08
        stx     $4D57
        stx     $09
        ldy     #$01
        lda     ($08),y
        and     #$01
        bne     LFAB5
LFAAC:  lda     #$10
        jsr     L075B
        tax
        jmp     L085D

LFAB5:  lda     ($08),y
        and     #$04
        bne     LFAAC
        ldy     #$00
        lda     ($08),y
        ldx     #$00
        jsr     L0A4D
        ldy     #$09
        jsr     L0A65
        ldy     #$07
        jsr     L0A65
        ldy     #$09
        jsr     L086D
        jsr     L096D
        cpx     #$00
        bne     LFAE8
        cmp     #$00
        bne     LFAE8
        ldy     #$05
        jsr     L086D
        ldy     #$0A
        jmp     L0765

LFAE8:  jsr     LFFF5
        cpx     #$FF
        bne     LFB07
        cmp     #$FF
        bne     LFB07
        lda     $4D56
        sta     $08
        lda     $4D57
        sta     $09
        ldy     #$01
        lda     ($08),y
        ora     #$04
        sta     ($08),y
        bne     LFAAC
LFB07:  jsr     L0A4D
        ldy     #$05
        jsr     L086D
        jsr     L0AE0
        jmp     L085D

        ldy     #$01
        lda     ($00),y
        tax
        .byte   $B2
        brk
        inc     $00
        beq     LFB25
        inc     $00
        beq     LFB27
        rts

LFB25:  inc     $00
LFB27:  inc     $01
        rts

        ldy     #$04
        jmp     L0765

        ldy     #$05
        jmp     L0765

        ldy     #$06
        jmp     L0765

        sta     $08
        stx     $09
        ldx     #$00
        lda     ($08),y
        rts

        ldy     #$01
        lda     ($00),y
        tax
        dey
        lda     ($00),y
        rts

        lda     #$00
        tax
        .byte   $64
        .byte   $02
        .byte   $64
        .byte   $03
        pha
        jsr     L07A9
        ldy     #$03
        lda     $03
        sta     ($00),y
        dey
        lda     $02
        sta     ($00),y
        dey
        txa
        sta     ($00),y
        pla
        .byte   $92
        brk
        rts

        sta     $10
        jsr     L083E
        sta     $08
        stx     $09
        sta     $02
        stx     $03
        jsr     L083E
        sta     $0A
        stx     $0B
        jsr     L083E
        sta     $0C
        stx     $0D
        rts

        jsr     L0892
        ldx     $0D
        ldy     $10
        cpy     #$0A
        bne     LFBDF
        lda     $0C
        ora     $0B
        ora     $0A
        bne     LFBA9
        cpx     #$80
        bne     LFBA9
        ldy     #$0B
LFB9E:  lda     $0BCB,y
        sta     ($08),y
        dey
        bpl     LFB9E
        jmp     L093C

LFBA9:  txa
        bpl     LFBDF
        lda     #$2D
        ldy     #$00
        sta     ($08),y
        inc     $08
        bne     LFBB8
        inc     $09
LFBB8:  lda     $0A
        eor     #$FF
        clc
        adc     #$01
        sta     $0A
        lda     $0B
        eor     #$FF
        adc     #$00
        sta     $0B
        lda     $0C
        eor     #$FF
        adc     #$00
        sta     $0C
        lda     $0D
        eor     #$FF
        adc     #$00
        sta     $0D
        jmp     L0908

        jsr     L0892
LFBDF:  lda     #$00
        pha
LFBE2:  ldy     #$20
        lda     #$00
LFBE6:  asl     $0A
        rol     $0B
        rol     $0C
        rol     $0D
        rol     a
        cmp     $10
        bcc     LFBF7
        sbc     $10
        inc     $0A
LFBF7:  dey
        bne     LFBE6
        tay
        lda     $0BBB,y
        pha
        lda     $0A
        ora     $0B
        ora     $0C
        ora     $0D
        bne     LFBE2
        ldy     #$00
LFC0B:  pla
        sta     ($08),y
        beq     LFC13
        iny
        bne     LFC0B
LFC13:  lda     $02
        ldx     $03
        rts

        bne     LFC20
LFC1A:  ldx     #$00
        txa
        rts

        bne     LFC1A
LFC20:  ldx     #$00
        lda     #$01
        rts

        beq     LFC20
        bmi     LFC20
        ldx     #$00
        txa
        rts

        beq     LFC31
        bpl     LFC20
LFC31:  ldx     #$00
        txa
        rts

        beq     LFC20
        bcc     LFC20
        ldx     #$00
        txa
        rts

        beq     LFC1A
        ldx     #$00
        txa
        rol     a
        rts

        sta     $0E
        txa
        beq     LFC77
        stx     $0F
        jsr     L09EC
        lda     #$00
        ldx     $03
        beq     LFC7A
        sta     $10
        ldy     #$10
        lsr     $0F
        ror     $0E
LFC5C:  bcc     LFC68
        clc
        adc     $02
        pha
        txa
        adc     $10
        sta     $10
        pla
LFC68:  ror     $10
        ror     a
        ror     $0F
        ror     $0E
        dey
        bne     LFC5C
        lda     $0E
        ldx     $0F
        rts

LFC77:  jmp     L09B4

LFC7A:  ldy     $02
        ldx     $0E
        stx     $02
        ldx     $0F
        sty     $0E
        ldy     #$08
        jmp     L09BF

        sta     $0E
        jsr     L09EC
        lda     #$00
        ldy     #$08
        ldx     $03
        beq     LFCB2
        sta     $0F
        lsr     $0E
LFC9A:  bcc     LFCA6
        clc
        adc     $02
        pha
        txa
        adc     $0F
        sta     $0F
        pla
LFCA6:  ror     $0F
        ror     a
        ror     $0E
        dey
        bne     LFC9A
        tax
        lda     $0E
        rts

LFCB2:  lsr     $0E
LFCB4:  bcc     LFCB9
        clc
        adc     $02
LFCB9:  ror     a
        ror     $0E
        dey
        bne     LFCB4
        tax
        lda     $0E
        rts

        pha
        ldy     #$01
        lda     ($00),y
        sta     $03
        .byte   $B2
        brk
        sta     $02
        pla
        jmp     L0845

        sty     $4D58
        lda     $0CF1
        ldx     $0CF2
        jsr     L0A4D
        lda     $00
        ldx     $01
        clc
        adc     $4D58
        bcc     LFCE9
        inx
LFCE9:  sta     $08
        stx     $09
        ldy     #$01
        lda     ($08),y
        tax
        dey
        lda     ($08),y
        jsr     L0A4D
        lda     $08
        ldx     $09
        jsr     L0B64
        ldy     $4D58
        jmp     L0765

        lda     #$01
        jmp     L0A4B

        ldy     #$00
        lda     ($00),y
        ldy     $00
        beq     LFD19
        dec     $00
        ldy     #$00
        sta     ($00),y
        rts

LFD19:  dec     $01
        dec     $00
        sta     ($00),y
        rts

        lda     #$00
        ldx     #$00
        pha
        lda     $00
        sec
        sbc     #$02
        sta     $00
        bcs     LFD30
        dec     $01
LFD30:  ldy     #$01
        txa
        sta     ($00),y
        pla
        dey
        sta     ($00),y
        rts

        ldy     #$03
        lda     $00
        sec
        sbc     #$02
        sta     $00
        bcs     LFD47
        dec     $01
LFD47:  lda     ($00),y
        tax
        dey
        lda     ($00),y
        ldy     #$00
        sta     ($00),y
        iny
        txa
        sta     ($00),y
        rts

        pha
        sty     $10
        ldy     #$01
        lda     ($00),y
        sta     $09
        dey
        lda     ($00),y
        sta     $08
        ldy     $10
        pla
        sta     ($08),y
        jmp     L0845

        ldy     #$00
        sta     ($00),y
        iny
        pha
        txa
        sta     ($00),y
        pla
        rts

        sta     $08
        stx     $09
        ldx     #$00
        ldy     #$00
LFD7F:  lda     ($08),y
        beq     LFD8B
        iny
        bne     LFD7F
        inc     $09
        inx
        bne     LFD7F
LFD8B:  tya
        rts

        sta     $08
        stx     $09
        sta     $0A
        stx     $0B
        ldy     #$00
LFD97:  lda     ($08),y
        beq     LFDB0
        tax
        lda     $0BD7,x
        and     #$02
        beq     LFDA9
        txa
        sec
        sbc     #$E0
        sta     ($08),y
LFDA9:  iny
        bne     LFD97
        inc     $09
        bne     LFD97
LFDB0:  lda     $0A
        ldx     $0B
        rts

        ldx     #$00
        sta     $0E
        stx     $0F
        jsr     L09EC
        jsr     L0AEF
        lda     $02
        ldx     $03
        rts

        lda     #$00
        sta     $09
        ldy     #$10
        ldx     $0F
        beq     LFDEF
LFDD0:  asl     $02
        rol     $03
        rol     a
        rol     $09
        pha
        cmp     $0E
        lda     $09
        sbc     $0F
        bcc     LFDE8
        sta     $09
        pla
        sbc     $0E
        pha
        inc     $02
LFDE8:  pla
        dey
        bne     LFDD0
        sta     $08
        rts

LFDEF:  asl     $02
        rol     $03
        rol     a
        bcs     LFDFA
        cmp     $0E
        bcc     LFDFE
LFDFA:  sbc     $0E
        inc     $02
LFDFE:  dey
        bne     LFDEF
        sta     $08
        rts

        ldy     #$05
        jsr     L0A65
        jsr     L0A2E
        ldy     #$07
        jsr     L0A65
        lda     $0D25
        ldx     $0D26
        jsr     L07C3
        sta     $08
        stx     $09
        ora     $09
        bne     LFE28
        .byte   $3A
        sta     $0D21
        bne     LFE35
LFE28:  lda     $08
        clc
        adc     $0D21
        sta     $0D21
        txa
        adc     $0D22
LFE35:  sta     $0D22
        jmp     L085D

        pha
        lda     #$00
        sta     $0D21
        sta     $0D22
        ldy     #$02
        lda     ($00),y
        sta     $0D25
        lda     #$21
        sta     ($00),y
        iny
        lda     ($00),y
        sta     $0D26
        lda     #$0D
        sta     ($00),y
        pla
        jsr     L04A9
        lda     $0D21
        ldx     $0D22
        rts

        lda     #$29
        sta     $08
        lda     #$0D
        sta     $09
        lda     #$00
        tay
        ldx     #$40
        beq     LFE7D
LFE73:  sta     ($08),y
        iny
        bne     LFE73
        inc     $09
        dex
        bne     LFE73
LFE7D:  cpy     #$30
        beq     LFE86
        sta     ($08),y
        iny
        bne     LFE7D
LFE86:  rts

        .byte   $25
LFE88:  bmi     $FEBE
        cli
        .byte   $3A
        and     $30
        .byte   $32
        cli
        asl     a
        brk
        bmi     LFEC5
        .byte   $32
        .byte   $33
        .byte   $34
        and     $36,x
        .byte   $37
        sec
        and     $4241,y
        .byte   $43
        .byte   $44
        eor     $46
        and     $3132
        .byte   $34
        .byte   $37
        .byte   $34
        sec
        .byte   $33
        rol     $34,x
        sec
        brk
        bpl     LFEC0
        bpl     LFEC2
        bpl     LFEC4
        bpl     LFEC6
        bpl     LFE88
        bvc     LFF0A
        bvc     LFF0C
        bpl     LFECE
        bpl     LFED0
LFEC0:  bpl     LFED2
LFEC2:  bpl     LFED4
LFEC4:  .byte   $10
LFEC5:  .byte   $10
LFEC6:  bpl     LFED8
        bpl     LFEDA
        bpl     LFEDC
        bpl     LFEDE
LFECE:  ldy     #$00
LFED0:  brk
        brk
LFED2:  brk
        brk
LFED4:  brk
        brk
        brk
        brk
LFED8:  brk
        brk
LFEDA:  brk
        brk
LFEDC:  brk
        brk
LFEDE:  .byte   $0C
        .byte   $0C
        .byte   $0C
        .byte   $0C
        .byte   $0C
        .byte   $0C
        .byte   $0C
        .byte   $0C
        .byte   $0C
        .byte   $0C
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        asl     a
        asl     a
        asl     a
        asl     a
        asl     a
        asl     a
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $02
        brk
LFF0A:  brk
        brk
LFF0C:  brk
        brk
        brk
        ora     #$09
        ora     #$09
        ora     #$09
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        brk
        brk
        brk
        brk
        rti

        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        ora     ($00,x)
        ora     ($01,x)
        brk
        .byte   $02
        ora     ($00,x)
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        .byte   $D7
        .byte   $0C
        .byte   $DA
        .byte   $0C
        cmp     $4C0C,x
        brk
        brk
        brk
        brk
        brk
        brk
        sta     $0D0A
        stx     $0D0B
        sta     $0D11
        stx     $0D12
LFFDF:  dey
        lda     LFFFF,y
        sta     $0D1B
        dey
        lda     LFFFF,y
        sta     $0D1A
        sty     $0D1D
        .byte   $20
LFFF1:  .byte   $FF
        .byte   $FF
        ldy     #$FF
LFFF5:  bne     LFFDF
        rts

        brk
        brk
        and     a:$0B
        brk
        brk
LFFFF:  brk

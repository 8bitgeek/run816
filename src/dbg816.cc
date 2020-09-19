/****************************************************************************
 * Copyright (c) 2020 Mike Sharkey <mike@8bitgeek.net>
 *
 * Permission is hereby granted, free of charge, to any person obtaining a 
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense, 
 * and/or sell copies of the Software, and to permit persons to whom the 
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING 
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
 * DEALINGS IN THE SOFTWARE.
 ****************************************************************************/
#include <dbg816.h>
#include <stdio.h>
#include <string>

using namespace std;
#define inherited load816

dbg816::dbg816()
: m_debug_state(dbg_pause)
, m_lines(0)
, m_cols(0)
{ 
    initscr();
    timeout(0);
    raw();
    noecho();
    keypad(stdscr, TRUE);
    refresh();
}

dbg816::~dbg816()
{ 
    endwin();
}

void dbg816::step()
{
    banner();
    dump();
    input();
    refresh();
}

void dbg816::input()
{
    int ch = getch();
    switch( ch )
    {
        case 'q':
        case 'Q':
            set_debug_state(dbg_pause);
            set_stopped(true);
            erase();
            break;
        case 's':
        case 'S':
            set_debug_state(dbg_step);
            inherited::step();
            break;
        case 'r':
        case 'R':
            set_debug_state(dbg_run);
            break;
        case 'p':
        case 'P':
            set_debug_state(dbg_pause);
            break;
        default:
            if ( get_debug_state() == dbg_run )
            {
                inherited::step();
            }
            break;
    }
}

void dbg816::banner()
{
    if ( m_lines != LINES || m_cols != COLS )
    {
        erase();
        m_lines = LINES;
        m_cols = COLS;
    }
    mvprintw( LINES-1, 0, "S)tep, R)un, P)uase, Q)uit");    
}

void dbg816::dump()
{
    uint8_t op = inherited::load8(join(pbr, pc));
    mvprintw( 0, 0, "CK:%08X:", cycles() );
    mvprintw( 1, 0, "F:%c%c%c%c%c%c%c%c",
            p.f_n ? 'N' : ' ',
            p.f_v ? 'V' : ' ',
            p.f_m ? 'M' : ' ',
            p.f_x ? 'X' : ' ',
            p.f_d ? 'D' : ' ',
            p.f_i ? 'I' : ' ',
            p.f_z ? 'Z' : ' ',
            p.f_c ? 'C' : ' '
            );
    mvprintw( 2, 0, "PC:%02X:%04X OP:%02X [%s] %02X%02X", pbr, pc, op, opcode_map[op].op, inherited::load8(join(pbr, (uint16_t)(pc+1))), inherited::load8(join(pbr, (uint16_t)(pc+2))) );
    mvprintw( 3, 0, "SP:%02X:%04X  D:%02X", 0, sp.w, inherited::load8(sp.w) );
    mvprintw( 4, 0, " A:%02X:%04X", 0, a.w );
    mvprintw( 5, 0, "DR:%02X:%04X", 0, dp.w );
    mvprintw( 6, 0, " Y:%02X:%04X", dbr, y.w );
    mvprintw( 7, 0, " X:%02X:%04X", dbr, x.w );
}

uint8_t dbg816::load8(emu816_addr_t ea)
{
    uint8_t data = inherited::load8(ea);
    mvprintw( 8, 0, "RD:%02X:%04X  D:%02X",ea>>16,ea&0xFFFF,data );
    refresh();
    return data;
}

void dbg816::store8(emu816_addr_t ea, uint8_t data)
{
    mvprintw( 9, 0, "WR:%02X:%04X  D:%02X",ea>>16,ea&0xFFFF,data );
    refresh();
    inherited::store8(ea,data);
}



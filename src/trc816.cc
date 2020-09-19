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
#include <trc816.h>
#include <stdio.h>
#include <string>

using namespace std;
#define inherited load816

trc816::trc816()
{ 
}

trc816::~trc816()
{ 
}

void trc816::step()
{
    dump();
    inherited::step();
}

void trc816::dump()
{
    uint8_t op = inherited::load8(join(pbr, pc));
    printf( "CK:%08X: ", cycles() );
    printf( "F:%c%c%c%c%c%c%c%c ",
            p.f_n ? 'N' : ' ',
            p.f_v ? 'V' : ' ',
            p.f_m ? 'M' : ' ',
            p.f_x ? 'X' : ' ',
            p.f_d ? 'D' : ' ',
            p.f_i ? 'I' : ' ',
            p.f_z ? 'Z' : ' ',
            p.f_c ? 'C' : ' '
            );
    printf( "PC:%02X:%04X OP:%02X [%s] %02X%02X ", pbr, pc, op, opcode_map[op].op, inherited::load8(join(pbr, (uint16_t)(pc+1))), inherited::load8(join(pbr, (uint16_t)(pc+2))) );
    printf( "SP:%02X:%04X  D:%02X ", 0, sp.w, inherited::load8(sp.w) );
    printf( " A:%02X:%04X ", 0, a.w );
    printf( "DR:%02X:%04X ", 0, dp.w );
    printf( " Y:%02X:%04X ", dbr, y.w );
    printf( " X:%02X:%04X\n", dbr, x.w );
}

// uint8_t trc816::load8(emu816_addr_t ea)
// {
//     uint8_t data = inherited::load8(ea);
//     move(0,7);
//     printf( "RD:%02X:%04X  D:%02X\n",ea>>16,ea&0xFFFF,data );
//     return data;
// }

// void trc816::store8(emu816_addr_t ea, uint8_t data)
// {
//     move(0,8);
//     printf( "WR:%02X:%04X  D:%02X\n",ea>>16,ea&0xFFFF,data );
//     inherited::store8(ea,data);
// }



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
#ifndef VM816_H
#define VM816_H

#include <emu816.h>

class vm816 : public emu816
{
    public:

        vm816();
        virtual ~vm816();

        // Define the memory areas and sizes
        virtual void            setMemory (emu816_addr_t memMask, emu816_addr_t ramSize, const uint8_t *pROM);
        virtual void            setMemory (emu816_addr_t memMask, emu816_addr_t ramSize, uint8_t *pRAM, const uint8_t *pROM);

        virtual uint8_t         load8(emu816_addr_t ea);
        virtual void            store8(emu816_addr_t ea, uint8_t data);
        virtual uint16_t        load16(emu816_addr_t ea);
        virtual void            store16(emu816_addr_t ea, uint16_t data);
        virtual emu816_addr_t   load24(emu816_addr_t ea);

    protected: 

    protected:

        typedef struct _opcode_
        {
            const char*     op;
            uint8_t         sz;
        } opcode_t;

        static opcode_t     opcode_map[];

        virtual void op_brk(emu816_addr_t ea);
        virtual void op_cop(emu816_addr_t ea);

    private:

        emu816_addr_t		    memMask;		// The address mask pattern
        emu816_addr_t		    ramSize;		// The amount of RAM

        uint8_t*                pRAM;			// Base of RAM memory array
        const uint8_t*          pROM;			// Base of ROM memory array

};
#endif
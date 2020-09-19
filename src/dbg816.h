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
#ifndef DBG816_H
#define DBG816_H

#include <load816.h>
#include <stdlib.h>
#include <stdint.h>
#include <ncurses.h>

class dbg816 : public load816
{
    public:

        dbg816();
        virtual ~dbg816();

        virtual void        step();

        virtual uint8_t     load8(emu816_addr_t ea);
        virtual void        store8(emu816_addr_t ea, uint8_t data);

    protected:

        typedef enum {
            dbg_pause=0,
            dbg_step,
            dbg_run,
            dbg_quit
        } debug_state_t;

        void                set_debug_state(debug_state_t dbg_state)
                                { m_debug_state = dbg_state; }

        debug_state_t       get_debug_state()
                                { return m_debug_state; }

        virtual void        input();
        virtual void        banner();

    private:

        void                dump();
        
        debug_state_t       m_debug_state;
        int                 m_lines;
        int                 m_cols;

};

#endif 


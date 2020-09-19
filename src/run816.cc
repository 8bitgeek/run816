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
#include <iostream>
#include <fstream>
#include <string>

using namespace std;

#include <string.h>
#include <time.h>
#include <dbg816.h>
#include <trc816.h>

#define	RAM_SIZE	(512 * 1024)
#define MEM_MASK	(512 * 1024L - 1)

int debug_trace=(-1);
bool debug=false;
load816* vm=NULL;
timespec tstart;
timespec tend;

void setup_memory();
void command_line(int argc, char **argv);
void finish();
void usage(const char* exec_name);


int main(int argc, char **argv)
{
	command_line(argc,argv);
	vm->run(debug_trace<0?0:debug_trace);
    finish();
	return(0);
}



void command_line(int argc, char **argv)
{
    int index=1; 

	while (index < argc) {
		if (argv[index][0] != '-') break;

		if (!strcmp(argv[index], "-d")) {
			debug=true;
			++index;
			continue;
		}
        else if (!strcmp(argv[index], "-t")) {
			debug_trace=0;
			++index;
            if ( index < argc && isdigit(*argv[index]) )
            {
                debug_trace=atoi(argv[index]);
                ++index;
            }
			continue;
		}
        else if (!strcmp(argv[index], "-?")) {
			usage(argv[0]);
			exit(0);
		}

		cerr << "Invalid: option '" << argv[index] << "'" << endl;
		usage(argv[0]);
		exit(1);
	}

    if ( debug_trace >= 0 )
        vm = new trc816;
    else
        vm = debug ? (new dbg816) : (new load816);

	setup_memory();

	if (index < argc)
		do {
			if ( !vm->load(argv[index]) )
            {
                cerr << "load failed '" << argv[index] << "'";
                exit(-1);
            }
            ++index;
		} while ( index < argc);
	else {
		cerr << "No S28 files specified" << endl;
		usage(argv[0]);
		exit(1);
	}
    
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &tstart);
}
 
void setup_memory()
{
	vm->setMemory(MEM_MASK, RAM_SIZE, NULL);
}

void finish()
{
	clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &tend);

	double secs = (tend.tv_sec + tend.tv_nsec / 1000000000.0)
		    - (tstart.tv_sec + tstart.tv_nsec / 1000000000.0);

	double speed = vm->cycles() / secs;

	cout << endl << "Executed " << vm->cycles() << " in " << secs << " Secs";
	cout << endl << "Overall CPU Frequency = ";
	if (speed < 1000.0)
		cout << speed << " Hz";
	else {
		if ((speed /= 1000.0) < 1000.0)
			cout << speed << " KHz";
		else
			cout << (speed /= 1000.0) << " Mhz";
	}
	cout << endl;

    if ( vm )
        delete vm;
}

void usage(const char* exec_name)
{
	fprintf( stderr, "Usage: %s [-d] [-t [clks]] <somefile>.s19\n", exec_name );
}
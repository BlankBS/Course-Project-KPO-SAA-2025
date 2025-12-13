#pragma once
#include "LT.h"
#define IN_MAX_LEN_TEXT 1024*1024
#define IN_CODE_ENDL '\n'
#define DIVIDE ';'
#define MAX_LEXEM_LENGTH 20
#include <list>
#define IN_CODE_TABLE {\
IN::T,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::S,IN::N,IN::F,IN::F,IN::T,IN::F,IN::F,\
IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,\
IN::S,IN::L,IN::D,IN::F,IN::O,IN::L,IN::L,IN::C,IN::L,IN::L,IN::L,IN::L,IN::L,IN::L,IN::F,IN::L,\
IN::T,IN::T,IN::T,IN::T,IN::T,IN::T,IN::T,IN::T,IN::T,IN::T,IN::L,IN::L,IN::L,IN::L,IN::L,IN::F,\
IN::F,IN::T,IN::T,IN::T,IN::T,IN::T,IN::T,IN::T,IN::T,IN::T,IN::T,IN::T,IN::T,IN::T,IN::T,IN::T,\
IN::T,IN::T,IN::T,IN::T,IN::T,IN::T,IN::T,IN::T,IN::T,IN::T,IN::T,IN::L,IN::L,IN::L,IN::L,IN::T,\
IN::F,IN::T,IN::T,IN::T,IN::T,IN::T,IN::T,IN::T,IN::T,IN::T,IN::T,IN::T,IN::T,IN::T,IN::T,IN::T,\
IN::T,IN::T,IN::T,IN::T,IN::T,IN::T,IN::T,IN::T,IN::T,IN::T,IN::T,IN::L,IN::L,IN::L,IN::L,IN::F,\
IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,\
IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,\
IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,\
IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,\
IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,\
IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,\
IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,\
IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F,IN::F, \
}


namespace In
{
	struct lexem
	{
		int line;
		int col;
		unsigned char* lexem;
	};

	struct IN
	{
		enum { T = 1024, F = 2048, L = 256, C = 128, N = 64, D = 32, O = 16, S = 0 };
		int size;
		int lines;
		int ignor;

		std::list<lexem> lexems;

	};

	IN getin(wchar_t infile[]);
}
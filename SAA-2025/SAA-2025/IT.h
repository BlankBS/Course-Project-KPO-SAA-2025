#pragma once
#pragma once
#define ID_MAXSIZE		26
#define ID_CURRENT_MAXSIZE		10

#define	TI_MAXSIZE		4096
#define TI_INT_DEFAULT	0x00000000
#define	TI_STR_DEFAULT	0x00
#define	TI_NULLIDX		0xffffffff
#define	TI_STR_MAXSIZE	255

#define FALSYNUMBER 17

namespace IT
{
	enum IDDATATYPE { UBYTE = 1, STR = 2, CHR = 3, BOOL = 4 };
	enum IDTYPE { V = 1, F = 2, P = 3, L = 4 };

	struct Entry
	{
		int idxfirstLE;
		char id[ID_MAXSIZE];
		bool isExternal;
		IDDATATYPE iddatatype;
		IDTYPE idtype;
		union {
			unsigned int vubyte;
			char vchar;
			bool vbool;
			struct
			{
				char len;
				char* str;
			} vstr;
		} value;
		Entry(int idxfirstLE, const char* id, IDDATATYPE iddatatype, IDTYPE idtype, bool e = false) {
			this->isExternal = e;
			this->idxfirstLE = idxfirstLE;
			this->iddatatype = iddatatype;
			this->idtype = idtype;
			if (iddatatype == CHR)
			{
				this->value.vchar = '\0';
			}
			if (iddatatype == UBYTE)
			{
				this->value.vubyte = 0;
			}
			if (iddatatype == STR)
			{
				this->value.vstr.len = 0;
				this->value.vstr.str = nullptr;
			}
			if (iddatatype == BOOL)
			{
				this->value.vbool = false;
			}

			int len = 0;
			for (int i = 0; id[i] != '\0' && i < ID_MAXSIZE; i++)
			{
				len++;
				this->id[i] = id[i];
			}
			if (len >= ID_MAXSIZE)
				this->id[ID_MAXSIZE - 1] = '\0';
			else
			{
				this->id[len] = '\0';
			}

		};
		Entry(int idxfirstLE, const char* id, IDDATATYPE iddatatype, IDTYPE idtype, unsigned int data, bool e = false) {
			this->isExternal = e;
			this->idxfirstLE = idxfirstLE;
			this->iddatatype = iddatatype;
			this->idtype = idtype;
			this->value.vubyte = data;
			int len = 0;
			for (int i = 0; id[i] != '\0' && i < ID_MAXSIZE; i++)
			{
				len++;
				this->id[i] = id[i];
			}
			if (len >= ID_MAXSIZE)
				this->id[ID_MAXSIZE - 1] = '\0';
			else
			{
				this->id[len] = '\0';
			}

		};
		Entry(int idxfirstLE, const char* id, IDDATATYPE iddatatype, IDTYPE idtype, char data, bool e = false) {
			this->isExternal = e;
			this->idxfirstLE = idxfirstLE;
			this->iddatatype = iddatatype;
			this->idtype = idtype;
			int len = 0;
			for (int i = 0; id[i] != '\0' && i < ID_MAXSIZE; i++)
			{
				len++;
				this->id[i] = id[i];
			}
			if (len >= ID_MAXSIZE)
				this->id[ID_MAXSIZE - 1] = '\0';
			else
			{
				this->id[len] = '\0';
			}

			this->value.vchar = data;
		};
		Entry(int idxfirstLE, const char* id, IDDATATYPE iddatatype, IDTYPE idtype, short data, bool e = false) {
			this->isExternal = e;
			this->idxfirstLE = idxfirstLE;
			this->iddatatype = iddatatype;
			this->idtype = idtype;
			int len = 0;
			for (int i = 0; id[i] != '\0' && i < ID_MAXSIZE; i++)
			{
				len++;
				this->id[i] = id[i];
			}
			if (len >= ID_MAXSIZE)
				this->id[ID_MAXSIZE - 1] = '\0';
			else
			{
				this->id[len] = '\0';
			}

			this->value.vbool = data;
		};
		Entry(int idxfirstLE, const char* id, IDDATATYPE iddatatype, IDTYPE idtype, char* data, bool e = false) {
			this->isExternal = e;
			this->idxfirstLE = idxfirstLE;
			this->iddatatype = iddatatype;
			this->idtype = idtype;
			int len = 0;
			for (int i = 0; id[i] != '\0' && i < ID_MAXSIZE; i++)
			{
				len++;
				this->id[i] = id[i];
			}
			if (len >= ID_MAXSIZE)
				this->id[ID_MAXSIZE - 1] = '\0';
			else
			{
				this->id[len] = '\0';
			}

			len = 0;
			for (int i = 1; data[i] != '\"'; i++)
			{
				len++;
			}
			this->value.vstr.len = len + 3;
			this->value.vstr.str = new char[len + 3];

			for (int i = 0; i < len + 3; i++)
			{
				this->value.vstr.str[i] = data[i];
			}
			this->value.vstr.str[len + 3 - 1] = '\0';
			this->value.vstr.len = len + 2;

		};
		Entry() = default;
	};
	struct IdTable
	{
		int maxsize;
		int size;
		Entry* table;
	};
	IdTable Create(
		int size
	);
	void Add(
		IdTable& idtable,
		Entry entry
	);
	Entry GetEntry(
		IdTable& idtable,
		int n
	);
	int IsId(
		IdTable& idtable,
		char id[ID_MAXSIZE]
	);
	int IsLX(
		IdTable& idtable,
		IDDATATYPE type,
		unsigned int data
	);
	int IsLX(
		IdTable& idtable,
		IDDATATYPE type,
		short data
	);
	int IsLX(
		IdTable& idtable,
		IDDATATYPE type,
		char data
	);
	int IsLX(
		IdTable& idtable,
		IDDATATYPE type,
		char* data
	);

	bool isUniq(IdTable& idtable,
		char id[ID_MAXSIZE]);
	void Delete(IdTable& idtable);
}
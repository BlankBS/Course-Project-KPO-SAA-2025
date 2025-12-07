#include "pch.h"
#include "framework.h"
#include <iostream>
#include <math.h>
#include <Windows.h>
#include <time.h>
#include <stdio.h>
#include <stdlib.h>
#pragma warning (disable : 4996)

extern "C"
{
	unsigned int __stdcall ord(char ch)
	{
		return (unsigned int)ch;
	}
	unsigned char __stdcall chr(unsigned int number)
	{
		return (unsigned char)number;
	}

	char* __stdcall GetDate()
	{
		time_t rawtime;
		struct tm timeinfo;
		time(&rawtime);
		localtime_s(&timeinfo, &rawtime);

		// Размер буфера, который необходим для даты DD.MM.YYYY
		const int bufferSize = 11;
		char* str = (char*)malloc(bufferSize);

		if (str != NULL) {
			// Форматируем дату в строку
			strftime(str, bufferSize, "%d.%m.%Y", &timeinfo);
		}
		return str;
	}

	char* __stdcall GetTime() {
		time_t rawtime;
		struct tm timeinfo;
		time(&rawtime);
		localtime_s(&timeinfo, &rawtime);

		// Размер буфера, который необходим для времени HH:MM
		const int bufferSize = 6;
		char* str = (char*)malloc(bufferSize);

		if (str != NULL) {
			// Форматируем время в строку
			strftime(str, bufferSize, "%H:%M", &timeinfo);
		}

		return str;
	}

	void __stdcall outputchar(char a)
	{
		std::cout << a << std::endl;
	}
	void __stdcall outputubyte(unsigned short a)
	{
		std::cout << a << std::endl;
	}
	void __stdcall outputstr(void* in)
	{
		char* a = (char*)in;
		setlocale(0, "");
		if (a != NULL)
			std::cout << a << std::endl;
	}

}


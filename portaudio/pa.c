#include "_cgo_export.h"

int cb(const void *inputBuffer, void *outputBuffer, unsigned long frames, const PaStreamCallbackTimeInfo *timeInfo, PaStreamCallbackFlags statusFlags, void *userData) {
	streamCallback((void*)inputBuffer, outputBuffer, frames, (PaStreamCallbackTimeInfo*)timeInfo, statusFlags, userData);
	return paContinue;
}

PaStreamCallback* paStreamCallback = cb;